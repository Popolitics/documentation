# POPolitics – Definition of Done (DoD)

## 1. Objectif

La **Definition of Done (DoD)** définit les critères permettant de considérer qu’une tâche, une fonctionnalité ou une user story est terminée et prête à être livrée.

Elle garantit que :

- toutes les fonctionnalités respectent un niveau de qualité défini ;
- le code est testé, documenté et validé ;
- l’équipe partage une définition commune du travail terminé.

La DoD permet également de maintenir une qualité constante du produit tout au long du projet.

---

## 2. Critères généraux de complétion

Une tâche est considérée comme **terminée** lorsque les conditions suivantes sont respectées.

### 2.1 Développement terminé

- Le code correspondant à la fonctionnalité est entièrement implémenté.
- Le code respecte les bonnes pratiques de développement définies par l’équipe.
- Le code est structuré et lisible.

### 2.2 Tests réalisés

Les tests nécessaires ont été réalisés :

- tests unitaires ;
- tests d’intégration (si applicable) ;
- tests manuels de validation.

Les critères suivants doivent être respectés :

- les tests passent **sans erreur** ;
- aucun bug critique n’est détecté.

### 2.3 Revue de code

Une **code review** a été réalisée par au moins un autre membre de l’équipe. La revue vérifie :

- la qualité du code ;
- la cohérence avec l’architecture ;
- le respect des standards de développement.

Les retours de relecture doivent être **corrigés avant validation**.

### 2.4 Intégration dans le repository

La fonctionnalité doit être :

- commit dans une branche dédiée ;
- fusionnée dans la branche principale via Pull Request ;
- validée après revue de code.

### 2.5 Documentation mise à jour

La documentation liée à la fonctionnalité doit être mise à jour si nécessaire :

- README ;
- documentation technique ;
- documentation API ;
- commentaires dans le code.

### 2.6 Fonctionnalité testée sur l’environnement de développement

La fonctionnalité doit être :

- testée dans l’application ;
- vérifiée pour s’assurer qu’elle fonctionne correctement ;
- validée par l’équipe.

### 2.7 Issue mise à jour dans l’outil de gestion de projet

Lorsque la tâche est terminée :

- l’issue correspondante est mise à jour ;
- elle est déplacée dans la colonne **Done** du board de gestion de projet ;
- les commentaires nécessaires sont ajoutés (lien vers la PR, notes importantes, etc.).

---

## 3. Critères spécifiques selon le type de tâche

### 3.1 Fonctionnalité Backend

Pour une fonctionnalité backend :

- l’API fonctionne correctement ;
- les endpoints répondent avec les bons formats et codes de retour ;
- les erreurs sont correctement gérées (messages clairs, statuts HTTP adaptés).

### 3.2 Fonctionnalité Frontend

Pour une fonctionnalité frontend :

- l’interface fonctionne sans erreur ;
- l’affichage est cohérent avec le design défini (UX/UI) ;
- les interactions utilisateur fonctionnent correctement sur les parcours ciblés.

### 3.3 Traitement de données / IA

Pour les fonctionnalités liées aux données ou à l’IA :

- les données sont correctement traitées (qualité, complétude minimale) ;
- les résultats produits sont cohérents par rapport aux attentes fonctionnelles ;
- les performances sont acceptables (temps de traitement raisonnable pour l’usage visé).

---

## 4. Validation finale

Une tâche est officiellement considérée comme **terminée** lorsque :

- tous les critères de la Definition of Done sont respectés ;
- la Pull Request est validée ;
- la fonctionnalité est intégrée au projet ;
- l’issue correspondante est marquée comme **Done** dans l’outil de gestion.

---

## 5. Évolution de la Definition of Done

La Definition of Done peut évoluer au cours du projet afin de :

- améliorer la qualité du produit ;
- adapter les processus de développement ;
- intégrer les retours de l’équipe.

Toute modification doit être **discutée et validée collectivement** par l’équipe, puis répercutée dans le présent document.