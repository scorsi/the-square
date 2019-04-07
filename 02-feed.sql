--- USERS

INSERT INTO "user" (first_name, last_name, birth_date, zip_code, password, email)
VALUES ('Sylvain',
        'Corsini',
        '09-14-1996' :: DATE,
        59100,
        md5('secret'),
        'scorsi@pm.me'),
       ('Jasmin',
        'Saipi',
        '04-07-1997' :: DATE,
        59000,
        md5('secret2'),
        'jasmin.saipi@epitech.eu');

--- COMPANIES

INSERT INTO company (description, name, siret)
VALUES ('A strategy marketing company',
        'Adfinitas',
        '43232660100056');

--- OFFICES

INSERT INTO office (address, is_head_office, company_id)
VALUES ('87 rue du Molinel, Batiment - Adfinitas, Marcq-en-Baroeul, 59700, France',
        false,
        (SELECT company_id FROM company WHERE name = 'Adfinitas'));

--- USER OFFICES

INSERT INTO user_office (office_id, user_id, from_date, to_date)
VALUES ((SELECT office_id
         FROM office
                  INNER JOIN company ON office.company_id = company.company_id
         WHERE company.name = 'Adfinitas'
         ORDER BY office_id ASC
         LIMIT 1),
        (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me'),
        '04-01-2018' :: DATE,
        NULL);

--- HOBBIES

INSERT INTO hobby (name)
VALUES ('computing'),
       ('football'),
       ('videogame'),
       ('movie'),
       ('footing');

--- USER HOBBIES

INSERT INTO user_hobby (hobby_id, user_id)
VALUES ((SELECT hobby.hobby_id FROM hobby WHERE name = 'footing'),
        (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me')),
       ((SELECT hobby.hobby_id FROM hobby WHERE name = 'computing'),
        (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me')),
       ((SELECT hobby.hobby_id FROM hobby WHERE name = 'videogame'),
        (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me')),
       ((SELECT hobby.hobby_id FROM hobby WHERE name = 'movie'),
        (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me')),
       ((SELECT hobby.hobby_id FROM hobby WHERE name = 'football'),
        (SELECT user_id FROM "user" WHERE email = 'jasmin.saipi@epitech.eu')),
       ((SELECT hobby.hobby_id FROM hobby WHERE name = 'movie'),
        (SELECT user_id FROM "user" WHERE email = 'jasmin.saipi@epitech.eu'));

--- ACTIVITYDOMAINS

INSERT INTO activitydomain (description, name)
VALUES ('Web Development....',
        'Web Development'),
       ('Marketing blablabla',
        'Marketing');

--- COMPANY ACTIVITYDOMAINS

INSERT INTO company_activitydomain (company_id, activity_id)
VALUES ((SELECT company_id FROM company WHERE name = 'Adfinitas'),
        (SELECT activitydomain.activity_id FROM activitydomain WHERE name = 'Web Development')),
       ((SELECT company_id FROM company WHERE name = 'Adfinitas'),
        (SELECT activitydomain.activity_id FROM activitydomain WHERE name = 'Marketing'));

--- SKILLS

INSERT INTO skill (name)
VALUES ('Java'),
       ('Spring'),
       ('Angular'),
       ('Python'),
       ('Javascript'),
       ('React');

INSERT INTO user_skill (skill_id, user_id)
VALUES ((SELECT skill_id FROM skill WHERE name = 'Java'), (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me')),
       ((SELECT skill_id FROM skill WHERE name = 'Angular'),
        (SELECT user_id FROM "user" WHERE email = 'jasmin.saipi@epitech.eu')),
       ((SELECT skill_id FROM skill WHERE name = 'Python'),
        (SELECT user_id FROM "user" WHERE email = 'jasmin.saipi@epitech.eu')),
       ((SELECT skill_id FROM skill WHERE name = 'Spring'), (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me'));

--- JOBPROPOSITION

INSERT INTO jobproposition (name, description, gross_salary, company_id)
VALUES ('Web developer', 'We are looking for a web developer to work on a secret project', 5000,
        (SELECT company_id FROM company WHERE company.name = 'Adfinitas'));

--- JOBPROPOSITION ACRTIVITYDOMAIN

INSERT INTO jobproposition_activitydomain (jobproposition_id, activity_id)
VALUES ((SELECT jobproposition_id
         FROM jobproposition
         WHERE name = 'Web developer'
           AND company_id = (SELECT company_id FROM company WHERE company.name = 'Adfinitas')),
        (SELECT activity_id FROM activitydomain WHERE name = 'Web Development'));

--- JOBPROPOSITION SKILL

INSERT INTO jobproposition_skill (jobproposition_id, skill_id)
VALUES ((SELECT jobproposition_id
         FROM jobproposition
         WHERE name = 'Web developer'
           AND company_id = (SELECT company_id FROM company WHERE company.name = 'Adfinitas')),
        (SELECT skill_id FROM skill WHERE name = 'Javascript')),
       ((SELECT jobproposition_id
         FROM jobproposition
         WHERE name = 'Web developer'
           AND company_id = (SELECT company_id FROM company WHERE company.name = 'Adfinitas')),
        (SELECT skill_id FROM skill WHERE name = 'React'));

--- FORMATION

INSERT INTO formation (school_name, title, start_year, end_year, description, user_id)
VALUES ('Epitech', 'Expert en Informatique et Nouvelles Technologies', 2015, 2020, '...',
        (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me'));

--- FORMATION ACTIVITYDOMAIN

INSERT INTO formation_activitydomain (formation_id, activity_id)
VALUES ((SELECT formation_id
         FROM formation
         WHERE title = 'Expert en Informatique et Nouvelles Technologies'
           AND user_id = (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me')),
        (SELECT activity_id FROM activitydomain WHERE name = 'Web Development'));

--- USER ACTIVITYDOMAIN

INSERT INTO user_activitydomain (activity_id, user_id)
VALUES ((SELECT activitydomain.activity_id FROM activitydomain WHERE name = 'Web Development'),
        (SELECT user_id FROM "user" WHERE email = 'scorsi@pm.me'));
