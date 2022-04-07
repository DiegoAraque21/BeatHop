-- INSERT USER
INSERT INTO User (name, lastName, email, password, userType, age, gender) VALUES
("Marius", "Linares", "mlinares@gmail.com", "123123", "player", 27, "M"),
("Gloria", "Saenz", "gsaenz@gmail.com", "123123", "player", 56, "F"),
("Florentino ", "Comas", "fcomas@gmail.com", "123123", "admin", 24, "F");

-- INSERT FORM
INSERT INTO Form (idUser, answer1, answer2, answer3) VALUES
(1, "A lot", "Guitar", "Little"),
(2, "Little", "Piano", "Little"),
(3, "Some", "Drums", "A lot"),
(4, "Little", "Drums", "Nothing"),
(5, "A lot", "Drums", "A lot"),
(6, "A lot", "Drums", "A lot"),
(7, "Little", "Piano", "Little"),
(8, "A lot", "Drums", "Nothing"),
(9, "Little", "None", "Nothing"),
(10, "Little", "Guitar", "Little"),
(11, "A lot", "Guitar", "Little"),
(12, "Some", "None", "Little"),
(13, "Some", "Guitar", "Nothing"),
(14, "Nothing", "Drums", "A lot"),
(15, "Nothing", "None", "Some"),
(16, "Nothing", "Drums", "Nothing"),
(17, "Some", "Piano", "A lot"),
(18, "A lot", "Piano", "A lot"),
(19, "A lot", "Guitar", "Some"),
(20, "A lot", "Drums", "Little");

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