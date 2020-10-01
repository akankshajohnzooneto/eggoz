var con= require('../config/connection'); 
  module.exports = {
    addFarmer: function (data, cb = () => {}) {
      var sql = "INSERT INTO `farmer`(`id`, `farmer`,`farm_id`,`address_id`) VALUES ('','"+data.farmer+"','"+data.farm_id+"','"+data.address_id+"')";
      con.query(sql, function (err, result) {
        if(err) cb(err);
        else cb(null, result);
    });
    },insertaddress: function (data, cb = () => {}) {
        var sql = "INSERT INTO `address`( `addressLine1`,`addressLine2`,`locality`,`cityID`) VALUES ('"+data.addressLine1+"','"+data.addressLine2+"','"+data.locality+"','"+data.cityID+"')";
        con.query(sql, function (err, result) {
          if(err) cb(err);
          else cb(null, result);
      });
      },getfarmer: function ($null = null,cb = () => {}) {
      var sql = "SELECT farmer.*,city.name as cityname,farm.name,address.addressLine1 ,address.addressLine2,address.locality FROM `farmer` JOIN farm ON farm.id=farmer.farm_id JOIN address ON address.id=farmer.address_id JOIN city ON city.id=address.cityID ORDER BY farm.id DESC";
      con.query(sql, function (err, result) {
        
          if(err) cb(err);
        
          else cb(null,result);
      });
    },getfarmerbyid: function (id = null,cb = () => {}) {
      var sql = "SELECT farmer.*,city.name as cityname,farm.name,address.addressLine1 ,address.addressLine2,address.locality FROM `farmer` JOIN farm ON farm.id=farmer.farm_id JOIN address ON address.id=farmer.address_id JOIN city ON city.id=address.cityID where farmer.id ='"+id+"'";
      con.query(sql, function (err, result) {
        
          if(err) cb(err);
        
          else cb(null,result);
      });
    },updatefarm: function (data, cb = () => {}) {
      var sql = "UPDATE farm SET name ='"+data.name+"',capacity='"+data.capacity+"',version='"+data.version+"' where id ='"+data.id+"'";
     
      con.query(sql, function (err, result) {
        if(err) cb(err);
        else cb(null, result);
        
    });
  },updateaddress: function (data, cb = () => {}) {
    var sql= "UPDATE address SET addressLine1='"+data.addressLine1+"' ,addressLine2='"+data.addressLine2+"', locality='"+data.locality+"',cityID='"+data.cityID+"' where id ='"+data.address_id+"'";
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

