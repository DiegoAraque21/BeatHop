let express = require("express");
let router = express.Router();
let path = require("path");
let connectToDB = require("../db");

// Log In
router.get("/login", function (req, res) {
  res.sendFile(path.join(__dirname, "../views/login.html"));
});
router.post("/login", function (req, res) {});

// Create Account
router.get("/create_account", function (req, res) {});
router.post("/create_account", function (req, res) {});

// New Form
router.post("/form", function (req, res) {  
  try {
    // Validate fields
    if (!req.body.answer1 || !req.body.answer2 || !req.body.answer3) throw "You must complete all fields.";

    // Make connection
    let connection = connectToDB();
    connection.connect();

    // Create query
    let query = `INSERT INTO Form (answer1, answer2, answer3) VALUES ("${req.body.answer1}", "${req.body.answer2}", "${req.body.answer3}")`;

    // Execute query in DB
    connection.query(query, (error, results) => {
      if (error) throw "There was an error with the creation of the user.";
      res.status(200).json({ message: "Form created successfully.", data: results });
    });

    // End connection
    connection.end();
  }

  // Manage error
  catch (error) {
    console.log("INSERT FORM ERROR:", error);
    res.status(500).json({ error });
  }
});

module.exports = router;
