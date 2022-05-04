// Packages
let express = require("express");
let userRouter = require("./routes/userRoutes.js");
let gameRouter = require("./routes/gameRoutes.js");
let graphsRouter = require("./routes/graphsRoutes.js");
let path = require("path");
let cors = require("cors");

// Initialize app
const app = express();
const port = 3000;

// Configuration
app.use(cors());
app.use(express.static(path.join(__dirname, "./public")));
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

// Routes
app.use("/user", userRouter);
app.use("/game", gameRouter);
app.use("/graphs", graphsRouter);

// Home
app.get("/", function (req, res) {
  res.sendFile(path.join(__dirname, "./views/home.html"));
});

// Listen
app.listen(port, () => console.log(`Server on port ${port}`));
