# POPolitics – Méthodologie et gestion de projet

## 1. Objectif du document

Ce document décrit la **méthodologie de gestion de projet** retenue pour POPolitics et la manière dont l’équipe organise le suivi des tâches, des livrables et des responsabilités.

---

## 2. Méthodologie choisie

### 2.1 Approche globale

Le projet POPolitics s'appuie sur un cadre **Scrum adapté** au contexte étudiant :

- Des **sprints à durée adaptée** au rythme d'alternance structurent l'avancement.
- **GitHub Projects** est utilisé comme tableau **Kanban** pour visualiser le flux de travail au quotidien — les deux pratiques coexistent : Scrum cadre les itérations, Kanban visualise l'état des tâches en temps réel.
- La priorisation est guidée par :
  - la valeur fonctionnelle (MoSCoW),
  - la complexité technique (story points),
  - les jalons académiques (livrables, soutenances).

### 2.2 Sprints

La durée des sprints est **variable** et calée sur le rythme d'alternance Master 1ère et 2ème année :

| Phase | Durée en présentiel | Durée en distanciel |
| :--- | :---: | :---: |
| Rythme M1 | 2 semaines | 6 semaines |
| Rythme M2 | 1 semaine | 9 semaines |

- En **présentiel** : 1 sprint = durée de la période (2 semaines ou 1 semaine).
- En **distanciel** : les sprints suivent le même principe mais s'adaptent à la période (6 ou 9 semaines), découpée en sous-sprints selon l'avancement.
- Chaque sprint démarre avec un **Sprint Planning** et se clôt avec une **Sprint Review** et une **Sprint Retrospective**.
- Le contenu d'un sprint est sélectionné depuis le **Product Backlog** (liste priorisée de toutes les user stories et tâches du projet).

#### Story points et estimation

L'effort de chaque tâche est estimé en **story points** selon les tailles de T-Shirt et l'échelle de Fibonacci :

| Points | Complexité indicative |
| :---: | :--- |
| XXS - 1 | Trivial, moins d'1 h de travail |
| XS - 2 | Simple, quelques heures |
| S - 3 | Modéré, une demi-journée |
| M - 5 | Complexe, 1–2 jours |
| L - 8 | Très complexe, nécessite découpage |
| XL - 13+ | Trop large, à découper obligatoirement |

#### Vélocité

- La **vélocité** correspond au nombre total de story points **complétés** (Definition of Done respectée) sur un sprint.
- Elle est mesurée à chaque fin de sprint et sert de référence pour calibrer le Sprint Planning suivant.
- Elle n'est pas une contrainte rigide mais un indicateur de capacité réelle de l'équipe.

### 2.3 Les 5 cérémonies Scrum

#### Sprint Planning

- **Quand** : début de chaque sprint (jour 1).
- **Durée** : 1 h maximum.
- **Participants** : toute l'équipe ou certains représentants indispensables pour ne pas mobiliser trop de temps d'équipe.
- **Objectif** : sélectionner les items du Product Backlog à intégrer dans le sprint, les estimer en story points si ce n'est pas encore fait, et définir l'objectif du sprint (*Sprint Goal*).
- **Output** : Sprint Backlog validé et Sprint Goal énoncé clairement, jusqu'à la Mise en Production (MEP).

#### Daily Standup (asynchrone)

- **Quand** : chaque jour ouvré ou tout les 2-3 jours si taille d'équipe trop importante et daily trop long.
- **Format** : message court dans le canal de l'équipe ou réunion (teams ou présentielle).
- **Structure** : chaque membre répond en quelques lignes à :
  1. Qu'ai-je fait depuis hier ?
  2. Que vais-je faire aujourd'hui ?
  3. Ai-je un blocage ?
- **Durée** : < 5 min par personne.
- **Output** : visibilité quotidienne sur l'avancement et les blocages.

#### Affinage du backlog

- **Quand** : en milieu de sprint (autour du jour 7).
- **Durée** : 30min-1h en fonction du nombre de ticket.
- **Participants** : toute l'équipe.
- **Objectif** : préparer les prochains sprints en affinant, découpant et estimant les tickets du Product Backlog pas encore prêts.
- **Output** : items « prêts » (bien définis, estimés, priorisés) pour le prochain Sprint Planning.

#### Sprint Review

- **Quand** : dernier jour du sprint.
- **Durée** : 30–45 min.
- **Participants** : toute l'équipe.
- **Objectif** : démontrer ce qui a été livré pendant le sprint et recueillir des retours.
- **Output** : incrément démontré, Product Backlog ajusté en fonction des retours.

#### Sprint Retrospective

- **Quand** : après la Sprint Review, toujours en fin de sprint.
- **Durée** : 30 min.
- **Participants** : toute l'équipe.
- **Objectif** : améliorer en continu la façon de travailler (processus, communication, outillage).
- **Structure** : 3 questions :
  1. Qu'est-ce qui a bien fonctionné ?
  2. Qu'est-ce qui a moins bien fonctionné ?
  3. Qu'allons-nous améliorer dès le prochain sprint ?
- **Output** : 1 à 3 actions concrètes d'amélioration actées pour le sprint suivant.

NB : Le Sprint Review et le Sprint Retrospective se feront au cours de la même réunion

---

## 3. Outil de gestion de projet

### 3.1 Outil utilisé

- Outil de gestion de tâches type **GitHub Projects** (Kanban) avec :
  - un **tableau unique POPolitics**,
  - des **colonnes** standard : Todo, In Progress, Code review, Deployable, In pre-production, Done.

### 3.2 Bonnes pratiques d’utilisation

- Chaque **tâche** correspond à un élément du **WBS** (ou à une sous‑tâche associée).
- Chaque carte contient :
  - un titre clair,
  - une description courte,
  - un lien vers la spécification (WBS / fonctionnalités / exigences),
  - le ou les **responsables** (membres OBS).
- Les étiquettes peuvent représenter :
  - le pôle concerné (Data, Backend, Frontend, DevOps, UX),
  - la priorité (Must / Should / Could).

### 3.3 Suivi de l’avancement

- L’avancement est suivi par :
  - le **nombre de cartes** dans chaque colonne,
  - les dates limites associées aux livrables majeurs,
  - des captures d’écran régulières pour les rapports.

---

## 4. Lien avec WBS et OBS

- Chaque **lot WBS** est décliné en tâches dans l’outil de gestion.
- Chaque tâche est **assignée** à un ou plusieurs membres selon l’OBS (voir document de mapping OBS ↔ WBS).
- Le **chef de projet** (Samy) :
  - contrôle la cohérence backlog ↔ WBS ↔ MoSCoW,
  - arbitre les priorités avec l’équipe,
  - s’assure que les tâches critiques sont bien couvertes par des responsables identifiés.

---

## 5. Jalons clés

Quelques jalons de référence (à adapter selon le planning) :

- Validation de l’architecture globale (plateforme data + backend + frontend).
- Livraison WBS + OBS + MoSCoW.
- Première démonstration interne du **Portail collectif**.
- Première démonstration interne de la **Page personnelle**.
- Livraison du **Plan Qualité** et mise en place des premiers tests.
- Préparation de la **soutenance** (diapositives, scénario de démo).
