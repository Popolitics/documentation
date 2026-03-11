# POPolitics – Mapping OBS ↔ WBS

Ce document fait le lien entre :
- la **structure organisationnelle** (OBS),
- les **lots de travail** définis dans le WBS.

L’objectif est de montrer **qui est responsable de quoi** pour chaque grande brique du projet.

---

## 1. Principaux lots WBS (niveau 1)

> Les intitulés ci‑dessous correspondent aux grands blocs fonctionnels et techniques du WBS POPolitics.

1. Pilotage & Produit
2. Plateforme Data & ETL
3. Datamarts & Analytique
4. Couche IA & Modèles
5. Backend Django (Services Data / IA / Auth)
6. Frontend Next.js (Portail collectif & Page personnelle)
7. DevOps & Orchestration (Kestra, déploiements)
8. Qualité, Tests & Sécurité

---

## 2. Tableau de responsabilités (vue synthétique)

<!-- markdownlint-disable MD060 -->

| Lot WBS (niveau 1)                               | Responsable principal (OBS) | Contributeurs clés (OBS)                                         |
|--------------------------------------------------|-----------------------------|------------------------------------------------------------------|
| 1. Pilotage & Produit                            | Samy (Chef de projet / PO) | Tous les leads techniques (Arthur, Mehdi, Chloé, Lazare, Front) |
| 2. Plateforme Data & ETL                         | Mehdi                       | Chloé (IA), Lazare (DevOps)                                     |
| 3. Datamarts & Analytique                        | Mehdi                       | Arthur (consommation via APIs), Chloé (besoins analytiques)     |
| 4. Couche IA & Modèles                           | Chloé                       | Mehdi (données), Arthur (intégration via IA Service)            |
| 5. Backend Django (Data / IA / Auth Services)    | Arthur                      | Jaures (support tech), Lazare (déploiement), Chloé (IA)         |
| 6. Frontend Next.js (Portail & Page personnelle) | Evilavy & Raphaël          | Samy (UX/UI), Arthur (contrats d’API)                           |
| 7. DevOps & Orchestration (Kestra, déploiements) | Lazare                      | Mehdi (workflows data), Arthur (services backend)               |
| 8. Qualité, Tests & Sécurité                     | Samy & Jaures              | Tous les membres selon leur périmètre                           |

<!-- markdownlint-enable MD060 -->

---

## 3. Exemple de mapping détaillé (extrait)

### 3.1 Lot WBS : Plateforme Data & ETL

- **Tâches principales** :
  - Conception pipelines d’ingestion (AN, Sénat, UE).
  - Mise en place de la Landing Zone (Bronze / Silver / Gold).
  - Orchestration des jobs dans Kestra.
- **Responsable** : Mehdi.
- **Contributeurs** :
  - Chloé (besoins IA sur les données Silver/Gold),
  - Lazare (environnements d’exécution, monitoring).

### 3.2 Lot WBS : Backend Django – Data Service

- **Tâches principales** :
  - Exposition des datamarts PostgreSQL via des APIs REST.
  - Gestion des contrats d’API avec le frontend.
  - Gestion des erreurs et des performances côté backend.
- **Responsable** : Arthur.
- **Contributeurs** :
  - Mehdi (schémas des datamarts),
  - Evilavy & Raphaël (besoins côté UI),
  - Lazare (déploiement).

### 3.3 Lot WBS : Frontend – Portail collectif

- **Tâches principales** :
  - Développement des écrans de suivi des votes et tendances.
  - Intégration des visualisations (graphes, tableaux, filtres).
  - Intégration avec les APIs backend.
- **Responsables** : Evilavy & Raphaël.
- **Contributeurs** :
  - Samy (priorisation fonctionnelle, UX),
  - Arthur (contrats d’API et endpoints).

Ce document peut être complété avec d’autres lots WBS détaillés, de façon similaire, si nécessaire.