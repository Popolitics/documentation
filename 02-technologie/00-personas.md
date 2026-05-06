# POPolitics – Personas

## Introduction

Ce document décrit les **trois personas** du projet POPolitics. Chaque persona est une représentation fictive mais réaliste d'un type d'utilisateur cible. Ils servent de référence commune pour les décisions de design, de priorisation des fonctionnalités et de rédaction des user stories.

Ces personas sont référencés dans [09-user-stories.md](09-user-stories.md).

---

## Persona 1 — Le Citoyen engagé

### 🧑 Profil

| | |
| :--- | :--- |
| **Nom** | Marie Fontaine |
| **Âge** | 34 ans |
| **Profession** | Infirmière en CHU |
| **Localisation** | Bordeaux (33) |
| **Situation** | En couple, deux enfants |
| **Niveau numérique** | Intermédiaire — utilise smartphone, réseaux sociaux, quelques apps métier |

### Biographie

Marie travaille en service de pédiatrie depuis 10 ans. Entre ses gardes, elle suit l'actualité politique sur son téléphone — principalement via les médias sociaux et des podcasts. Elle vote à chaque élection mais se sent souvent perdue face à la complexité des textes de loi et des positions politiques. Elle a développé une méfiance vis-à-vis des médias traditionnels qu'elle trouve trop orientés, et cherche à former ses propres opinions à partir de **données brutes et vérifiables**.

Elle entend souvent parler d'un élu en particulier sur les sujets de santé et d'hôpital public, mais n'a jamais trouvé un outil simple pour suivre concrètement ce que cet élu vote réellement au parlement.

### Objectifs

- Comprendre comment **ses représentants locaux** votent sur les sujets qui la touchent (santé, éducation, logement).
- Pouvoir **vérifier rapidement** une information politique sans lire des dizaines de pages.
- Suivre l'**actualité parlementaire** en moins de 10 minutes par jour.
- Former son opinion sur la base de **faits, pas de discours**.

### Frustrations

- Les sites officiels (Assemblée nationale, Sénat) sont **complexes et peu intuitifs**.
- Les médias simplifient trop ou au contraire noient l'information dans du contexte.
- Elle ne sait pas toujours **qui représente sa circonscription** ni ce qu'il a voté récemment.
- Les alertes d'actualité sont soit trop nombreuses, soit trop vagues.

### Comportement numérique

| Habitude | Détail |
| :--- | :--- |
| **Appareils** | Smartphone (90 %), tablette occasionnellement |
| **Réseaux** | Instagram, X (Twitter), podcasts |
| **Sessions** | Courtes (5–10 min), souvent en transport ou pendant les pauses |
| **Tolérance aux frictions** | Faible — abandonne si une page est trop lente ou confuse |

### Scénarios d'usage sur POPolitics

1. **Vérification rapide** : Elle entend à la radio qu'un député a voté contre une loi sur les infirmières. Elle ouvre POPolitics, tape le nom du député et vérifie le vote en 30 secondes.
2. **Suivi de son élu local** : Elle ajoute son député de circonscription à ses élus suivis et reçoit une notification quand il vote sur un texte lié à la santé.
3. **Découverte** : Via le portail collectif, elle découvre qu'un groupe politique qu'elle pensait proche de ses valeurs vote régulièrement contre les textes sur le service public hospitalier.

### Citation représentative

> *« Je veux juste savoir ce que font réellement les gens que j'ai élus. Pas ce qu'ils disent à la télé — ce qu'ils votent vraiment. »*

---

## Persona 2 — Le Journaliste / Expert politique

### 🎙️ Profil

| | |
| :--- | :--- |
| **Nom** | Thomas Marchand |
| **Âge** | 41 ans |
| **Profession** | Journaliste politique indépendant & blogueur data |
| **Localisation** | Paris (75) |
| **Situation** | Célibataire, très mobile |
| **Niveau numérique** | Avancé — à l'aise avec Excel, Python basique, APIs publiques |

### Biographie

Thomas a travaillé 12 ans en presse nationale avant de se mettre à son compte. Il tient un blog d'analyse politique très suivi (~40 000 abonnés) et collabore ponctuellement avec des médias en ligne pour des articles de fond. Sa spécialité : le **data journalisme politique** — il transforme des données brutes en récits visuels compréhensibles pour le grand public.

Il passe plusieurs heures par semaine à extraire manuellement des données du site de l'Assemblée nationale et du Sénat, à les nettoyer dans des tableurs et à construire ses propres analyses. Ce travail fastidieux lui prend un temps précieux qu'il préférerait consacrer à l'écriture et à l'analyse.

### Objectifs

- Accéder à des **données propres, structurées et à jour** sans effort d'extraction manuel.
- Pouvoir **croiser les données** entre AN, Sénat et Parlement européen sur un même élu ou groupe.
- Identifier rapidement des **tendances et anomalies** (votes atypiques, ruptures, alliances inattendues).
- **Exporter les données** pour les réutiliser dans ses articles et visualisations.
- Comparer des élus ou groupes sur une période longue.

### Frustrations

- Les **APIs officielles** sont peu documentées, instables et hétérogènes entre institutions.
- Le croisement manuel entre AN et Sénat sur un même élu est **extrêmement chronophage**.
- Les outils existants sont soit trop généralistes, soit derrière des paywalls prohibitifs.
- Les données de l'UE sont dans un format (RDF/JSON-LD) difficile à exploiter sans compétences techniques avancées.

### Comportement numérique

| Habitude | Détail |
| :--- | :--- |
| **Appareils** | Ordinateur (Mac, 95 %) |
| **Outils** | Google Sheets, Datawrapper, Python/Pandas (basique), Flourish |
| **Sessions** | Longues (1–3h), le matin ou tard le soir |
| **Tolérance aux frictions** | Haute — accepte la complexité si les données sont fiables et riches |

### Scénarios d'usage sur POPolitics

1. **Enquête thématique** : Il prépare un article sur les votes concernant le nucléaire depuis 2015. Il filtre par thème, période et institution, exporte le CSV et l'importe dans Datawrapper pour créer une visualisation.
2. **Portrait d'élu** : Il accède à la fiche d'un sénateur, consulte son score de cohérence avec son groupe, identifie 3 votes atypiques et les utilise comme angle d'attaque pour son article.
3. **Analyse des alliances** : Il utilise la cartographie des alliances pour identifier quels groupes ont voté ensemble sur les textes économiques lors de la dernière session. Il inclut la capture dans son article.
4. **Croisement AN/Sénat/UE** : Pour un article sur un eurodéputé qui a également été député AN, il croise ses votes sur les trois institutions pour montrer une évolution de positionnement au fil du temps.

### Citation représentative

> *« Ce dont j'ai besoin, c'est d'un accès propre aux données — pas d'une interface grand public. Donnez-moi les filtres, les exports et les comparateurs, et je fais le reste. »*

---

## Persona 3 — L'Administrateur plateforme

### ⚙️ Profil

| | |
| :--- | :--- |
| **Nom** | Lucas Perrin |
| **Âge** | 26 ans |
| **Profession** | Étudiant M2 Informatique / Membre de l'équipe POPolitics |
| **Localisation** | Lyon (69) |
| **Rôle dans l'équipe** | DevOps / Data Engineer en alternance |
| **Niveau numérique** | Expert — DevOps, Docker, CI/CD, monitoring, Python |

### Biographie

Lucas est en dernière année de master à Epitech. Il a rejoint le projet POPolitics dès le départ, convaincu par la dimension civic-tech du projet. En entreprise, il travaille chez un éditeur SaaS B2B où il gère l'infrastructure cloud et les pipelines de données. Il apporte à l'équipe ses compétences en orchestration, déploiement et fiabilité des systèmes.

Au quotidien, il est l'un des seuls membres de l'équipe à interagir directement avec l'infrastructure de production : il surveille les pipelines Kestra, diagnostique les erreurs d'ingestion, gère les accès et s'assure que la plateforme est disponible avant chaque démo ou soutenance.

### Objectifs

- **Maintenir les pipelines ETL** opérationnels sans intervention manuelle quotidienne.
- Détecter et corriger rapidement les **erreurs d'ingestion** (API source indisponible, format modifié, rejet de données).
- Gérer les **comptes utilisateurs** et les droits d'accès à la plateforme.
- Préparer et valider l'environnement avant les **démos et soutenances**.
- Monitorer la **santé globale** du système (services, base de données, jobs Kestra).

### Frustrations

- Les erreurs silencieuses dans les pipelines : un job ETL échoue mais aucune alerte n'est déclenchée, les données en base sont obsolètes sans que personne ne le remarque.
- La **dépendance aux APIs publiques** instables : un changement de format sur data.assemblee-nationale.fr peut casser toute la chaîne d'ingestion.
- La gestion manuelle des **migrations de base de données** lors des mises à jour.
- Le manque de visibilité sur l'état global de la plateforme en dehors de la console Kestra.

### Comportement numérique

| Habitude | Détail |
| :--- | :--- |
| **Appareils** | Ordinateur (Linux/Mac), terminal omniprésent |
| **Outils** | Docker, GitHub Actions, Kestra UI, psql, logs système |
| **Sessions** | Ponctuelles et réactives — intervient sur incident ou lors des déploiements |
| **Tolérance aux frictions** | Très haute pour les outils techniques, très faible pour le manque de logs clairs |

### Scénarios d'usage sur POPolitics

1. **Monitoring quotidien** : Chaque matin, il consulte le tableau de bord Kestra pour vérifier que les jobs ETL de la nuit se sont bien exécutés. Si un job est en erreur, il accède aux logs, identifie la cause (timeout API, schéma modifié) et relance manuellement ou déclenche un correctif.
2. **Gestion des utilisateurs** : Un membre de l'équipe pédagogique demande un accès démo à la plateforme. Lucas crée un compte via l'interface d'administration, lui attribue le rôle "lecture seule" et lui communique ses identifiants.
3. **Déploiement avant soutenance** : 48h avant une soutenance, il exécute le script de déploiement complet, vérifie les migrations, charge un jeu de données de démo figé et effectue les smoke tests pour s'assurer que tous les parcours utilisateurs critiques fonctionnent.
4. **Gestion d'incident** : Un pipeline d'ingestion des données du Sénat échoue deux jours de suite. Lucas analyse les logs, identifie que l'URL de l'API source a changé, met à jour le connecteur Kestra et relance le pipeline avec rejeu des données manquantes.

### Citation représentative

> *« Mon job, c'est que personne ne remarque que j'existe — parce que si la plateforme tourne sans accroc, c'est que j'ai bien fait mon travail. »*

---

## Récapitulatif

| Persona | Représente | Priorité fonctionnelle |
| :--- | :--- | :--- |
| **Marie Fontaine** — Citoyenne | Grand public, usage mobile, sessions courtes | Simplicité, notifications, filtres de base |
| **Thomas Marchand** — Journaliste/Expert | Utilisateur avancé, analyse data, desktop | Export, filtres avancés, cross-match, comparateurs |
| **Lucas Perrin** — Administrateur | Équipe interne, opérations, infrastructure | Monitoring, gestion utilisateurs, fiabilité ETL |
