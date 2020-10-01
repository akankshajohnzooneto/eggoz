var con= require('../config/connection'); 
module.exports = {
  addProduct: function (data, cb = () => {}) {
    var sql = "INSERT INTO `product`(`id`, `name`, `slug`, `sku`, `product_image`,  `created_at`) VALUES ('','"+data.name+"','"+data.slug+"','"+data.sku+"','"+data.product_image+"','2019-11-11 02:05:00')";
    con.query(sql, function (err, result) {
      if(err) cb(err);
      else cb(null, result);
  });
  },getProdcut: function ($null = null,cb = () => {}) {
    var sql = "SELECT * FROM product";
    con.query(sql, function (err, result) {
      
        if(err) cb(err);
       
        else cb(null,result);
    });
  }
 
}

