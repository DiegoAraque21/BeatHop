let mysql = require("mysql");

// Connection to heroku
const connectToDB = () => {
  try {
    return mysql.createConnection({
      host: "us-cdbr-east-05.cleardb.net",
      user: "b48bd5b8cc1254",
      password: "9ca1c4d4",
      database: "heroku_48f0b55a01c5202",
    });
  } catch (error) {
    // error message, if the connection couldn't be done
    console.log("CONNECT TO DB ERROR:", error);
  }
};

module.exports = connectToDB;
