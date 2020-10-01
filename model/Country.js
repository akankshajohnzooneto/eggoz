var con= require('../config/connection'); 
  module.exports = {
    addCountry: function (data, cb = () => {}) {
      var sql = "INSERT INTO `country`(`id`, `name`) VALUES ('','"+data.name+"')";
      con.query(sql, function (err, result) {
        if(err) cb(err);
        else cb(null, result);
    });
    },getcountry: function ($null = null,cb = () => {}) {
      var sql = "SELECT * FROM country ORDER BY id DESC";
      con.query(sql, function (err, result) {
        
          if(err) cb(err);
        
          else cb(null,result);
      });
    },getcountrybyid: function (id = null,cb = () => {}) {
      var sql = "SELECT * FROM country where id ='"+id+"'";
      con.query(sql, function (err, result) {
        
          if(err) cb(err);
        
          else cb(null,result);
      });
    },updateCountry: function (data, cb = () => {}) {
      var sql = "UPDATE country SET name ='"+data.name+"' where id ='"+data.id+"'";
      con.query(sql, function (err, result) {
        if(err) cb(err);
        else cb(null, result);
    });
  },addState:function (data, cb = () => {}) {
    var sql = "INSERT INTO `state`(`id`, `name`,`country_id`) VALUES ('','"+data.name+"','"+data.country_id+"')";
    con.query(sql, function (err, result) {
      if(err) cb(err);
      else cb(null, result);
  });
  },getstate: function ($null = null,cb = () => {}) {
    var sql = "SELECT state.name,country.name as country,state.id,state.status,state.country_id  FROM `state` JOIN country ON  country.id=state.country_id ORDER BY state.id DESC";
    con.query(sql, function (err, result) {
      
        if(err) cb(err);
      
        else cb(null,result);
    });
  },getstatebyid: function (id = null,cb = () => {}) {
    var sql = "SELECT * FROM state where id ='"+id+"'";
    con.query(sql, function (err, result) {
      
        if(err) cb(err);
      
        else cb(null,result);
    });
  }
}

