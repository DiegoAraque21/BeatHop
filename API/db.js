let mysql = require("mysql");

const connectToDB = () => {
  try {
    return mysql.createConnection({
      host: "us-cdbr-east-05.cleardb.net",
      user: "b48bd5b8cc1254",
      password: "9ca1c4d4",
      database: "heroku_48f0b55a01c5202",
    });
  } catch (error) {
    console.log(error);
  }
};

module.exports = connectToDB;
