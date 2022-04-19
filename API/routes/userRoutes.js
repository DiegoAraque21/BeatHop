let express = require("express");
let router = express.Router();

// Log In
router.get("/login", function (req, res) {
    res.render("index");
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
  
});

module.exports = router;
