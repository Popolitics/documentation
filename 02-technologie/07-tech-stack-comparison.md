# POPolitics – Comparaison des stacks techniques

Ce document présente, de manière synthétique, les principales **options techniques étudiées** pour POPolitics, séparées par couche (ETL, Backend, Frontend), et justifie les choix retenus.

---

## 1. ETL & Orchestration

### 1.1 Kestra vs Airflow

<!-- markdownlint-disable MD060 -->

| Option      | Avantages principaux                                                                                   | Limites / remarques                                                                                  | Choix retenu                                                |
|-------------|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| **Kestra**  | Orienté data engineering, workflows déclaratifs en YAML, interface moderne, déploiement simple en Docker, bonne observabilité, **outil français** | Communauté plus jeune qu’Airflow, moins de documentation historique                                  | **Oui** – bon compromis pédagogie / simplicité / modernité |
| Airflow     | Standard industriel très répandu, très puissant, riche en opérateurs                                   | Plus lourd à mettre en place et à administrer pour un projet étudiant, courbe d’apprentissage plus importante | Non pour le MVP (envisageable plus tard)                   |

**Conclusion :** Kestra est choisi pour **orchestrer les pipelines ETL** car il offre un bon équilibre entre puissance, lisibilité et simplicité de déploiement dans une stack Docker multi‑conteneurs, tout en étant un **outil français**, cohérent éthiquement avec un projet centré sur la politique française et la souveraineté numérique. Ce choix complète l’architecture **Data Lake (Bronze / Silver / Gold)** décrite dans 01-technological-choices.md en apportant une orchestration moderne et facilement reproductible.

---

## 2. Backend

### 2.1 Django vs FastAPI

| Option      | Avantages principaux                                                                                         | Limites / remarques                                                                                          | Choix retenu                                                              |
|------------|--------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| **Django** | Framework web complet (ORM, auth, admin), écosystème mature, très adapté aux CRUD et aux APIs REST classiques | Plus « lourd » que FastAPI pour de la simple API, débit brut plus faible sur les très petites réponses (voir [Performances mesurées](#4-performances-mesurées)) | **Oui** – socle **unique** de tous les services backend (`api`, `auth-service`, `data-service`, `ia-service`) |
| FastAPI     | Très rapide (ASGI/async), orienté API, typing moderne, excellent pour des services à forte charge ou faible latence | Nécessite d’assembler plus de briques (auth, admin, ORM), moins « tout‑en‑un » ; ajouterait un 2ᵉ framework à maintenir | Non – évalué comme alternative (benchmark en [§4](#4-performances-mesurées)), non retenu pour conserver une **stack unique** |

**Conclusion :** **Django est retenu comme socle backend unique**, pour **tous** les services, y compris `ia-service`. On privilégie la richesse fonctionnelle (ORM, auth, admin, migrations), la productivité et la **cohérence d’une seule stack** plutôt que le débit brut.

FastAPI a été **mesuré** comme alternative (voir [§4](#4-performances-mesurées)) : il n’est plus rapide que Django que sur de **très petites réponses**, alors que sur une charge de données réaliste (listes tabulaires), Django fait jeu égal voire mieux. Cet écart ne justifie pas l’ajout d’un second framework à maintenir : un socle Django unique reste le meilleur compromis pour la taille de l’équipe et le type de charge de POPolitics.

### 2.2 Backend Python vs Backend JavaScript

| Option                                   | Avantages principaux                                                                                                                 | Limites / remarques                                                                                                      | Choix retenu                                                              |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| **Backend Python (Django)**              | Aligné avec l’écosystème data/IA (ETL en Python, modèles IA en Python), forte cohérence technique, mutualisation des compétences | Moins homogène avec le frontend JavaScript, nécessité de maîtriser deux langages sur le projet                           | **Oui** – meilleure intégration avec ETL & IA, moins de friction technique globale |
| Backend JavaScript (Node.js, Express/Nest) | Homogénéité full‑JS (front + back), grande communauté, écosystème riche de packages                                                 | Moins naturel pour interfacer directement les pipelines ETL Python et les modèles IA Python ; nécessite plus de “colle” entre mondes JS et Python | Non, écarté pour éviter la complexité d’un pont JS ↔ Python permanent    |

**Conclusion :** un **backend Python** est privilégié pour rester cohérent avec :
- la plateforme data et les pipelines ETL majoritairement en Python ;
- les modèles IA également développés en Python ;
ce qui simplifie les échanges entre services et réduit les risques d’incompréhension technique au sein de l’équipe.

---

## 3. Frontend

### 3.1 Next.js vs SPA React classique

| Option              | Avantages principaux                                                                                             | Limites / remarques                                               | Choix retenu                                                |
|--------------------|-------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|-------------------------------------------------------------|
| **Next.js**        | SSR/SSG, très bonne intégration avec React, BFF intégré (Next Server), gestion des Server Actions, performance et SEO | Architecture un peu plus avancée à appréhender                   | **Oui** – idéal pour un front web moderne consommant des APIs REST |
| React SPA classique| Simplicité de mise en place, très répandu, courbe d’apprentissage déjà connue par beaucoup d’étudiants             | Pas de SSR natif, SEO plus faible, logique sensible côté client | Non, moins adapté aux besoins de performance et de sécurité  |

<!-- markdownlint-enable MD060 -->

**Conclusion :** Next.js est retenu pour bénéficier du **BFF** et du rendu côté serveur, ce qui améliore à la fois la performance perçue, la sécurité (logique côté serveur) et l’expérience utilisateur, en cohérence avec l’objectif de proposer une **interface web performante et sécurisée** détaillé dans 01-technological-choices.md. L’écart de performance perçue (LCP, TTFB, SEO) est quantifié dans la section [Performances mesurées](#4-performances-mesurées).

---

## 4. Performances mesurées

Cette section objective les choix ci‑dessus par des **chiffres**. Elle distingue :

1. des **ordres de grandeur de référence**, issus de benchmarks publics et sourcés, qui montrent les écarts *attendus* ;
2. nos **mesures propres**, déjà réalisées sur la machine de test et **reproductibles** via le dossier [`benchmarks/`](benchmarks/README.md) (utilitaire `bench.ps1`).

> Les valeurs de référence varient selon le type de test (plaintext, sérialisation JSON, stack complète) et le matériel : elles indiquent un **ordre de grandeur**, pas une vérité absolue. Nos propres mesures, faites sur la même machine, sont la justification finale.

### 4.1 Glossaire ce qui est réellement mesuré

Pour que chaque chiffre des tableaux suivants soit interprétable sans ambiguïté.

#### Outils de mesure

- **`wrk`** générateur de charge HTTP (lancé via Docker) ; bombarde une URL et mesure débit + latence. Utilisé pour le **back**.
- **Lighthouse** outil de Google (Chrome headless) qui mesure les *Core Web Vitals* d'une page. Utilisé pour le **front**. Throttling **mobile Slow‑4G** appliqué par défaut.

#### Métriques back (débit & latence)

| Terme | Définition | Sens |
|---|---|---|
| **Débit (req/s)** | Requêtes servies par seconde sous charge. | Plus haut = mieux |
| **Latence p50** | Médiane : 50 % des requêtes sont plus rapides que cette valeur. | Plus bas = mieux |
| **Latence p90 / p99** | 90 % / 99 % des requêtes sont plus rapides. Le **p99** révèle les pires cas (queue de distribution). | Plus bas = mieux |

#### Métriques front (Core Web Vitals & associées)

Ordre chronologique du chargement :

| Terme | Définition | Bon seuil (mobile) |
|---|---|---|
| **TTFB** *(Time To First Byte)* | Temps avant le **1ᵉʳ octet** renvoyé par le serveur (réactivité serveur/réseau). | < 200 ms |
| **FCP** *(First Contentful Paint)* | Instant où le **1ᵉʳ contenu** apparaît (l'écran n'est plus blanc). | < 1,8 s |
| **LCP** *(Largest Contentful Paint)* | Instant où le **plus gros élément** visible est affiché ≈ « page chargée ». **Métrique reine.** | < 2,5 s |
| **Speed Index** | Vitesse de **remplissage visuel** de la page. | < 3,4 s |
| **TBT** *(Total Blocking Time)* | Temps cumulé où la page est **figée** (JS qui monopolise le CPU). | < 200 ms |
| **TTI** *(Time To Interactive)* | Instant où la page devient **pleinement réactive**. | — (diagnostic) |
| **CLS** *(Cumulative Layout Shift)* | À quel point le contenu **saute** pendant le chargement (sans unité). | < 0,1 |

#### Score de performance Lighthouse (/100)

Moyenne **pondérée** de 5 métriques (TTFB et TTI ne sont **pas** comptés, ce sont des diagnostics) :

| Métrique | Poids |
|---|---|
| TBT | **30 %** |
| LCP | **25 %** |
| CLS | **25 %** |
| FCP | 10 % |
| Speed Index | 10 % |

> Conséquence : le score « punit » surtout le **JS bloquant (TBT)**. Un framework qui hydrate beaucoup de JS (Next.js) peut donc scorer plus bas qu'une SPA sur une petite page, **sans** que cela traduise une mauvaise expérience réelle. Le score **ne mesure pas le SEO** → d'où le test séparé sur le HTML brut.

#### Mesure SEO / crawlabilité

| Terme | Définition |
|---|---|
| **HTML brut** | Le document HTML envoyé par le serveur **avant** exécution du JS — exactement ce que voit un crawler (Googlebot). |
| **Occurrences de « Député »** | Indicateur simple : combien de fois le contenu réel est présent dans ce HTML brut. Élevé = contenu indexable ; ≈ 1 = page vide pour un crawler. |

### 4.2 Backend débit & latence

**Ordres de grandeur de référence (TechEmpower / synthèses publiques) :**

| Framework | Débit indicatif (sérialisation JSON) | Profil de latence | Lecture |
|---|---|---|---|
| **FastAPI** (ASGI/async) | le plus élevé des trois (jusqu’à ~plusieurs ×10⁴ req/s/cœur selon le test) | la plus faible à forte concurrence | alternative la plus rapide, mais ajouterait un 2ᵉ framework |
| **Node.js** (Express/Nest) | intermédiaire | bonne, régulière | non retenu (voir 2.2 : pont JS ↔ Python) |
| **Django** (DRF) | le plus faible des trois sur l’API brute | correcte sur charge CRUD modérée | **retenu** pour tous les services : gain net en productivité, socle unique |

L’écart de débit brut entre FastAPI et Django est de l’ordre d’un **facteur 3 à 10** selon les tests — mais uniquement sur l’**API brute**. Pour POPolitics, dont les charges sont surtout du **CRUD et de l’agrégation de données**, et où la maintenabilité d’une **stack unique** prime, ce gain ne suffit pas à introduire un second framework : **Django est retenu pour tous les services**, y compris `ia-service`.

**Nos mesures** scripts : [`benchmarks/backend`](benchmarks/README.md#1-backend--django-vs-fastapi-overhead-du-framework)
Outil de charge : **`wrk`** (8 threads, 50 connexions, 12 s). Les deux apps sont servies à
serveur égal (`uvicorn`, 1 worker), endpoints identiques, sans middleware. FastAPI en handlers
`async`, Django en vues sync via ASGI — usage représentatif de chacun.

| Endpoint | Charge | Débit (req/s) | p50 | p90 | p99 |
|---|---|---|---|---|---|
| **FastAPI** `/json` | réponse minimale | **626** | 59 ms | 342 ms | 1,80 s |
| **Django** `/json`  | réponse minimale | 122 | 302 ms | 445 ms | 860 ms |
| **FastAPI** `/deputes` | liste de 200 objets | 98 | 445 ms | 685 ms | 1,11 s |
| **Django** `/deputes`  | liste de 200 objets | **163** | 274 ms | 382 ms | 519 ms |

> Machine de test : AMD Ryzen 5 5500U (12 threads logiques), 8 Go RAM, Windows 11 — Python 3.13, Django 6.0, FastAPI 0.138 — Date : 2026‑06‑25.
> Mesures *indicatives* : client (`wrk`) et serveurs colocalisés sur la même machine, 1 seul worker `uvicorn` → forte variance sur les queues (p99). Lire surtout le **débit** et la **médiane p50**, confirmés sur un second run à 200 connexions (FastAPI `/json` 922 req/s vs Django 265 req/s).

**Lecture pourquoi Django reste le bon choix :**

- Sur une **réponse minimale** (`/json`), FastAPI est nettement plus rapide (**~5× le débit**). C'est le seul cas où l'écart est marqué — un profil peu représentatif de nos endpoints.
- Sur une **grosse charge utile tabulaire** (`/deputes`, 200 objets) — qui correspond à **nos vrais endpoints data/CRUD** — la tendance **s'inverse** : **Django passe devant** (163 vs 98 req/s), car la sérialisation par défaut de FastAPI (`jsonable_encoder` sur chaque objet) coûte plus cher que le `JsonResponse` de Django sur de gros volumes.

Autrement dit : sur **le type de charge réel de POPolitics**, Django fait jeu égal voire mieux que FastAPI. L'avantage de FastAPI se limite aux micro‑réponses, ce qui **ne justifie pas** d'ajouter et de maintenir un second framework. Le benchmark **conforte donc le choix d'un socle Django unique** pour l'ensemble des services, IA comprise.

### 4.3 Frontend Core Web Vitals (Next.js SSR/SSG vs SPA React)

**Ordres de grandeur de référence (synthèses Core Web Vitals 2025) :**

| Métrique | Next.js (SSR/SSG) | SPA React (CSR) | Pourquoi |
|---|---|---|---|
| Chargement initial | **2 à 3× plus rapide** | référence | HTML pré‑rendu vs cascade JS (download → parse → exec → fetch → render) |
| LCP | ~1,2 s | ~4,2 s | contenu pré‑rendu, images optimisées par défaut |
| LCP (gain relatif) | **30–50 % meilleur** | référence | — |
| CLS | ~0,03 | ~0,22 | layout stable dès le 1ᵉʳ rendu |
| TTFB | légèrement supérieur en SSR ; **< 50 ms** en SSG | très bas (fichier statique) mais contenu vide au départ | SSR calcule côté serveur ; SSG sert du pré‑généré |
| SEO | indexé au 1ᵉʳ passage du crawler | indexation différée (2ᵉ vague JS, jours de retard possibles) | Googlebot doit exécuter le JS pour une SPA |

La SPA gagne parfois sur le **TTFB brut** (simple fichier statique), mais perd sur le **temps avant contenu utile** (LCP, Speed Index) et sur le **SEO** — deux critères directement liés à l’objectif d’« interface accessible à un public non expert ». C’est ce qui justifie Next.js.

**Nos mesures** — apps témoins : [`benchmarks/frontend-next`](benchmarks/frontend-next/) (Next.js) et [`benchmarks/frontend-spa`](benchmarks/frontend-spa/) (Vite/React).
Page identique (table de 200 députés), build **production**, moyenne sur 5 runs Lighthouse, même machine.

| Variante | Score perf. | TTFB | FCP | LCP | Speed Index | TBT | TTI | CLS |
|---|---|---|---|---|---|---|---|---|
| **Next.js** (SSG, données résolues serveur) | 82/100 | 118 ms | **944 ms** | 1 694 ms | 1 327 ms | 811 ms | 2 446 ms | 0,00 |
| **SPA React** (CSR, données *inlinées* — cas irréaliste) | **98/100** | 15 ms | 1 286 ms | **1 346 ms** | **1 286 ms** | **152 ms** | **1 603 ms** | 0,00 |
| **SPA React** (CSR, **+ fetch API réel** — cas réaliste) | 98/100 | **11 ms** | 1 298 ms | 1 489 ms | 1 324 ms | 131 ms | 1 609 ms | 0,00 |

> La 2ᵉ ligne (données dans le bundle) **fausse la comparaison en faveur de la SPA** : une vraie SPA va chercher ses données via l'`api`. La 3ᵉ ligne mesure ce cas réaliste.

**Lecture honnête — le speed test localhost ne suffit PAS à justifier Next.js.** Sur cette page triviale, servie en localhost (latence réseau ~0) et avec les données *inlinées* dans le bundle, **la SPA fait jeu égal voire mieux** : meilleur score, meilleur LCP, TTFB plus bas (simple fichier statique), TBT bien plus faible (Next.js paie son runtime d'**hydratation**). C'est attendu : dans ces conditions, les avantages structurels du SSR (latence réseau réelle, cascade de fetch d'API, gros contenus) **ne se manifestent pas**. Conclusion importante : **choisir Next.js sur la seule base d'un micro‑benchmark de vitesse serait une erreur de raisonnement.**

**Le vrai argument décisif est le SEO / la crawlabilité — et lui se mesure sans ambiguïté.** On compare le **HTML brut** réellement servi (ce que voit Googlebot *avant* d'exécuter le JS) :

| HTML brut servi (sans exécuter le JS) | Next.js | SPA React |
|---|---|---|
| Taille du document HTML | **90 617 octets** | 465 octets |
| Occurrences de « Député » dans le HTML | **404** | 1 (seulement le `<title>`) |
| Contenu du `<body>` | toute la table pré‑rendue | `<div id="root"></div>` **vide** |

Avec la SPA, un crawler (ou un lecteur d'écran, ou un aperçu de lien) reçoit une **page vide** ; le contenu n'existe qu'après exécution du JS, indexée au mieux dans une 2ᵉ vague différée. Avec Next.js, **toute la page est dans le HTML dès le premier octet**.

**Pourquoi Next.js est donc retenu** — pas pour la vitesse localhost, mais pour trois raisons que le micro‑benchmark ne capture pas :

1. **SEO / accessibilité du contenu** : POPolitics est un site **public** de vulgarisation de données politiques → il doit être **indexable** et lisible sans JS. Mesuré ci‑dessus : 404 vs 1.
2. **Performance perçue sur réseau réel** : sur mobile/4G et avec des données chargées via l'`api`, la SPA subit une cascade *download JS → exec → fetch API → render* que le SSR/SSG évite. **Mesuré ci‑dessus** : passer la SPA d'un rendu de données inlinées à un vrai *fetch* réseau dégrade déjà le LCP de **1 346 → 1 489 ms** (+1 aller‑retour sous throttling Slow‑4G). Ici l'API n'est qu'un fichier de 14 ko sur le même domaine ; en production, l'`api` enchaîne requêtes DB, logique métier et appels internes (`auth` → `data` → `ia`), donc **chaque aller‑retour s'ajoute** et l'écart se creuse — c'est ainsi qu'on retrouve l'ordre de grandeur de référence (LCP ~1,2 s SSR vs ~4,2 s SPA), invisible en localhost.
3. **Sécurité / BFF** : le `Next Server` garde la logique sensible côté serveur ([§3.1](#31-nextjs-vs-spa-react-classique)), impossible avec une SPA pure.

### 4.4 Sources

- TechEmpower Framework Benchmarks — <https://www.techempower.com/benchmarks/>
- FastAPI — Benchmarks — <https://fastapi.tiangolo.com/benchmarks/>
- Django vs FastAPI Performance Benchmarks (2025) — <https://johal.in/web-framework-comparison-django-vs-fastapi-performance-benchmarks-in-2025/>
- FastAPI vs Node.js vs Django REST Framework — <https://medium.com/@iamabdullah234/the-backend-framework-battle-fastapi-vs-node-js-vs-django-rest-framework-1420aecfd40c>
- Next.js Core Web Vitals Optimization — <https://eastondev.com/blog/en/posts/dev/20251219-nextjs-core-web-vitals/>
- React vs Next.js for SEO (2025) — <https://www.deepakg.in/blog/react-vs-nextjs-for-seo-friendly-websites-2025>

---

## 5. Synthèse

- **ETL & Data** : **Kestra** pour l’orchestration des pipelines vers le Data Lake (Bronze / Silver / Gold) et les datamarts PostgreSQL, garantissant traçabilité et reproductibilité des traitements.
- **Backend** : **Django / Python** comme framework complet pour les services Data, IA et Auth, fortement aligné avec les pipelines ETL et les modèles IA développés en Python.
- **Frontend** : **Next.js** pour un frontend moderne, performant et sécurisé (BFF + SSR/SSG) offrant une expérience claire et accessible aux utilisateurs finaux.

Ces choix prolongent les principes exposés dans 01-technological-choices.md : **séparation claire des responsabilités**, scalabilité progressive (MVP local → cloud), et alignement avec les bonnes pratiques de data engineering et de développement web modernes dans le cadre d’un projet de Master 2.
