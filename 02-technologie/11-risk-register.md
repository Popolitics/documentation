# POPolitics – Registre des risques

## 1. Méthode d'évaluation

Chaque risque est évalué selon deux axes :

- **Probabilité** : Faible (1) / Moyen (2) / Élevé (3)
- **Impact** : Faible (1) / Moyen (2) / Élevé (3)
- **Criticité** = Probabilité × Impact → score de 1 à 9

| Criticité | Niveau |
|---|---|
| 1 – 2 | Faible |
| 3 – 4 | Moyen |
| 6 – 9 | Critique |

---

## 2. Registre des risques

### Catégorie : Données & Sources externes

| ID | Risque | Probabilité | Impact | Criticité | Mitigation | Responsable |
|---|---|:---:|:---:|:---:|---|---|
| R-01 | Changement de format ou d'URL d'une API source (AN, Sénat, UE) sans préavis | 2 | 3 | **6** | Versionner les connecteurs ETL ; surveiller les changelogs des portails open data ; couche Bronze comme filet de sécurité | Data Engineer |
| R-02 | Qualité des données insuffisante (doublons, valeurs manquantes, incohérences entre sources) | 3 | 2 | **6** | Tests de qualité systématiques en phase Silver ; logs de rejet explicites dans Kestra ; validation d'un échantillon à chaque ingestion | Data Engineer |
| R-03 | Indisponibilité temporaire d'une source (maintenance portail, panne) | 2 | 2 | **4** | Gestion des runs vides dans Kestra (no-op) ; retry automatique ; stocker les dernières données valides en Bronze | Data Engineer |
| R-04 | Absence d'identifiant commun entre AN, Sénat et UE pour le cross-match | 3 | 2 | **6** | Table de correspondance manuelle (nom + prénom + date de naissance) ; documenter les cas ambigus ; limiter le cross-match aux élus avec mandat simultané | Data Engineer |
| R-05 | Volume de données plus important que prévu (saturation disque ou mémoire) | 1 | 2 | **2** | Surveiller la taille des données dès le Sprint 1 ; prévoir un quota disque minimum (50 Go) sur la VM de démo | DevOps |

---

### Catégorie : Technique & Architecture

| ID | Risque | Probabilité | Impact | Criticité | Mitigation | Responsable |
|---|---|:---:|:---:|:---:|---|---|
| R-06 | Complexité de la stack locale (7–8 conteneurs Docker) bloquant le démarrage d'un membre | 2 | 2 | **4** | Guide de démarrage rapide obligatoire dès le Sprint 0 ; critère de fin de Sprint 0 : stack opérationnelle en < 30 min pour chacun | Tech Lead |
| R-07 | Couche IA (Sprint 9) sous-estimée — modèle non livrable dans les temps | 3 | 3 | **9** | Réduire le périmètre IA au strict minimum (résumé automatique uniquement) ; prévoir un fallback sans IA si nécessaire ; anticiper en Sprint 8 | Tech Lead / IA |
| R-08 | Divergence des schémas de données entre AN et Sénat rendant la normalisation Silver complexe | 3 | 2 | **6** | Documenter les deux schémas dès le Sprint 1 ; définir le schéma unifié avant le Sprint 2 ; tester la couche Silver avec données réelles | Data Engineer |
| R-09 | Régression backend ou ETL non détectée faute de tests automatisés suffisants | 2 | 3 | **6** | Tests unitaires sur les transformations critiques ; tests d'intégration backend ↔ datamarts ; smoke tests avant chaque démo | Backend / Data |
| R-10 | Performance insuffisante des requêtes PostgreSQL sur de gros volumes | 2 | 2 | **4** | Indexer les colonnes clés dès la création des datamarts ; surveiller les temps de réponse des endpoints ; optimiser en Gold si nécessaire | Backend / Data |

---

### Catégorie : Organisation & Équipe

| ID | Risque | Probabilité | Impact | Criticité | Mitigation | Responsable |
|---|---|:---:|:---:|:---:|---|---|
| R-11 | Manque de disponibilité de membres en période de distanciel (alternance, charge entreprise) | 3 | 2 | **6** | Sprints de 2 semaines avec objectifs réalistes ; revue de charge lors du Sprint Planning ; périmètre ajustable (Should → Could) | Scrum Master / PO |
| R-12 | Départ ou indisponibilité prolongée d'un membre clé (maladie, abandon) | 1 | 3 | **3** | Documentation continue des choix et décisions ; pas de compétence en silo ; pair programming encouragé | Tech Lead |
| R-13 | Mauvaise synchronisation entre équipes data, backend et frontend (dépendances bloquantes) | 2 | 3 | **6** | Définir les contrats d'API et les schémas de données avant le début du Sprint concerné ; daily ou point de synchro hebdomadaire | Scrum Master |
| R-14 | Sous-estimation générale de la charge sur un sprint | 2 | 2 | **4** | Vélocité suivie sprint par sprint ; affinage du backlog régulier ; règle : mieux vaut finir moins et bien que livrer un sprint instable | PO / Scrum Master |

---

### Catégorie : Périmètre & Livraison

| ID | Risque | Probabilité | Impact | Criticité | Mitigation | Responsable |
|---|---|:---:|:---:|:---:|---|---|
| R-15 | Périmètre Must Have non livré avant la soutenance | 1 | 3 | **3** | Prioriser strictement le Must Have ; bloquer toute fonctionnalité Should si un Must est en retard | PO |
| R-16 | Scénario de démonstration non préparé ou instable le jour J | 2 | 3 | **6** | Dédier le Sprint 11 à la stabilisation et à la préparation de la démo ; jeu de données de démonstration figé et testé à l'avance | Tech Lead / PO |
| R-17 | Documentation technique incomplète ou désynchronisée avec le code | 2 | 2 | **4** | Mise à jour des docs incluse dans la Definition of Done ; revue documentation lors du Sprint 11 | Toute l'équipe |

---

## 3. Récapitulatif par criticité

### Critiques (score 6–9)

| ID | Risque | Score |
|---|---|:---:|
| R-07 | Couche IA sous-estimée | **9** |
| R-01 | Changement d'API source | **6** |
| R-02 | Qualité des données insuffisante | **6** |
| R-04 | Pas d'identifiant commun cross-match | **6** |
| R-08 | Divergence schémas AN / Sénat | **6** |
| R-09 | Régressions non détectées | **6** |
| R-11 | Disponibilité en distanciel | **6** |
| R-13 | Désynchronisation équipes | **6** |
| R-16 | Démo instable le jour J | **6** |

### Moyens (score 3–4)

| ID | Risque | Score |
|---|---|:---:|
| R-06 | Stack locale bloquante | **4** |
| R-10 | Performance PostgreSQL | **4** |
| R-14 | Sous-estimation de charge | **4** |
| R-17 | Documentation désynchronisée | **4** |
| R-12 | Départ d'un membre clé | **3** |
| R-15 | Must Have non livré | **3** |

### Faibles (score 1–2)

| ID | Risque | Score |
|---|---|:---:|
| R-05 | Volume de données excessif | **2** |

---

## 4. Suivi

Ce registre est à réviser **à chaque Sprint Review**. Pour chaque risque critique actif, une ligne de suivi doit être ajoutée lors de la révision :

| ID | Date révision | Statut | Évolution |
|---|---|---|---|
| | | | |

**Statuts possibles :** `Actif` / `Atténué` / `Clos` / `Matérialisé`
