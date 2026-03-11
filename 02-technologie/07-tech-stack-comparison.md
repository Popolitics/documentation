# POPolitics – Comparaison des stacks techniques

Ce document présente, de manière synthétique, les principales **options techniques étudiées** pour POPolitics, séparées par couche (ETL, Backend, Frontend), et justifie les choix retenus.

---

## 1. ETL & Orchestration

### 1.1 Kestra vs Airflow

<!-- markdownlint-disable MD060 -->

| Option       | Avantages principaux                                                   | Limites / remarques                                      | Choix retenu |
|-------------|-------------------------------------------------------------------------|----------------------------------------------------------|-------------|
| **Kestra**  | Orienté data engineering, workflows déclaratifs en YAML, interface moderne, déploiement simple en Docker, bonne observabilité, **outil français** | Communauté plus jeune qu’Airflow, moins de documentation historique | **Oui** – bon compromis pédagogie / simplicité / modernité |
| Airflow     | Standard industriel très répandu, très puissant, riche en opérateurs   | Plus lourd à mettre en place et à administrer pour un projet étudiant, courbe d’apprentissage plus importante | Non pour le MVP (envisageable plus tard) |

**Conclusion :** Kestra est choisi pour **orchestrer les pipelines ETL** car il offre un bon équilibre entre puissance, lisibilité et simplicité de déploiement dans une stack Docker multi‑conteneurs, tout en étant un **outil français**, cohérent éthiquement avec un projet centré sur la politique française et la souveraineté numérique. Ce choix complète l’architecture **Data Lake (Bronze / Silver / Gold)** décrite dans 01-technological-choices.md en apportant une orchestration moderne et facilement reproductible.

---

## 2. Backend

### 2.1 Django vs FastAPI

| Option      | Avantages principaux                                                | Limites / remarques                                              | Choix retenu |
|------------|----------------------------------------------------------------------|------------------------------------------------------------------|-------------|
| **Django** | Framework web complet (ORM, auth, admin), écosystème mature, très adapté aux CRUD et aux APIs REST classiques | Plus « lourd » que FastAPI pour de la simple API, courbe d’apprentissage un peu plus large | **Oui** – cohérent avec le besoin d’un backend complet (Auth Service, Data Service, IA Service) |
| FastAPI    | Très rapide, orienté API, typing moderne, excellent pour des micro‑services légers | Nécessite d’assembler plus de briques (auth, admin, etc.), moins aligné avec le besoin d’un backend structuré « tout‑en‑un » | Non, réservé éventuellement à des services spécifiques ultérieurs |

**Conclusion :** Django est retenu comme **socle backend principal** pour POPolitics, afin de bénéficier d’un cadre complet (authentification, ORM, structuration des apps) adapté au MVP et à la taille de l’équipe, et conforme à l’architecture **multi‑services** (Data Service, IA Service, Auth Service) décrite dans 01-technological-choices.md.

### 2.2 Backend Python vs Backend JavaScript

| Option                        | Avantages principaux                                                             | Limites / remarques                                                   | Choix retenu |
|------------------------------|---------------------------------------------------------------------------------|------------------------------------------------------------------------|-------------|
| **Backend Python (Django)**  | Aligné avec l’écosystème data/IA (ETL en Python, socle IA exposé en FastAPI), forte cohérence technique, mutualisation des compétences | Moins homogène avec le frontend JavaScript, nécessité de maîtriser deux langages sur le projet | **Oui** – meilleure intégration avec ETL & IA, moins de friction technique globale |
| Backend JavaScript (Node.js, Express/Nest) | Homogénéité full‑JS (front + back), grande communauté, écosystème riche de packages | Moins naturel pour interfacer directement les pipelines ETL Python et les modèles IA Python ; nécessite plus de “colle” entre mondes JS et Python | Non, écarté pour éviter la complexité d’un pont JS ↔ Python permanent |

**Conclusion :** un **backend Python** est privilégié pour rester cohérent avec :
- la plateforme data et les pipelines ETL majoritairement en Python ;
- le socle IA également en Python (FastAPI) ;
ce qui simplifie les échanges entre services et réduit les risques d’incompréhension technique au sein de l’équipe.

---

## 3. Frontend

### 3.1 Next.js vs SPA React classique

| Option              | Avantages principaux                                               | Limites / remarques                                | Choix retenu |
|--------------------|---------------------------------------------------------------------|----------------------------------------------------|-------------|
| **Next.js**        | SSR/SSG, très bonne intégration avec React, BFF intégré (Next Server), gestion des Server Actions, performance et SEO | Architecture un peu plus avancée à appréhender    | **Oui** – idéal pour un front web moderne consommant des APIs REST |
| React SPA classique| Simplicité de mise en place, très répandu, courbe d’apprentissage déjà connue par beaucoup d’étudiants | Pas de SSR natif, SEO plus faible, logique sensible côté client | Non, moins adapté aux besoins de performance et de sécurité |

<!-- markdownlint-enable MD060 -->

**Conclusion :** Next.js est retenu pour bénéficier du **BFF** et du rendu côté serveur, ce qui améliore à la fois la performance perçue, la sécurité (logique côté serveur) et l’expérience utilisateur, en cohérence avec l’objectif de proposer une **interface web performante et sécurisée** détaillé dans 01-technological-choices.md.

---

## 4. Synthèse

- **ETL & Data** : **Kestra** pour l’orchestration des pipelines vers le Data Lake (Bronze / Silver / Gold) et les datamarts PostgreSQL, garantissant traçabilité et reproductibilité des traitements.
- **Backend** : **Django / Python** comme framework complet pour les services Data, IA et Auth, fortement aligné avec les pipelines ETL et les modèles IA développés en Python.
- **Frontend** : **Next.js** pour un frontend moderne, performant et sécurisé (BFF + SSR/SSG) offrant une expérience claire et accessible aux utilisateurs finaux.

Ces choix prolongent les principes exposés dans 01-technological-choices.md : **séparation claire des responsabilités**, scalabilité progressive (MVP local → cloud), et alignement avec les bonnes pratiques de data engineering et de développement web modernes dans le cadre d’un projet de Master 2.