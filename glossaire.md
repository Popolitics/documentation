# POPolitics – Glossaire

Ce glossaire regroupe les termes politiques et techniques utilisés dans le projet POPolitics. Il est destiné à l'ensemble de l'équipe ainsi qu'aux lecteurs externes (jury, partenaires).

---

## A

**Abstention**
Vote par lequel un parlementaire choisit de ne pas se prononcer ni pour ni contre un texte. Distinct de l'absence physique en séance.

**Affinage du backlog** *(Backlog Refinement)*
Cérémonie Scrum tenue en milieu de sprint pour préparer les prochains sprints : découpage, estimation et priorisation des tickets du Product Backlog.

**Amendement**
Modification proposée à un texte de loi en cours d'examen. Peut être déposé par un parlementaire ou le gouvernement. Soumis au vote de l'assemblée concernée.

**AN**
Abréviation utilisée dans le projet pour désigner l'**Assemblée nationale**.

**API** *(Application Programming Interface)*
Interface permettant à deux applications de communiquer. Dans POPolitics, les APIs REST exposées par Django permettent au frontend Next.js de consommer les données des datamarts.

**Architecture Bronze / Silver / Gold**
Organisation en trois couches du Data Lake :
- **Bronze** : données brutes, format original, traçabilité maximale.
- **Silver** : données nettoyées, normalisées, schéma unifié.
- **Gold** : données agrégées, prêtes à la consommation par les datamarts et le backend.

---

## B

**Backend**
Partie serveur d'une application, invisible pour l'utilisateur final. Dans POPolitics, le backend est développé avec **Django** et expose des APIs REST.

**Backlog** *(Product Backlog)*
Liste priorisée de toutes les fonctionnalités, améliorations et corrections à développer sur le projet. Géré par le Product Owner.

**BFF** *(Backend For Frontend)*
Couche intermédiaire côté serveur qui adapte les données du backend aux besoins spécifiques du frontend. Dans POPolitics, le **Next Server** joue ce rôle.

**Bronze**
Voir *Architecture Bronze / Silver / Gold*.

---

## C

**CI/CD** *(Continuous Integration / Continuous Deployment)*
Pratique DevOps consistant à automatiser les tests (CI) et le déploiement (CD) à chaque modification du code.

**Cohérence** *(d'un élu)*
Indicateur calculé par POPolitics mesurant l'écart entre les votes d'un élu et la ligne officielle de son groupe politique.

**Cross-match**
Opération consistant à rapprocher les données de plusieurs institutions (AN, Sénat, UE) pour identifier les mêmes élus ou les mêmes textes législatifs à travers des sources différentes.

---

## D

**Data Lake**
Système de stockage centralisé de données brutes, organisé en couches (Bronze / Silver / Gold). Permet de conserver l'historique complet des données ingérées et de les retraiter à tout moment.

**Datamart**
Base de données relationnelle thématique, alimentée depuis la couche Gold du Data Lake, consommée par le backend Django. POPolitics dispose de 4 datamarts : AN, Sénat, UE, Cross-match.

**Definition of Done (DoD)**
Liste de critères qu'une user story ou une tâche doit satisfaire pour être considérée comme terminée (tests passants, revue de code effectuée, documentation à jour, etc.).

**Député**
Membre de l'Assemblée nationale, élu au suffrage universel direct pour 5 ans dans une circonscription. Participe au vote des lois en première ou deuxième lecture.

**Distanciel**
Période du calendrier d'alternance pendant laquelle les membres de l'équipe travaillent depuis leur entreprise d'accueil. Par opposition au **présentiel**.

**Django**
Framework web Python utilisé pour le backend de POPolitics. Fournit le système d'authentification, l'ORM (accès base de données) et les APIs REST via Django REST Framework.

**Docker / Docker Compose**
Outil de conteneurisation permettant d'isoler chaque service de la stack (Django, Next.js, PostgreSQL, Kestra…) dans un conteneur indépendant. Docker Compose orchestre l'ensemble en local.

**Dossier législatif**
Ensemble des documents relatifs à un texte de loi : projet ou proposition de loi, amendements, comptes rendus des débats, résultat des votes, navette parlementaire.

---

## E

**Élu**
Terme générique désignant tout représentant élu dans le projet : député (AN), sénateur (Sénat) ou eurodéputé (Parlement européen).

**ETL** *(Extract, Transform, Load)*
Processus en trois étapes permettant d'ingérer des données :
- **Extract** : récupération des données depuis les sources (AN, Sénat, UE).
- **Transform** : nettoyage, normalisation, enrichissement.
- **Load** : chargement dans les datamarts PostgreSQL.

**Eurodéputé (MEP)**
Membre du Parlement européen, élu au suffrage universel direct pour 5 ans. Siège à Strasbourg (sessions plénières) et Bruxelles (commissions).

---

## F

**Frontend**
Partie visible d'une application, rendue dans le navigateur de l'utilisateur. Dans POPolitics, le frontend est développé avec **Next.js** (React).

---

## G

**Gold**
Voir *Architecture Bronze / Silver / Gold*.

**Groupe politique**
Association de parlementaires partageant une même orientation politique au sein d'une assemblée. Distinct d'un parti politique (un groupe peut regrouper plusieurs partis). Exemples : groupe Renaissance, groupe RN à l'AN ; groupe PPE au Parlement européen.

---

## I

**IA Service**
Service Django dédié à l'exposition des modèles d'intelligence artificielle (résumé automatique, classification de textes). Consommé par le Data Service et le frontend via APIs REST.

**Indicateur**
Métrique calculée à partir des données d'un élu ou d'un groupe politique. Exemples : taux de présence, taux de cohérence avec le groupe, nombre d'amendements déposés.

---

## J

**JWT** *(JSON Web Token)*
Format de token utilisé pour l'authentification dans POPolitics. Contient les informations de l'utilisateur de façon signée et chiffrée, avec une durée de vie limitée.

---

## K

**Kanban**
Méthode de gestion visuelle du flux de travail par colonnes (Todo → In Progress → Done). Utilisé via **GitHub Projects** en complément du cadre Scrum.

**Kestra**
Outil d'orchestration de pipelines ETL utilisé dans POPolitics. Permet de planifier, déclencher, surveiller et rejouer les workflows d'ingestion de données. Basé sur des fichiers YAML déclaratifs.

---

## L

**Landing Zone**
Terme désignant la zone de réception initiale des données brutes dans le Data Lake, correspondant à la couche **Bronze**.

**Législature**
Période correspondant au mandat d'une assemblée entre deux élections. La législature courante de l'AN est la **16e** (depuis 2022). Le Parlement européen est actuellement à la **10e** législature (depuis 2024).

**Loi**
Texte adopté par le Parlement (AN + Sénat) après une ou plusieurs lectures, puis promulgué par le Président de la République. Point d'arrivée d'un dossier législatif.

---

## M

**Mandat**
Période d'exercice d'une fonction élective. Un même élu peut avoir plusieurs mandats successifs (réélu) ou simultanés (cumulat de mandats, limité par la loi en France).

**MEP** *(Member of European Parliament)*
Voir *Eurodéputé*.

**MoSCoW**
Méthode de priorisation des fonctionnalités en quatre catégories : **Must have**, **Should have**, **Could have**, **Won't have (for now)**.

**MVP** *(Minimum Viable Product)*
Version minimale du produit permettant de valider les fonctionnalités essentielles (Must Have) et de réaliser une démonstration convaincante en soutenance.

---

## N

**Navette parlementaire**
Processus par lequel un texte de loi est transmis alternativement entre l'AN et le Sénat jusqu'à adoption d'un texte identique par les deux chambres, ou intervention d'une commission mixte paritaire.

**Next.js**
Framework React utilisé pour le frontend de POPolitics. Permet le rendu côté serveur (SSR) et côté client, ainsi que la mise en place d'un BFF via les Server Actions.

**NFR** *(Non-Functional Requirements)*
Voir *Exigences non-fonctionnelles*. Définissent les contraintes de performance, sécurité, disponibilité et maintenabilité du système.

---

## O

**OBS** *(Organizational Breakdown Structure)*
Décomposition hiérarchique de l'équipe projet par rôles et responsabilités. Complément du WBS pour l'affectation des tâches aux membres.

**ORM** *(Object-Relational Mapping)*
Couche d'abstraction permettant de manipuler une base de données relationnelle via des objets Python, sans écrire de SQL manuellement. Django intègre son propre ORM.

---

## P

**Parlement européen (UE)**
Institution de l'Union européenne composée d'eurodéputés élus dans chaque État membre. Codécide des lois européennes avec le Conseil de l'UE. Abrégé **UE** dans le projet.

**Pipeline**
Séquence automatisée d'étapes de traitement de données (extraction → transformation → chargement). Dans POPolitics, les pipelines sont orchestrés par **Kestra**.

**PostgreSQL**
Système de gestion de base de données relationnelle open source utilisé pour les datamarts de POPolitics (AN, Sénat, UE, Cross-match) et la base d'authentification.

**Présentiel**
Période du calendrier d'alternance pendant laquelle les membres de l'équipe sont physiquement à l'école. Par opposition au **distanciel**.

**Product Owner (PO)**
Rôle Scrum responsable de la vision produit, de la priorisation du backlog et de la validation des fonctionnalités livrées. Dans POPolitics : **Samy**.

**Pull Request (PR)**
Mécanisme GitHub permettant de proposer des modifications de code pour revue avant intégration dans la branche principale.

---

## R

**REST** *(Representational State Transfer)*
Style d'architecture pour les APIs web. Les APIs de POPolitics suivent les conventions REST : ressources identifiées par des URLs, verbes HTTP (GET, POST, PUT, DELETE), réponses en JSON.

**RGPD** *(Règlement Général sur la Protection des Données)*
Règlement européen (2018) encadrant la collecte et le traitement des données personnelles. S'applique aux données des utilisateurs inscrits sur POPolitics.

---

## S

**Scrutin**
Vote formel organisé au sein d'une assemblée parlementaire. Un scrutin donne lieu à un résultat officiel (adopté / rejeté) et au relevé du vote individuel de chaque parlementaire.

**Sénateur**
Membre du Sénat, élu au suffrage universel indirect pour 6 ans (renouvelé par moitié tous les 3 ans). Participe à l'examen et au vote des lois.

**Sénat**
Chambre haute du Parlement français, composée de 348 sénateurs. Examine les textes après l'AN dans le cadre de la navette parlementaire.

**Silver**
Voir *Architecture Bronze / Silver / Gold*.

**Scrum**
Cadre de développement agile structuré en sprints itératifs, avec des rôles définis (Product Owner, Scrum Master, équipe) et des cérémonies régulières (Planning, Daily, Review, Retro).

**Sprint**
Itération de durée fixe (2 semaines dans POPolitics) pendant laquelle l'équipe développe un ensemble de fonctionnalités définies lors du Sprint Planning.

**Sprint Goal**
Objectif principal d'un sprint, exprimé en une phrase. Guide les décisions de l'équipe si des ajustements sont nécessaires en cours de sprint.

**SSR** *(Server-Side Rendering)*
Technique de rendu où la page HTML est générée côté serveur avant d'être envoyée au navigateur. Améliore les performances et le référencement. Utilisé par Next.js.

**Story Points**
Unité d'estimation de la complexité d'une tâche, indépendante du temps. Basée sur l'échelle de Fibonacci (1, 2, 3, 5, 8, 13…).

---

## T

**Tech Lead**
Rôle technique responsable de l'architecture, de la cohérence des choix techniques et de la revue de code. Dans POPolitics : **Jaures**.

**Token**
Voir *JWT*.

---

## U

**UE**
Abréviation utilisée dans le projet pour désigner le **Parlement européen** (Union européenne).

**User Story**
Description courte d'une fonctionnalité du point de vue de l'utilisateur. Format standard : *"En tant que [rôle], je veux [action] afin de [bénéfice]."*

---

## V

**Vélocité**
Nombre de story points complétés par l'équipe sur un sprint. Indicateur de capacité utilisé pour calibrer les sprints suivants.

---

## W

**WBS** *(Work Breakdown Structure)*
Décomposition hiérarchique de l'ensemble des tâches du projet en lots de travail. Permet de couvrir exhaustivement le périmètre et d'affecter des responsabilités via l'OBS.
