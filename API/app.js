// Packages
let express = require("express");
let userRouter = require("./routes/userRoutes.js");
let path = require("path");

// Initialize app
const app = express();
const port = 3000;

// Configuration
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, './views'));
app.use(express.static(path.join(__dirname, './public')))

// Routes
app.use("/user", userRouter);
app.use("/game", userRouter);
app.use("/graphs", userRouter);

// Home
app.get("/", function (req, res) {
    res.render("pages/home");
});

// Listen
app.listen(port, () => console.log(`Server on port ${port}`));
