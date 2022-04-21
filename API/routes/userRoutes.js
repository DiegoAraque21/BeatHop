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
router.get("/create_account", function (req, res) {
  res.sendFile(path.join(__dirname, "../views/createAccount.html"));
});

router.post("/create_account", function (req, res) {
  try {
    // Validate fields
    if (!req.body.name || !req.body.lastName || !req.body.email || !req.body.password ||
       !req.body.type || !req.body.gender || !req.body.age || !req.body.idForm)
      throw "You must complete all fields.";

    // Make connection
    let connection = connectToDB();
    connection.connect();

    // Create user query
    let userQuery = `INSERT INTO User (name, lastName, email, password, userType, age, gender, idForm) VALUES 
    ("${req.body.name}", "${req.body.lastName}", "${req.body.email}", "${req.body.password}", "${req.body.type}", ${req.body.age}, "${req.body.gender}", ${req.body.idForm})`;

    console.log(userQuery);

    // Execute from query in DB
    connection.query(userQuery, (error, results) => {

      // If error creating user
      if (error) throw "There was an error with the creation of the user."; 
      
      // Response
      res.status(200).json({ message: "User created successfully.", userId: results.insertId });

    });

    // End connection
    connection.end();
  }

  // Manage error
  catch (error) {
    console.log("INSERT USER ERROR:", error);
    res.status(500).json({ error });
  }
});

// New form
router.post("/form", function (req, res) {
  try {
    // Validate fields
    if (!req.body.answer1 || !req.body.answer2 || !req.body.answer3) throw "You must complete all fields.";

    // Make connection
    let connection = connectToDB();
    connection.connect();

    // Create form query
    let formQuery = `INSERT INTO Form (answer1, answer2, answer3) VALUES 
    ("${req.body.answer1}", "${req.body.answer2}", "${req.body.answer3}")`;

    // Execute from query in DB
    connection.query(formQuery, (error, results) => {
      
      // If error creating form
      if (error) throw "There was an error with the creation of the form.";

      // Response
      res.status(200).json({ message: "Form created successfully.", formId: results.insertId});

    });
    
    // End connection
    connection.end();
  }

  // Manage error
  catch (error) {
    console.log("INSERT USER ERROR:", error);
    res.status(500).json({ error });
  }
});

module.exports = router;
