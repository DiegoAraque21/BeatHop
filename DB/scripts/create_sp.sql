-- CREATE PRODCEDURE TO ADD NEW GAMERUNS BECAUSE ITS THE MOST CALLED OPERATION IN THE SYSTEM
DROP PROCEDURE IF EXISTS AddGameRun;

DELIMITER //
CREATE PROCEDURE AddGameRun(
	IN idUser INT,
    IN idLevel INT,
    IN score FLOAT,
    IN deaths INT,
    IN tries INT
)
BEGIN

	INSERT INTO GameRun (idUser, idLevel, score, deaths, tries) VALUES
    (idUser, idLevel, score, deaths, tries);

END //
DELIMITER ;

-- CREATE PRODCEDURE TO COUNT THE AMOUNT OF ANSWERS FOR THE GRAPHS
DROP PROCEDURE IF EXISTS CountAnswers;

DELIMITER //
CREATE PROCEDURE CountAnswers()
BEGIN
	
	SELECT 
		-- Count answers from question 1
		COUNT(IF (answer1 = 'Yes', 1, NULL) ) 'Q1_A1',
		COUNT(IF (answer1 = 'A little bit', 1, NULL) ) 'Q1_A2',
		COUNT(IF (answer1 = 'No', 1, NULL) ) 'Q1_A3',
		-- Count answers from question 2
		COUNT(IF (answer2 = 'Yes', 1, NULL) ) 'Q2_A1',
		COUNT(IF (answer2 = 'Some of them', 1, NULL) ) 'Q2_A2',
		COUNT(IF (answer2 = 'No', 1, NULL) ) 'Q2_A3',
		-- Count answers from question 3
		COUNT(IF (answer3 = 'Yes', 1, NULL) ) 'Q3_A1',
		COUNT(IF (answer3 = 'Some of them', 1, NULL) ) 'Q3_A2',
		COUNT(IF (answer3 = 'No', 1, NULL) ) 'Q3_A3'
	FROM form;
    
END //
DELIMITER ;

-- CREATE PRODCEDURE TO GET THE SCORE OF GAMERUNS WITH THE ANSWERS OF QUESTION 1
DROP PROCEDURE IF EXISTS ScoresPerAnswer1;

DELIMITER //
CREATE PROCEDURE ScoresPerAnswer1(
    IN answer VARCHAR(100)
)
BEGIN
	
	SELECT 
		u.name AS 'Player',
		score AS 'Score',
        f.answer1 AS 'Have you played any percussion instrument?'
    FROM 
		form AS f
			INNER JOIN
		user AS u on f.idForm = u.idForm
			INNER JOIN
		gamerun on gamerun.idUser = u.idUser
	WHERE
		f.answer1 = answer;
    
END //
DELIMITER ;

-- CREATE PRODCEDURE TO GET THE SCORE OF GAMERUNS WITH THE ANSWERS OF QUESTION 2
DROP PROCEDURE IF EXISTS ScoresPerAnswer2;

DELIMITER //
CREATE PROCEDURE ScoresPerAnswer2(
    IN answer VARCHAR(100)
)
BEGIN
	
	SELECT 
		u.name AS 'Player',
		score AS 'Score',
        f.answer2 AS 'Can you identify musical notes?'
    FROM 
		form AS f
			INNER JOIN
		user AS u on f.idForm = u.idForm
			INNER JOIN
		gamerun on gamerun.idUser = u.idUser
	WHERE
		f.answer2 = answer;
    
END //
DELIMITER ;

-- CREATE PRODCEDURE TO GET THE SCORE OF GAMERUNS WITH THE ANSWERS OF QUESTION 3
DROP PROCEDURE IF EXISTS ScoresPerAnswer3;

DELIMITER //
CREATE PROCEDURE ScoresPerAnswer3(
    IN answer VARCHAR(100)
)
BEGIN
	
	SELECT 
		u.name AS 'Player',
		score AS 'Score',
        f.answer3 AS 'Can you identify the tempo of every note?'
    FROM 
		form AS f
			INNER JOIN
		user AS u on f.idForm = u.idForm
			INNER JOIN
		gamerun on gamerun.idUser = u.idUser
	WHERE
		f.answer3 = answer;
    
END //
DELIMITER ;