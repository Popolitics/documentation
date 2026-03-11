# POPolitics – Priorisation MoSCoW

## Méthode

La priorisation MoSCoW est utilisée ici pour distinguer :

- **Must have** : indispensable pour un MVP crédible à la soutenance.
- **Should have** : important, fortement souhaité si le temps le permet.
- **Could have** : bonus / nice-to-have si la charge le permet.
- **Won't have (for now)** : hors périmètre de ce projet (phase ultérieure).

---

## 1. Must have

### 1.1 Données & ETL (plateforme minimale)

- Ingestion des données **AN, Sénat et UE** via un pipeline ETL minimal.
- Mise en place de la Landing Zone avec au moins les couches **Bronze** (brut) et **Silver** (nettoyé / normalisé).
- Orchestration de base des jobs ETL avec **Kestra** (lancement, logs, statut des exécutions).
- Création de datamarts PostgreSQL pour au moins **AN, Sénat et UE**, consommables par le backend.

### 1.2 Backend & services

- Backend **Django** opérationnel, structuré en services :
  - **Data Service** exposant des APIs REST pour le **Portail collectif** (votes, indicateurs de base),
  - **Auth Service** avec authentification basique (création de compte, login, rôles simples).
- Intégration minimale avec la plate‑forme data (requêtes sur les datamarts principaux).

### 1.3 Frontend (MVP Portail collectif)

- Frontend **Next.js** avec BFF (Next Server) consommant les APIs backend.
- Pages principales :
  - Page de **connexion / inscription**,
  - Première version du **Portail collectif** :
    - tableau des votes avec filtres essentiels (institution, période, groupe politique, élu),
    - premiers graphiques simples (évolution, répartition des votes).
- Gestion minimale des erreurs et états de chargement.

### 1.4 Qualité, sécurité & documentation

- Traçabilité minimale des traitements ETL (logs Kestra, identifiants de batch, statut des jobs).
- Séparation claire des données métier et des données d’authentification (base Auth dédiée).
- Livraison d’une **documentation d’architecture** (choix techniques, schémas) et d’un **Plan Qualité** décrivant méthodo, tests et déploiement.

---

## 2. Should have

### 2.1 Données & analytique

- Mise en place de la couche **Gold** dans le Data Lake (données prêtes à l’analyse).
- Datamart **Cross‑match** permettant de croiser AN / Sénat / UE.
- Jeux d’**indicateurs et KPI** plus avancés (activité, typologie de votes, cohérence, opposition, alliances).

### 2.2 Couche IA

- Premier modèle IA en production (ex. **résumé automatique** de débats ou **classification** de textes politiques).
- **IA Service** exposant au moins un endpoint d’inférence vers le backend.

### 2.3 Frontend (tendances & page personnelle v1)

- Filtres avancés (dates, institutions, catégories, types de texte).
- Visualisations graphiques plus évoluées (courbes, barres, heatmaps simples).
- Première version de la **Page personnelle** :
  - sélection d’élus suivis et de thèmes d’intérêt,
  - timeline simplifiée des actions des élus suivis,
  - premières **notifications personnalisées** basées sur ces préférences.

### 2.4 Opérations & outillage

- Monitoring plus détaillé des workflows Kestra (retries, alertes simples, tableau de bord minimal).
- Scripts de déploiement / configuration plus industrialisés (Docker ou équivalent) pour la stack Django / Next.js / Kestra.

---

## 3. Could have

### 3.1 Données & IA

- Modèles IA supplémentaires (analyse de tendance plus fine, détection d’anomalies, recommandation de contenus, etc.).
- Scénarios de simulation ou de projection simples à partir des données.

### 3.2 Frontend & UX

- Tableau de bord **hautement personnalisable** par utilisateur (widgets, réorganisation des blocs).
- Export avancé des résultats (CSV, PDF, infographies prêtes pour les réseaux sociaux ou la presse).
- Pages explicatives / pédagogiques détaillées sur les données, les indicateurs et la méthodologie.

### 3.3 Plateforme & DevOps

- Pipeline CI/CD automatisé (tests, build, déploiement automatique sur un environnement de démo).
- Supervision centralisée (tableau de bord de santé des services et des jobs Kestra, alertes proactives).

---

## 4. Won't have (for now)

- Ingestion **temps réel** ou streaming massif de données.
- Infrastructure cloud complexe et coûteuse (cluster managé, data warehouse propriétaire payant, etc.).
- Application mobile native dédiée (Android / iOS).
- Fonctionnalités sociales avancées (commentaires, interactions entre utilisateurs).
- Mécanismes de recommandation complexes basés sur l’IA.

Ces éléments sont considérés hors périmètre pour le projet et pourront être envisagés dans une phase ultérieure si le projet est pérennisé.
