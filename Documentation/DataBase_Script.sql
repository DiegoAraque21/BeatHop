CREATE SCHEMA `beatHop` DEFAULT CHARACTER SET utf8 ;
USE beatHop;

CREATE TABLE `User`(
    `idUser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(25) NOT NULL,
    `lastName` VARCHAR(30) NOT NULL,
    `age` INT NOT NULL,
    `sex` VARCHAR(10) NOT NULL,
    `type` VARCHAR(10) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    `idForm` INT NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_iduser_primary`(`idUser`);

CREATE TABLE `Form`(
    `idForm` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `answer1` VARCHAR(30) NOT NULL,
    `answer2` VARCHAR(30) NOT NULL,
    `answer3` VARCHAR(30) NOT NULL
);
ALTER TABLE
    `Form` ADD PRIMARY KEY `form_idform_primary`(`idForm`);
CREATE TABLE `Performance`(
    `idPerformance` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `idUser` INT NOT NULL,
    `score` INT NOT NULL,
    `numDeaths` INT NOT NULL,
    `numTries` INT NOT NULL,
    `idLevel` INT NOT NULL
);
ALTER TABLE
    `Performance` ADD PRIMARY KEY `performance_idperformance_primary`(`idPerformance`);

CREATE TABLE `Level`(
    `idLevel` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `avgScore` INT NOT NULL,
    `totalDeaths` INT NOT NULL,
    `totalTries` INT NOT NULL
);
ALTER TABLE
    `Level` ADD PRIMARY KEY `level_idlevel_primary`(`idLevel`);
ALTER TABLE
    `Performance` ADD CONSTRAINT `performance_iduser_foreign` FOREIGN KEY(`idUser`) REFERENCES `User`(`idUser`);
ALTER TABLE
    `User` ADD CONSTRAINT `user_idform_foreign` FOREIGN KEY(`idForm`) REFERENCES `Form`(`idForm`);
ALTER TABLE
    `Performance` ADD CONSTRAINT `performance_idlevel_foreign` FOREIGN KEY(`idLevel`) REFERENCES `Level`(`idLevel`);