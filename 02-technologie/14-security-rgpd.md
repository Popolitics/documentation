# POPolitics – Sécurité & RGPD

## 1. Introduction

Ce document décrit les mesures de sécurité applicatives et les obligations RGPD du projet POPolitics. Il complète le [Plan Qualité](04-quality-plan.md) et les [Exigences non-fonctionnelles](12-non-functional-requirements.md).

---

## 2. Périmètre des données

POPolitics manipule deux catégories de données distinctes :

| Catégorie | Exemples | Régime juridique |
|---|---|---|
| **Données publiques d'élus** | Votes, mandats, groupes politiques, amendements | Licence Ouverte Etalab 2.0 / CC BY 4.0, pas de contrainte RGPD |
| **Données utilisateurs** | Email, mot de passe hashé, élus suivis, thèmes d'intérêt | Données personnelles soumises au RGPD |

Les données d'élus sont des **données publiques** liées à l'exercice d'un mandat électif. Leur traitement est légalement autorisé sans consentement individuel. Seules les données des **utilisateurs inscrits** relèvent du RGPD.

---

## 3. Authentification & gestion des accès

### 3.1 Mécanisme d'authentification

- Authentification via **JWT** (JSON Web Token) ou session sécurisée avec cookie **HttpOnly** et flag **Secure**.
- Les tokens JWT ont une durée de vie courte : **< 1 heure** avec mécanisme de refresh token.
- Les refresh tokens sont **révocables** (invalidation côté serveur en cas de déconnexion ou de compromission).

### 3.2 Stockage des mots de passe

- Les mots de passe sont hashés avec **bcrypt** ou **argon2** avant stockage.
- Aucun mot de passe n'est stocké en clair, ni loggé, ni transmis en clair dans les logs.
- Longueur minimale imposée : **8 caractères**.

### 3.3 Gestion des rôles

| Rôle | Accès |
|---|---|
| Anonyme | Lecture publique (si activée) uniquement |
| Utilisateur standard | Accès complet au portail collectif + page personnelle |
| Administrateur | Accès aux fonctions d'administration (gestion utilisateurs, monitoring) |

- Les droits sont vérifiés **côté serveur** (middleware Django), jamais uniquement côté client.
- Principe du **moindre privilège** : chaque rôle n'accède qu'aux ressources dont il a besoin.

---

## 4. Sécurité des échanges

### 4.1 Transport

- Toutes les communications frontend ↔ backend transitent en **HTTPS** dès la V1 serveur.
- En environnement local (MVP), HTTP est toléré uniquement en développement.
- Certificat TLS : Let's Encrypt (gratuit) ou certificat auto-signé pour les environnements internes.

### 4.2 Protection des APIs

- **CORS** configuré explicitement : whitelist des origines autorisées (pas de `*` en production).
- **CSRF** : protection activée sur toutes les routes POST/PUT/DELETE Django.
- **Rate limiting** : à implémenter sur les endpoints sensibles (login, refresh token) pour limiter les attaques par force brute.

### 4.3 Protection contre les injections

- **Injection SQL** : utilisation systématique de l'ORM Django — pas de requêtes SQL construites par concaténation de chaînes.
- **XSS** : échappement automatique des données côté Next.js (React échappe par défaut) ; pas d'utilisation de `dangerouslySetInnerHTML` sans validation préalable.
- **Injection de commandes** : aucune commande shell construite depuis des entrées utilisateur.

---

## 5. Protection des secrets

### 5.1 Règles

- Aucun secret (clé API, mot de passe, token, DSN de base de données) ne doit être **commité dans Git**.
- Le fichier `.env` est listé dans `.gitignore` — il n'est jamais versionné.
- Un fichier `.env.example` (sans valeurs réelles) est versionné pour documenter les variables requises.

### 5.2 Gestion en production

- Les secrets sont injectés via **variables d'environnement** dans Docker Compose.
- Pour la V1 Cloud : utilisation d'un gestionnaire de secrets (ex. AWS Secrets Manager, HashiCorp Vault) selon l'infrastructure retenue.

---

## 6. Obligations RGPD

### 6.1 Base légale du traitement

Articles de référence :

> **Art. 6§1a RGPD** : *« La personne concernée a consenti au traitement de ses données à caractère personnel pour une ou plusieurs finalités spécifiques. »*
>
> **Art. 6§1b RGPD** : *« Le traitement est nécessaire à l'exécution d'un contrat auquel la personne concernée est partie ou à l'exécution de mesures précontractuelles prises à la demande de celle-ci. »*
>
> **Art. 9§2e RGPD** : *« Le traitement porte sur des données à caractère personnel qui sont manifestement rendues publiques par la personne concernée. »*

| Traitement | Base légale |
|---|---|
| Données d'élus (votes, mandats) | Données manifestement rendues publiques par la personne concernée (Art. 9§2e RGPD) |
| Compte utilisateur | Consentement explicite (Art. 6§1a RGPD) |
| Préférences utilisateur (élus suivis, thèmes) | Exécution du contrat / consentement (Art. 6§1b RGPD) |

### 6.2 Droits des utilisateurs

Les utilisateurs inscrits disposent des droits suivants, à exercer via l'interface ou par email :

| Droit | Mise en œuvre |
|---|---|
| **Droit d'accès** | Export des données personnelles de l'utilisateur |
| **Droit de rectification** | Modification du profil (email, préférences) depuis le compte |
| **Droit à l'effacement** | Suppression du compte et de toutes les données associées |
| **Droit à la portabilité** | Export des préférences au format JSON |
| **Droit d'opposition** | Désinscription et suppression du compte |

### 6.3 Données collectées sur les utilisateurs

| Donnée | Finalité | Durée de conservation |
|---|---|---|
| Email | Authentification, notifications | Durée du compte + 30 jours après suppression |
| Mot de passe hashé | Authentification | Durée du compte |
| Élus suivis | Personnalisation | Durée du compte |
| Thèmes d'intérêt | Personnalisation | Durée du compte |
| Logs de connexion | Sécurité | 90 jours glissants |

### 6.4 Minimisation des données

- Seules les données **strictement nécessaires** à la fonctionnalité sont collectées.
- Pas de collecte d'adresse postale, numéro de téléphone ou données de géolocalisation.
- Pas de partage des données utilisateurs avec des tiers.

### 6.5 Consentement

- À l'inscription, l'utilisateur doit **accepter explicitement** les conditions d'utilisation et la politique de confidentialité (case à cocher, non pré-cochée).
- Un lien vers la politique de confidentialité est accessible depuis toutes les pages.

---

## 7. Sécurité de l'infrastructure

### 7.1 Isolation des bases de données

- La base **Auth** (utilisateurs, tokens) est **strictement séparée** des datamarts métier (AN, Sénat, UE).
- Les services Django ne peuvent accéder qu'aux bases dont ils ont explicitement besoin (principe de ségrégation).

### 7.2 Journalisation

- Les événements de sécurité sont loggés : tentatives de connexion échouées, accès refusés, erreurs 5xx.
- Les logs ne contiennent **aucune donnée sensible** (pas de mot de passe, pas de token JWT complet).
- Les logs sont conservés **90 jours** puis supprimés.

### 7.3 Mises à jour de sécurité

- Les dépendances Python (Django, DRF, etc.) et Node.js (Next.js) doivent être maintenues à jour.
- Une vérification des vulnérabilités connues est effectuée avant chaque déploiement en production (`pip audit`, `npm audit`).

---

## 8. Responsabilités

| Responsabilité | Rôle |
|---|---|
| Mise en œuvre des mesures de sécurité backend | Développeur Backend |
| Mise en œuvre CORS / HTTPS / CSRF | Tech Lead / DevOps |
| Conformité RGPD & politique de confidentialité | Product Owner |
| Revue de sécurité avant déploiement | Tech Lead |
| Gestion des incidents de sécurité | Tech Lead + toute l'équipe |
