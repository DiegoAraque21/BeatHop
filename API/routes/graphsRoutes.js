let express = require("express");
let router = express.Router();
let path = require("path");
let connectToDB = require("../db");

// Get the html
router.get("/", function (req, res) {
    res.sendFile(path.join(__dirname, '../views/graphs.html'));
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
        let query = `SELECT * FROM form`;

        // Execute query in DB
        connection.query(query, function (error, results) {
        
            // If there is no level or there is an error
            if (error) {
                return res
                    .status(500)
                    .json({
                        error: "Error getting the forms.",
                        status: false,
                    });
            }
        
            // If everything is correct return level data
            res
                .status(200)
                .json({
                    message: "Successful request.",
                    status: true,
                    forms: results
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

module.exports = router;
