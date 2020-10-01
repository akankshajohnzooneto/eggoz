var con= require('../config/connection'); 
  module.exports = {
    addFlock: function (data, cb = () => {}) {
      var sql = "INSERT INTO `flock`(`id`, `name`,`flock_type`,`quantity`) VALUES ('','"+data.name+"','"+data.flock_type+"','"+data.quantity+"')";
      con.query(sql, function (err, result) {
        if(err) cb(err);
        else cb(null, result);
    });
    },getFlock: function ($null = null,cb = () => {}) {
      var sql = "SELECT * FROM flock ORDER BY id DESC";
      con.query(sql, function (err, result) {
        
          if(err) cb(err);
        
          else cb(null,result);
      });
    },getflockbyid: function (id = null,cb = () => {}) {
      var sql = "SELECT * FROM flock where id ='"+id+"'";
      con.query(sql, function (err, result) {
        
          if(err) cb(err);
        
          else cb(null,result);
      });
    },updateflock: function (data, cb = () => {}) {
      var sql = "UPDATE flock SET name ='"+data.name+"',flock_type='"+data.flock_type+"',quantity='"+data.quantity+"',version='"+data.version+"' where id ='"+data.id+"'";
      con.query(sql, function (err, result) {
        if(err) cb(err);
        else cb(null, result);
    });
  },deleteflock:function (id=null, cb = () => {}) {
    var sql = "DELETE FROM flock where id='"+id+"' ";
    con.query(sql, function (err, result) {
      if(err) cb(err);
      else cb(null, result);
  });
  }
}

