const express = require('express')
const router = express.Router();
const { check, Validator } = require('node-input-validator');
const CountryModel = require('../model/Country');
var md5 = require('md5');
const { exit } = require('process');
var session;
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })
router.get('/country/add', (req, res) => {
    res.render('pages/location/country',{expressFlash: req.flash('success') })
  })

  router.post('/country/data',urlencodedParser,(req,res)=>{
    var today = new Date();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var CurrentDateTime = date+''+time;
    
    if(typeof req.body.id !='undefined'){
        var data = {'name' : req.body.name,'id':req.body.id};
        CountryModel.updateCountry(data, (err, result) => {
            if(result)
            {
              req.flash('success', 'Country updated Successfull');
              res.redirect('/country');
            }
          })
    }else{
        var data = {'name' : req.body.name};
        CountryModel.addCountry(data, (err, result) => {
          if(result.insertId>0)
          {
            req.flash('success', 'Country added Successfull');
            res.redirect('/country');
          }
        })
    }
  })
  // Get product listing 
router.get('/country',(req,res)=>{
    CountryModel.getcountry(null,(err, result) => {
      res.render('pages/location/viewcountry',{data:result,expressFlash: req.flash('success')})
    })
  })
  // Edit Country

  router.get('/country/edit/:id', (req, res) => {
    var id=req.params.id;
    CountryModel.getcountrybyid(id,(err, result) => {
        
    res.render('pages/location/editcountry',{data:result,expressFlash: req.flash('success') })
    })
  })

// ADD state on behalf of country  

router.get('/state/add', (req, res) => {
  CountryModel.getcountry(null,(err, result) => {
  res.render('pages/location/addstate',{data:result,expressFlash: req.flash('success') })
  })
})

router.post('/state/data',urlencodedParser,(req,res)=>{
  var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
  var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  var CurrentDateTime = date+''+time;
  
  if(typeof req.body.id !='undefined'){
      var data = {'name' : req.body.name,'id':req.body.id,'country_id':req.body.country_id};
      CountryModel.updateCountry(data, (err, result) => {
          if(result)
          {
            req.flash('success', 'state updated Successfull');
            res.redirect('/country');
          }
        })
  }else{
      var data = {'name' : req.body.name,'country_id':req.body.country_id};
      CountryModel.addState(data, (err, result) => {
        if(result.insertId>0)
        {
          req.flash('success', 'State added Successfull');
          res.redirect('/state');
        }
      })
  }
})

router.get('/state', (req, res) => {
  CountryModel.getstate(null,(err, result) => {
  res.render('pages/location/viewstate',{data:result,expressFlash: req.flash('success') })
  })
})
router.get('/state/edit/:id', (req, res) => {
  var id=req.params.id;
  CountryModel.getstatebyid(id,(err, dataid) => {
    CountryModel.getcountry(null,(err, result) => {
      
      res.render('pages/location/editstate',{data:result,singledata:dataid,expressFlash: req.flash('success') })
      })
  });
  
 
})
module.exports=router