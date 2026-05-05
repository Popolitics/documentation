# POPolitics – Exigences non-fonctionnelles (NFR)

## 1. Introduction

Les exigences non-fonctionnelles définissent **comment** le système doit se comporter, indépendamment des fonctionnalités métier. Elles s'appliquent à l'ensemble de la stack : pipeline ETL, backend Django, frontend Next.js et infrastructure Docker.

---

## 2. Performance

### 2.1 Temps de réponse API

| Endpoint | Cible MVP | Cible V1 |
|---|---|---|
| Consultation tableau des votes (filtre simple) | < 2 s | < 1 s |
| Consultation tableau des votes (filtre avancé / cross-match) | < 5 s | < 2 s |
| Page personnelle (timeline d'un élu suivi) | < 3 s | < 1,5 s |
| Authentification (login) | < 1 s | < 500 ms |
| Endpoint IA (résumé automatique) | < 10 s | < 5 s |

### 2.2 Pipeline ETL

- Ingestion complète AN + Sénat + UE : **< 2 heures** pour un run journalier complet.
- Ingestion différentielle (données du jour uniquement) : **< 30 minutes**.
- Kestra doit loguer le temps d'exécution de chaque step pour permettre l'identification des goulots d'étranglement.

### 2.3 Chargement frontend

- **LCP (Largest Contentful Paint)** : < 2,5 s sur connexion standard.
- **TTI (Time to Interactive)** : < 4 s.
- Les pages lourdes (tableaux, graphiques) doivent implémenter une **pagination** ou un **chargement progressif** pour ne jamais dépasser 500 lignes chargées en une seule requête.

---

## 3. Scalabilité

### 3.1 Charge utilisateurs

| Phase | Utilisateurs simultanés cibles |
|---|---|
| MVP local (démo soutenance) | 5–10 |
| V1 serveur local | 50–100 |
| Version Cloud | 500+ |

### 3.2 Volume de données

| Source | Volume estimé (initial) | Croissance annuelle |
|---|---|---|
| Assemblée nationale | ~5 Go (historique depuis 2007) | ~500 Mo/an |
| Sénat | ~3 Go (historique depuis 2010) | ~300 Mo/an |
| Parlement européen | ~2 Go (historique depuis 2004) | ~200 Mo/an |
| **Total** | **~10 Go** | **~1 Go/an** |

- L'architecture Bronze/Silver/Gold doit rester fonctionnelle jusqu'à **100 Go** sans modification structurelle.
- Le passage à un stockage Cloud (S3 ou équivalent) doit être possible sans refonte du pipeline ETL.

---

## 4. Disponibilité & fiabilité

### 4.1 Disponibilité cible

| Environnement | Disponibilité cible |
|---|---|
| MVP local (démo) | Best-effort (pas de SLA) |
| V1 serveur local | 95 % (tolérance maintenance planifiée) |
| Version Cloud | 99 % |

### 4.2 Gestion des pannes

- Un job ETL en échec ne doit **pas bloquer les autres jobs** , isolation par pipeline dans Kestra.
- En cas d'indisponibilité d'une source externe, le système doit servir les **dernières données valides** sans erreur visible pour l'utilisateur.
- Le backend Django doit retourner des **codes HTTP explicites** (404, 503, etc.) et jamais exposer de stack trace en production.

### 4.3 Reprise après incident

- Temps de redémarrage de la stack complète (Docker Compose) : **< 5 minutes**.
- Les pipelines Kestra doivent supporter le **rejeu manuel** d'un run en échec sans duplication de données.

---

## 5. Sécurité

### 5.1 Authentification & autorisation

- Authentification via **JWT** ou session sécurisée (HttpOnly cookie).
- Toute route API Django doit vérifier l'authentification **avant** tout traitement.
- Les rôles (utilisateur standard, administrateur) doivent être vérifiés côté serveur, jamais côté client seul.
- Les tokens JWT doivent avoir une **durée de vie courte** (< 1 heure) avec mécanisme de refresh.

### 5.2 Protection des données

- Aucun secret (clés API, mots de passe, tokens) ne doit être commité dans le dépôt Git.
- Les secrets sont gérés via **variables d'environnement** et/ou fichier `.env` non versionné.
- Les mots de passe utilisateurs sont stockés **hashés** (bcrypt ou argon2), jamais en clair.

### 5.3 Sécurité des échanges

- Toutes les communications entre frontend et backend doivent transiter en **HTTPS** (dès la V1 serveur).
- Les APIs doivent implémenter une protection **CORS** explicite (whitelist des origines autorisées).
- Protection contre les injections SQL via l'ORM Django — pas de requêtes SQL concaténées manuellement.

### 5.4 Données personnelles (RGPD)

- Les données traitées sont des **données publiques d'élus** dans l'exercice de leur mandat, pas de contrainte RGPD spécifique sur ces données.
- Les données des **utilisateurs inscrits** (email, préférences) sont soumises au RGPD :
  - Consentement explicite à l'inscription.
  - Possibilité de suppression du compte et des données associées.
  - Pas de partage avec des tiers.

---

## 6. Maintenabilité

### 6.1 Lisibilité du code

- Couverture de tests unitaires sur les fonctions critiques : **> 60 %** (cible MVP).
- Chaque pipeline Kestra doit être nommé explicitement et documenté en en-tête YAML.
- Pas de valeurs en dur (*hardcoded*) dans les scripts ETL, utiliser des variables de configuration.

### 6.2 Traçabilité

- Chaque run ETL doit produire un log structuré contenant : date, source, nombre de lignes ingérées, nombre de rejets, statut final.
- Les erreurs backend doivent être loguées avec leur contexte (endpoint, paramètres, timestamp), sans données sensibles.

### 6.3 Évolutivité de l'architecture

- L'ajout d'une nouvelle source de données (ex. conseils régionaux) doit être possible **sans modifier** les couches Silver/Gold existantes.
- L'ajout d'un nouveau modèle IA doit se faire via un nouveau service indépendant, sans modifier le backend Django existant.

---

## 7. Compatibilité

### 7.1 Navigateurs supportés

| Navigateur | Support |
|---|---|
| Chrome / Chromium (dernière version) | Complet |
| Firefox (dernière version) | Complet |
| Safari (dernière version) | Complet |
| Edge (dernière version) | Complet |
| Internet Explorer | Non supporté |

### 7.2 Résolutions

- L'interface doit être utilisable sur **desktop** (largeur ≥ 1024 px) en priorité.
- Une adaptation **tablette** (≥ 768 px) est un objectif Should Have.
- Le support mobile n'est pas dans le périmètre du MVP.

---

## 8. Contraintes d'infrastructure (MVP)

En cohérence avec [08-projet-ressources.md](08-projet-ressources.md) :

- Stack complète opérationnelle sur une machine **4 vCPU / 16 Go RAM / 256 Go SSD**.
- Démarrage de la stack via `docker-compose up` en **< 5 minutes** sur la machine de démo.
- Aucun service cloud payant requis pour le MVP — tout doit fonctionner **offline** (sauf les appels aux sources externes lors des runs ETL).
