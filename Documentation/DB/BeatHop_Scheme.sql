-- CREATE SCHEMA
DROP SCHEMA IF EXISTS beathop;
CREATE SCHEMA beathop DEFAULT CHARACTER SET utf8;
USE beathop;

-- CREATE TABLES
CREATE TABLE User (
     idUser INT UNSIGNED NOT NULL AUTO_INCREMENT,
     name VARCHAR(30) NOT NULL,
     lastName VARCHAR(30) NOT NULL,
     email VARCHAR(40) NOT NULL UNIQUE,
     password VARCHAR(30) NOT NULL,
     userType VARCHAR(10) NOT NULL,
     age INT NOT NULL,
     gender CHAR(1) NOT NULL,
     idForm INT UNSIGNED NOT NULL,
     PRIMARY KEY (idUser),
     FOREIGN KEY (idForm) REFERENCES Form(idForm)
);

CREATE TABLE Form (
     idForm INT UNSIGNED NOT NULL AUTO_INCREMENT,
     answer1 VARCHAR(30) NOT NULL,
     answer2 VARCHAR(30) NOT NULL,
     answer3 VARCHAR(30) NOT NULL,
     PRIMARY KEY (idForm)
);

CREATE TABLE Level (
     idLevel INT UNSIGNED NOT NULL AUTO_INCREMENT,
     levelName VARCHAR(30) NOT NULL,
     avgScore FLOAT NOT NULL,
     totalDeaths INT NOT NULL,
     totalTries INT NOT NULL,
     PRIMARY KEY (idLevel)
);

CREATE TABLE GameRun (
     idGameRun INT UNSIGNED NOT NULL AUTO_INCREMENT,
     idUser INT UNSIGNED NOT NULL,
     idLevel INT UNSIGNED NOT NULL,
     score FLOAT NOT NULL,
     deaths INT NOT NULL,
     tries INT NOT NULL,
     PRIMARY KEY (idGameRun),
     FOREIGN KEY (idUser) REFERENCES User(idUser),
     FOREIGN KEY (idLevel) REFERENCES Level(idLevel)
);