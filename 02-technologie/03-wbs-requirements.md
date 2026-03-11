# POPolitics – Exigences fonctionnelles et non fonctionnelles liées au WBS

Ce document complète le **WBS** en décrivant, pour chaque grand lot, les **exigences fonctionnelles** (ce que le système doit faire) et **non fonctionnelles** (qualité, performances, sécurité, UX, etc.).

---

## 1. Portail collectif (WBS – Fonctionnalité principale)

### 1.1 Description

Interface principale permettant de **suivre les votes, tendances et débats** à l’échelle collective (groupes politiques, institutions, textes de loi).

### 1.2 Exigences fonctionnelles

- Afficher l’historique des votes avec filtres par :
  - institution (AN, Sénat, UE),
  - période,
  - type de texte (loi, amendement, résolution…),
  - groupe politique, élu, commission.
- Afficher les résultats de vote avec codes couleurs (Pour / Contre / Abstention / Non‑votant).
- Calculer et afficher :
  - taux de participation,
  - cohésion de groupe,
  - évolution temporelle.
- Fournir des visualisations de base (tableaux + graphiques).

### 1.3 Exigences non fonctionnelles

- Temps de réponse acceptable pour les principales requêtes (ex. < 2–3 secondes sur un dataset de taille raisonnable).
- Interface responsive (desktop en priorité, utilisation possible sur tablette).
- Lisibilité : couleurs cohérentes, légendes et titres explicites.

### 1.4 Critères d’acceptation (exemples)

- Un utilisateur peut, en moins de 5 clics, afficher les votes d’un groupe politique sur une période donnée.
- Les indicateurs de cohésion et de participation sont systématiquement mis à jour quand les filtres changent.

---

## 2. Page personnelle & notifications (WBS – Fonctionnalité utilisateur)

### 2.1 Description

Tableau de bord individuel permettant à un utilisateur de suivre **ses élus, ses thèmes** et de recevoir des **notifications personnalisées**.

### 2.2 Exigences fonctionnelles

- L’utilisateur peut :
  - sélectionner des élus suivis,
  - choisir des thèmes d’intérêt (économie, social, environnement…).
- Le système génère des notifications en fonction :
  - d’événements importants (vote majeur, changement de position, amendement marquant),
  - des préférences de l’utilisateur.
- Afficher une timeline des principales actions des élus suivis.

### 2.3 Exigences non fonctionnelles

- Volume de notifications limité pour éviter la fatigue (priorisation par importance / urgence / intérêt).
- Possibilité de désactiver certaines catégories d’alertes.

### 2.4 Critères d’acceptation

- Un utilisateur peut configurer ses préférences et ne reçoit ensuite que des notifications en lien avec celles‑ci.
- Les notifications affichent un lien direct vers la page correspondante (vote, texte, fiche élu).

---

## 3. Plateforme Data & ETL (WBS – Infrastructure data)

### 3.1 Description

Ensemble des pipelines ETL et du Data Lake (Landing Zone Bronze / Silver / Gold) permettant d’ingérer, nettoyer et structurer les données.

### 3.2 Exigences fonctionnelles

- Ingestion régulière des données AN, Sénat, UE.
- Stockage des données brutes en zone **Bronze** (traçabilité).
- Transformation vers **Silver** (nettoyage, normalisation).
- Préparation des données prêtes pour analyse en zone **Gold**.
- Orchestration des pipelines via **Kestra**.

### 3.3 Exigences non fonctionnelles

- Reproductibilité des traitements (mêmes entrées → mêmes sorties).
- Traçabilité des exécutions (logs, statut des jobs).
- Capacité à relancer un job en erreur sans casser les données.

### 3.4 Critères d’acceptation

- Pour une nouvelle source intégrée, le pipeline peut être relancé de bout en bout sans intervention manuelle lourde.
- Les jeux de données Bronze, Silver et Gold sont clairement identifiables et documentés.

---

## 4. Datamarts & analytique (WBS – Stockage analytique)

### 4.1 Description

Datamarts PostgreSQL dédiés aux analyses politiques (AN, Sénat, UE, Cross‑match).

### 4.2 Exigences fonctionnelles

- Mise à disposition de tables analytiques pour :
  - les votes par texte / élu / groupe,
  - les indicateurs agrégés,
  - les croisements entre institutions (datamart Cross‑match).
- Actualisation des datamarts en cohérence avec les pipelines ETL.

### 4.3 Exigences non fonctionnelles

- Schémas normalisés et documentés.
- Requêtes principales exécutables en temps raisonnable (index adaptés).

### 4.4 Critères d’acceptation

- Les APIs backend peuvent récupérer les données nécessaires via des requêtes SQL stables et documentées.

---

## 5. Couche IA & modèles (WBS – IA Service)

### 5.1 Description

Socle IA fournissant des **résumés**, **classifications** ou autres analyses automatiques.

### 5.2 Exigences fonctionnelles

- Entraîner au moins un modèle (ex. résumé de débat ou classification de texte).
- Exposer un endpoint d’inférence via l’**IA Service**.

### 5.3 Exigences non fonctionnelles

- Temps de réponse compatible avec une utilisation interactive (ex. < 5 s pour un résumé court).
- Possibilité de journaliser les appels pour améliorer les modèles ultérieurement.

### 5.4 Critères d’acceptation

- Depuis le frontend, un utilisateur peut demander un résumé ou une analyse IA et obtenir une réponse lisible.

---

## 6. Authentification & gestion des utilisateurs (WBS – Auth Service)

### 6.1 Description

Service d’authentification et base d’utilisateurs dédiés.

### 6.2 Exigences fonctionnelles

- Création de compte, login / logout.
- Rôles simples (ex. utilisateur standard, admin).
- Stockage sécurisé des mots de passe.

### 6.3 Exigences non fonctionnelles

- Respect des bonnes pratiques de sécurité (hashage robuste, pas de mot de passe en clair).
- Séparation stricte entre données d’authentification et données métier.

### 6.4 Critères d’acceptation

- Impossible d’accéder aux pages protégées sans être authentifié.
- Les droits d’accès sont appliqués conformément au rôle de l’utilisateur.

---

## 7. Qualité, monitoring & opérations (WBS – Support)

### 7.1 Description

Ensemble des pratiques de qualité, de tests et de supervision de la plateforme.

### 7.2 Exigences fonctionnelles

- Mise en place de tests (voir Plan Qualité).
- Supervision minimale des jobs Kestra et des services backend.

### 7.3 Exigences non fonctionnelles

- Logs accessibles et compréhensibles pour diagnostiquer un incident.
- Documentation à jour des procédures de redémarrage ou de réinstallation.

Ce document est volontairement synthétique et doit être lu conjointement avec :
- le **WBS** (découpage du travail),
- les documents de **fonctionnalités** et de **MoSCoW**,
- le **Plan Qualité**.
