------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------


------------------------------------------------------------
-- Table: User
------------------------------------------------------------
CREATE TABLE public.User
(
    user_id    SERIAL       NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    birth_date DATE         NOT NULL,
    zip_code   INT          NOT NULL,
    password   VARCHAR(128) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    CONSTRAINT User_PK PRIMARY KEY (user_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: Company
------------------------------------------------------------
CREATE TABLE public.Company
(
    company_id  SERIAL        NOT NULL,
    description VARCHAR(2000) NOT NULL,
    name        VARCHAR(100)  NOT NULL,
    siret       VARCHAR(14)   NOT NULL,
    CONSTRAINT Company_PK PRIMARY KEY (company_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: Hobby
------------------------------------------------------------
CREATE TABLE public.Hobby
(
    hobby_id SERIAL       NOT NULL,
    name     VARCHAR(128) NOT NULL,
    CONSTRAINT Hobby_PK PRIMARY KEY (hobby_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: Formation
------------------------------------------------------------
CREATE TABLE public.Formation
(
    formation_id SERIAL        NOT NULL,
    school_name  VARCHAR(100)  NOT NULL,
    title        VARCHAR(100)  NOT NULL,
    start_year   INT2          NOT NULL,
    end_year     INT2          NOT NULL,
    description  VARCHAR(2000) NOT NULL,
    user_id      INT           NOT NULL,
    CONSTRAINT Formation_PK PRIMARY KEY (formation_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: Skill
------------------------------------------------------------
CREATE TABLE public.Skill
(
    skill_id SERIAL       NOT NULL,
    name     VARCHAR(120) NOT NULL,
    CONSTRAINT Skill_PK PRIMARY KEY (skill_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: JobProposition
------------------------------------------------------------
CREATE TABLE public.JobProposition
(
    job_id       SERIAL        NOT NULL,
    name         VARCHAR(255)  NOT NULL,
    description  VARCHAR(2000) NOT NULL,
    gross_salary FLOAT,
    company_id   INT           NOT NULL,
    CONSTRAINT JobProposition_PK PRIMARY KEY (job_id),
    CONSTRAINT JobProposition_Company_FK FOREIGN KEY (company_id) REFERENCES public.Company (company_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: ActivityDomain
------------------------------------------------------------
CREATE TABLE public.ActivityDomain
(
    activity_id SERIAL        NOT NULL,
    description VARCHAR(2000) NOT NULL,
    name        VARCHAR(100)  NOT NULL,
    CONSTRAINT ActivityDomain_PK PRIMARY KEY (activity_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: Office
------------------------------------------------------------
CREATE TABLE public.Office
(
    office_id      SERIAL        NOT NULL,
    address        VARCHAR(2000) NOT NULL,
    is_head_office BOOL          NOT NULL,
    company_id     INT           NOT NULL,
    CONSTRAINT Office_PK PRIMARY KEY (office_id),
    CONSTRAINT Office_Company_FK FOREIGN KEY (company_id) REFERENCES public.Company (company_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: User_Hobby
------------------------------------------------------------
CREATE TABLE public.User_Hobby
(
    hobby_id INT NOT NULL,
    user_id  INT NOT NULL,
    CONSTRAINT User_Hobby_PK PRIMARY KEY (hobby_id, user_id),
    CONSTRAINT User_Hobby_Hobby_FK FOREIGN KEY (hobby_id) REFERENCES public.Hobby (hobby_id),
    CONSTRAINT User_Hobby_User0_FK FOREIGN KEY (user_id) REFERENCES public.User (user_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: User_ActivityDomain
------------------------------------------------------------
CREATE TABLE public.User_ActivityDomain
(
    activity_id INT NOT NULL,
    user_id     INT NOT NULL,
    CONSTRAINT User_ActivityDomain_PK PRIMARY KEY (activity_id, user_id),
    CONSTRAINT User_ActivityDomain_ActivityDomain_FK FOREIGN KEY (activity_id) REFERENCES public.ActivityDomain (activity_id),
    CONSTRAINT User_ActivityDomain_User0_FK FOREIGN KEY (user_id) REFERENCES public.User (user_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: JobProposition_ActivityDomain
------------------------------------------------------------
CREATE TABLE public.JobProposition_ActivityDomain
(
    job_id      INT NOT NULL,
    activity_id INT NOT NULL,
    CONSTRAINT JobProposition_ActivityDomain_PK PRIMARY KEY (job_id, activity_id),
    CONSTRAINT JobProposition_ActivityDomain_JobProposition_FK FOREIGN KEY (job_id) REFERENCES public.JobProposition (job_id),
    CONSTRAINT JobProposition_ActivityDomain_ActivityDomain0_FK FOREIGN KEY (activity_id) REFERENCES public.ActivityDomain (activity_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: Company_ActivityDomain
------------------------------------------------------------
CREATE TABLE public.Company_ActivityDomain
(
    company_id  INT NOT NULL,
    activity_id INT NOT NULL,
    CONSTRAINT Company_ActivityDomain_PK PRIMARY KEY (company_id, activity_id),
    CONSTRAINT Company_ActivityDomain_Company_FK FOREIGN KEY (company_id) REFERENCES public.Company (company_id),
    CONSTRAINT Company_ActivityDomain_ActivityDomain0_FK FOREIGN KEY (activity_id) REFERENCES public.ActivityDomain (activity_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: Formation_ActivityDomain
------------------------------------------------------------
CREATE TABLE public.Formation_ActivityDomain
(
    formation_id INT NOT NULL,
    activity_id  INT NOT NULL,
    CONSTRAINT Formation_ActivityDomain_PK PRIMARY KEY (formation_id, activity_id),
    CONSTRAINT Formation_ActivityDomain_Formation_FK FOREIGN KEY (formation_id) REFERENCES public.Formation (formation_id),
    CONSTRAINT Formation_ActivityDomain_ActivityDomain0_FK FOREIGN KEY (activity_id) REFERENCES public.ActivityDomain (activity_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: User_Formation
------------------------------------------------------------
CREATE TABLE public.User_Formation
(
    user_id      INT NOT NULL,
    formation_id INT NOT NULL,
    CONSTRAINT User_Formation_PK PRIMARY KEY (user_id, formation_id),
    CONSTRAINT User_Formation_User_FK FOREIGN KEY (user_id) REFERENCES public.User (user_id),
    CONSTRAINT User_Formation_Formation0_FK FOREIGN KEY (formation_id) REFERENCES public.Formation (formation_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: User_Skill
------------------------------------------------------------
CREATE TABLE public.User_Skill
(
    skill_id INT NOT NULL,
    user_id  INT NOT NULL,
    CONSTRAINT User_Skill_PK PRIMARY KEY (skill_id, user_id),
    CONSTRAINT User_Skill_Skill_FK FOREIGN KEY (skill_id) REFERENCES public.Skill (skill_id),
    CONSTRAINT User_Skill_User0_FK FOREIGN KEY (user_id) REFERENCES public.User (user_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: JobProposition_Skill
------------------------------------------------------------
CREATE TABLE public.JobProposition_Skill
(
    job_id   INT NOT NULL,
    skill_id INT NOT NULL,
    CONSTRAINT JobProposition_Skill_PK PRIMARY KEY (job_id, skill_id),
    CONSTRAINT JobProposition_Skill_JobProposition_FK FOREIGN KEY (job_id) REFERENCES public.JobProposition (job_id),
    CONSTRAINT JobProposition_Skill_Skill0_FK FOREIGN KEY (skill_id) REFERENCES public.Skill (skill_id)
) WITHOUT OIDS;


------------------------------------------------------------
-- Table: User_Office
------------------------------------------------------------
CREATE TABLE public.User_Office
(
    office_id INT  NOT NULL,
    user_id   INT  NOT NULL,
    from_date DATE NOT NULL,
    to_date   DATE,
    CONSTRAINT User_Office_PK PRIMARY KEY (office_id, user_id),
    CONSTRAINT User_Office_Office_FK FOREIGN KEY (office_id) REFERENCES public.Office (office_id),
    CONSTRAINT User_Office_User0_FK FOREIGN KEY (user_id) REFERENCES public.User (user_id)
) WITHOUT OIDS;


CREATE INDEX User_Idx ON public.User (email);
CREATE INDEX Company_Idx ON public.Company (name, siret);
CREATE INDEX ActivityDomain_Idx ON public.ActivityDomain (name);

