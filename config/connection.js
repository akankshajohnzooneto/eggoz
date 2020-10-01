var mysql = require('mysql'); // npm install mysql
var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "eggoz"
      });
con.connect(function(err) {
if (err) throw err;
else console.log("Server is up");

});
module.exports = con;