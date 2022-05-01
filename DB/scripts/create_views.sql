-- VIEW TO SEE THE ANSWERS OF THE PLAYERS
DROP VIEW IF EXISTS players_answers;

CREATE VIEW players_answers AS
SELECT 
	name, lastName, age, answer1, answer2, answer3 
FROM User INNER JOIN 
	Form USING (idForm);