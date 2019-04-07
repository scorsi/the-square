---
id: formation
title: Formation Table
---

## Description de la table SQL

| Nom du champ | Type du champ | Description du champ                                   |
| ------------ | ------------- | ------------------------------------------------------ |
| formation_id | integer       | L'identifiant unique                                   |
| school_name  | varchar(100)  | Le nom de l'école où la formation à eu lieu            |
| title        | varchar(100)  | Le nom du titre obtenu                                 |
| start_year   | integer       | L'année de début de la formation                       |
| end_year     | integer       | L'année d'optention du diplome                         |
| description  | varchar(2000) | Une longue description sur la formation et ses acquis  |
| user_id      | integer       | L'identifiant de l'utilisateur qui a acquis ce diplome |
