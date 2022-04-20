let express = require("express");
let router = express.Router();
let path = require("path");

// Log In
router.get("/login", function (req, res) {
    res.sendFile(path.join(__dirname, '../views/login.html'));
});
router.post("/login", function (req, res) {
  
});

// Sign Up
router.get("/signup", function (req, res) {
  
});
router.post("/signup", function (req, res) {
  
});

// New Form
router.get("/form", function (req, res) {
  
});
router.post("/form", function (req, res) {
    console.log(req.body);
});

module.exports = router;
