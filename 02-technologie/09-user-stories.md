# POPolitics – User Stories

## 1. Introduction

Ce document liste les **user stories** du projet POPolitics, organisées par **Epic** (grand domaine fonctionnel).

Chaque user story suit le format Scrum standard :

> **En tant que** [persona], **je veux** [action] **afin de** [bénéfice].

Chaque story est accompagnée de :

- sa **priorité MoSCoW** (Must / Should / Could),
- ses **critères d'acceptation** (conditions à remplir pour considérer la story comme Done).

> **Note :** les story points ne sont pas pré-assignés ici. Conformément au processus Scrum, ils sont **estimés collectivement par l'équipe lors des séances d'affinage du backlog** (voir [Méthodologie](../01-organisation/02-project-methodology-management.md)).

---

## 2. Personas

| Persona | Description |
| :--- | :--- |
| **Citoyen** | Utilisateur grand public souhaitant suivre l'activité politique de ses représentants. |
| **Journaliste / Expert** | Utilisateur averti cherchant à analyser des données politiques en profondeur. |
| **Administrateur** | Membre de l'équipe POPolitics gérant la plateforme et les données. |

---

## 3. Épics

- [Epic 1 – Authentification & Gestion de compte](#epic-1--authentification--gestion-de-compte)
- [Epic 2 – Portail collectif : Votes](#epic-2--portail-collectif--votes)
- [Epic 3 – Portail collectif : Tendances & Analyses](#epic-3--portail-collectif--tendances--analyses)
- [Epic 4 – Portail collectif : Synthèses IA](#epic-4--portail-collectif--synthèses-ia)
- [Epic 5 – Page personnelle : Suivi & Notifications](#epic-5--page-personnelle--suivi--notifications)
- [Epic 6 – Plateforme Data & ETL](#epic-6--plateforme-data--etl)

---

## Epic 1 – Authentification & Gestion de compte

### US-101 – Créer un compte

> **En tant que** citoyen, **je veux** créer un compte sur POPolitics **afin de** bénéficier d'une expérience personnalisée et accéder aux fonctionnalités protégées.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Je peux renseigner un email et un mot de passe pour créer mon compte.
  - Le mot de passe est soumis à une règle de complexité minimale (8 caractères, majuscule, chiffre).
  - Un message de confirmation est affiché après création réussie.
  - Il m'est impossible de créer deux comptes avec le même email.

---

### US-102 – Se connecter

> **En tant que** citoyen, **je veux** me connecter avec mes identifiants **afin d'** accéder à mon espace personnel et aux pages protégées.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Je peux me connecter avec email + mot de passe.
  - Une erreur claire s'affiche si les identifiants sont incorrects.
  - Je suis redirigé vers le Portail collectif après connexion réussie.
  - Les pages protégées sont inaccessibles sans être connecté.

---

### US-103 – Se déconnecter

> **En tant que** citoyen, **je veux** me déconnecter de la plateforme **afin de** sécuriser mon compte lorsque je quitte l'application.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Un bouton de déconnexion est accessible depuis toutes les pages authentifiées.
  - Après déconnexion, je suis redirigé vers la page de connexion.
  - Ma session est bien invalidée côté serveur.

---

### US-104 – Réinitialiser son mot de passe

> **En tant que** citoyen, **je veux** pouvoir réinitialiser mon mot de passe oublié **afin de** retrouver l'accès à mon compte.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Je peux saisir mon email pour recevoir un lien de réinitialisation.
  - Le lien de réinitialisation expire après 1 heure.
  - Je peux définir un nouveau mot de passe via ce lien.

---

## Epic 2 – Portail collectif : Votes

### US-201 – Consulter le tableau des votes

> **En tant que** citoyen, **je veux** consulter un tableau des votes des élus **afin de** savoir comment mes représentants votent sur les textes de loi.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Le tableau affiche pour chaque vote : l'élu, le texte, l'institution (AN / Sénat / UE), la date et la position (Pour / Contre / Abstention / Non-votant).
  - Les données sont mises à jour au moins une fois par jour.
  - Un code couleur distinct est appliqué à chaque position.

---

### US-202 – Filtrer les votes

> **En tant que** citoyen, **je veux** filtrer les votes par institution, période, groupe politique et élu **afin de** retrouver rapidement les informations qui m'intéressent.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Les filtres disponibles sont : institution, période (date début / fin), groupe politique, nom de l'élu.
  - Les résultats se mettent à jour dynamiquement lors de l'application des filtres.
  - Il est possible de réinitialiser tous les filtres en un clic.

---

### US-203 – Filtrer les votes par thème, commission et type de texte

> **En tant que** journaliste, **je veux** filtrer les votes par thème, commission et type de texte **afin d'** affiner mes analyses sur un sujet précis.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Les filtres thème, commission et type de texte (amendement vs vote final) sont disponibles en complément des filtres de base.
  - Les filtres sont combinables entre eux.

---

### US-204 – Consulter les indicateurs d'un vote

> **En tant que** citoyen, **je veux** voir le taux de participation et la cohésion du groupe pour un vote donné **afin de** comprendre la dynamique politique derrière le résultat.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Le taux de participation (% de votants) est affiché pour chaque vote.
  - Un indice de cohésion de groupe (% de membres ayant voté dans le même sens) est calculé et affiché.

---

### US-205 – Exporter les résultats de vote

> **En tant que** journaliste, **je veux** exporter les données de vote au format CSV ou PDF **afin de** les réutiliser dans mes articles et analyses.

- **Priorité** : Could
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Un bouton d'export CSV et PDF est disponible sur le tableau des votes.
  - L'export respecte les filtres actifs au moment du téléchargement.
  - Le fichier exporté contient les colonnes : élu, texte, institution, date, position.

---

## Epic 3 – Portail collectif : Tendances & Analyses

### US-301 – Visualiser les indicateurs de cohérence d'un élu

> **En tant que** citoyen, **je veux** visualiser l'indice de cohérence d'un élu avec son groupe politique **afin de** savoir s'il suit les positions de son parti ou s'en écarte.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Une jauge ou score de cohérence est affiché sur la fiche d'un élu.
  - Les votes atypiques (où l'élu a voté contre son groupe) sont mis en évidence.

---

### US-302 – Comparer deux élus ou deux groupes

> **En tant que** journaliste, **je veux** comparer les positions de deux élus ou de deux groupes politiques **afin d'** identifier leurs convergences et divergences.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Je peux sélectionner deux élus ou deux groupes pour lancer une comparaison.
  - Une vue côte-à-côte affiche leurs positions respectives sur les mêmes textes.
  - Un score de similarité globale est calculé et affiché.

---

### US-303 – Visualiser la cartographie des alliances

> **En tant que** journaliste, **je veux** voir une cartographie des alliances entre groupes politiques **afin d'** identifier quels groupes votent ensemble et sur quels sujets.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Un graphe de réseau affiche les groupes politiques et les liens entre eux pondérés par la fréquence d'alignement.
  - Il est possible de filtrer la cartographie par institution ou par thème.

---

### US-304 – Croiser les données AN / Sénat / UE

> **En tant que** expert, **je veux** croiser les données de vote entre l'Assemblée nationale, le Sénat et le Parlement européen **afin d'** analyser la cohérence des positions politiques entre institutions.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Le datamart Cross-match est disponible et interrogeable via l'interface.
  - Je peux filtrer les résultats par élu ou groupe pour voir ses positions sur plusieurs institutions.

---

## Epic 4 – Portail collectif : Synthèses IA

### US-401 – Obtenir un résumé automatique d'un débat

> **En tant que** citoyen, **je veux** obtenir un résumé automatique d'un débat parlementaire **afin de** comprendre l'essentiel en moins d'une minute sans lire le transcript complet.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Un bouton "Résumé IA" est accessible sur la page d'un débat.
  - Le résumé est présenté en 5 points clés maximum.
  - Le temps de génération est inférieur à 5 secondes.
  - Un lien vers le transcript complet est proposé sous le résumé.

---

### US-402 – Consulter une fiche éclair sur un texte de loi

> **En tant que** citoyen, **je veux** accéder à une fiche éclair sur un projet de loi ou amendement **afin de** comprendre son objectif, ses enjeux et les positions des acteurs en quelques secondes.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - La fiche présente 3 vues : Résumé / Enjeux / Acteurs.
  - La section Acteurs indique qui est pour et qui est contre, avec une courte justification.
  - La fiche est accessible depuis le tableau des votes.

---

## Epic 5 – Page personnelle : Suivi & Notifications

### US-501 – Suivre des élus

> **En tant que** citoyen, **je veux** sélectionner des élus à suivre **afin d'** être informé de leurs actions et votes sans avoir à les chercher à chaque visite.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Je peux rechercher un élu par nom et l'ajouter à ma liste de suivi.
  - Ma liste de suivi est persistante entre les sessions.
  - Je peux retirer un élu de ma liste de suivi à tout moment.

---

### US-502 – Consulter la timeline d'un élu suivi

> **En tant que** citoyen, **je veux** consulter la timeline des actions d'un élu que je suis **afin de** voir d'un coup d'œil ses votes récents, interventions et amendements.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - La timeline affiche les événements des élus suivis dans l'ordre chronologique inverse.
  - Chaque événement indique le type (vote, intervention, amendement), la date et un bref libellé.
  - Je peux cliquer sur un événement pour accéder au détail.

---

### US-503 – Configurer ses thèmes d'intérêt

> **En tant que** citoyen, **je veux** choisir des thèmes politiques qui m'intéressent (économie, environnement, social…) **afin de** recevoir uniquement les alertes pertinentes pour moi.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Une liste de thèmes prédéfinis est proposée lors du paramétrage du profil.
  - Je peux en sélectionner plusieurs.
  - Mes préférences de thèmes peuvent être modifiées à tout moment depuis mon profil.

---

### US-504 – Recevoir des notifications personnalisées

> **En tant que** citoyen, **je veux** recevoir des notifications sur les événements importants liés à mes élus suivis et à mes thèmes d'intérêt **afin d'** être informé sans être submergé d'alertes.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Je ne reçois des notifications que pour les événements liés à mes élus suivis ou à mes thèmes d'intérêt.
  - Chaque notification affiche un libellé clair et un lien direct vers la page concernée.
  - Je peux désactiver certaines catégories de notifications depuis mes paramètres.

---

## Epic 6 – Plateforme Data & ETL

### US-601 – Ingérer les données de l'Assemblée nationale

> **En tant qu'** administrateur, **je veux** que les données de vote de l'AN soient ingérées automatiquement **afin de** disposer d'une base à jour sans intervention manuelle.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Le pipeline ETL AN s'exécute automatiquement selon une fréquence définie (quotidienne minimum).
  - Les données brutes sont stockées en zone Bronze.
  - Les exécutions sont tracées (logs, statut, horodatage) dans Kestra.
  - En cas d'échec, une alerte est émise et le job peut être relancé manuellement.

---

### US-602 – Ingérer les données du Sénat

> **En tant qu'** administrateur, **je veux** que les données de vote du Sénat soient ingérées automatiquement **afin de** couvrir les deux chambres du Parlement français.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Identiques à US-601, appliquées à la source Sénat.
  - Les données Sénat sont stockées dans un datamart PostgreSQL distinct et documenté.

---

### US-603 – Ingérer les données du Parlement européen

> **En tant qu'** administrateur, **je veux** que les données du Parlement européen soient ingérées automatiquement **afin d'** offrir une dimension européenne à l'analyse.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Identiques à US-601, appliquées à la source UE.
  - Les données UE sont stockées dans un datamart PostgreSQL distinct et documenté.

---

### US-604 – Normaliser les données en zone Silver

> **En tant qu'** administrateur, **je veux** que les données brutes soient nettoyées et normalisées en zone Silver **afin de** disposer d'une base cohérente et exploitable par le backend.

- **Priorité** : Must
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - Les données Silver respectent un schéma normalisé documenté.
  - Les doublons et données incohérentes sont traités et tracés.
  - La transformation Bronze → Silver est reproductible (mêmes entrées → mêmes sorties).

---

### US-605 – Préparer les données analytiques en zone Gold

> **En tant qu'** administrateur, **je veux** que des données agrégées et prêtes à l'analyse soient disponibles en zone Gold **afin de** réduire les temps de requête du backend et enrichir les indicateurs.

- **Priorité** : Should
- **Story points** : *À estimer lors de l'affinage du backlog*
- **Critères d'acceptation** :
  - La zone Gold contient des tables pré-agrégées (indicateurs, KPI) consommables directement par les APIs.
  - La transformation Silver → Gold est orchestrée par Kestra.

---

## 4. Récapitulatif

> Les story points sont laissés vides et seront renseignés lors des séances d'affinage du backlog.

| ID | Titre court | Epic | Priorité | Points |
| :--- | :--- | :--- | :---: | :---: |
| US-101 | Créer un compte | Auth | Must | |
| US-102 | Se connecter | Auth | Must | |
| US-103 | Se déconnecter | Auth | Must | |
| US-104 | Réinitialiser mot de passe | Auth | Should | |
| US-201 | Consulter tableau des votes | Votes | Must | |
| US-202 | Filtrer les votes (base) | Votes | Must | |
| US-203 | Filtrer les votes (avancé) | Votes | Should | |
| US-204 | Indicateurs d'un vote | Votes | Should | |
| US-205 | Exporter les votes | Votes | Could | |
| US-301 | Cohérence d'un élu | Tendances | Should | |
| US-302 | Comparer élus / groupes | Tendances | Should | |
| US-303 | Cartographie des alliances | Tendances | Should | |
| US-304 | Croisement AN / Sénat / UE | Tendances | Should | |
| US-401 | Résumé IA d'un débat | IA | Should | |
| US-402 | Fiche éclair sur un texte | IA | Should | |
| US-501 | Suivre des élus | Page perso | Should | |
| US-502 | Timeline d'un élu suivi | Page perso | Should | |
| US-503 | Configurer thèmes d'intérêt | Page perso | Should | |
| US-504 | Notifications personnalisées | Page perso | Should | |
| US-601 | Ingestion données AN | Data | Must | |
| US-602 | Ingestion données Sénat | Data | Must | |
| US-603 | Ingestion données UE | Data | Must | |
| US-604 | Normalisation zone Silver | Data | Must | |
| US-605 | Agrégation zone Gold | Data | Should | |
