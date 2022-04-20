let connectToDB = require("../db");

let express = require("express");
let router = express.Router();
let path = require("path");

// Log In
router.get("/login", function (req, res) {
  res.sendFile(path.join(__dirname, "../views/login.html"));
});
router.post("/login", function (req, res) {});

// Sign Up
router.get("/signup", function (req, res) {});
router.post("/signup", function (req, res) {});

// New Form
router.get("/form", function (req, res) {});
router.post("/form", function (req, res) {
  let connection = connectToDB();

  try {
    connection.connect();
    // const query = `INSERT INTO Form (answer1, answer2, answer3) VALUES (${req.body.answer1}, ${req.body.answer2}, ${req.body.answer3})`;
    const query = `INSERT INTO Form (answer1, answer2, answer3) VALUES ("A lot", "Yes", "No")`;
    connection.query(query, (error, results, fields) => {
      if (error) console.log(error);
      console.log(JSON.stringify(results));
      response.json(results);
    });

    connection.end();
  } catch (error) {
    response.json(error);
    console.log(error);
  }
});

module.exports = router;
