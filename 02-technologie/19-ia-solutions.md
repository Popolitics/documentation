# POPolitics – Solutions IA & Model Training

## 1. Vue d'ensemble

POPolitics intègre une couche IA destinée à enrichir l'exploitation des données parlementaires issues des couches **Silver / Gold**.

Les fonctionnalités IA reposent sur un **IA Service indépendant du frontend**, consommé par le backend Django via API.

La couche IA permet :

- la génération automatique de résumés,
- l'analyse de similarité entre textes,
- un chatbot conversationnel sur les données parlementaires,
- la classification de documents,
- l'analyse de tendances.

Les modèles sont exécutés via un environnement dédié pouvant utiliser :
- des modèles locaux auto-hébergés,
- ou des API LLM externes.

---

# 2. Architecture IA

## 2.1 Vue logique

Datamarts PostgreSQL (Silver / Gold)
          │
          ▼
     IA Service
          │
          ├───────────────┐
          │               │
          ▼               ▼
   Traitements IA     LLM Gateway
          │               │
          ▼               ▼
 Résultats enrichis       LLM
          │
          ▼
PostgreSQL / Index vectoriel

## 2.2 Intégration applicative

L'IA Service est exposé comme un service indépendant.

Le backend Django consomme ses fonctionnalités via API REST.

Frontend NextJS
        │
        ▼
Backend Django
        │
        ▼
IA Service
        │
        ├── Résumé automatique
        ├── Similarité
        ├── Chatbot RAG
        ├── Classification
        └── Analyse

# 3. Cas d’usage IA

## 3.1 Résumés automatiques (MVP)
### Objectif 

Générer automatiquement un résumé compréhensible d'une loi, d'un amendement ou d'un débat parlementaire.

### Sources

- textes de lois,
- amendements,
- comptes rendus,
- débats parlementaires.

Données utilisées depuis :

Data Gold PostgreSQL,
documents nettoyés issus de la couche Silver.

### Pipeline
Texte parlementaire
        │
        ▼
Nettoyage / découpage
        │
        ▼
LLM
        │
        ▼
Résumé structuré
        │
        ▼
Stockage résultat json

Exemple :

{
  "objectif": "...",
  "mesures_principales": [
    "...",
    "..."
  ],
  "impact": "...",
  "resume_court": "..."
}

## 3.2 Score de similarité textes (MVP)

### Objectif

Comparer :
- lois,
- amendements,
- déclarations de groupes,
- positions politiques.

### Approche

Utilisation d'embeddings vectoriels.

Texte
  │
  ▼
Embedding model
  │
  ▼
Vecteur
  │
  ▼
Recherche similarité
  │
  ▼
Score

### Technologie
- Sentence Transformers (modèle français)
- Base vectorielle PostgreSQL + pgvector

### Exemple de sortie
Loi A ↔ Amendement B

Similarité : 87%

## 3.3 Chatbot parlementaire (V1)

### Objectif

Permettre une interrogation en langage naturel des données parlementaires.

### Architecture

Approche RAG (Retrieval Augmented Generation).

Question utilisateur
        │
        ▼
Recherche vectorielle
        │
        ▼
Contexte parlementaire
        │
        ▼
LLM
        │
        ▼
Réponse sourcée

### Sources interrogées
- lois,
- amendements,
- débats,
- votes,
- données parlementaires.

### Capacités
- recherche documentaire,
- explication de textes,
- synthèse,
- questions/réponses.

# 4. Modèles IA

## 4.1 Modèles LLM

Deux modes de déploiement :
Mode : Local / Usage : Développement, tests, confidentialité
Mode: API externe / Usage : roduction, montée en charge

Exemples :
- Mistral,
- Qwen,
- modèles compatibles OpenAI API.

## 4.2 Modèles d'embeddings

Utilisés pour :
- recherche sémantique,
- RAG,
- similarité.

Pipeline :

Document
   │
   ▼
Découpage en chunks
   │
   ▼
Embedding
   │
   ▼
Index vectoriel

# 5. Stockage IA

## 5.1 Base vectorielle

Utilisation de pgvector pour :
- embeddings,
- recherche sémantique,
- RAG.

Stockage :
- documents
- chunks
- embeddings
- metadata

# 6. Déploiement

## 6.1 Environnement

### Développement :

Ollama
+
Modèle local

### Production :

IA Service
      │
      ▼
LLM Gateway
      │
      ├── Modèle auto-hébergé
      └── API LLM externe

# 7. Limites connues
Taille des textes parlementaires : Dépassement contexte LLM -> Découpage en chunks
Hallucinations LLM : Réponses incorrectes -> RAG + sources
Coût API externe : Budget variable -> Modèles locaux
Qualité des résumés : Dépend du modèle -> Validation humaine
Similarité sémantique : Score approximatif -> Ajustement du modèle embedding