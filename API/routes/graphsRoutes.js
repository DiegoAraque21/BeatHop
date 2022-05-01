let express = require("express");
let router = express.Router();
let path = require("path");
let connectToDB = require("../db");

// Get the graphs html
router.get("/", function (req, res) {
    res.sendFile(path.join(__dirname, '../views/graphs.html'));
});

// Get the tables html
router.get("/tables", function (req, res) {
    res.sendFile(path.join(__dirname, '../views/tables.html'));
});

// Get levels data
router.get("/levels", function (req, res) {
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
    }
    // Manage error
    catch (error) {
        console.log("GET ALL LEVELS DATA ERROR:", error);
        res.status(500).json({ error: "There was a problem with the data." });
    }
});

// Get the forms data
router.get("/forms", function (req, res) {
    try {

        // Make connection
        let connection = connectToDB();
        connection.connect();

        // Create user query
        let query = `CALL CountAnswers()`;

        // Execute query in DB
        connection.query(query, function (error, results) {
        
            // If there is no level or there is an error
            if (error) {
                return res
                    .status(500)
                    .json({
                        error: "Error getting the forms data.",
                        status: false,
                    });
            }
        
            // If everything is correct return level data
            res
                .status(200)
                .json({
                    message: "Successful request.",
                    status: true,
                    results: results[0]
                });
        });

        // End connection
        connection.end();
    }
    // Manage error
    catch (error) {
        console.log("GET FORMS DATA ERROR:", error);
        res.status(500).json({ error });
    }
});

// Get players answers data
router.get("/players_answers", function (req, res) {
    try {
        // Make connection
        let connection = connectToDB();
        connection.connect();

        // Create user query
        let query = `SELECT * FROM players_answers;`;

        // Execute query in DB
        connection.query(query, function (error, results) {
        
            // If error
            if (error) {
                return res
                    .status(500)
                    .json({
                        error: "Error getting the palyers data.",
                        status: false,
                    });
            }
        
            // If everything is correct return level data
            res
                .status(200)
                .json({
                    message: "Successful request.",
                    status: true,
                    results
                });
        });

        // End connection
        connection.end();
    }
    // Manage error
    catch (error) {
        console.log("GET PLAYERS DATA ERROR:", error);
        res.status(500).json({ error });
    }
});

// Get highest scores data
router.get("/highest_scores", function (req, res) {
    try {
        // Make connection
        let connection = connectToDB();
        connection.connect();

        // Create user query
        let query = `SELECT * FROM level_performance ORDER BY score DESC LIMIT 10`;

        // Execute query in DB
        connection.query(query, function (error, results) {
        
            // If error
            if (error) {
                return res
                    .status(500)
                    .json({
                        error: "Error getting the data.",
                        status: false,
                    });
            }
        
            // If everything is correct return level data
            res
                .status(200)
                .json({
                    message: "Successful request.",
                    status: true,
                    results
                });
        });

        // End connection
        connection.end();
    }
    // Manage error
    catch (error) {
        console.log("GET HISGHEST SCORES ERROR:", error);
        res.status(500).json({ error });
    }
});

// Get lowest scores data
router.get("/lowest_scores", function (req, res) {
    try {
        // Make connection
        let connection = connectToDB();
        connection.connect();

        // Create user query
        let query = `SELECT * FROM level_performance ORDER BY score ASC LIMIT 10`;

        // Execute query in DB
        connection.query(query, function (error, results) {
        
            // If error
            if (error) {
                return res
                    .status(500)
                    .json({
                        error: "Error getting the data.",
                        status: false,
                    });
            }
        
            // If everything is correct return level data
            res
                .status(200)
                .json({
                    message: "Successful request.",
                    status: true,
                    results
                });
        });

        // End connection
        connection.end();
    }
    // Manage error
    catch (error) {
        console.log("GET LOWEST SCORES ERROR:", error);
        res.status(500).json({ error });
    }
});

module.exports = router;
