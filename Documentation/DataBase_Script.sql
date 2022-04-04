CREATE TABLE `User`(
    `idUser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `lastName` VARCHAR(255) NOT NULL,
    `age` INT NOT NULL,
    `sex` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_iduser_primary`(`idUser`);
CREATE TABLE `Formulario`(
    `idFormulario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `idUsuario` INT NOT NULL,
    `answer1` VARCHAR(255) NOT NULL,
    `answer2` VARCHAR(255) NOT NULL,
    `answer3` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Formulario` ADD PRIMARY KEY `formulario_idformulario_primary`(`idFormulario`);
ALTER TABLE
    `Formulario` ADD UNIQUE `formulario_idusuario_unique`(`idUsuario`);
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
ALTER TABLE
    `Performance` ADD UNIQUE `performance_iduser_unique`(`idUser`);
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
    `Formulario` ADD CONSTRAINT `formulario_idusuario_foreign` FOREIGN KEY(`idUsuario`) REFERENCES `User`(`idUser`);
ALTER TABLE
    `Performance` ADD CONSTRAINT `performance_idlevel_foreign` FOREIGN KEY(`idLevel`) REFERENCES `Level`(`idLevel`);