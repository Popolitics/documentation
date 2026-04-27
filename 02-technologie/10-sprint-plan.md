# POPolitics – Plan de Sprints

## 1. Introduction

Ce document décrit le **découpage du projet en sprints**, aligné sur le rythme d'alternance Master (voir [Méthodologie](../01-organisation/02-project-methodology-management.md)).

### Principes

- Les sprints sont calés sur le **calendrier d'alternance** : présentiel et distanciel alternent selon le rythme M1 (2S / 6S) ou M2 (1S / 9S).
- En **distanciel**, une longue période est découpée en **sous-sprints de 2 semaines** pour maintenir le rythme.
- Le contenu exact de chaque sprint (user stories, story points) est **validé lors du Sprint Planning** et affiné lors des séances d'**Affinage du backlog**.
- Les user stories référencées ici sont issues de [09-user-stories.md](09-user-stories.md). Les story points sont à estimer en séance.

---

## 2. Vue d'ensemble des phases

| Phase | Contexte | Durée indicative | Sprints |
| :--- | :--- | :---: | :---: |
| Phase 0 | Cadrage & setup | 1–2 semaines | Sprint 0 |
| Phase 1 | Fondations : Auth + ETL + Infra | 6–9 semaines | Sprint 1 à 3 |
| Phase 2 | MVP Portail collectif | 2–4 semaines | Sprint 4 à 5 |
| Phase 3 | Enrichissement : tendances, page perso | 6–9 semaines | Sprint 6 à 8 |
| Phase 4 | Couche IA & finition | 2–4 semaines | Sprint 9 à 10 |
| Phase 5 | Stabilisation & soutenance | 1–2 semaines | Sprint 11 |

> Les dates réelles sont à renseigner par l'équipe une fois le calendrier d'alternance de l'année connu.

---

## 3. Détail des Sprints

---

### Sprint 0 – Cadrage & Setup

| | |
| :--- | :--- |
| **Contexte** | Présentiel |
| **Durée** | 1–2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Mettre en place les fondations techniques et organisationnelles avant tout développement produit. |

**Objectifs :**

- Initialisation des dépôts Git (backend, frontend, data, documentation).
- Mise en place de la stack Docker locale (Django, Next.js, PostgreSQL, Kestra).
- Configuration de GitHub Projects (colonnes, labels, règles de contribution).
- Lecture et validation collective des documents clés : architecture, MoSCoW, user stories, DoD.
- Attribution des premiers rôles et responsabilités (OBS).
- Rédaction du premier Sprint Backlog opérationnel.

**User stories ciblées :** aucune (sprint technique pur)

**Critère de fin de sprint :** chaque membre de l'équipe peut lancer la stack complète en local en moins de 30 minutes.

---

### Sprint 1 – Authentification & Ingestion des données (Must)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 1/3 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Disposer d'un service d'authentification fonctionnel et lancer les premiers pipelines d'ingestion de données. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-101 | Créer un compte | Must |
| US-102 | Se connecter | Must |
| US-103 | Se déconnecter | Must |
| US-601 | Ingestion données AN | Must |

**Notes :** US-601 peut démarrer en parallèle de l'auth car il n'y a pas de dépendance technique directe.

---

### Sprint 2 – Pipelines ETL complets (Must)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 2/3 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Compléter l'ingestion des trois sources de données et normaliser les données en zone Silver. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-602 | Ingestion données Sénat | Must |
| US-603 | Ingestion données UE | Must |
| US-604 | Normalisation zone Silver | Must |

**Notes :** Les datamarts PostgreSQL AN, Sénat et UE doivent être créés et documentés à la fin de ce sprint.

---

### Sprint 3 – APIs backend & consolidation (Must)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 3/3 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Exposer les premières APIs REST depuis le backend Django pour alimenter le frontend. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-201 | Consulter tableau des votes | Must |

**Notes :** Ce sprint est le premier à relier la couche data au frontend. L'endpoint `/votes` doit retourner des données réelles issues des datamarts.

---

### Sprint 4 – MVP Portail collectif (Must)

| | |
| :--- | :--- |
| **Contexte** | Présentiel |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Livrer une première version du Portail collectif utilisable de bout en bout : données réelles, filtres de base, interface fonctionnelle. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-202 | Filtrer les votes (base) | Must |

**Notes :** À la fin de ce sprint, une démo interne complète doit être réalisable : connexion → consultation du tableau des votes filtré → déconnexion.

---

### Sprint 5 – Enrichissement données & filtres avancés (Should)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 1/3 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Enrichir la plateforme data avec la zone Gold et proposer des filtres avancés sur le portail. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-605 | Agrégation zone Gold | Should |
| US-203 | Filtrer les votes (avancé) | Should |
| US-204 | Indicateurs d'un vote | Should |

---

### Sprint 6 – Indicateurs & cohérence des élus (Should)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 2/3 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Afficher les indicateurs de cohérence des élus et permettre la comparaison entre élus ou groupes. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-301 | Cohérence d'un élu | Should |
| US-302 | Comparer élus / groupes | Should |

---

### Sprint 7 – Page personnelle v1 (Should)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 3/3 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Permettre à un utilisateur de suivre des élus, configurer ses thèmes d'intérêt et consulter une timeline personnalisée. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-501 | Suivre des élus | Should |
| US-503 | Configurer thèmes d'intérêt | Should |
| US-502 | Timeline d'un élu suivi | Should |

---

### Sprint 8 – Notifications & Croisement données (Should)

| | |
| :--- | :--- |
| **Contexte** | Présentiel |
| **Durée** | 1–2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Activer les notifications personnalisées et le croisement AN / Sénat / UE. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-504 | Notifications personnalisées | Should |
| US-304 | Croisement AN / Sénat / UE | Should |

---

### Sprint 9 – Couche IA (Should)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 1/2 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Déployer un premier modèle IA (résumé ou classification) et exposer un endpoint d'inférence consommable par le frontend. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-401 | Résumé IA d'un débat | Should |
| US-402 | Fiche éclair sur un texte | Should |

**Notes :** Sprint le plus risqué techniquement — prévoir une réduction de périmètre si la charge est trop importante (US-402 peut passer en Could si nécessaire).

---

### Sprint 10 – Cartographie, export & finitions (Should / Could)

| | |
| :--- | :--- |
| **Contexte** | Distanciel – Sous-sprint 2/2 |
| **Durée** | 2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Compléter les visualisations avancées et traiter les fonctionnalités Could Have selon la capacité disponible. |

**User stories ciblées :**

| ID | Titre | Priorité |
| :--- | :--- | :---: |
| US-303 | Cartographie des alliances | Should |
| US-104 | Réinitialiser mot de passe | Should |
| US-205 | Exporter les votes | Could |

---

### Sprint 11 – Stabilisation & Soutenance

| | |
| :--- | :--- |
| **Contexte** | Présentiel |
| **Durée** | 1–2 semaines |
| **Dates** | *À renseigner* |
| **Sprint Goal** | Stabiliser la plateforme, corriger les derniers bugs, préparer le scénario de démo et la soutenance. |

**Objectifs :**

- Correction des bugs identifiés lors des sprints précédents.
- Tests de bout en bout sur les parcours critiques.
- Préparation du scénario de démonstration.
- Rédaction / mise à jour de la documentation technique.
- Préparation des slides de soutenance.

**User stories ciblées :** pas de nouvelles stories — sprint de stabilisation uniquement.

---

## 4. Récapitulatif des sprints

| Sprint | Contexte | Durée | Sprint Goal résumé | Stories Must | Stories Should |
| :--- | :---: | :---: | :--- | :---: | :---: |
| Sprint 0 | Présentiel | 1–2 sem. | Setup & cadrage | – | – |
| Sprint 1 | Distanciel | 2 sem. | Auth + ETL AN | 4 | – |
| Sprint 2 | Distanciel | 2 sem. | ETL Sénat, UE + Silver | 3 | – |
| Sprint 3 | Distanciel | 2 sem. | APIs backend | 1 | – |
| Sprint 4 | Présentiel | 2 sem. | MVP Portail collectif | 1 | – |
| Sprint 5 | Distanciel | 2 sem. | Gold + filtres avancés | – | 3 |
| Sprint 6 | Distanciel | 2 sem. | Cohérence & comparaison élus | – | 2 |
| Sprint 7 | Distanciel | 2 sem. | Page personnelle v1 | – | 3 |
| Sprint 8 | Présentiel | 1–2 sem. | Notifications + Cross-match | – | 2 |
| Sprint 9 | Distanciel | 2 sem. | Couche IA | – | 2 |
| Sprint 10 | Distanciel | 2 sem. | Visualisations + export | – | 3 |
| Sprint 11 | Présentiel | 1–2 sem. | Stabilisation & soutenance | – | – |

> **Total stories Must Have couvertes :** 9 / 9
> **Total stories Should Have couvertes :** 15 / 15
> **Stories Could Have :** traitées en Sprint 10 selon capacité disponible
