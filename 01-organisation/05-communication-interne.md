# POPolitics – Plan de communication

## 1. Introduction

Ce document décrit les règles et outils de communication de l'équipe POPolitics, en complément de la [Méthodologie de gestion de projet](02-project-methodology-management.md). Il couvre la communication interne (entre membres) et externe (avec l'école et les parties prenantes).

---

## 2. Équipe & rôles de communication

| Membre | Rôle | Responsabilité communication |
|---|---|---|
| **Samy** | Chef de projet / Product Owner / UX-UI | Animation des cérémonies Scrum, point de contact principal avec l'école |
| **Jaures** | Tech Lead | Coordination technique inter-pôles, arbitrage des décisions d'architecture |
| **Samuel** | Développeur Backend | Communication pôle Backend |
| **Arthur** | Data Integration Engineer | Communication Backend ↔ Data |
| **Evilavy** | Frontend / UX-UI | Communication pôle Frontend |
| **Raphaël** | Frontend / UX-UI | Communication pôle Frontend |
| **Mehdi** | Data Engineer | Communication pôle Data |
| **Chloé** | Data Scientist / IA | Communication pôle Data / IA |
| **Lazare** | DevOps | Communication pôle Infrastructure |

---

## 3. Outils de communication

| Outil | Usage | Audience |
|---|---|---|
| **Discord / Slack** | Communication quotidienne, daily asynchrone, alertes rapides | Toute l'équipe |
| **GitHub Projects** | Suivi des tâches, commentaires sur les issues, revues de PR | Toute l'équipe |
| **GitHub (Issues / PR)** | Discussion technique sur le code, revues, décisions liées aux tickets | Développeurs |
| **Google Meet / Teams** | Cérémonies Scrum (Sprint Planning, Review, Retro), réunions ad hoc | Toute l'équipe |
| **Email** | Communication officielle avec l'école, documents formels | Samy (+ membres concernés) |
| **Google Drive / Notion** | Partage de documents, comptes rendus de réunion | Toute l'équipe |

---

## 4. Canaux par type de communication

| Type de message | Canal | Délai de réponse attendu |
|---|---|---|
| Question rapide / blocage | Canal Discord principal | < 2 heures en journée |
| Daily standup (asynchrone) | Canal Discord `#daily` | Chaque matin avant 10h |
| Décision technique importante | Issue GitHub + mention en Discord | Réponse sous 24h |
| Revue de code (PR) | GitHub Pull Request | Sous 24–48h |
| Alerte critique (bug bloquant, pipeline down) | Canal Discord `#alertes` + message direct | < 1 heure |
| Communication avec l'école | Email | Selon délais de l'institution |

---

## 5. Cérémonies Scrum (rappel)

Les cérémonies sont décrites en détail dans la [Méthodologie](02-project-methodology-management.md). Récapitulatif :

| Cérémonie | Fréquence | Durée | Animateur |
|---|---|---|---|
| Sprint Planning | Début de chaque sprint | 1h max | Samy (PO) |
| Daily Standup | Chaque jour ouvré (asynchrone) | < 5 min/membre | Chaque membre |
| Affinage du backlog | Milieu de sprint | 30–60 min | Samy + Jaures |
| Sprint Review | Fin de sprint | 30–45 min | Samy (PO) |
| Sprint Retrospective | Après la Review | 30 min | Toute l'équipe |

**Format du daily asynchrone** (message dans `#daily`) :

```text
Fait : [ce que j'ai accompli]
En cours : [ce que je fais aujourd'hui]
Blocage : [rien / description du problème]
```

---

## 6. Règles de communication

### 6.1 Règles générales

- Toute décision technique structurante est **documentée par écrit** (issue GitHub ou compte rendu), pas de décision uniquement à l'oral.
- Les absences prévisibles (maladie, contrainte entreprise) sont **signalées dès que possible** dans le canal Discord.
- Les blocages non résolus en 24h sont remontés au Tech Lead (Jaures) ou au PO (Samy).
- Le canal Discord principal reste **professionnel**, les discussions hors-sujet ont leur propre canal.

### 6.2 Revues de code

- Toute PR doit être relue par **au moins un autre membre** avant merge.
- Le reviewer doit laisser un commentaire explicite même si la PR est approuvée sans modification.
- Une PR en attente de review depuis plus de **48h** est relancée en Discord.

### 6.3 Gestion des désaccords

1. Discussion directe entre les membres concernés (Discord ou appel).
2. Si non résolu : arbitrage par le Tech Lead (Jaures) pour les sujets techniques, par le PO (Samy) pour les sujets de priorité produit.
3. La décision finale est consignée dans une issue GitHub ou un compte rendu.

---

## 7. Communication externe

### 7.1 Avec l'école

- Points de contact : **Samy**, **Mehdi** et **Raphaël**.
- Toute communication officielle (email, livrables) passe par l'un d'eux ou est validée par eux avant envoi.
- Les livrables académiques sont déposés avec un délai de **48h de marge** avant la deadline pour permettre une relecture collective.

### 7.2 Comptes rendus de réunion

- Chaque Sprint Review et Sprint Retrospective donne lieu à un **compte rendu court** (5–10 lignes) partagé dans Google Drive / Notion.
- Structure minimale d'un compte rendu :
  - Date, participants
  - Ce qui a été livré (Review)
  - Ce qui s'est bien passé / moins bien (Retro)
  - Actions décidées (1 à 3 max, avec responsable et délai)

---

## 8. Escalade des problèmes

| Niveau | Situation | Action |
|---|---|---|
| **1 – Individuel** | Blocage technique personnel | Daily standup + message Discord |
| **2 – Pôle** | Blocage impactant un pôle entier | Réunion de pôle + alerte Jaures |
| **3 – Projet** | Risque sur un livrable ou le planning | Réunion d'urgence toute l'équipe + PO (Samy) |
| **4 – Externe** | Impact sur les livrables académiques | Communication avec l'école via Samy, Mehdi ou Raphaël |
