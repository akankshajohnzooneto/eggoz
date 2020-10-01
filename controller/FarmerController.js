const express = require('express')
const router = express.Router();
const { check, Validator } = require('node-input-validator');
const FarmerModel = require('../model/Farmer');
const FarmModel = require('../model/Farm');
const CityModel = require('../model/City.js');
var md5 = require('md5');
const { exit } = require('process');
var session;
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })
router.get('/farmer/add', (req, res) => {
    CityModel.citylist(null,(err, result) => {
        FarmModel.getfarmlist(null,(err, result1) => {
            res.render('pages/farmer/addfarmer',{city:result,farm:result1,expressFlash: req.flash('success') })
        })
    });
  })
  /**
   * create or update Farm data 
   * @method post
   * @param id
   */
  router.post('/farmer/data',urlencodedParser,(req,res)=>{
    var today = new Date();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var CurrentDateTime = date+''+time;
    
    if(typeof req.body.id !='undefined'){
       
        var data = {'id':req.body.id,'name' : req.body.name,'address_id':req.body.address_id,'capacity':req.body.capacity,'addressLine1':req.body.addressLine1,'addressLine2':req.body.addressLine2,'locality':req.body.locality,'cityID':req.body.cityID};
        FarmModel.updateaddress(data, (err, result) => {
            //console.log(err);return;
            if(result)
            {
                FarmModel.updatefarmer(data, (err, result) => { 
                req.flash('success', 'farm updated Successfull');
                res.redirect('/farm');
                })
            }
          })
    }else{
        var data = {'farmer': req.body.farmer,'farm_id':req.body.farm_id,'address_id':req.body.address_id,'addressLine1':req.body.addressLine1,'addressLine2':req.body.addressLine2,'locality':req.body.locality,'cityID':req.body.cityID};
        FarmerModel.insertaddress(data, (err, result) => {
           
          if(result.insertId>0)
          { 
             data['address_id']=result.insertId;
             FarmerModel.addFarmer(data, (err, result) => {
                req.flash('success', 'farmer added Successfull');
                res.redirect('/farmer');
             })
           
          }
        })
    }
  }) 
    /**
     * Get added flock data 
     * @method getFlock
     * @param null
     */
router.get('/farmer',(req,res)=>{
    FarmerModel.getfarmer(null,(err, result) => {
      res.render('pages/farmer/viewfarmer',{data:result,expressFlash: req.flash('success')})
    })
  })
/**
 * Edit flock detail
 * @method editflock
 * @param flock id
 */
router.get('/farmer/edit/:id', (req, res) => {
    var id=req.params.id;
    
     FarmerModel.getfarmerbyid(id,(err, result) => {
        
        CityModel.citylist(null,(err, result1) => {
           
          FarmModel.getfarmlist(id,(err, result2) => {
            res.render('pages/farmer/editfarmer',{city:result1,farm:result2,farmer:result,expressFlash: req.flash('success') })
            })
        })
    })
  })
/**
 * Delete Flock data
 * @method deleteflock
 * @param id
 */  
router.get('/flock/delete/:id', (req, res) => {
    var id=req.params.id;
    FlockModel.deleteflock(id,(err, result) => { 
        req.flash('success', 'Flock deleted Successfull');
        res.redirect('/flock');
    })
  })

module.exports=router