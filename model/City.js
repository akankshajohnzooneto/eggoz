var con= require('../config/connection'); 
  module.exports = {
    citylist: function (data, cb = () => {}) {
      var sql = "SELECT * FROM city";
      con.query(sql, function (err, result) {
        if(err) cb(err);
        else cb(null, result);
    });
    
  }
}

