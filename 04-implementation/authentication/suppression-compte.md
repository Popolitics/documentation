# Suppression du compte et conservation

## Routes

| Route | Méthode | Rôle |
|---|---|---|
| `/api/accounts/delete/` | POST | Supprime le compte connecté ; Bearer et mot de passe requis |

## Parcours authentifié

La requête nécessite un jeton Bearer valide et le mot de passe courant du compte :

```http
POST /api/accounts/delete/
Authorization: Bearer <access>
Content-Type: application/json

{"password": "<mot de passe courant>"}
```

La réponse de succès est `204 No Content`, sans corps.
Aucun identifiant cible n'est accepté : seul le compte authentifié est supprimé.
Sans authentification, la réponse est `401` ; avec un mot de passe manquant ou
incorrect, `400`.
Une erreur de base de données retourne `503` avec un message générique ; la
transaction est annulée et la demande peut être renouvelée.

Le compte (profil, hash du mot de passe, appartenances), ses sessions Django et
tous ses jetons stockés, y compris les JWT contenant des données personnelles,
sont supprimés dans une transaction. Les endpoints protégés, de renouvellement
et de vérification rejettent immédiatement les jetons de ce compte supprimé.
Les autres comptes et leurs sessions sont préservés. Aucun modèle de préférences
ou de suivi n'existe actuellement dans ce service ; tout futur modèle lié au
compte doit prévoir son effacement en cascade et un test associé.

L’email est supprimé immédiatement avec le compte, conformément à la
[politique RGPD](../../02-technologie/14-security-rgpd.md). Aucune copie de
l’email n’est conservée par ce parcours et aucune purge différée n’est nécessaire.
Les logs d’infrastructure et sauvegardes restent soumis à leur propre politique
de conservation ; le service ne crée pas de log contenant l’email ou les jetons
lors de la suppression.

Les services consommateurs de JWT doivent vérifier l'existence du compte via
`POST /api/token/verify/` pour assurer la révocation immédiate. Une vérification
hors ligne de la seule signature RS256 ne suffit pas à détecter un compte supprimé.
