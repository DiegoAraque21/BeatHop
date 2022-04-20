let express = require("express");
let router = express.Router();
let path = require("path");

router.get("/graphs", function (req, res) {
    res.sendFile(path.join(__dirname, './views/graphs.html'));
});


module.exports = router;
