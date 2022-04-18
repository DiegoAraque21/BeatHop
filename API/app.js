// Imports
let express = require("express");
let userRouter = require("./routes/userRoutes.js");

// Initialize app
const app = express();
const port = 3000;

// Routes
app.use("/user", userRouter);
app.use("/game", userRouter);
app.use("/graphs", userRouter);

// Listen
app.listen(port, () => console.log(`Server on port ${port}`));
