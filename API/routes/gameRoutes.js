let express = require("express");
let router = express.Router();
let connectToDB = require("../db");

// Create game run
router.post("/gamerun", function (req, res) {
  try {
    // Make connection
    let connection = connectToDB();
    connection.connect();

    // Create query
    let query = `INSERT INTO GameRun (idUser, idLevel, score, deaths, tries) VALUES
    (${req.body.idUser}, ${req.body.idLevel}, ${req.body.score}, ${req.body.deaths}, ${req.body.tries})`;

    // Execute query in DB
    connection.query(query, (error, results) => {
      // If error insertings
      if (error) {
        console.log("INSERT GAMERUN ERROR:", error);
        return res.status(500).json({
          error: "There was an error with the creation of the gamerun.",
        });
      }

      // Response
      res.status(200).json({
        message: "Game run inserted successfully.",
        // formId: results.insertId,
        formId: 1,
      });
    });

    // End connection
    connection.end();
  } catch (error) {
    // Manage error
    console.log("INSERT GAMERUN ERROR:", error);
    res.status(500).json({ error });
  }
});

// Get level data
router.get("/level", function (req, res) {
  try {
    // Validate fields
    if (!req.body.idLevel) throw "You must complete all fields.";

    // Make connection
    let connection = connectToDB();
    connection.connect();

    // Create user query
    let query = `SELECT * FROM level WHERE (idLevel = ${req.body.idLevel})`;

    // Execute query in DB
    connection.query(query, function (error, results) {
      // If there is no level or there is an error
      if (results.length === 0 || error) {
        return res.status(500).json({
          error: "Level doesn't exist.",
          status: false,
        });
      }

      // If everything is correct return level data
      res.status(200).json({
        message: "Successful request.",
        status: true,
        levelName: results[0].levelName,
        avgScore: results[0].avgScore,
        totalDeaths: results[0].totalDeaths,
        totalTries: results[0].totalTries,
        amountGameRuns: results[0].amountGameRuns,
      });
    });

    // End connection
    connection.end();
  } catch (error) {
    // Manage error
    console.log("GET LEVEL DATA ERROR:", error);
    res.status(500).json({ error });
  }
});

module.exports = router;
