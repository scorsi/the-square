---
id: user
title: User Table
---

## Description de la table SQL

| Nom du champ | Type du champ | Description du champ    |
|:------------ |:------------- | ----------------------- |
| user_id      | integer       | L'identifiant unique    |
| first_name   | varchar(100)  | Le prénom               |
| last_name    | varchar(100)  | Le nom de famille       |
| birth_date   | date          | La date de naissance    |
| zip_code     | integer       | Le code postal          |
| password     | varchar(128)  | Le mot de passe chiffré |
| email        | varchar(255)  | L'email unique          |

## Les tables liées

### Activity Domain ([lien](activity_domain.md))

```sql
SELECT *
FROM activitydomain ad
         INNER JOIN user_activitydomain uad ON ad.activity_id = uad.activity_id
WHERE uad.user_id = 'X'; --- Where X is the user_id
```

### Formation ([lien](formation.md))

```sql
SELECT *
FROM formation f
WHERE f.user_id = 'X'; --- Where X is the user_id
```

### Hobby ([lien](hooby.md))

```sql
SELECT *
FROM hobby h
         INNER JOIN user_hobby uh on h.hobby_id = uh.hobby_id
WHERE uh.user_id = 'X'; --- Where X is the user_id
```

### Office ([lien](office.md))

```sql
SELECT *
FROM office o
         INNER JOIN user_office uo ON o.office_id = uo.office_id
WHERE uo.user_id = 'X'; --- Where X is the user_id
```

### Company ([lien](company.md))

```sql
SELECT *
FROM company c
         INNER JOIN office o ON c.company_id = o.company_id
         INNER JOIN user_office uo ON o.office_id = uo.office_id
WHERE uo.user_id = 'X'; --- Where X is the user_id
```

### Skill ([lien](skill.md))

```sql
SELECT *
FROM skill s
         INNER JOIN user_skill us on s.skill_id = us.skill_id
WHERE us.user_id = 'X'; --- Where X is the user_id
```

## Les requêtes utiles

#### La Company actuelle ou rien

```sql
SELECT *
FROM company c
         INNER JOIN office o ON c.company_id = o.company_id
         INNER JOIN user_office uo ON o.office_id = uo.office_id
WHERE uo.user_id = 'X' --- Where X is the user_id
  AND uo.to_date IS NULL
ORDER BY uo.from_date
LIMIT 1;
```


