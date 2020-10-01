const express = require('express')
const router = express.Router();
const { check, Validator } = require('node-input-validator');
const ProductModel = require('../model/Product');
var md5 = require('md5');
var session;
var multer=require("multer");
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/')
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now()+'.jpg')
  }
})
//var upload=multer({dest:"uploads/"});
var upload = multer({ storage: storage })
router.get('/products/add', (req, res) => {
  res.render('pages/product/addProduct',{expressFlash: req.flash('success') })
})

router.post('/send/data',upload.single('product_image'),(req,res)=>{
  var data = {'name' : req.body.product_name,'slug':req.body.slug,'sku':req.body.sku,'product_image':req.file.filename};
  ProductModel.addProduct(data, (err, result) => {
    if(result.insertId>0)
    {
      req.flash('success', 'Product added Successfull');
      res.redirect('/products');
    }
  })
})

// Get product listing 
router.get('/products',(req,res)=>{
  ProductModel.getProdcut(null,(err, result) => {
    res.render('pages/product/viewProduct',{data:result,expressFlash: req.flash('success')})
  })
})

module.exports = router