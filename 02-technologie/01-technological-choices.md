# POPolitics – Choix techniques

## 1. Vision générale

- Projet de **collecte**, **transformation**, **analyse** et **vulgarisation** de données politiques publiques.
- **Sources** : Assemblée nationale, Sénat, Parlement européen.
- **Contraintes** :
  - Budget nul au départ
  - Données publiques
  - Architecture évolutive
- **Message clé** : Construire un pipeline **moderne**, **robuste** et **scalable**, **gratuit au départ**.

---

## 2. Objectifs fonctionnels de l’application

### 2.1 Objectifs principaux

- Centraliser les données politiques issues de plusieurs institutions.
- Nettoyer, structurer et croiser les données.
- Rendre l’information accessible et compréhensible pour un public non expert.
- Offrir une interface web performante et sécurisée.

### 2.2 Contraintes clés

- Sources multiples (AN, Sénat, UE).
- Volumétrie évolutive.
- Besoin de traçabilité et de reproductibilité.
- Séparation claire des responsabilités (data / backend / frontend).

---

## 3. Vision globale de l’architecture

### 3.1 Approche retenue

- Architecture **modulaire en couches**.
- Séparation claire entre :
  - Pipeline ETL
  - Stockage analytique
  - Services backend
  - Interface frontend

### 3.2 Motivations

- Scalabilité (MVP local → évolution Cloud, ajout de sources, etc.).
- Maintenabilité.
- Possibilité d’évolution indépendante de chaque brique.
- Alignement avec des architectures utilisées en production.

---

## 4. Sources de données & ingestion

### 4.1 Sources exploitées

- Données du **Sénat**.
- Données de l’**Assemblée nationale**.
- Données du **Parlement européen**.

### 4.2 Caractéristiques

- Formats hétérogènes.
- Fréquences de mise à jour variables.
- Structures parfois non normalisées.

### 4.3 Choix

- Phase **EXTRACT** dédiée.
- Centralisation initiale avant toute transformation.

---

## 5. Landing Zone & Data Lake

### 5.1 Landing Zone – Data Lake

- Stockage de type fichiers/objets, pensé pour être **scalable**,
  qu’il soit hébergé en local (MVP, V1 serveur) ou dans le **Cloud**.
- Format **Parquet** / fichiers bruts.

### 5.2 Organisation en 3 niveaux

- **Bronze** : données brutes (traçabilité maximale).
- **Silver** : données nettoyées et pré‑traitées.
- **Gold** : données prêtes à être consommées.

### 5.3 Avantages

- Séparation des responsabilités.
- Reproductibilité des traitements.
- Facilité de debug et d’audit.

---

## 6. Orchestration des pipelines ETL

### 6.1 Outil : Kestra

**Rôle :**

- Orchestration des tâches ETL.
- Gestion des dépendances.
- Automatisation des workflows.

### 6.2 Pourquoi Kestra ?

- Orienté **data engineering**.
- Déclaratif et lisible (**YAML**).
- Facilement observable (logs, retries, monitoring).
- Outil **français**.

---

## 7. Stockage analytique : Datamarts

### 7.1 Outil : PostgreSQL

**Organisation :**

- Datamart 1 : Assemblée nationale.
- Datamart 2 : Sénat.
- Datamart 3 : Parlement européen.
- Datamart 4 : Cross‑match multi‑institutions.

### 7.2 Raisons du choix

- SQL standard et robuste.
- Adapté à l’analyse tabulaire.
- Bonne intégration avec les services backend.

---

## 8. Couche IA & Model Training

### 8.1 Socle IA

- Données issues de la couche **Silver/Gold**.

### 8.2 Cas d’usage

- Résumés automatiques.
- Classification des textes politiques.
- Analyse de tendances ou d’activité.

### 8.3 Intégration

- Modèles entraînés **hors frontend**.
- Exposés via un **service dédié (IA Service)**, accessible par le backend Django.

---

## 9. Backend – Django

### 9.1 Découpage en services

- **IA Service** : accès aux modèles et prédictions.
- **Data Service** : exposition des données métier issues des datamarts.
- **Auth Service** : gestion des utilisateurs et des droits.

### 9.2 Communication

- APIs **REST**.
- Découplage fort entre services backend et plate‑forme data.

### 9.3 Objectifs

- Clarté fonctionnelle.
- Sécurité.
- Évolutivité indépendante.

---

## 10. Authentification & gestion des utilisateurs

### 10.1 Base d’authentification dédiée

- Stockage des utilisateurs.
- Rôles et permissions.

### 10.2 Flux

- Frontend → Auth Service → Auth Database.

### 10.3 Objectifs

- Sécurité.
- Séparation des données métier et utilisateurs.
- Préparation à des fonctionnalités avancées (comptes, profils, favoris).

---

## 11. Frontend – Next.js

### 11.1 Architecture

- **Next Server** : BFF (Backend For Frontend).
- **Server Actions** : logique côté serveur.
- **Next Client** : rendu côté utilisateur.

### 11.2 Motivations

- Performance (**SSR / SSG**).
- Sécurité (logique sensible côté serveur).
- Intégration naturelle avec des APIs REST.

---

## 12. Synthèse

- Séparation claire des responsabilités (ETL, stockage, services, UI).
- Application des bonnes pratiques du **data engineering moderne**.
- Structuration des données via **Data Lake** (Bronze / Silver / Gold).
- Datamarts dédiés aux usages analytiques.
- Exposition des données via **APIs REST**.
- BFF garantissant sécurité et cohérence côté frontend.

L’architecture est cohérente avec les objectifs fonctionnels, réaliste pour un projet de Master 2 et alignée avec les standards professionnels, tout en restant généralisable à d’autres contextes institutionnels.

