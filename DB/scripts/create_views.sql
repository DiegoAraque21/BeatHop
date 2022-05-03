-- VIEW TO SEE THE ANSWERS OF THE PLAYERS
DROP VIEW IF EXISTS players_answers;

CREATE VIEW players_answers AS
SELECT 
	name, lastName, age, answer1, answer2, answer3 
FROM User INNER JOIN 
	Form USING (idForm);

DROP VIEW IF EXISTS level1_performance;
CREATE VIEW level1_performance as
SELECT levelName AS 'Name of the level',
	Concat(u.name, ' ', u.lastName) AS 'Player',
	gr.score AS 'Score',
	l.avgScore AS 'Level 1 avg score'
FROM heroku_48f0b55a01c5202.level l INNER JOIN heroku_48f0b55a01c5202.gamerun gr
ON l.idLevel = gr.idLevel INNER JOIN heroku_48f0b55a01c5202.user u
ON u.idUser = gr.idUser
WHERE gr.idLevel = 4

DROP VIEW IF EXISTS level2_performance;
CREATE VIEW level2_performance as
SELECT levelName AS 'Name of the level',
	Concat(u.name, ' ', u.lastName) AS 'Player',
	gr.score AS 'Score',
	l.avgScore AS 'Level 2 avg score'
FROM heroku_48f0b55a01c5202.level l INNER JOIN heroku_48f0b55a01c5202.gamerun gr
ON l.idLevel = gr.idLevel INNER JOIN heroku_48f0b55a01c5202.user u
ON u.idUser = gr.idUser
WHERE gr.idLevel = 14

DROP VIEW IF EXISTS level3_performance;
CREATE VIEW level3_performance as
SELECT levelName AS 'Name of the level',
	Concat(u.name, ' ', u.lastName) AS 'Player',
	gr.score AS 'Score',
	l.avgScore AS 'Level 3 avg score'
FROM heroku_48f0b55a01c5202.level l INNER JOIN heroku_48f0b55a01c5202.gamerun gr
ON l.idLevel = gr.idLevel INNER JOIN heroku_48f0b55a01c5202.user u
ON u.idUser = gr.idUser
WHERE gr.idLevel = 24

DROP VIEW IF EXISTS level_performance;
CREATE VIEW level_performance as
SELECT levelName AS 'Name of the level',
	Concat(u.name, ' ', u.lastName) AS 'Player',
	gr.score AS 'Score',
	l.avgScore AS 'Avg score of the level'
FROM heroku_48f0b55a01c5202.level l INNER JOIN heroku_48f0b55a01c5202.gamerun gr
ON l.idLevel = gr.idLevel INNER JOIN heroku_48f0b55a01c5202.user u
WHERE gr.idLevel = 4 AND gr.idLevel = 14 AND gr.idLevel = 24