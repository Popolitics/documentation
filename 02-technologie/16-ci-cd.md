# POPolitics – Pipeline CI/CD

## 1. Introduction

Ce document décrit le pipeline d'intégration continue (CI) et de déploiement continu (CD) du projet POPolitics. Il couvre les workflows automatisés, les environnements cibles et les règles de déploiement.

---

## 2. Vue d'ensemble

```text
Développeur
    │
    │  git push / Pull Request
    ▼
GitHub (dépôt)
    │
    ▼
┌─────────────────────────────┐
│     CI – GitHub Actions     │
│  1. Linting                 │
│  2. Tests unitaires         │
│  3. Tests d'intégration     │
└─────────────┬───────────────┘
              │  CI verte
              ▼
        Merge sur main
              │
              ▼
┌─────────────────────────────┐
│    CD – Déploiement         │
│  → Environnement de démo    │
│    (VM / serveur local)     │
└─────────────────────────────┘
```

---

## 3. Dépôts Git

Le projet est découpé en plusieurs dépôts GitHub :

| Dépôt | Contenu |
|---|---|
| `popolitics/documentation` | Documentation projet (ce dépôt) |
| `popolitics/backend` | Backend Django (APIs REST, Auth, IA Service) |
| `popolitics/frontend` | Frontend Next.js |
| `popolitics/data` | Pipelines ETL, scripts de transformation, configurations Kestra |

Chaque dépôt dispose de son propre pipeline CI indépendant.

---

## 4. Branches

| Branche | Rôle |
|---|---|
| `main` | Branche stable, déployée en démo — aucun push direct |
| `dev` | Branche d'intégration — les features y sont mergées avant `main` |
| `feature/<nom>` | Branche de développement d'une fonctionnalité |
| `fix/<description>` | Branche de correction de bug |

**Règle** : tout changement passe par une Pull Request. Le push direct sur `main` est interdit.

---

## 5. Pipeline CI (Intégration continue)

Le pipeline CI s'exécute automatiquement à chaque **push** et **Pull Request** sur `dev` et `main`.

### 5.1 Dépôt Documentation

Workflow existant : `markdown-lint.yml`

| Step | Outil | Description |
|---|---|---|
| Markdown Lint | `markdownlint-cli` | Vérifie la syntaxe et le style de tous les fichiers `.md` |

### 5.2 Dépôt Backend (Django)

| Step | Outil | Description |
|---|---|---|
| 1. Checkout | `actions/checkout` | Récupération du code |
| 2. Setup Python | `actions/setup-python` | Installation de Python 3.11+ |
| 3. Installation des dépendances | `pip install -r requirements.txt` | Installation des packages |
| 4. Linting | `ruff` ou `flake8` | Vérification du style PEP 8 |
| 5. Tests unitaires | `pytest` | Exécution des tests unitaires |
| 6. Tests d'intégration | `pytest-django` | Tests avec base PostgreSQL de test |

### 5.3 Dépôt Frontend (Next.js)

| Step | Outil | Description |
|---|---|---|
| 1. Checkout | `actions/checkout` | Récupération du code |
| 2. Setup Node.js | `actions/setup-node` | Installation de Node.js 20+ |
| 3. Installation des dépendances | `npm ci` | Installation des packages |
| 4. Linting | `eslint` | Vérification du style JS/TS |
| 5. Tests unitaires | `jest` | Exécution des tests unitaires |
| 6. Build | `npm run build` | Vérification que le build Next.js passe |

### 5.4 Dépôt Data (ETL)

| Step | Outil | Description |
|---|---|---|
| 1. Checkout | `actions/checkout` | Récupération du code |
| 2. Setup Python | `actions/setup-python` | Installation de Python 3.11+ |
| 3. Installation des dépendances | `pip install -r requirements.txt` | Installation des packages |
| 4. Linting | `ruff` | Vérification du style PEP 8 |
| 5. Tests unitaires ETL | `pytest` | Tests des fonctions de transformation |

---

## 6. Règles de merge

- Une PR ne peut être mergée que si **tous les steps CI sont verts**.
- La PR doit être approuvée par **au moins un autre membre** de l'équipe (revue de code).
- Les conflits Git doivent être résolus **par le demandeur**, pas le reviewer.

---

## 7. Pipeline CD (Déploiement continu)

### 7.1 Environnements

| Environnement | Déclencheur | Infrastructure |
|---|---|---|
| **Local (dev)** | Manuel — `docker-compose up` | Machine du développeur |
| **Démo / pré-prod** | Merge sur `main` (manuel ou automatique) | VM partagée / serveur local |
| **Production (futur)** | Hors périmètre MVP | Cloud (à définir) |

### 7.2 Déploiement en démo

Le déploiement sur l'environnement de démo suit les étapes suivantes :

```text
1. Merge sur main (après CI verte + revue de code)
        │
        ▼
2. Pull du code sur la VM de démo
   git pull origin main
        │
        ▼
3. Reconstruction des images Docker si nécessaire
   docker-compose build
        │
        ▼
4. Redémarrage des services
   docker-compose up -d
        │
        ▼
5. Application des migrations base de données
   docker-compose exec backend python manage.py migrate
        │
        ▼
6. Smoke tests manuels (parcours critiques)
        │
        ▼
7. Démo disponible
```

### 7.3 Services déployés

| Service | Image | Port exposé |
|---|---|---|
| Backend Django | `popolitics/backend` | 8000 |
| Frontend Next.js | `popolitics/frontend` | 3000 |
| PostgreSQL (Auth) | `postgres:15` | 5432 |
| PostgreSQL (Datamart AN) | `postgres:15` | 5433 |
| PostgreSQL (Datamart Sénat) | `postgres:15` | 5434 |
| PostgreSQL (Datamart UE) | `postgres:15` | 5435 |
| Kestra | `kestra/kestra` | 8080 |

---

## 8. Variables d'environnement

Les variables sensibles ne sont **jamais committées** dans le dépôt. Elles sont gérées via :

- **En local** : fichier `.env` (non versionné, listé dans `.gitignore`)
- **En CI** : GitHub Actions Secrets (`Settings > Secrets and variables > Actions`)
- **En démo** : fichier `.env` sur la VM, accès restreint

Variables requises (exemple — voir `.env.example` dans chaque dépôt) :

```bash
DATABASE_URL=postgresql://user:password@localhost:5432/popolitics
SECRET_KEY=<django-secret-key>
JWT_SECRET=<jwt-secret>
KESTRA_URL=http://localhost:8080
```

---

## 9. Responsabilités

| Responsabilité | Rôle |
|---|---|
| Mise en place et maintenance des workflows CI | Lazare (DevOps) |
| Déploiement sur la VM de démo | Lazare (DevOps) |
| Gestion des secrets GitHub | Lazare + Jaures (Tech Lead) |
| Validation post-déploiement (smoke tests) | Jaures (Tech Lead) |
