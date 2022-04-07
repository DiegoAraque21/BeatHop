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
(1, 2, 90, 7, 3),
(2, 1, 60, 6, 1),
(3, 3, 40, 1, 2),
(4, 2, 70, 1, 7),
(2, 1, 80, 2, 4),
(2, 2, 20, 3, 7),
(4, 2, 30, 7, 8),
(4, 3, 80, 4, 4),
(2, 3, 90, 5, 5),
(6, 1, 40, 2, 8),
(7, 3, 50, 6, 8),
(8, 2, 60, 4, 4),
(9, 2, 70, 8, 9),
(10, 1, 90, 1, 3),
(11, 3, 60, 2, 7),
(11, 3, 30, 7, 4),
(12, 2, 20, 4, 8),
(15, 2, 40, 8, 8),
(18, 1, 50, 4, 8);