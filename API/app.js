// Packages
let express = require("express");
let userRouter = require("./routes/userRoutes.js");
let path = require("path");

// Initialize app
const app = express();
const port = 3000;

// Configuration
app.use(express.static(path.join(__dirname, './public')))

// Routes
app.use("/user", userRouter);
app.use("/game", userRouter);
app.use("/graphs", userRouter);

// Home
app.get("/", function (req, res) {
    res.sendFile(path.join(__dirname, './views/home.html'));
});

app.get("/graphs", function (req, res) {
    res.sendFile(path.join(__dirname, './views/graphs.html'));
});

// Listen
app.listen(port, () => console.log(`Server on port ${port}`));
