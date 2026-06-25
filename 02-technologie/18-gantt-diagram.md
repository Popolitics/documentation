# POPolitics - Diagramme de Gantt

Ce fichier centralise le planning projet sous forme de diagrammes de Gantt :

- une vue macro (sprints + jalons),
- une vue detaillee avec toutes les US planifiees par lot.

## 1) Vue macro

```mermaid
gantt
    title POPolitics - Planning global (2026-2027)
    dateFormat  YYYY-MM-DD
    axisFormat  %d/%m/%Y

    section Execution
    Sprint 1 - Fondations                :s1, 2026-09-21, 2026-11-20
    Sprint 2 - MVP Portail collectif     :s2, 2026-11-23, 2027-01-22
    Sprint 3 - Enrichissements           :s3, 2027-01-25, 2027-03-26
    Sprint 4 - IA et finitions           :s4, 2027-03-29, 2027-05-28
    Sprint 5 - Stabilisation soutenance  :s5, 2027-05-31, 2027-06-25

    section Jalons
    Lancement planning                   :milestone, m1, 2026-09-21, 0d
    Fin Sprint 1                         :milestone, m2, 2026-11-20, 0d
    Fin Sprint 2                         :milestone, m3, 2027-01-22, 0d
    Fin Sprint 3                         :milestone, m4, 2027-03-26, 0d
    Fin Sprint 4                         :milestone, m5, 2027-05-28, 0d
    Fin de projet                        :milestone, m6, 2027-06-25, 0d
```

## 2) Vue detaillee (toutes les US)

```mermaid
gantt
    title POPolitics - Gantt detaille (US par lot)
    dateFormat  YYYY-MM-DD
    axisFormat  %d/%m/%Y

    section Cadre sprint
    Sprint 1                              :sp1, 2026-09-21, 2026-11-20
    Sprint 2                              :sp2, 2026-11-23, 2027-01-22
    Sprint 3                              :sp3, 2027-01-25, 2027-03-26
    Sprint 4                              :sp4, 2027-03-29, 2027-05-28
    Sprint 5                              :sp5, 2027-05-31, 2027-06-25

    section Auth (auth-service)
    US-101 Creer un compte                :crit, us101, 2026-09-21, 2026-11-20
    US-102 Se connecter                   :crit, us102, 2026-09-21, 2026-11-20
    US-103 Se deconnecter                 :crit, us103, 2026-09-21, 2026-11-20
    US-104 Reinitialiser mot de passe     :us104, 2027-03-29, 2027-05-28

    section Data ETL (data)
    US-601 Ingestion AN                   :crit, us601, 2026-09-21, 2026-11-20
    US-602 Ingestion Senat                :crit, us602, 2026-09-21, 2026-11-20
    US-603 Ingestion UE                   :crit, us603, 2026-09-21, 2026-11-20
    US-604 Normalisation Silver           :crit, us604, 2026-09-21, 2026-11-20
    US-605 Agregation Gold                :us605, 2026-11-23, 2027-01-22

    section API (api)
    US-201 Tableau des votes              :crit, us201, 2026-11-23, 2027-01-22
    US-204 Indicateurs d un vote          :us204, 2026-11-23, 2027-01-22
    US-301 Coherence d un elu             :us301, 2027-01-25, 2027-03-26
    US-302 Comparer elus/groupes          :us302, 2027-01-25, 2027-03-26
    US-304 Croisement AN/Senat/UE         :us304, 2027-01-25, 2027-03-26
    US-303 Cartographie alliances         :us303, 2027-03-29, 2027-05-28

    section Frontend (frontend)
    US-202 Filtres de base                :crit, us202, 2026-11-23, 2027-01-22
    US-203 Filtres avances                :us203, 2026-11-23, 2027-01-22
    US-501 Suivre des elus                :us501, 2027-01-25, 2027-03-26
    US-502 Timeline elu suivi             :us502, 2027-01-25, 2027-03-26
    US-503 Themes d interet               :us503, 2027-01-25, 2027-03-26
    US-504 Notifications personnalisees   :us504, 2027-01-25, 2027-03-26
    US-205 Export CSV/PDF                 :us205, 2027-03-29, 2027-05-28

    section IA (ia-service)
    US-401 Resume IA debat                :us401, 2027-03-29, 2027-05-28
    US-402 Fiche eclair texte             :us402, 2027-03-29, 2027-05-28

    section Stabilisation (Sprint 5)
    Tests E2E et corrections              :active, st1, 2027-05-31, 2027-06-25
    Preparation soutenance                :st2, 2027-05-31, 2027-06-25
```
