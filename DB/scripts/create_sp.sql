-- CREATE PRODCEDURE TO ADD NEW GAMERUNS BECAUSE ITS THE MOST CALLED OPERATION IN THE SYSTEM
DROP PROCEDURE IF EXISTS addGameRun;

DELIMITER //
CREATE PROCEDURE addGameRun(
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
DROP PROCEDURE IF EXISTS countForms;

DELIMITER //
CREATE PROCEDURE countAnswers()
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