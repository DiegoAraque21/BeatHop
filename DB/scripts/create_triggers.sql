/*
	We host our DB in the ClearDB service from Heroku,
	unfortunally the free plan of that service doesn´t allow 
	the use of triggers. The following triggers are not implemented on the
	system but they would work if the owner wants to pay for another plan.
*/

-- TRIGGER FOR UPDATING THE AMOUNT OF GAMERUNS OF A LEVEL
DROP TRIGGER IF EXISTS update_level_amount_gameruns;

DELIMITER //
CREATE TRIGGER update_level_amount_gameruns AFTER INSERT ON gamerun
FOR EACH ROW 
BEGIN

	SET @currentAmount = (SELECT amountGameRuns from level WHERE idLevel = NEW.idLevel);
	UPDATE level SET amountGameRuns = ( (SELECT @currentAmount) + 1 )  WHERE idLevel = NEW.idLevel;

END //
DELIMITER ;

-- TRIGGER FOR UPDATING THE DATA OF A LEVEL
DROP TRIGGER IF EXISTS update_level_data;
DELIMITER //
CREATE TRIGGER update_level_data AFTER INSERT ON gamerun
FOR EACH ROW 
BEGIN

	SET @currentAvgScore = (SELECT avgScore from level WHERE idLevel = NEW.idLevel);
    SET @currentTotalDeaths = (SELECT totalDeaths from level WHERE idLevel = NEW.idLevel);
    SET @currentTotalTries = (SELECT totalTries from level WHERE idLevel = NEW.idLevel);
    SET @currentAmount = (SELECT amountGameRuns from level WHERE idLevel = NEW.idLevel);

	UPDATE level SET 
		avgScore = ( ((SELECT @currentAvgScore) * ( ((SELECT @currentAmount) - 1) / (SELECT @currentAmount))) + (NEW.score / (SELECT @currentAmount))),
        totalDeaths = ( (SELECT @currentTotalDeaths) + NEW.deaths ),
        totalTries = ( (SELECT @currentTotalTries) + NEW.tries )
		
	WHERE idLevel = NEW.idLevel;

END //
DELIMITER ;