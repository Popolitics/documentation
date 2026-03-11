# POPolitics – Ressources matérielles & coûts

Ce document complète les choix techniques de POPolitics en détaillant les ressources matérielles nécessaires, les coûts estimés et la logique d’évolution de l’infrastructure :
- MVP en local via Docker sur machine de développement
- V1 sur serveur local (on-premise léger)
- Version Cloud managée

---

## 1. MVP local – Docker sur machine de développement

- **Contexte** : exécution en local sur la machine d’un membre de l’équipe (ou d’une machine partagée ponctuellement) avec l’ensemble des services Docker (Django, Next.js, PostgreSQL, Kestra, etc.).
- **Configuration cible** :
  - CPU : 4 vCPU
  - RAM : 16 Go
  - Stockage : 256–512 Go SSD
- **Coût estimatif** :
  - Utilisation d’un laptop/PC déjà existant → **0 € de coût supplémentaire** pour le projet.
- **Justification** :
  - Suffisant pour développer, lancer les containers Docker et exécuter les premiers pipelines ETL et modèles IA sur des volumes réduits.
  - Permet de démarrer le projet sans frais, en cohérence avec la contrainte « budget nul au départ ».

---

## 2. V1 – Serveur local (on-premise léger)

- **Contexte** : hébergement sur un petit serveur local ou une machine dédiée dans l’école / l’organisation, toujours via Docker Compose.
- **Configuration cible** :
  - CPU : 4–8 vCPU
  - RAM : 16–32 Go
  - Stockage : 512 Go–1 To SSD (pour Data Lake + datamarts + logs)
- **Coût estimatif** :
  - Réutilisation d’un serveur existant → **0–200 €** (maintenance mineure, disques supplémentaires éventuels).
  - Achat d’un serveur d’entrée de gamme → **800–1 200 €** (one-shot, amortissable sur plusieurs projets).
- **Justification** :
  - Offre un environnement plus stable pour les démos internes et tests d’intégration.
  - Permet d’augmenter la volumétrie manipulée sans saturer les machines personnelles.

---

## 3. Version Cloud – Hébergement managé

- **Contexte** : déploiement sur un fournisseur Cloud (type AWS, GCP, Azure ou équivalent souverain) avec une machine virtuelle ou un petit cluster de services managés.
- **Configuration cible (exemple VM unique)** :
  - CPU : 4 vCPU
  - RAM : 16 Go
  - Stockage : 200–500 Go SSD (Data Lake et bases de données sur volumes attachés)
- **Coût estimatif** (ordre de grandeur) :
  - VM 4 vCPU / 16 Go RAM : **40–80 €/mois** selon le fournisseur et la région.
  - Stockage : **5–20 €/mois** pour 200–500 Go.
- **Justification** :
  - Permet une haute disponibilité, un accès distant pour tous les membres de l’équipe et une montée en charge progressive.
  - Facilite l’exposition sécurisée de l’application à des bêta‑testeurs externes et son passage à l’échelle.

---

## 4. Cohérence avec les choix techniques

L’architecture et la stack retenues dans 01-technological-choices.md (Docker, Django, Next.js, PostgreSQL, Kestra, Data Lake Bronze/Silver/Gold) restent identiques dans ces trois scénarios :
- on ne change que le niveau d’infrastructure (machine locale, serveur local, Cloud),
- ce qui limite les coûts de migration entre MVP local, V1 sur serveur local et future version Cloud.
