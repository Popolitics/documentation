# Benchmarks POPolitics

Scripts de mesure **reproductibles** servant à justifier, par des chiffres, les choix de stack
documentés dans [`../07-tech-stack-comparison.md`](../07-tech-stack-comparison.md).

L'objectif n'est **pas** de produire un benchmark de laboratoire parfait, mais de fournir une
mesure honnête, reproductible sur la machine de l'équipe, qui illustre concrètement les écarts
attendus entre les options envisagées.

> Les chiffres dépendent fortement de la machine. Lancez toujours les deux côtés d'une
> comparaison **sur la même machine, dans la même session**, et reportez la config matérielle.

---

## 0. Démarrage rapide `bench.ps1`

Tout est piloté par un utilitaire unique à la racine, [`bench.ps1`](bench.ps1) (Windows / PowerShell 7+) :

```powershell
.\bench.ps1 setup        # installe les dépendances (venv Python + npm des 2 apps front)
.\bench.ps1 backend      # bench back : FastAPI vs Django (wrk via Docker)
.\bench.ps1 frontend     # bench front : Core Web Vitals (Lighthouse) + test SEO
.\bench.ps1 seo          # uniquement le test SEO / crawlabilité
.\bench.ps1 all          # tout d'un coup
.\bench.ps1 help         # rappel des commandes
```

Prérequis : **Docker Desktop lancé** (back) et **Node.js + Chrome** (front). Les sections
ci‑dessous détaillent ce que chaque commande fait, et comment lancer les tests à la main.

---

## 1. Backend  Django vs FastAPI (overhead du framework)

On compare l'overhead pur des deux frameworks **à serveur égal** : les deux apps sont servies
par `uvicorn` (1 worker), exposent des endpoints identiques, et n'ont aucun middleware superflu.

La charge est générée par **`wrk`** (outil natif, lancé via Docker). On n'utilise pas de client
Python maison : un client mono‑process sature lui‑même avant le serveur (~150 req/s) et ne
discrimine pas les frameworks. Endpoints : `/json` (réponse minimale), `/deputes` (200 objets).

### Prérequis

- **Docker Desktop lancé** (pour `wrk`).
- venv Python avec les dépendances :

```powershell
cd backend
python -m venv .venv ; .\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

### Lancer (automatique) — recommandé

```powershell
.\run.ps1                          # 8 threads, 50 connexions, 12 s
.\run.ps1 -Connections 200 -Duration 15
```

`run.ps1` démarre FastAPI (8001) puis Django (8002), les charge avec `wrk` sur `/json` et
`/deputes`, affiche débit + latences, puis arrête tout. Une seule commande.

### Lancer (manuel, 2 terminaux)

```powershell
# Terminal 1 — démarrer un serveur :
python -m uvicorn fastapi_app:app       --host 0.0.0.0 --port 8001 --workers 1
python -m uvicorn django_app:application --host 0.0.0.0 --port 8002 --workers 1

# Terminal 2 — charger via wrk (conteneur) :
docker run --rm williamyeh/wrk -t8 -c50 -d12s --latency http://host.docker.internal:8001/deputes
```

`wrk` affiche le débit (`Requests/sec`) et la distribution de latence (p50/p90/p99).

### Mesurer les services réels

`wrk` accepte n'importe quelle URL : on peut viser directement les services du `docker-compose`
(`api`, `ia-service`) une fois lancés, plutôt que les apps de démo.

```powershell
docker run --rm williamyeh/wrk -t8 -c50 -d15s --latency http://host.docker.internal:8000/api/deputes
```

---

## 2. Frontend  Next.js (SSR/SSG) vs SPA React

Deux apps témoins servent la **même page** (table de 200 députés) :

- [`frontend-next/`](frontend-next/) — Next.js 14, contenu pré‑rendu côté serveur (SSG).
- [`frontend-spa/`](frontend-spa/) — Vite + React 18, rendu 100 % côté client (CSR).

On mesure (a) les **Core Web Vitals** via Lighthouse et (b) la **crawlabilité / SEO** via le HTML brut.
Toujours tester en mode **production** (`build` puis `start`/`preview`), jamais en `dev`.

### Prérequis

Node.js. Lighthouse est appelé via `npx`. Chrome doit être installé (Lighthouse le pilote en headless).

### a) Core Web Vitals (Lighthouse)

```powershell
# 1. Builder puis servir Next.js (port 3000)
cd frontend-next ; npm install ; npm run build
node node_modules/next/dist/bin/next start -p 3000     # laisser tourner
# 2. Dans un autre terminal :
./frontend/lighthouse_bench.ps1 -Url "http://localhost:3000" -Runs 5 -Label "Next.js"

# Puis la SPA (port 4173)
cd frontend-spa ; npm install ; npm run build
node node_modules/vite/bin/vite.js preview --port 4173  # laisser tourner
./frontend/lighthouse_bench.ps1 -Url "http://localhost:4173" -Runs 5 -Label "SPA React"
```

> En **localhost** (latence réseau ~0) et avec des données inlinées, la SPA peut faire jeu égal
> voire mieux : les avantages du SSR (réseau réel, cascade de fetch, SEO) ne s'y voient pas.
> Nous ne pouvons pas conclure « Next.js inutile » sur ce seul test, ce qui nous amène au point (b), décisif.

### b) Crawlabilité / SEO (HTML brut)

Le critère qui justifie réellement Next.js pour un site public. On compare ce que reçoit un
crawler **avant** d'exécuter le JS :

```powershell
# Serveurs lancés (3000 = Next, 4173 = SPA) :
(Invoke-WebRequest http://localhost:3000 -UseBasicParsing).Content -match "Député" # → contenu présent
(Invoke-WebRequest http://localhost:4173 -UseBasicParsing).Content                  # → <div id="root"></div> vide
```

Résultat type : Next.js sert ~90 ko de HTML contenant toute la table (« Député » ×404) ;
la SPA sert ~0,5 ko avec un `<body>` vide (« Député » ×1, dans le `<title>`).

---

## 3. Où reporter les résultats

Section **« Performances mesurées »** de [`../07-tech-stack-comparison.md`](../07-tech-stack-comparison.md).
Compléter les tableaux et indiquer la machine de test (CPU, RAM, OS) ainsi que la date.
