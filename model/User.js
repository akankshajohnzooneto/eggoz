var con= require('../config/connection'); 
module.exports = {
  validateUser: function (username = null, password = null, cb = () => {}) {
      var sql = "SELECT * FROM users WHERE email_id='" + username + "' AND password = '" + password + "'";
      con.query(sql, function (err, result) {
          if(err) cb(err);
          else cb(null, result);
      });
  }
}
