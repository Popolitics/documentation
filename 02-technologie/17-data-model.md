# POPolitics – Modèle de données

## 1. Introduction

Ce document décrit le modèle de données de POPolitics : les entités principales, leurs attributs et leurs relations, répartis entre les 4 datamarts PostgreSQL et la base d'authentification.

Il s'appuie sur l'architecture définie dans [01-technological-choices.md](01-technological-choices.md).

---

## 2. Vue d'ensemble des bases de données

```text
┌──────────────────────────────────────────────────────────────┐
│                        Data Lake                             │
│              (Bronze → Silver → Gold)                        │
└──────────────────────┬───────────────────────────────────────┘
                       │ ETL (Kestra)
          ┌────────────┼────────────┐
          ▼            ▼            ▼            ▼
   ┌────────────┐ ┌──────────┐ ┌────────┐ ┌─────────────┐
   │ Datamart   │ │Datamart  │ │Datamart│ │  Datamart   │
   │    AN      │ │  Sénat   │ │   UE   │ │ Cross-match │
   └────────────┘ └──────────┘ └────────┘ └─────────────┘

   ┌─────────────────────┐
   │   Base Auth         │
   │ (utilisateurs,      │
   │  tokens, prefs)     │
   └─────────────────────┘
```

---

## 3. Datamart Assemblée nationale

### Schéma

```text
┌──────────────┐       ┌──────────────┐
│   groupes    │       │   scrutins   │
│──────────────│       │──────────────│
│ id (PK)      │       │ id (PK)      │
│ nom          │       │ date         │
│ abreviation  │       │ titre        │
│ legislature  │       │ type         │
└──────┬───────┘       │ resultat     │
       │               │ legislature  │
       │               └──────┬───────┘
       │                      │
       ▼                      ▼
┌──────────────┐       ┌──────────────┐
│    elus      │       │    votes     │
│──────────────│       │──────────────│
│ id (PK)      │◄──────│ id (PK)      │
│ nom          │       │ scrutin_id   │
│ prenom       │       │ elu_id       │
│ date_naiss   │       │ position     │
│ groupe_id    │       └──────────────┘
│ circo        │
│ legislature  │       ┌──────────────────┐
└──────────────┘       │   amendements    │
                       │──────────────────│
                       │ id (PK)          │
                       │ texte_ref        │
                       │ auteur_id (→ elu)│
                       │ date_depot       │
                       │ sort             │
                       └──────────────────┘
```

### Tables

**`groupes`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel AN |
| `nom` | VARCHAR | Nom complet du groupe |
| `abreviation` | VARCHAR | Sigle (ex. RN, RE, LFI) |
| `legislature` | INTEGER | Numéro de législature |

**`elus`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel AN (`acteur_uid`) |
| `nom` | VARCHAR | Nom de famille |
| `prenom` | VARCHAR | Prénom |
| `date_naissance` | DATE | Date de naissance |
| `groupe_id` | VARCHAR | Référence `groupes.id` |
| `circonscription` | VARCHAR | Nom de la circonscription |
| `legislature` | INTEGER | Numéro de législature |

**`scrutins`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel AN |
| `date` | DATE | Date du scrutin |
| `titre` | TEXT | Intitulé du vote |
| `type` | VARCHAR | Type (solennel, ordinaire…) |
| `resultat` | VARCHAR | `adopte` ou `rejete` |
| `legislature` | INTEGER | Numéro de législature |

**`votes`**

| Colonne | Type | Description |
|---|---|---|
| `id` | SERIAL | Identifiant interne |
| `scrutin_id` | VARCHAR | Référence `scrutins.id` |
| `elu_id` | VARCHAR | Référence `elus.id` |
| `position` | VARCHAR | `pour`, `contre`, `abstention`, `absent` |

**`amendements`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel AN |
| `texte_ref` | VARCHAR | Référence du texte de loi |
| `auteur_id` | VARCHAR | Référence `elus.id` |
| `date_depot` | DATE | Date de dépôt |
| `sort` | VARCHAR | `adopte`, `rejete`, `retire` |

---

## 4. Datamart Sénat

Structure similaire au datamart AN, avec les spécificités du Sénat.

### Tables principales

**`senateurs`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel Sénat |
| `nom` | VARCHAR | Nom de famille |
| `prenom` | VARCHAR | Prénom |
| `date_naissance` | DATE | Date de naissance |
| `groupe_id` | VARCHAR | Référence `groupes_senat.id` |
| `departement` | VARCHAR | Département représenté |
| `serie` | INTEGER | Série de renouvellement (1 ou 2) |

**`groupes_senat`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel Sénat |
| `nom` | VARCHAR | Nom complet |
| `abreviation` | VARCHAR | Sigle |

**`scrutins_senat`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel Sénat |
| `date` | DATE | Date du scrutin |
| `titre` | TEXT | Intitulé du vote |
| `type` | VARCHAR | Type (public, commission…) |
| `resultat` | VARCHAR | `adopte` ou `rejete` |

**`votes_senat`**

| Colonne | Type | Description |
|---|---|---|
| `id` | SERIAL | Identifiant interne |
| `scrutin_id` | VARCHAR | Référence `scrutins_senat.id` |
| `senateur_id` | VARCHAR | Référence `senateurs.id` |
| `position` | VARCHAR | `pour`, `contre`, `abstention`, `absent` |

---

## 5. Datamart Parlement européen

### Tables principales

**`eurodeputes`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel UE (`mepId`) |
| `nom` | VARCHAR | Nom de famille |
| `prenom` | VARCHAR | Prénom |
| `date_naissance` | DATE | Date de naissance |
| `pays` | VARCHAR | Pays représenté |
| `groupe_id` | VARCHAR | Référence `groupes_ue.id` |
| `legislature` | INTEGER | Numéro de législature européenne |

**`groupes_ue`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel UE |
| `nom` | VARCHAR | Nom complet (ex. PPE, S&D, Renew) |
| `abreviation` | VARCHAR | Sigle |

**`scrutins_ue`**

| Colonne | Type | Description |
|---|---|---|
| `id` | VARCHAR | Identifiant officiel UE |
| `date` | DATE | Date du scrutin |
| `titre` | TEXT | Intitulé |
| `type` | VARCHAR | Type de vote |
| `resultat` | VARCHAR | `adopte` ou `rejete` |

**`votes_ue`**

| Colonne | Type | Description |
|---|---|---|
| `id` | SERIAL | Identifiant interne |
| `scrutin_id` | VARCHAR | Référence `scrutins_ue.id` |
| `eurodepute_id` | VARCHAR | Référence `eurodeputes.id` |
| `position` | VARCHAR | `pour`, `contre`, `abstention`, `absent` |

---

## 6. Datamart Cross-match

Permet de croiser les données entre les trois institutions. Alimenté depuis les couches Gold des trois autres datamarts.

### Tables principales

**`elus_unifies`**

| Colonne | Type | Description |
|---|---|---|
| `id` | SERIAL | Identifiant interne Cross-match |
| `nom` | VARCHAR | Nom normalisé |
| `prenom` | VARCHAR | Prénom normalisé |
| `date_naissance` | DATE | Date de naissance |
| `elu_an_id` | VARCHAR | Référence `elus.id` (NULL si pas de mandat AN) |
| `senateur_id` | VARCHAR | Référence `senateurs.id` (NULL si pas de mandat Sénat) |
| `eurodepute_id` | VARCHAR | Référence `eurodeputes.id` (NULL si pas de mandat UE) |

**`correspondance_groupes`**

Table de mapping manuel entre les groupes des trois institutions.

| Colonne | Type | Description |
|---|---|---|
| `id` | SERIAL | Identifiant interne |
| `orientation` | VARCHAR | Orientation politique (gauche, centre, droite…) |
| `groupe_an_id` | VARCHAR | Référence `groupes.id` (nullable) |
| `groupe_senat_id` | VARCHAR | Référence `groupes_senat.id` (nullable) |
| `groupe_ue_id` | VARCHAR | Référence `groupes_ue.id` (nullable) |

---

## 7. Base Auth

Base strictement séparée des datamarts métier. Contient uniquement les données des utilisateurs de l'application.

### Schéma

```text
┌────────────────┐       ┌──────────────────┐
│  utilisateurs  │       │  refresh_tokens  │
│────────────────│       │──────────────────│
│ id (PK)        │──────►│ id (PK)          │
│ email          │       │ utilisateur_id   │
│ password_hash  │       │ token_hash       │
│ role           │       │ expiration       │
│ date_inscript  │       └──────────────────┘
│ actif          │
└───────┬────────┘
        │
        ├──────────────────────────────┐
        ▼                              ▼
┌──────────────────┐       ┌──────────────────┐
│   elus_suivis    │       │ themes_interet   │
│──────────────────│       │──────────────────│
│ id (PK)          │       │ id (PK)          │
│ utilisateur_id   │       │ utilisateur_id   │
│ elu_unifie_id    │       │ theme            │
│ date_ajout       │       │ date_ajout       │
└──────────────────┘       └──────────────────┘
```

### Tables

**`utilisateurs`**

| Colonne | Type | Description |
|---|---|---|
| `id` | UUID | Identifiant unique utilisateur |
| `email` | VARCHAR | Email (unique) |
| `password_hash` | VARCHAR | Mot de passe hashé (bcrypt/argon2) |
| `role` | VARCHAR | `user` ou `admin` |
| `date_inscription` | TIMESTAMP | Date de création du compte |
| `actif` | BOOLEAN | Compte actif ou désactivé |

**`refresh_tokens`**

| Colonne | Type | Description |
|---|---|---|
| `id` | UUID | Identifiant du token |
| `utilisateur_id` | UUID | Référence `utilisateurs.id` |
| `token_hash` | VARCHAR | Hash du refresh token |
| `expiration` | TIMESTAMP | Date d'expiration |

**`elus_suivis`**

| Colonne | Type | Description |
|---|---|---|
| `id` | SERIAL | Identifiant interne |
| `utilisateur_id` | UUID | Référence `utilisateurs.id` |
| `elu_unifie_id` | INTEGER | Référence `elus_unifies.id` (Cross-match) |
| `date_ajout` | TIMESTAMP | Date de suivi |

**`themes_interet`**

| Colonne | Type | Description |
|---|---|---|
| `id` | SERIAL | Identifiant interne |
| `utilisateur_id` | UUID | Référence `utilisateurs.id` |
| `theme` | VARCHAR | Thème choisi (ex. environnement, santé, éducation…) |
| `date_ajout` | TIMESTAMP | Date d'ajout |

---

## 8. Index et performances

| Table | Colonne indexée | Raison |
|---|---|---|
| `votes` | `scrutin_id`, `elu_id` | Requêtes filtrées par scrutin ou par élu |
| `votes_senat` | `scrutin_id`, `senateur_id` | Idem |
| `votes_ue` | `scrutin_id`, `eurodepute_id` | Idem |
| `scrutins` | `date`, `legislature` | Filtres temporels fréquents |
| `elus` | `groupe_id` | Filtres par groupe politique |
| `elus_unifies` | `nom`, `prenom`, `date_naissance` | Rapprochement cross-match |
| `utilisateurs` | `email` | Authentification (lookup unique) |
| `elus_suivis` | `utilisateur_id` | Chargement de la page personnelle |
