-- INSERT USER
INSERT INTO User (name, lastName, email, password, userType, age, gender) VALUES
("Marius", "Linares", "mlinares@gmail.com", "123123", "player", 27, "M"),
("Gloria", "Saenz", "gsaenz@gmail.com", "123123", "player", 56, "F"),
("Florentino ", "Comas", "fcomas@gmail.com", "123123", "admin", 24, "F");

-- INSERT FORM
INSERT INTO Form (idUser, answer1, answer2, answer3) VALUES
(1, "A lot", "Guitar", "Little"),
(2, "Little", "Piano", "Little"),
(3, "Some", "Drums", "A lot");

-- INSERT LEVEL
INSERT INTO Level (levelName, avgScore, totalDeaths, totalTries) VALUES
("City", 85.7, 141, 345),
("Mars", 70.2, 236, 346),
("Night", 69.6, 192, 283);

-- INSERT GAMERUN
INSERT INTO GameRun (idUser, idLevel, score, deaths, tries) VALUES
(1, 1, 80, 2, 4),
(1, 2, 90, 6, 3),
(2, 1, 50, 4, 7);