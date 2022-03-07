const faker = require("faker");
const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "join_us",
});

// connection.connect();

// var data = [];
// for (var i = 0; i < 500; i++) {
//   data.push([faker.internet.email(), faker.date.past()]);
// }
// var q = "INSERT INTO users (email, created_at) VALUES ?";

const q = "SELECT * FROM users";

connection.query(q, function (err, result) {
  if (err) throw err;
  console.log(result[3]);
});

connection.end();
