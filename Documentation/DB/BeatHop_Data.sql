-- USE BEATHOP SCHEME
USE beathop;

-- INSERT USER
INSERT INTO User (name, lastName, email, password, userType, age, gender, idForm) VALUES
("Marius", "Linares", "mlinares@gmail.com", "123123", "player", 27, "M", 1),
("Gloria", "Saenz", "gsaenz@gmail.com", "123123", "player", 56, "F", 2),
("Florentino", "Comas", "fcomas@gmail.com", "123123", "admin", 24, "F", 3),
("Pedro", "Perez", "pedroperez@gmail.com", "454212", "player", 18, "M", 4),
("Maria", "Lopez", "mlopez@gmail.com", "533222", "admin", 30, "F", 5),
("Bonnie", "Flippen", "bonfl@egl-inc.info", "344232", "player", 21, "F", 6),
("Adir", "Moffatt", "ad.moffatt@diaperstack.com", "4532423", "player", 17, "M", 7),
("Roderigo", "Greig", "ro.greig@diaperstack.com", "8675656", "player", 28, "M", 8),
("Becse", "Hosey", "becs.ho@acusage.net", "08678", "admin", 16, "M", 9),
("Miklos", "Hopson", "miklos_hops@acusage.net", "3983983", "player", 20, "M", 10),
("Sam", "Willcox", "sa.wi@careful-organics.org", "83838", "player", 19, "M", 11),
("Christian", "Xia", "ch.xi@egl-inc.info", "1342", "player", 22, "M", 12),
("Vitus", "Greig", "vitu.gre@consolidated-farm-research.net", "342", "player", 19, "M", 13),
("Sharmistha", "Helmuth", "shar-helmut@egl-inc.info", "783893", "player", 20, "F", 14),
("Ebba", "Bedwell", "eb_bedwel@diaperstack.com", "43256", "player", 24, "F", 15),
("Szilord", "Hopson", "szi.hopso@arketmay.com", "234234", "admin", 25, "M", 16),
("Ziggy", "Newberg", "zigg-new@acusage.net", "43253", "player", 16, "M", 17),
("Angie", "Kutz", "ang.kut@arvinmeritor.info", "65353", "player", 27, "F", 18),
("Elmas", "Mikell", "elmmi@egl-inc.info", "4324234", "player", 34, "F", 19),
("Diego", "Altamirano", "diegoalt@gmail.com", "4324234", "admin", 34, "F", 20);

-- INSERT FORM
INSERT INTO Form (idUser, answer1, answer2, answer3) VALUES
("A lot", "Guitar", "Little"),
("Little", "Piano", "Little"),
("Some", "Drums", "A lot"),
("Little", "Drums", "Nothing"),
("A lot", "Drums", "A lot"),
("A lot", "Drums", "A lot"),
("Little", "Piano", "Little"),
("A lot", "Drums", "Nothing"),
("Little", "None", "Nothing"),
("Little", "Guitar", "Little"),
("A lot", "Guitar", "Little"),
("Some", "None", "Little"),
("Some", "Guitar", "Nothing"),
("Nothing", "Drums", "A lot"),
("Nothing", "None", "Some"),
("Nothing", "Drums", "Nothing"),
("Some", "Piano", "A lot"),
("A lot", "Piano", "A lot"),
("A lot", "Guitar", "Some"),
("A lot", "Drums", "Little");

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