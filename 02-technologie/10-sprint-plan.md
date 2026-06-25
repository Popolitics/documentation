# POPolitics - Plan de Sprints

## 1. Introduction

Ce document décrit le **decoupage du projet en sprints**, aligne sur le rythme d'alternance Master (voir [Methodologie](../01-organisation/02-project-methodology-management.md)).

### Principes

- Les sprints ont une **duree fixe de 9 semaines**.
- Le planning demarre le **21/09/2026** et se termine le **25/06/2027**.
- Les semaines de presentiel sont integrees dans les sprints en cours.
- Le dernier sprint peut etre plus court que 9 semaines pour s'aligner sur la date de fin d'annee.
- Le contenu exact de chaque sprint (user stories, story points) est valide lors du Sprint Planning et affine lors des seances d'affinage du backlog.

---

## 2. Vue d'ensemble

| Periode | Dates | Duree | Objectif global |
| :--- | :--- | :---: | :--- |
| Sprint 1 | 21/09/2026 -> 20/11/2026 | 9 semaines | Fondations (Auth + ETL) |
| Sprint 2 | 23/11/2026 -> 22/01/2027 | 9 semaines | MVP Portail collectif |
| Sprint 3 | 25/01/2027 -> 26/03/2027 | 9 semaines | Enrichissements (tendances + page perso) |
| Sprint 4 | 29/03/2027 -> 28/05/2027 | 9 semaines | IA + finitions |
| Sprint 5 | 31/05/2027 -> 25/06/2027 | 4 semaines | Stabilisation finale + soutenance |

---

## 3. Detail des sprints

### Sprint 1 - Fondations (Must)

| | |
| :--- | :--- |
| **Duree** | 9 semaines |
| **Dates** | 21/09/2026 -> 20/11/2026 |
| **Sprint Goal** | Poser les fondations techniques: authentification operationnelle et pipelines ETL de base. |

**User stories ciblees :**

| ID | Titre | Priorite |
| :--- | :--- | :---: |
| US-101 | Creer un compte | Must |
| US-102 | Se connecter | Must |
| US-103 | Se deconnecter | Must |
| US-601 | Ingestion donnees AN | Must |
| US-602 | Ingestion donnees Senat | Must |
| US-603 | Ingestion donnees UE | Must |
| US-604 | Normalisation zone Silver | Must |

---

### Sprint 2 - MVP Portail collectif

| | |
| :--- | :--- |
| **Duree** | 9 semaines |
| **Dates** | 23/11/2026 -> 22/01/2027 |
| **Sprint Goal** | Livrer un portail collectif utilisable avec donnees reelles, filtres et premiers indicateurs. |

**User stories ciblees :**

| ID | Titre | Priorite |
| :--- | :--- | :---: |
| US-201 | Consulter tableau des votes | Must |
| US-202 | Filtrer les votes (base) | Must |
| US-605 | Agregation zone Gold | Should |
| US-203 | Filtrer les votes (avance) | Should |
| US-204 | Indicateurs d'un vote | Should |

---

### Sprint 3 - Enrichissements (Should)

| | |
| :--- | :--- |
| **Duree** | 9 semaines |
| **Dates** | 25/01/2027 -> 26/03/2027 |
| **Sprint Goal** | Ajouter les fonctionnalites d'analyse politique et les usages personnalises. |

**User stories ciblees :**

| ID | Titre | Priorite |
| :--- | :--- | :---: |
| US-301 | Coherence d'un elu | Should |
| US-302 | Comparer elus / groupes | Should |
| US-304 | Croisement AN / Senat / UE | Should |
| US-501 | Suivre des elus | Should |
| US-502 | Timeline d'un elu suivi | Should |
| US-503 | Configurer themes d'interet | Should |
| US-504 | Notifications personnalisees | Should |

---

### Sprint 4 - IA et finitions (Should/Could)

| | |
| :--- | :--- |
| **Duree** | 9 semaines |
| **Dates** | 29/03/2027 -> 28/05/2027 |
| **Sprint Goal** | Integrer la couche IA, finaliser les visualisations avancees et traiter les finitions. |

**User stories ciblees :**

| ID | Titre | Priorite |
| :--- | :--- | :---: |
| US-401 | Resume IA d'un debat | Should |
| US-402 | Fiche eclair sur un texte | Should |
| US-303 | Cartographie des alliances | Should |
| US-104 | Reinitialiser mot de passe | Should |
| US-205 | Exporter les votes | Could |

---

## 4. Sprint 5 - Stabilisation & soutenance

| | |
| :--- | :--- |
| **Duree** | 4 semaines |
| **Dates** | 31/05/2027 -> 25/06/2027 |
| **Objectif** | Stabiliser, corriger, preparer la soutenance et finaliser les livrables academiques. |

**Travaux prevus :**

- Corrections de bugs transverses.
- Tests de bout en bout sur les parcours critiques.
- Preparation du scenario de demonstration.
- Mise a jour finale de la documentation technique.
- Preparation des slides de soutenance.

---

## 5. Recapitulatif

| Periode | Duree | Stories Must | Stories Should | Stories Could |
| :--- | :---: | :---: | :---: | :---: |
| Sprint 1 | 9 sem. | 7 | 0 | 0 |
| Sprint 2 | 9 sem. | 2 | 3 | 0 |
| Sprint 3 | 9 sem. | 0 | 7 | 0 |
| Sprint 4 | 9 sem. | 0 | 4 | 1 |
| Sprint 5 | 4 sem. | - | - | - |

> **Total stories Must Have couvertes :** 9 / 9  
> **Total stories Should Have couvertes :** 14 / 14  
> **Total stories Could Have couvertes :** 1 / 1
