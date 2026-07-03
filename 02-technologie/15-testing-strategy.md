# POPolitics – Stratégie de tests

## 1. Introduction

Ce document décrit la stratégie de tests du projet POPolitics. Il complète le [Plan Qualité](04-quality-plan.md) et la [Definition of Done](05-definition-of-done.md) en détaillant les types de tests, les outils, les responsabilités et les critères de couverture par pôle technique.

---

## 2. Principes généraux

- Tout code livré doit être accompagné des tests correspondants — c'est un critère de la Definition of Done.
- Les tests sont **versionnés dans le dépôt Git** au même titre que le code de production.
- On teste en priorité les **chemins critiques** (authentification, pipeline ETL, endpoints exposés au frontend).
- Un test qui échoue **bloque le merge** de la Pull Request.

---

## 3. Pyramide de tests

```text
        /\
       /  \   Tests E2E (manuels)
      /----\
     /      \  Tests d'intégration
    /--------\
   /          \  Tests unitaires
  /____________\
```

- **Base large** : tests unitaires, rapides, nombreux.
- **Milieu** : tests d'intégration sur les interfaces entre composants.
- **Sommet** : tests E2E manuels sur les parcours utilisateurs critiques.

---

## 4. Types de tests par pôle

### 4.1 Backend (Django)

#### Tests unitaires

- **Outil** : `pytest` + `pytest-django`
- **Ce qu'on teste** :
  - Fonctions de validation et de transformation de données
  - Logique métier des services (Data Service, Auth Service, IA Service)
  - Serializers et permissions Django REST Framework
- **Cible de couverture** : > 80 % sur les modules critiques (MVP)

#### Tests d'intégration

- **Outil** : `pytest-django` avec base de données de test
- **Ce qu'on teste** :
  - Endpoints REST de bout en bout (requête HTTP → réponse JSON)
  - Interactions backend ↔ datamarts PostgreSQL
  - Flux d'authentification complet (inscription → login → accès protégé → déconnexion)
- **Base de données** : base PostgreSQL dédiée aux tests, réinitialisée à chaque run

#### Exemple de cas de test prioritaires

| Cas | Type | Priorité |
|---|---|---|
| Login avec identifiants valides → token retourné | Intégration | Must |
| Login avec mauvais mot de passe → 401 | Intégration | Must |
| GET `/votes` sans token → 401 | Intégration | Must |
| GET `/votes` avec token valide → liste paginée | Intégration | Must |
| Serializer vote : champs manquants → erreur explicite | Unitaire | Should |

---

### 4.2 Pipeline ETL (Kestra / Python)

#### Tests unitaires

- **Outil** : `pytest`
- **Ce qu'on teste** :
  - Fonctions de transformation (nettoyage, normalisation, déduplication)
  - Parsers par source (AN, Sénat, UE)
  - Validateurs de schéma (structure attendue des données Silver)

#### Tests de données (data quality)

- **Outil** : assertions Python dans les scripts ETL ou `great_expectations` (optionnel)
- **Ce qu'on teste** :
  - Nombre de lignes ingérées > 0 après un run
  - Absence de doublons sur les identifiants clés
  - Valeurs nulles dans les colonnes obligatoires
  - Cohérence des types de données (dates, entiers, chaînes)

#### Exemple de cas de test prioritaires

| Cas | Type | Priorité |
|---|---|---|
| Fonction de normalisation AN : entrée JSON → sortie schéma Silver correct | Unitaire | Must |
| Run ETL AN : nombre de votes ingérés > 0 | Data quality | Must |
| Cross-match : pas de doublon sur `(nom, prenom, date_naissance)` | Data quality | Should |
| Parser UE JSON-LD : champ `mepId` toujours présent | Unitaire | Should |

---

### 4.3 Frontend (Next.js)

#### Tests unitaires

- **Outil** : `Jest` + `React Testing Library`
- **Ce qu'on teste** :
  - Composants réutilisables (boutons, cartes, filtres)
  - Fonctions utilitaires (formatage de dates, tri, pagination)
  - Hooks personnalisés

#### Tests d'intégration

- **Outil** : `Jest` + mocks des appels API (MSW — Mock Service Worker)
- **Ce qu'on teste** :
  - Pages complètes avec données mockées (portail collectif, page personnelle)
  - Comportement des filtres et de la pagination
  - Gestion des états de chargement et d'erreur

#### Tests manuels (E2E)

- **Outil** : navigation manuelle dans le navigateur (Chrome / Firefox)
- **Parcours testés à chaque fin de sprint** :

| Parcours | Description |
|---|---|
| Authentification | Inscription → connexion → déconnexion |
| Portail collectif | Consultation du tableau des votes + filtres de base |
| Filtres avancés | Filtrer par institution, période, groupe politique |
| Page personnelle | Suivre un élu → consulter sa timeline |
| Gestion d'erreur | Accès sans connexion → redirection login |

---

## 5. Environnements de test

| Environnement | Usage | Données |
|---|---|---|
| **Local (machine développeur)** | Tests unitaires et d'intégration au quotidien | Données de test synthétiques |
| **CI (GitHub Actions)** | Exécution automatique à chaque PR | Données de test synthétiques |
| **Démo / pré-prod** | Tests manuels E2E avant soutenance | Données réelles (échantillon) |

---

## 6. Intégration continue (CI)

À chaque Pull Request sur la branche principale, GitHub Actions exécute automatiquement :

1. Linting du code (flake8 / ruff pour Python, ESLint pour JS)
2. Tests unitaires backend (`pytest`)
3. Tests unitaires frontend (`jest`)
4. Tests d'intégration backend (`pytest-django`)

Un PR ne peut pas être mergé si l'un de ces steps échoue.

---

## 7. Données de test

- Les tests utilisent des **jeux de données synthétiques** (fixtures) représentatives des données réelles.
- Les fixtures sont versionnées dans le dépôt (`tests/fixtures/`).
- Aucune donnée de production n'est utilisée dans les tests automatisés.
- Pour les tests manuels E2E en pré-prod, un **échantillon de données réelles** (votes AN sur 3 mois) est utilisé.

---

## 8. Responsabilités

| Pôle | Responsable des tests | Type de tests |
|---|---|---|
| Backend | Samuel (+ relecture Jaures) | Unitaires + intégration |
| Intégration Data | Arthur | Tests de contrats d’API internes + flux inter-systèmes |
| ETL / Data | Mehdi | Unitaires + data quality |
| IA | Chloé | Unitaires sur les pipelines de traitement |
| Frontend | Evilavy + Raphaël | Unitaires + intégration + E2E manuels |
| Revue globale avant soutenance | Jaures (Tech Lead) | Smoke tests sur tous les parcours |

---

## 9. Critères de qualité minimaux (MVP)

| Critère | Cible |
|---|---|
| Couverture tests unitaires backend | > 80 % sur les modules critiques |
| Couverture tests unitaires frontend | > 50 % sur les composants partagés |
| Parcours E2E manuels validés | 100 % des parcours Must Have |
| Zéro bug critique ouvert | Avant chaque démo |
| CI verte | Sur toutes les PR mergées |
