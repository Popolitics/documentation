# OBS – POPolitics (Organisation Breakdown Structure)

## 0. Contexte

Projet étudiant de Master 2 visant à concevoir une plateforme web POPolitics pour l’analyse de données politiques et citoyennes. L’OBS ci‑dessous structure l’organisation de l’équipe en unités de responsabilité, en cohérence avec l’organigramme et le document Team composition & Skills.

---

## 1. Pilotage & Produit

**Responsable : Samy (Chef de projet / Product Owner)**

- **1.1 Gouvernance du projet**  
  - 1.1.1 Définition de la vision produit POPolitics  
  - 1.1.2 Animation des réunions d’équipe / comités  
  - 1.1.3 Suivi des jalons académiques (livrables, soutenance)
- **1.2 Gestion de projet & backlog**  
  - 1.2.1 Planification globale (roadmap, sprint planning)  
  - 1.2.2 Priorisation du backlog fonctionnel  
  - 1.2.3 Suivi des tâches (Trello / Notion / GitHub Projects)
- **1.3 Coordination inter‑pôles**  
  - 1.3.1 Synchronisation Frontend / Backend / Data / DevOps  
  - 1.3.2 Gestion des dépendances entre lots techniques  
  - 1.3.3 Arbitrage des charges et disponibilités de l’équipe

---

## 2. Backend & Architecture Applicative

**Responsable : Arthur – Support technique / Tech Lead : Jaures**

- **2.1 Architecture backend**  
  - 2.1.1 Choix du framework (ex. Django / FastAPI)  
  - 2.1.2 Structuration des modules backend (IA Service, Data Service, Auth Service, couches d'API)  
  - 2.1.3 Standards de développement et bonnes pratiques
- **2.2 Développement des APIs**  
  - 2.2.1 Conception des endpoints REST exposés par les services (Data, IA, Auth) vers la couche frontend / BFF Next.js  
  - 2.2.2 Gestion des accès aux données exposées par les services Data (APIs internes / connecteurs)  
  - 2.2.3 Intégration avec les services Data & IA et le service d'authentification (Auth Service / Auth Database), sans gestion directe de la plate‑forme data (data lake / datamarts)
- **2.3 Sécurité & performances backend**  
  - 2.3.1 Gestion de l’authentification / autorisation  
  - 2.3.2 Validation des entrées et gestion des erreurs  
  - 2.3.3 Optimisation des temps de réponse (caching, requêtes)

---

## 3. Frontend & UX/UI

**Responsables : Evilavy, Raphaël – Contribution UX/UI : Samy**

- **3.1 Architecture frontend**  
  - 3.1.1 Choix des technologies frontend (Next.js / React, HTML/CSS/JS)  
  - 3.1.2 Organisation des vues et composants, avec séparation BFF (Next Server / Server Actions) et Next Client  
  - 3.1.3 Intégration du design system POPolitics
- **3.2 Implémentation de l’interface**  
  - 3.2.1 Intégration des maquettes UX/UI  
  - 3.2.2 Consommation des APIs backend  
  - 3.2.3 Gestion des états de chargement / erreurs / feedbacks utilisateurs
- **3.3 Visualisation de données**  
  - 3.3.1 Choix des bibliothèques de visualisation (graphiques, cartes, etc.)  
  - 3.3.2 Conception des dashboards et écrans d’analyse  
  - 3.3.3 Optimisation de l’ergonomie et de la lisibilité des données

---

## 4. Data Engineering & Data Science

**Responsables : Mehdi (ETL / Data Engineering), Chloé (IA / Data Science)**

- **4.1 Ingestion & préparation des données**  
  - 4.1.1 Conception des pipelines ETL depuis les sources (AN, Sénat, UE) vers la Landing Zone  
  - 4.1.2 Gestion des couches DATA BRONZE (raw), DATA SILVER (soft process) et DATA GOLD (ready to ingest)  
  - 4.1.3 Choix des formats et emplacements de stockage (Parquet / filesystem / cloud scalable)
- **4.2 Modélisation & analyse**  
  - 4.2.1 Définition des indicateurs et KPI politiques / citoyens  
  - 4.2.2 Développement des modèles d’analyse ou de machine learning  
  - 4.2.3 Validation des modèles et interprétation des résultats
- **4.3 Intégration au produit**  
  - 4.3.1 Exposition des fonctionnalités data via services / APIs, y compris l'API FastAPI du socle IA vers le backend Django  
  - 4.3.2 Collaboration avec le frontend pour la restitution visuelle  
  - 4.3.3 Documentation des jeux de données et des modèles

- **4.4 Orchestration des pipelines**  
  - 4.4.1 Conception et configuration des workflows d'orchestration dans Kestra  
  - 4.4.2 Supervision, logging et relance des jobs ETL  
  - 4.4.3 Coordination avec le pôle DevOps pour l'exécution en environnement contrôlé

---

## 5. Data Lake, Data Warehouse & Datamarts

**Responsable principal : Mehdi (schémas & flux analytiques)**

- **5.1 Conception des couches de stockage**  
  - 5.1.1 Modélisation logique des données pour le data lake (Landing Zone BRONZE / SILVER / GOLD) et le data warehouse  
  - 5.1.2 Choix de l’architecture de stockage et des technologies (filesystem / cloud, formats Parquet, etc.)  
  - 5.1.3 Définition des clés, index et contraintes d’intégrité pour les usages analytiques
- **5.2 Datamarts analytiques PostgreSQL**  
  - 5.2.1 Conception et implémentation des datamarts AN, Sénat, UE et Cross-match dans PostgreSQL  
  - 5.2.2 Optimisation des schémas tabulaires pour l’interrogation par les APIs backend  
  - 5.2.3 Gestion des évolutions de schémas en fonction des besoins métier
- **5.3 Administration & accès**  
  - 5.3.1 Création et maintenance des environnements de stockage (data lake / data warehouse / datamarts)  
  - 5.3.2 Gestion des connexions et performances des requêtes analytiques  
  - 5.3.3 Stratégie de sauvegarde minimale (contexte projet étudiant)

---

## 6. DevOps, Intégration & Déploiement

**Responsable : Lazare**

- **6.1 Environnements & outils**  
  - 6.1.1 Définition des environnements (dev / démo / éventuellement prod)  
  - 6.1.2 Mise en place de la gestion de versions (Git / GitHub)  
  - 6.1.3 Standardisation de la configuration locale de l’équipe
- **6.2 Intégration continue (CI)**  
  - 6.2.1 Configuration des pipelines CI de base (lint, tests)  
  - 6.2.2 Vérification automatique des pull requests  
  - 6.2.3 Reporting minimal vers l’équipe (statut build/tests)
- **6.3 Déploiement & hébergement**  
  - 6.3.1 Choix de la plateforme d’hébergement (cloud / PaaS) adaptée au projet étudiant  
  - 6.3.2 Scripts de déploiement ou fichiers de configuration (Docker, etc.)  
  - 6.3.3 Supervision légère et gestion des incidents  
  - 6.3.4 Mise en production et supervision des workflows Kestra, des services Django (Data, IA, Auth) et de la stack Next.js

---

## 7. Qualité, Tests & Sécurité

**Responsabilité partagée – Coordination : Samy & Jaures**

- **7.1 Stratégie de test**  
  - 7.1.1 Définition des types de tests (unitaires, intégration, tests manuels)  
  - 7.1.2 Répartition des responsabilités de test par pôle  
  - 7.1.3 Plan de recette avant démonstrations / soutenance
- **7.2 Mise en œuvre des tests**  
  - 7.2.1 Écriture des tests techniques essentiels (backend / data)  
  - 7.2.2 Scénarios de tests fonctionnels côté frontend  
  - 7.2.3 Suivi des anomalies et corrections
- **7.3 Sécurité & conformité minimale**  
  - 7.3.1 Revue des accès API et des droits utilisateurs  
  - 7.3.2 Application des bonnes pratiques de développement sécurisé  
  - 7.3.3 Revue de code croisée entre membres de l’équipe

---

## 8. UX/UI & Communication Produit

**Responsables : Samy, Evilavy, Raphaël**

- **8.1 Recherche utilisateur & cadrage UX**  
  - 8.1.1 Identification des profils d’utilisateurs cibles  
  - 8.1.2 Clarification des besoins d’analyse et de visualisation  
  - 8.1.3 Définition des parcours utilisateurs principaux
- **8.2 Design d’interface**  
  - 8.2.1 Création des maquettes et prototypes  
  - 8.2.2 Définition des chartes graphiques et composants  
  - 8.2.3 Itérations sur la base des retours équipe / encadrants
- **8.3 Documentation & communication**  
  - 8.3.1 Contribution aux supports de présentation du projet  
  - 8.3.2 Participation à la rédaction de la documentation fonctionnelle  
  - 8.3.3 Mise en cohérence des messages clés (vision POPolitics)

---

## 9. Synthèse et spécificités 

- Organisation légère et pragmatique : chaque bloc OBS est dimensionné pour être gérable par 1–2 personnes au sein d’une équipe étudiante.  
- Polyvalence assumée : certains membres interviennent sur plusieurs blocs (ex. Samy sur pilotage + UX, Mehdi sur data + base de données).  
- Priorisation forte : les parties critiques (APIs, frontend, data principale, déploiement minimal) sont couvertes clairement par des responsables identifiés.  
- Alignement avec l’organigramme : la hiérarchie de cet OBS reprend les pôles affichés dans l’organigramme (pilotage, backend, frontend, data, DevOps, qualité).  
- Séparation claire des couches : plate‑forme data (Landing Zone, datamarts PostgreSQL, Kestra), couche backend Django (services Data/IA/Auth) et couche frontend Next.js (BFF, Next Server, Next Client).
