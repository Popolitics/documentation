# POPolitics – Sources de données

## 1. Vue d'ensemble

POPolitics s'appuie exclusivement sur des **données publiques ouvertes** issues de trois institutions :

| Institution | Portail open data | Licence |
|---|---|---|
| Assemblée nationale | data.assemblee-nationale.fr | Licence Ouverte Etalab 2.0 |
| Sénat | data.senat.fr | Licence Ouverte Etalab 2.0 |
| Parlement européen | data.europarl.europa.eu | Licence CC BY 4.0 |

Toutes les sources sont **gratuites**, sans clé d'API requise pour l'accès de base.

---

## 2. Assemblée nationale

### 2.1 Portail

- URL : [https://data.assemblee-nationale.fr](https://data.assemblee-nationale.fr)
- API REST (Recherche AN) : [https://recherche.assemblee-nationale.fr/api](https://recherche.assemblee-nationale.fr/api)

### 2.2 Données disponibles

| Dataset | Description | Format |
|---|---|---|
| Scrutins / votes | Résultats des votes en séance publique | JSON, XML |
| Députés | Identité, groupe politique, circonscription, mandats | JSON, XML |
| Amendements | Dépôt, sort, auteur, texte de référence | JSON, XML |
| Dossiers législatifs | Textes de loi, étapes, commissions | JSON, XML |
| Agenda | Ordre du jour des séances plénières | JSON, iCal |
| Comptes rendus | Verbatim des débats en séance | HTML, PDF |

### 2.3 Fréquence de mise à jour

- Votes et dossiers : **quotidienne** (jours de séance).
- Référentiels élus : **à chaque changement** (élection partielle, démission, décès).
- Comptes rendus : **sous 24–48h** après la séance.

### 2.4 Particularités

- Les identifiants d'élus (`acteur_uid`) sont stables entre les législatures.
- Les scrutins contiennent le vote individuel de chaque député (pour / contre / abstention / absent).
- Les données remontent jusqu'à la **13e législature** (2007) selon les datasets.

---

## 3. Sénat

### 3.1 Portail

- URL : [https://data.senat.fr](https://data.senat.fr)
- API REST : [https://api.senat.fr](https://api.senat.fr)

### 3.2 Données disponibles

| Dataset | Description | Format |
|---|---|---|
| Scrutins / votes | Votes en séance publique et en commission | JSON, XML |
| Sénateurs | Identité, groupe, département, mandats | JSON, XML |
| Amendements | Dépôt, sort, co-signataires | JSON, XML |
| Dossiers législatifs | Textes, navettes, commissions | JSON, XML |
| Agenda | Calendrier des séances | JSON |
| Comptes rendus | Verbatim des débats | HTML, PDF |

### 3.3 Fréquence de mise à jour

- Votes : **sous 24h** après la séance.
- Référentiels sénateurs : **temps quasi réel**.
- Comptes rendus : **48–72h** après la séance.

### 3.4 Particularités

- Le modèle de données Sénat est **structurellement différent** de celui de l'AN (schémas non identiques — transformation requise en phase Silver).
- Les votes en commission sont moins systématiquement disponibles que ceux en plénière.
- Certains anciens datasets (avant 2010) sont en **XML uniquement**.

---

## 4. Parlement européen

### 4.1 Portail

- URL : [https://data.europarl.europa.eu](https://data.europarl.europa.eu)
- API REST (SPARQL endpoint & REST) : [https://data.europarl.europa.eu/api/v1](https://data.europarl.europa.eu/api/v1)

### 4.2 Données disponibles

| Dataset | Description | Format |
|---|---|---|
| Votes en plénière | Résultats par eurodéputé | JSON-LD, RDF, XML |
| Eurodéputés (MEPs) | Identité, groupe politique, pays, mandats | JSON, XML |
| Activités parlementaires | Questions, rapports, résolutions | JSON, XML |
| Documents officiels | Textes législatifs (règlements, directives) | JSON, PDF |
| Agenda | Sessions plénières et ordre du jour | JSON, iCal |

### 4.3 Fréquence de mise à jour

- Votes : **après chaque session plénière** (hebdomadaire à Strasbourg, mensuelle à Bruxelles).
- Référentiels élus : **à chaque changement** (rotation liée aux élections nationales ou décès).

### 4.4 Particularités

- L'API utilise partiellement le format **JSON-LD / RDF** (données liées) — parsing plus complexe.
- Les identifiants MEP (`mepId`) sont stables sur toute la mandature.
- Les données sont disponibles en **24 langues** ; nous ciblons le **français et l'anglais** uniquement.
- La couverture remonte à la **6e législature** (2004).

---

## 5. Formats et ingestion

### 5.1 Formats bruts attendus

| Format | Sources concernées | Traitement requis |
|---|---|---|
| JSON | AN, Sénat, UE | Parsing direct |
| XML | AN, Sénat (anciens datasets) | Conversion JSON ou parsing XML |
| JSON-LD / RDF | UE (API SPARQL) | Parsing spécifique, aplatissement |
| HTML | Comptes rendus AN, Sénat | Scraping + nettoyage texte |
| PDF | Comptes rendus, textes officiels | Extraction texte (pdfplumber ou équivalent) |

### 5.2 Stratégie d'ingestion (pipeline ETL)

```text
Sources externes
      │
      ▼
[EXTRACT] ──► Landing Zone (Bronze) : données brutes, format original
      │
      ▼
[TRANSFORM] ──► Silver : normalisation, déduplication, schéma unifié
      │
      ▼
[LOAD] ──► Gold : agrégats, KPI, données prêtes à la consommation
      │
      ▼
Datamarts PostgreSQL (AN / Sénat / UE / Cross-match)
```

### 5.3 Identifiants croisés

Pour le datamart **Cross-match**, le rapprochement entre institutions s'appuie sur :

- **Nom + prénom + date de naissance** (aucun identifiant commun inter-institutionnel officiel).
- **Groupe politique européen** ↔ **groupe parlementaire français** (table de correspondance à maintenir manuellement).

---

## 6. Licences et conditions d'utilisation

| Source | Licence | Conditions |
|---|---|---|
| Assemblée nationale | Licence Ouverte Etalab 2.0 | Mention de la source obligatoire |
| Sénat | Licence Ouverte Etalab 2.0 | Mention de la source obligatoire |
| Parlement européen | CC BY 4.0 | Mention de la source + intégrité des données |

- **Utilisation commerciale** : autorisée sous ces licences.
- **Modification / redistribution** : autorisées, sous réserve de mention.
- **Données personnelles** : les données des élus sont des données publiques dans l'exercice de leur mandat — pas de contrainte RGPD particulière pour leur traitement dans ce contexte.

---

## 7. Limitations connues

| Limitation | Source(s) | Impact | Mitigation |
|---|---|---|---|
| Historique partiel (< 2007 pour l'AN) | AN | Analyses longue durée limitées | Cadrer les analyses à partir de 2007 |
| Schémas non normalisés entre AN et Sénat | AN, Sénat | Complexité de la couche Silver | Table de mapping explicite |
| Format JSON-LD complexe | UE | Temps de parsing plus long | Librairie RDFLib ou conversion préalable |
| Comptes rendus en PDF/HTML | AN, Sénat | Extraction texte fragile | Prétraitement dédié, validation manuelle d'un échantillon |
| Absences non distinguées | AN | Vote "absent" ≠ "ne participe pas" | Annoter dans le schéma Silver |
| Mises à jour irrégulières hors sessions | Toutes | Pipelines vides certains jours | Gestion des runs vides dans Kestra (no-op) |

---

## 8. Évolutions envisagées

- **Could have** : ajout d'autres sources (conseils régionaux, assemblées d'outre-mer).
- **Won't have (for now)** : flux temps réel ou streaming — ingestion batch journalière suffisante pour le MVP.
