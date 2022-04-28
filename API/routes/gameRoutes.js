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

// Get all level data
router.get("/all_level", function (req, res) {
  try {
    // Make connection
    let connection = connectToDB();
    connection.connect();

    // Create user query
    let query = `SELECT * FROM level`;

    // Execute query in DB
    connection.query(query, function (error, results) {
      // If there is no level or there is an error
      if (error) {
        return res.status(500).json({
          error: "There was a problem with the data.",
          status: false,
        });
      }

      // If everything is correct return level data
      res.status(200).json({
        message: "Successful request.",
        levels: results,
      });
    });

    // End connection
    connection.end();
  } catch (error) {
    // Manage error
    console.log("GET ALL LEVELS DATA ERROR:", error);
    res.status(500).json({ error: "There was a problem with the data." });
  }
});

// Update level data
router.put("/level", function (req, res) {
  try {
    // Make connection
    let connection = connectToDB();
    connection.connect();

    // Create user query
    let query = `UPDATE level SET
                    avgScore = (avgScore * (amountGameRuns / (amountGameRuns + 1))+(${req.body.score} * (1 / (amountGameRuns + 1)),
                    totalDeaths = totalDeaths + ${req.body.deaths},
                    totalTries = totalTries + ${req.body.tries},
                    amountGameRuns = amountGameRuns + 1
                    WHERE idlevel = ${req.body.idLevel}`;

    console.log(req.body);
    console.log(query);
    // Execute query in DB
    connection.query(query, function (error, results) {
      // If there is no level or there is an error
      if (error) {
        console.log("UPDATE LEVEL DATA ERROR:", error);
        return res.status(500).json({
          error: "Error updating level data.",
          status: false,
        });
      }

      // If everything is correct
      res.status(200).json({
        message: "Successfully updated level data.",
        status: true,
      });
    });

    // End connection
    connection.end();
  } catch (error) {
    // Manage error
    console.log("UPDATE LEVEL DATA ERROR:", error);
    res.status(500).json({ error });
  }
});

module.exports = router;
