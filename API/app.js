let express = require("express");
let userRoad = require("./roads/userRoad.js");

const app = express();
const port = 3000;
app.use("/user", userRoad);

app.listen(port, () => {
  console.log(`Server on port ${port}`);
});
