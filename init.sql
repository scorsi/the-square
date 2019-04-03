#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        user_id    Int  Auto_increment  NOT NULL ,
        first_name Varchar (100) NOT NULL ,
        last_name  Varchar (100) NOT NULL ,
        birth_date Date NOT NULL ,
        zip_code   Int NOT NULL ,
        password   Varchar (128) NOT NULL ,
        email      Varchar (255) NOT NULL
	,CONSTRAINT User_Idx INDEX (email)
	,CONSTRAINT User_PK PRIMARY KEY (user_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Company
#------------------------------------------------------------

CREATE TABLE Company(
        id          Int  Auto_increment  NOT NULL ,
        name        Varchar (100) NOT NULL ,
        description Text NOT NULL ,
        zip_code    Int NOT NULL ,
        siret       Varchar (14) NOT NULL
	,CONSTRAINT Company_Idx INDEX (siret)
	,CONSTRAINT Company_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Hobby
#------------------------------------------------------------

CREATE TABLE Hobby(
        hobby_id Int  Auto_increment  NOT NULL ,
        name     Varchar (128) NOT NULL
	,CONSTRAINT Hobby_PK PRIMARY KEY (hobby_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Formation
#------------------------------------------------------------

CREATE TABLE Formation(
        formation_id Int  Auto_increment  NOT NULL ,
        school_name  Varchar (100) NOT NULL ,
        title        Varchar (100) NOT NULL ,
        start_year   Smallint NOT NULL ,
        end_year     Smallint NOT NULL ,
        description  Text NOT NULL ,
        user_id      Int NOT NULL
	,CONSTRAINT Formation_PK PRIMARY KEY (formation_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Skill
#------------------------------------------------------------

CREATE TABLE Skill(
        skill_id Int  Auto_increment  NOT NULL ,
        name     Varchar (120) NOT NULL
	,CONSTRAINT Skill_PK PRIMARY KEY (skill_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: JobProposition
#------------------------------------------------------------

CREATE TABLE JobProposition(
        job_id       Int  Auto_increment  NOT NULL ,
        name         Varchar (255) NOT NULL ,
        gross_salary Float ,
        id           Int NOT NULL
	,CONSTRAINT JobProposition_PK PRIMARY KEY (job_id)

	,CONSTRAINT JobProposition_Company_FK FOREIGN KEY (id) REFERENCES Company(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ActivityDomain
#------------------------------------------------------------

CREATE TABLE ActivityDomain(
        activity_id Int  Auto_increment  NOT NULL ,
        name        Varchar (100) NOT NULL ,
        description Text NOT NULL
	,CONSTRAINT ActivityDomain_PK PRIMARY KEY (activity_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_Hobby
#------------------------------------------------------------

CREATE TABLE User_Hobby(
        hobby_id Int NOT NULL ,
        user_id  Int NOT NULL
	,CONSTRAINT User_Hobby_PK PRIMARY KEY (hobby_id,user_id)

	,CONSTRAINT User_Hobby_Hobby_FK FOREIGN KEY (hobby_id) REFERENCES Hobby(hobby_id)
	,CONSTRAINT User_Hobby_User0_FK FOREIGN KEY (user_id) REFERENCES User(user_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_ActivityDomain
#------------------------------------------------------------

CREATE TABLE User_ActivityDomain(
        activity_id Int NOT NULL ,
        user_id     Int NOT NULL
	,CONSTRAINT User_ActivityDomain_PK PRIMARY KEY (activity_id,user_id)

	,CONSTRAINT User_ActivityDomain_ActivityDomain_FK FOREIGN KEY (activity_id) REFERENCES ActivityDomain(activity_id)
	,CONSTRAINT User_ActivityDomain_User0_FK FOREIGN KEY (user_id) REFERENCES User(user_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: JobProposition_ActivityDomain
#------------------------------------------------------------

CREATE TABLE JobProposition_ActivityDomain(
        job_id      Int NOT NULL ,
        activity_id Int NOT NULL
	,CONSTRAINT JobProposition_ActivityDomain_PK PRIMARY KEY (job_id,activity_id)

	,CONSTRAINT JobProposition_ActivityDomain_JobProposition_FK FOREIGN KEY (job_id) REFERENCES JobProposition(job_id)
	,CONSTRAINT JobProposition_ActivityDomain_ActivityDomain0_FK FOREIGN KEY (activity_id) REFERENCES ActivityDomain(activity_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Company_ActivityDomain
#------------------------------------------------------------

CREATE TABLE Company_ActivityDomain(
        id          Int NOT NULL ,
        activity_id Int NOT NULL
	,CONSTRAINT Company_ActivityDomain_PK PRIMARY KEY (id,activity_id)

	,CONSTRAINT Company_ActivityDomain_Company_FK FOREIGN KEY (id) REFERENCES Company(id)
	,CONSTRAINT Company_ActivityDomain_ActivityDomain0_FK FOREIGN KEY (activity_id) REFERENCES ActivityDomain(activity_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Formation_ActivityDomain
#------------------------------------------------------------

CREATE TABLE Formation_ActivityDomain(
        formation_id Int NOT NULL ,
        activity_id  Int NOT NULL
	,CONSTRAINT Formation_ActivityDomain_PK PRIMARY KEY (formation_id,activity_id)

	,CONSTRAINT Formation_ActivityDomain_Formation_FK FOREIGN KEY (formation_id) REFERENCES Formation(formation_id)
	,CONSTRAINT Formation_ActivityDomain_ActivityDomain0_FK FOREIGN KEY (activity_id) REFERENCES ActivityDomain(activity_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_Formation
#------------------------------------------------------------

CREATE TABLE User_Formation(
        user_id      Int NOT NULL ,
        formation_id Int NOT NULL
	,CONSTRAINT User_Formation_PK PRIMARY KEY (user_id,formation_id)

	,CONSTRAINT User_Formation_User_FK FOREIGN KEY (user_id) REFERENCES User(user_id)
	,CONSTRAINT User_Formation_Formation0_FK FOREIGN KEY (formation_id) REFERENCES Formation(formation_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_Skill
#------------------------------------------------------------

CREATE TABLE User_Skill(
        skill_id Int NOT NULL ,
        user_id  Int NOT NULL
	,CONSTRAINT User_Skill_PK PRIMARY KEY (skill_id,user_id)

	,CONSTRAINT User_Skill_Skill_FK FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
	,CONSTRAINT User_Skill_User0_FK FOREIGN KEY (user_id) REFERENCES User(user_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: JobPosition_Skill
#------------------------------------------------------------

CREATE TABLE JobPosition_Skill(
        job_id   Int NOT NULL ,
        skill_id Int NOT NULL
	,CONSTRAINT JobPosition_Skill_PK PRIMARY KEY (job_id,skill_id)

	,CONSTRAINT JobPosition_Skill_JobProposition_FK FOREIGN KEY (job_id) REFERENCES JobProposition(job_id)
	,CONSTRAINT JobPosition_Skill_Skill0_FK FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
)ENGINE=InnoDB;

