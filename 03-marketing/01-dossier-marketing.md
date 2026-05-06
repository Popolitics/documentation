# POPolitics - Dossier marketing

## 1. Introduction

### 1.1 Presentation du projet

POPolitics est une plateforme civic-tech qui aide les citoyens a comprendre l'activite parlementaire a partir de donnees publiques officielles. Le produit centralise les votes, prises de position, tendances et debats issus de plusieurs institutions, puis les transforme en informations lisibles, comparables et actionnables.

Le projet repose sur trois piliers :

- **transparence democratique**,
- **accessibilite de la donnee publique**,
- **personnalisation de l'experience utilisateur**.

### 1.2 Contexte et origine de l'idee

Le point de depart de POPolitics est un constat simple : les donnees parlementaires existent, mais elles restent difficiles a lire, a comparer et a exploiter pour un non-specialiste. Les portails officiels proposent une information riche mais peu pedagogique, tandis que les medias simplifient souvent les sujets ou se concentrent sur l'actualite immediate.

Dans ce contexte, POPolitics se positionne comme un **pont entre la donnee brute et la comprehension citoyenne**. Le projet nait dans un cadre academique Epitech, mais il est pense des l'origine comme une plateforme capable de continuer a vivre apres les etudes, avec une ambition produit et une trajectoire de croissance reelle.

### 1.3 Objectifs du projet

Les objectifs marketing et produit de POPolitics sont les suivants :

- rendre le suivi parlementaire comprensible en moins de quelques minutes,
- creer une marque civic-tech reconnue pour sa fiabilite,
- attirer une premiere base d'utilisateurs engagees,
- fournir un outil utile aux journalistes et analystes,
- construire une trajectoire de perennisation post-etudes.

---

## 2. Presentation de l'offre

> Note d'adaptation : le sommaire initial etait formule pour une agence. Il a ete adapte ici a une logique de **plateforme produit**.

### 2.1 Concept de la plateforme

POPolitics est une plateforme d'analyse politique accessible via le web. Elle combine :

- des donnees ouvertes issues de l'Assemblee nationale, du Senat et du Parlement europeen,
- des traitements ETL pour nettoyer et normaliser l'information,
- une interface claire pour explorer votes, tendances et debats,
- des fonctions de personnalisation pour suivre des elus et des themes,
- a terme, des fonctions IA pour accelerer la comprehension des textes et debats.

Le concept ne consiste pas a produire de l'opinion, mais a **mettre en scene des faits politiques verifiables**.

### 2.2 Fonctionnement du service

Le service suit un cycle simple :

1. ingestion quotidienne des donnees publiques,
2. normalisation et enrichissement des informations,
3. exposition via une interface web et des APIs,
4. consultation par l'utilisateur selon son besoin,
5. personnalisation progressive via suivis, filtres et alertes.

Pour l'utilisateur final, la promesse est simple :

- rechercher un elu,
- voir ses votes et positions,
- comprendre le contexte d'un texte,
- comparer plusieurs profils ou groupes,
- recevoir des alertes sur les sujets qui comptent.

### 2.3 Description des offres et trajectoire de monetisation

Le projet est pense selon une logique de lancement progressif.

| Niveau d'offre | Cible | Contenu | Statut |
| :--- | :--- | :--- | :--- |
| **Offre publique gratuite** | Citoyens | Consultation des votes, filtres, pages elus, notifications de base | Cible MVP |
| **Offre Pro** | Journalistes, chercheurs, ONG | Filtres avances, exports, comparateurs, historique plus profond, visualisations | Hypothese post-lancement |
| **Offre Data / API** | Medias, associations, partenaires institutionnels | Acces API, extractions structurees, jeux de donnees enrichis, support | Hypothese de croissance |

Position retenue a court terme :

- **gratuit pour le grand public** afin de maximiser l'adoption,
- **monetisation differenciee** seulement lorsque la valeur d'usage et la stabilite produit seront prouvees.

### 2.4 Experience client

L'experience souhaitee est fondee sur quatre moments clefs :

| Etape | Experience attendue |
| :--- | :--- |
| **Decouverte** | Comprendre en quelques secondes ce que fait POPolitics et a qui cela sert |
| **Premiere valeur** | Trouver rapidement un vote, un elu ou un texte sans apprentissage complexe |
| **Engagement** | Revenir pour suivre des themes, sauvegarder des preferences et recevoir des alertes |
| **Prescription** | Partager une analyse, un graphique ou une fiche utile a d'autres utilisateurs |

Le positionnement UX doit rester :

- lisible pour le grand public,
- robuste pour les utilisateurs avances,
- credible pour les journalistes et partenaires.

---

## 3. Etude de marche

### 3.1 Analyse du marche

POPolitics se situe a la jonction de quatre marches :

- la **civic-tech**,
- l'**open data publique**,
- les **medias et outils d'analyse politique**,
- les **outils d'aide a la decision et a la veille**.

Le contexte de marche est favorable pour plusieurs raisons :

- la demande de transparence democratique augmente,
- la fatigue informationnelle pousse vers des formats plus synthétiques,
- les jeux de donnees publics deviennent plus accessibles,
- les outils IA rendent possible une meilleure mediation de contenus complexes.

Le marche reste toutefois fragmenté : l'offre est dispersee entre sites institutionnels, associations, journalistes data et outils generiques d'analyse.

### 3.2 Analyse de la demande

La demande adressee par POPolitics repose sur trois besoins concrets :

| Besoin | Description | Cible principale |
| :--- | :--- | :--- |
| **Comprendre vite** | Acceder en moins d'une minute a l'essentiel d'un vote ou d'un texte | Citoyens |
| **Explorer en profondeur** | Filtrer, croiser, comparer et exporter les donnees | Journalistes / experts |
| **Suivre dans le temps** | Recevoir des alertes et construire une veille personnalisee | Citoyens engages, ONG, experts |

La demande est probablement plus forte sur les moments de tension democratique : elections, grandes reformes, crises sociales, textes clivants.

### 3.3 Personas

Les personas detailles sont documentes dans [02-technologie/00-personas.md](../02-technologie/00-personas.md).

Synthese marketing :

| Persona | Motivation principale | Attente marketing |
| :--- | :--- | :--- |
| **Marie Fontaine** | Comprendre ce que votent ses representants | Simplicite, rapidite, mobile-first |
| **Thomas Marchand** | Exploiter des donnees fiables pour produire des analyses | Precision, export, profondeur |
| **Lucas Perrin** | Garantir la fiabilite et la disponibilite de la plateforme | Robustesse, monitoring, credibilite technique |

### 3.4 Analyse de la concurrence

La concurrence de POPolitics est surtout **indirecte** ou **partielle**.

| Type de concurrent | Exemples | Forces | Limites face a POPolitics |
| :--- | :--- | :--- | :--- |
| **Portails institutionnels** | Assemblee nationale, Senat, Parlement europeen | Source officielle, exhaustivite | UX complexe, peu de personnalisation, croisement limite |
| **Acteurs civic-tech** | Regards Citoyens, projets open data citoyens | Credibilite democratique, transparence | Offre parfois technique, experience inegale selon les usages |
| **Medias et data journalisme** | Rubriques data de medias, formats interactifs ponctuels | Pedagogie, audience | Vision episodique, pas d'outil continu et personnalisable |
| **Outils generiques data** | Tableurs, BI, scraping perso | Flexibilite | Requiert du temps, des competences et peu d'accessibilite grand public |

Conclusion concurrentielle : POPolitics peut se differencier en combinant **rigueur des donnees**, **UX accessible**, **croisement multi-institutionnel** et **personnalisation**.

### 3.5 Tendances du marche

Les tendances qui soutiennent POPolitics sont :

- progression des usages de l'open data,
- demande croissante de formats visuels et pedagogiques,
- recherche de produits de veille personnalisee,
- montee des attentes sur l'explicabilite de l'IA,
- essor des produits a impact public et civic-tech.

Les risques de marche a surveiller sont :

- saturation informationnelle,
- defiance envers les outils perçus comme politiques,
- dependance aux plateformes sociales pour l'acquisition,
- evolution des politiques d'acces aux APIs publiques.

### 3.6 Analyses strategiques

#### SWOT

| Forces | Faiblesses |
| :--- | :--- |
| Positionnement clair sur la transparence democratique | Produit encore en phase de construction |
| Multi-source AN / Senat / UE | Marque encore inconnue |
| Forte valeur percue pour plusieurs publics | Dependance aux donnees et APIs externes |
| Differenciation par la lisibilite et la personnalisation | Ressources humaines et budget limites au depart |

| Opportunites | Menaces |
| :--- | :--- |
| Croissance de la civic-tech et de l'open data | Changement de formats des donnees publiques |
| Partenariats medias, associations, ecoles | Recuperation du sujet par un acteur plus installe |
| Besoin de veille politique outillee | Polemiques sur la neutralite de la plateforme |
| Valorisation post-etudes comme startup ou association | Faible retention si l'usage n'est pas assez recurrent |

#### PESTEL

| Dimension | Impact sur POPolitics |
| :--- | :--- |
| **Politique** | Forte actualite parlementaire, besoin de transparence, sensibilite au positionnement partisan |
| **Economique** | Budget initial limite mais couts d'infrastructure modérés au lancement |
| **Social** | Defiance envers les institutions mais forte attente de comprehension simple |
| **Technologique** | Open data, ETL, IA et visualisation favorisent la proposition de valeur |
| **Environnemental** | Impact faible, mais choix d'une infra sobre et progressive valorisable |
| **Legal** | RGPD, licences ouvertes, reutilisation des donnees publiques a maitriser |

#### Five Forces de Porter

| Force | Niveau | Lecture |
| :--- | :---: | :--- |
| Intensite concurrentielle | Moyen | Peu d'acteurs couvrent toute la chaine, mais plusieurs alternatives partielles existent |
| Menace des nouveaux entrants | Moyen | Les donnees sont ouvertes, mais l'execution technique et UX reste difficile |
| Pouvoir des fournisseurs | Eleve | Les institutions sources controlent l'acces et les formats de donnees |
| Pouvoir des clients | Moyen | Les utilisateurs ont beaucoup d'alternatives gratuites, donc l'usage doit etre tres clair |
| Menace des substituts | Elevee | Sites officiels, articles de presse, analystes et outils perso peuvent remplacer partiellement l'usage |

---

## 4. Positionnement et strategie marketing

### 4.1 Positionnement

POPolitics se positionne comme une **plateforme civic-tech de reference pour lire, comparer et suivre l'activite parlementaire**.

Le positionnement souhaite peut se formuler ainsi :

> Pour les citoyens et analystes qui veulent comprendre la politique a partir de faits, POPolitics est la plateforme qui transforme la donnee parlementaire brute en lecture claire, personnalisee et exploitable.

### 4.2 Proposition de valeur

La proposition de valeur repose sur quatre promesses :

- **voir clair** dans des donnees habituellement opaques,
- **gagner du temps** dans la recherche et l'analyse,
- **suivre ce qui compte** grace a la personnalisation,
- **faire confiance** a une approche documentee, traçable et ouverte.

### 4.3 Avantage concurrentiel

Les avantages concurrentiels les plus solides sont :

- croisement AN / Senat / UE dans une meme experience,
- niveau de lisibilite pense pour le grand public,
- profondeur de lecture suffisante pour les journalistes,
- trajectoire produit credible apres les etudes,
- dimension open source et civic-tech rassurante pour la credibilite.

### 4.4 Ciblage

Le ciblage recommande est progressif.

| Horizon | Cible prioritaire | Objectif |
| :--- | :--- | :--- |
| **Court terme** | Citoyens engages et jury Epitech | Prouver la clarte du produit et sa valeur immediate |
| **Moyen terme** | Journalistes, chercheurs, ONG | Installer la credibilite analytique du projet |
| **Long terme** | Partenaires medias, institutions, associations | Structurer un modele durable et un rayonnement large |

---

## 5. Marketing mix (4P)

### 5.1 Produit

Le produit est une plateforme web structurée autour de trois blocs :

- **portail collectif** pour explorer votes, textes et tendances,
- **page personnelle** pour suivre elus et themes,
- **couche analytique** pour fournir indicateurs, exports et, a terme, syntheses IA.

Les composantes produit les plus marketables sont :

- tableau de votes lisible,
- fiches elus,
- indicateurs de coherence,
- comparateurs,
- visualisations,
- alertes personnalisees.

### 5.2 Prix

La logique tarifaire doit soutenir la mission du projet.

| Offre | Politique tarifaire recommandee |
| :--- | :--- |
| **Grand public** | Gratuit |
| **Pro / media / ONG** | Abonnement mensuel ou annuel a tester apres preuve d'usage |
| **API / partenariats** | Tarification sur devis selon volume et besoins |

Hypotheses de prix a explorer post-lancement :

- offre Pro entre **15 et 29 EUR / mois**,
- offre equipe entre **99 et 299 EUR / mois**,
- prestations data ou partenariats sur mesure.

### 5.3 Distribution

La distribution principale est **digitale directe** :

- site web / application web,
- documentation GitHub,
- relais sociaux,
- demonstration live en soutenance et evenements,
- reseau de partenaires civic-tech et medias.

Le produit doit rester accessible sans friction : pas d'installation locale pour l'utilisateur final, pas de courbe d'apprentissage inutile, acces rapide au coeur de la valeur.

### 5.4 Communication

La communication marketing s'appuie sur :

- des contenus pedagogiques et data-driven,
- des captures d'ecran et visualisations parlantes,
- des cas d'usage concrets,
- un discours de marque centre sur la transparence, pas sur le commentaire partisan.

Le detail du plan de communication est documente dans [02-plan-de-communication.md](02-plan-de-communication.md).

---

## 6. Approche centree client (4C)

### 6.1 Client

Le client principal n'est pas defini seulement par son profil socio-demographique, mais par son besoin :

- mieux comprendre,
- mieux verifier,
- mieux suivre,
- mieux reutiliser.

### 6.2 Cout

Le cout perçu ne se limite pas au prix. Pour POPolitics, il inclut :

- le temps passe a comprendre l'interface,
- l'effort necessaire pour trouver une information,
- la confiance accordee aux donnees,
- le risque de surcharge informationnelle.

La strategie doit donc viser a reduire ce cout perçu avant meme de parler d'argent.

### 6.3 Convenience

La commodite d'usage est un facteur cle :

- experience fluide sur mobile et desktop,
- acces rapide aux recherches principales,
- filtres comprehensibles,
- notifications utiles plutot qu'invasives,
- consultation simple meme pour un non-expert.

### 6.4 Communication

La communication avec le client doit rester :

- claire,
- factuelle,
- non partisane,
- utile,
- reguliere.

Chaque prise de parole doit repondre a une question implicite de l'utilisateur :

- pourquoi cela me concerne,
- qu'est-ce que je comprends grace a vous,
- pourquoi puis-je vous faire confiance.

---

## 7. Strategie de communication

Cette section synthétise la logique marketing. Le detail operationnel est documente dans [02-plan-de-communication.md](02-plan-de-communication.md).

### 7.1 Objectifs

- faire connaitre la marque POPolitics,
- installer une image de fiabilite,
- recruter des beta-utilisateurs,
- favoriser le bouche-a-oreille et la reprise par des tiers,
- soutenir la continuite du projet apres les etudes.

### 7.2 Cibles

- citoyens engages,
- journalistes et data journalistes,
- chercheurs et experts,
- ONG et associations civic-tech,
- ecole, jury, partenaires potentiels.

### 7.3 Messages

- **Vous pouvez enfin voir ce que votent reellement vos representants.**
- **Les donnees politiques deviennent lisibles, comparables et verifiables.**
- **POPolitics fait gagner du temps sans sacrifier la rigueur.**
- **Le projet continue apres les etudes : ce n'est pas une simple demo.**

### 7.4 Canaux

- GitHub,
- LinkedIn,
- X / Mastodon,
- relations presse ciblees,
- soutenance et evenements,
- reseau communautaire civic-tech.

### 7.5 Plan media

Le plan media recommande reste majoritairement **organique** au lancement.

| Canal | Priorite | Logique |
| :--- | :---: | :--- |
| GitHub | Haute | Credibilite technique et open source |
| LinkedIn | Haute | Notoriete pro, storytelling de progression |
| X / Mastodon | Moyenne | Diffusion rapide de faits et visualisations |
| Email cible | Moyenne | Contact direct avec medias, ONG, partenaires |
| Paid media | Faible | A tester seulement si traction organique deja validee |

---

## 8. Plan d'actions marketing

### 8.1 Actions digitales

| Action | Objectif | Horizon |
| :--- | :--- | :--- |
| Optimiser le README et la landing narrative | Clarifier la promesse produit | Court terme |
| Publier des captures et cas d'usage | Rendre la valeur visible | Court terme |
| Produire des posts LinkedIn de sprint | Installer la marque et la progression | Court terme |
| Ouvrir une roadmap publique | Montrer la suite du projet | Moyen terme |
| Lancer une newsletter ou changelog public | Fideliser une audience recurrente | Moyen terme |

### 8.2 Actions evenementielles

| Action | Objectif |
| :--- | :--- |
| Soutenance avec demo live | Prouver la valeur et la maturite du produit |
| Presentation dans un meetup etudiant ou civic-tech | Gagner en visibilite et en retours externes |
| Participation a un salon open source ou data | Rencontrer partenaires et utilisateurs avancés |

### 8.3 Partenariats

Les partenariats les plus pertinents sont :

- associations civic-tech,
- medias independants,
- ecoles et laboratoires de recherche,
- ONG specialisees en democratie et transparence,
- collectifs de journalistes data.

Objectif partenariat :

- gagner en credibilite,
- acceder a de nouveaux usages,
- obtenir du feedback qualifie,
- envisager des relais de diffusion et de financement.

### 8.4 Calendrier editorial

Le calendrier editorial detaille est deja defini dans [02-plan-de-communication.md](02-plan-de-communication.md). Du point de vue marketing, il doit suivre trois temps :

| Phase | Objectif editorial |
| :--- | :--- |
| **Avant MVP** | Raconter la construction et installer le probleme traite |
| **Apres MVP** | Montrer des cas d'usage concrets et des preuves produit |
| **Post-etudes** | Faire rayonner POPolitics comme produit durable avec une suite claire |

---

## 9. Budget previsionnel

### 9.1 Repartition des couts

Le budget marketing recommande doit rester realiste et sobre au lancement.

#### Scenario 1 - lancement academique

| Poste | Estimation |
| :--- | ---: |
| Production de contenus (en interne) | 0 EUR |
| Captures / GIF / assets | 0 a 50 EUR |
| Nom de domaine / outils de base | 10 a 30 EUR / mois |
| Emailing / formulaire / analytics | 0 a 20 EUR / mois |
| Deplacements evenements | 0 a 150 EUR |
| **Total indicatif** | **10 a 250 EUR** |

#### Scenario 2 - lancement post-etudes

| Poste | Estimation |
| :--- | ---: |
| Identite visuelle et kit media | 100 a 300 EUR |
| Outils de diffusion / CRM / newsletter | 20 a 60 EUR / mois |
| Hebergement de demo publique | 40 a 100 EUR / mois |
| Production video courte | 0 a 200 EUR |
| Tests d'acquisition payants | 100 a 300 EUR |
| **Total indicatif** | **260 a 960 EUR** au lancement |

### 9.2 ROI attendu

Le ROI doit etre lu en deux temps.

#### ROI non financier au lancement

- notoriete de la marque,
- credibilite du projet,
- acquisition de beta-testeurs,
- opportunites de partenariat,
- legitimite pour la suite post-etudes.

#### ROI financier a moyen terme

Hypotheses de traction a surveiller :

- **50 utilisateurs Pro** a 19 EUR / mois = **950 EUR / mois**,
- **10 organisations** sur une offre equipe a 149 EUR / mois = **1 490 EUR / mois**,
- **1 a 2 partenariats data** annuels pouvant financer la maintenance ou la croissance.

Ces chiffres sont des hypotheses de cadrage marketing, pas des engagements commerciaux.

---

## 10. Indicateurs de performance (KPI)

### 10.1 Notoriete

- trafic sur la landing page,
- vues du README GitHub,
- impressions LinkedIn,
- mentions externes du projet,
- nombre de stars GitHub.

### 10.2 Acquisition

- nombre d'inscriptions,
- taux de conversion visiteur vers compte,
- provenance des utilisateurs,
- nombre de demandes de demo ou contacts entrants.

### 10.3 Engagement

- nombre de recherches effectuees,
- taux d'utilisation des filtres,
- frequence de consultation des pages elus,
- taux d'ouverture des notifications ou emails,
- nombre d'exports ou comparaisons lances.

### 10.4 Fidelisation

- retention a 7, 30 et 90 jours,
- nombre d'utilisateurs recurrentes,
- nombre d'elus suivis par utilisateur,
- taux de desactivation des notifications,
- feedback positif / demandes de fonctionnalites.

---

## Conclusion

POPolitics a un positionnement marketing pertinent parce qu'il repond a un manque reel : la difficulte a comprendre rapidement et sereinement l'activite parlementaire. Le projet dispose d'un angle clair, d'une proposition de valeur lisible et d'une capacite a toucher plusieurs publics sans diluer sa mission.

La strategie recommandee est la suivante :

- lancer avec une promesse simple et forte pour le grand public,
- prouver la profondeur d'analyse aupres des journalistes et experts,
- construire une marque credible par la transparence et l'open source,
- transformer le projet d'etudes en produit durable avec une feuille de route publique.

Le succes marketing de POPolitics ne dependra pas uniquement de la communication, mais de l'alignement entre trois elements : **la fiabilite des donnees, la clarte de l'experience utilisateur et la regularite du rayonnement public**.