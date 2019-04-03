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
        ((SELECT activitydomain.activity_id FROM activitydomain WHERE name = 'Web Development'))),
       ((SELECT company_id FROM company WHERE name = 'Adfinitas'),
        ((SELECT activitydomain.activity_id FROM activitydomain WHERE name = 'Marketing')));