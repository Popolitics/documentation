# POPolitics – Plan de Communication Externe

## 1. Introduction

Ce document décrit la **stratégie de communication externe** du projet POPolitics : comment le projet se présente, se diffuse et interagit avec le monde en dehors de l'équipe (grand public, journalistes, école, jury, communauté civic-tech).

La communication **interne** (équipe, Scrum, GitHub) est traitée dans [05-communication-interne.md](../01-organisation/05-communication-interne.md).

---

## 2. Objectifs de communication

| Objectif | Description | Horizon |
| :--- | :--- | :--- |
| **Notoriété** | Faire connaître POPolitics auprès des cibles pertinentes (citoyens, journalistes, civic-tech) | Moyen terme |
| **Crédibilité** | Démontrer la fiabilité des données et la rigueur du projet | Court terme |
| **Engagement** | Attirer de premiers utilisateurs testeurs et recueillir des retours | Court terme |
| **Légitimité académique** | Valoriser le projet auprès du jury et de l'école Epitech | Immédiat |
| **Rayonnement** | Positionner POPolitics comme une référence civic-tech open source | Long terme |

---

## 3. Cibles de communication

### 3.1 Cibles primaires

| Cible | Profil | Canal privilégié | Message clé |
| :--- | :--- | :--- | :--- |
| **Citoyens engagés** | 25–45 ans, actifs politiquement, à l'aise avec le numérique | LinkedIn, X (Twitter), Instagram | « Enfin un outil simple pour comprendre qui vote quoi » |
| **Journalistes / Data journalistes** | Presse indépendante, médias en ligne, blogueurs data | LinkedIn, X (Twitter), Mastodon | « Des données propres et croisées, prêtes à l'emploi » |
| **Jury & école Epitech** | Encadrants pédagogiques, correcteurs | Présentation orale, rapport, démo live | « Projet rigoureux, technique maîtrisée, valeur civic-tech démontrée » |

### 3.2 Cibles secondaires

| Cible | Profil | Canal privilégié | Message clé |
| :--- | :--- | :--- | :--- |
| **Communauté civic-tech** | Associations, développeurs open source, think tanks | GitHub, forums civic-tech, événements | « Projet open source contribuant à la transparence démocratique » |
| **Experts politiques** | Chercheurs, consultants, analystes | LinkedIn, email direct | « Un outil d'analyse multi-institutionnel inédit » |
| **Étudiants / développeurs** | Étudiants en informatique ou sciences politiques | GitHub, forums, Discord public | « Un projet open source pour apprendre et contribuer » |

---

## 4. Messages clés

### Message principal

> **POPolitics rend l'activité parlementaire accessible à tous — en transformant des milliers de votes bruts en insights clairs, personnalisés et vérifiables.**

### Messages secondaires

- **Fiabilité** : *« Des données officielles, mises à jour quotidiennement, issues de trois institutions publiques. »*
- **Simplicité** : *« Comprendre comment vote votre élu en moins de 30 secondes. »*
- **Profondeur** : *« Des analyses croisées AN / Sénat / UE introuvables ailleurs. »*
- **Transparence** : *« Projet open source, données sous licence ouverte, méthodologie documentée. »*
- **IA au service du citoyen** : *« Des résumés automatiques pour rester informé sans être submergé. »*

---

## 5. Canaux et stratégie par canal

### 5.1 GitHub (dépôt public)

| | |
| :--- | :--- |
| **Objectif** | Crédibilité technique, transparence, contribution communautaire |
| **Contenu** | README clair, documentation complète, badges CI/CD, CONTRIBUTING.md |
| **Fréquence** | En continu (commits réguliers visibles) |
| **Responsable** | Lazare (DevOps) + Jaures (Tech Lead) |
| **KPI** | Nombre de stars, forks, issues ouvertes par des tiers |

**Actions clés :**
- Rédiger un README attractif avec captures d'écran et GIF de démo dès le Sprint 4.
- Ajouter un badge "build passing", couverture de tests, licence.
- Publier un `CONTRIBUTING.md` pour inviter les contributions externes.

---

### 5.2 LinkedIn

| | |
| :--- | :--- |
| **Objectif** | Notoriété professionnelle, crédibilité académique, networking civic-tech |
| **Contenu** | Posts de progression (sprints, fonctionnalités), articles de fond, démo finale |
| **Fréquence** | 1 post toutes les 2–3 semaines (calé sur les fins de sprint) |
| **Responsable** | Samy (PO) |
| **Ton** | Professionnel, engagé, pédagogique |

**Calendrier éditorial LinkedIn :**

| Sprint | Sujet de publication |
| :--- | :--- |
| Sprint 0 | Lancement du projet — présentation équipe & vision |
| Sprint 2 | Les coulisses de l'ETL — comment on ingère les données parlementaires |
| Sprint 4 | MVP en ligne — première démo du portail collectif |
| Sprint 7 | Focus UX — comment on a conçu la page personnelle |
| Sprint 9 | IA & politique — comment on résume automatiquement un débat parlementaire |
| Sprint 11 | Article bilan — ce qu'on a appris en construisant POPolitics |

---

### 5.3 X (Twitter) / Mastodon

| | |
| :--- | :--- |
| **Objectif** | Visibilité rapide, engagement communauté civic-tech et journalistes data |
| **Contenu** | Résultats d'analyse insolites, captures de la plateforme, citations chocs |
| **Fréquence** | 1–2 posts par semaine à partir du Sprint 4 |
| **Responsable** | Samy + Evilavy |
| **Ton** | Direct, factuel, parfois provocateur (chiffres surprenants) |

**Exemples de posts :**
- *« 73 % des amendements sur l'environnement rejetés depuis 2022 — visualisé avec POPolitics. [lien] »*
- *« Votre député a voté contre ce texte 4 fois de suite. On a rendu ça visible. »*
- *« Open source, données publiques, 0 trackers — voilà POPolitics. »*

---

### 5.4 Présentation jury / soutenance

| | |
| :--- | :--- |
| **Objectif** | Valider la qualité académique et technique du projet |
| **Format** | Diaporama (15–20 min) + démo live (10 min) + Q&A (10 min) |
| **Responsable** | Samy (présentation) + Jaures (démo technique) |
| **Date cible** | Fin Sprint 11 |

**Structure du pitch de soutenance :**

1. **Problème** (2 min) : la démocratie représentative est opaque pour le citoyen moyen.
2. **Solution** (2 min) : POPolitics — données brutes → insights actionnables.
3. **Architecture technique** (4 min) : ETL, datamarts, Django, Next.js, couche IA.
4. **Démo live** (10 min) : parcours utilisateur complet + fonctionnalité phare.
5. **Impact & perspectives** (2 min) : open source, évolutivité, données futures.

---

### 5.5 Email / Relations presse

| | |
| :--- | :--- |
| **Objectif** | Cibler les journalistes data et les associations civic-tech |
| **Format** | Email de présentation personnalisé + lien vers démo |
| **Fréquence** | Ponctuel — à partir du Sprint 11 (version stable) |
| **Responsable** | Samy |
| **Cibles prioritaires** | Médiapart data, Next INpact, Regards Citoyens, La Quadrature du Net |

---

## 6. Ligne éditoriale & charte de communication

### Ton général

- **Factuel et sobre** : on cite les données, on ne dramatise pas.
- **Accessible** : on évite le jargon technique en communication externe.
- **Engagé** : on croit à la transparence démocratique, on l'affirme.
- **Honnête** : projet académique open source, pas un produit commercial.

### Ce qu'on ne fait PAS

- Pas de prise de position partisane — POPolitics est **apolitique**.
- Pas de communication sur des données non vérifiées.
- Pas de publication de données personnelles au-delà du mandat public des élus.
- Pas de promesses de fonctionnalités non livrées.

### Identité visuelle (à définir en Sprint 4)

| Élément | Statut |
| :--- | :--- |
| Logo POPolitics | À créer (responsable : Evilavy) |
| Palette de couleurs | À définir avec la charte UI |
| Typographie | À définir avec la charte UI |
| Captures d'écran officielles | Disponibles à partir du Sprint 4 |

---

## 7. Calendrier de communication global

### 7.1 Pendant le projet (calé sur les sprints)

| Période | Événement | Action communication |
| :--- | :--- | :--- |
| Sprint 0 | Lancement projet | Post LinkedIn "on démarre" + publication dépôt GitHub |
| Sprint 2 | ETL fonctionnel | Post LinkedIn "coulisses data" |
| Sprint 4 | MVP Portail | Post LinkedIn + captures d'écran + README mis à jour |
| Sprint 7 | Page personnelle | Post LinkedIn focus UX + X/Twitter |
| Sprint 9 | Couche IA | Post LinkedIn "IA et politique" |
| Sprint 11 | Soutenance | Présentation jury + article bilan LinkedIn + communication école |

### 7.2 Post-projet — Calendrier éditorial (après soutenance)

L'objectif post-projet est de **capitaliser sur le travail accompli** : valoriser le projet sur les CV, attirer des contributions open source et ancrer POPolitics comme référence civic-tech.

| Échéance | Canal | Action | Responsable |
| :--- | :--- | :--- | :--- |
| **J+1 semaine** | GitHub | Nettoyage final du dépôt : README complet, captures, GIF de démo, licence claire, `CONTRIBUTING.md` | Lazare + Jaures |
| **J+1 semaine** | LinkedIn | Article bilan : *« Ce qu'on a appris en construisant une plateforme civic-tech en M2 »* — retour d'expérience technique et humain | Samy |
| **J+2 semaines** | X / Mastodon | Thread de présentation : vision, architecture, stack, résultats — avec captures et lien GitHub | Samy + Evilavy |
| **J+2 semaines** | Email ciblé | Envoi du projet à 5–10 organisations civic-tech pertinentes (Regards Citoyens, La Quadrature du Net, Démocratie Ouverte…) | Samy |
| **J+1 mois** | LinkedIn | Post "données insolites" : une analyse concrète produite avec POPolitics (ex. taux d'abstention record, élu le plus atypique…) | Thomas Marchand — ou l'équipe |
| **J+1 mois** | GitHub | Ouverture des issues "good first issue" pour inviter des contributions externes | Jaures |
| **J+2 mois** | LinkedIn | Post de chaque membre sur son rôle dans le projet — valorisation individuelle (portfolio, recrutement) | Chaque membre |
| **J+3 mois** | Événements | Soumission d'une présentation à un événement civic-tech ou tech étudiant (ex. Open Source Experience, DataDays…) si opportunité | Samy |
| **Continu** | GitHub | Maintenance légère : réponse aux issues, merge des PR externes, mise à jour des dépendances critiques | Lazare |

**Principes du calendrier post-projet :**

POPolitics n'est pas un projet académique qui s'arrête à la soutenance — c'est un **produit qui continue de vivre et d'évoluer**. La communication post-études doit refléter cette ambition.

- **Maintenir le rythme** : continuer à publier régulièrement, même à fréquence réduite, pour ancrer POPolitics dans la durée.
- **Faire grandir la communauté** : chaque publication est une opportunité d'attirer des contributeurs, des partenaires ou de futurs utilisateurs réguliers.
- **Documenter la suite** : publier une roadmap publique sur GitHub pour montrer que le projet avance (nouvelles données, nouvelles fonctionnalités, nouvelles institutions).
- **Construire une identité durable** : à terme, POPolitics peut viser une reconnaissance institutionnelle (partenariats avec des médias, des associations, voire des institutions publiques).
- **Valoriser sans s'éparpiller** : la croissance post-études doit rester maîtrisée — mieux vaut un projet qui tient ses promesses sur le long terme qu'une communication ambitieuse non suivie d'effets.

---

## 8. Responsabilités

| Tâche | Responsable | Support |
| :--- | :--- | :--- |
| Posts LinkedIn | Samy | Toute l'équipe (relecture) |
| Posts X / Mastodon | Samy, Evilavy | — |
| README GitHub | Lazare, Jaures | Samy (contenu) |
| Présentation soutenance | Samy | Jaures (partie technique) |
| Identité visuelle | Evilavy | Raphaël |
| Relations presse / email | Samy | — |

---

## 9. Indicateurs de succès (KPIs)

| KPI | Cible | Mesure |
| :--- | :--- | :--- |
| Stars GitHub | > 20 avant soutenance | GitHub Insights |
| Vues README GitHub | > 200 | GitHub Traffic |
| Vues posts LinkedIn | > 500 par post (en moyenne) | LinkedIn Analytics |
| Engagement communauté | ≥ 1 retour externe (issue, message) avant Sprint 11 | GitHub Issues / DM |
| Note jury soutenance | ≥ 15/20 | Feedback école |
