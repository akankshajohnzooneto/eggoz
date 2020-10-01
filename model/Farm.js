var con= require('../config/connection'); 
  module.exports = {
    addFarm: function (data, cb = () => {}) {
      var sql = "INSERT INTO `farm`(`id`, `name`,`address_id`,`capacity`) VALUES ('','"+data.name+"','"+data.address_id+"','"+data.capacity+"')";
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
      },getfarm: function ($null = null,cb = () => {}) {
      var sql = "SELECT farm.*,address.addressLine1 ,address.addressLine2,address.locality , address.cityID ,city.name as cityname FROM `farm` JOIN address ON address.id=farm.address_id JOIN city ON city.id=address.cityID ORDER BY farm.id DESC";
      con.query(sql, function (err, result) {
        
          if(err) cb(err);
        
          else cb(null,result);
      });
    },getfarmbyid: function (id = null,cb = () => {}) {
      var sql = "SELECT farm.*,address.addressLine1 ,address.addressLine2,address.locality , address.cityID  FROM `farm` JOIN address ON address.id=farm.address_id where farm.id ='"+id+"'";
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
  },getfarmlist:function (id=null, cb = () => {}) {
    var sql = "SELECT * FROM farm";
    con.query(sql, function (err, result) {
      if(err) cb(err);
      else cb(null, result);
  });
}
}

