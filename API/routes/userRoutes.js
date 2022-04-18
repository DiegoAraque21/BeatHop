let express = require("express");
let router = express.Router();
let path = require("path");

router.post("/login", function (req, res) {
  res.sendFile(path.join(__dirname, "../templates/index.html"));
});

module.exports = router;
