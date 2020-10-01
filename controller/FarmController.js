const express = require('express')
const router = express.Router();
const { check, Validator } = require('node-input-validator');
const FarmModel = require('../model/Farm');
const CityModel = require('../model/City.js');
var md5 = require('md5');
const { exit } = require('process');
var session;
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })
router.get('/farm/add', (req, res) => {
    CityModel.citylist(null,(err, result) => {
        
        res.render('pages/farm/addfarm',{city:result,expressFlash: req.flash('success') })
    });
  })
  /**
   * create or update Farm data 
   * @method post
   * @param id
   */
  router.post('/farm/data',urlencodedParser,(req,res)=>{
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
                FarmModel.updatefarm(data, (err, result) => { 
                req.flash('success', 'farm updated Successfull');
                res.redirect('/farm');
                })
            }
          })
    }else{
        var data = {'name' : req.body.name,'addres_id':req.body.address_id,'capacity':req.body.capacity,'addressLine1':req.body.addressLine1,'addressLine2':req.body.addressLine2,'locality':req.body.locality,'cityID':req.body.cityID};
        FarmModel.insertaddress(data, (err, result) => {
          if(result.insertId>0)
          { 
             data['address_id']=result.insertId;
             FarmModel.addFarm(data, (err, result) => {
                req.flash('success', 'farm added Successfull');
                res.redirect('/farm');
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
router.get('/farm',(req,res)=>{
    FarmModel.getfarm(null,(err, result) => {
        
      res.render('pages/farm/viewfarm',{data:result,expressFlash: req.flash('success')})
    })
  })
/**
 * Edit flock detail
 * @method editflock
 * @param flock id
 */
router.get('/farm/edit/:id', (req, res) => {
    var id=req.params.id;
    
     FarmModel.getfarmbyid(id,(err, result) => {
        
        CityModel.citylist(null,(err, result1) => {
           
        res.render('pages/farm/editfarm',{city:result1,farm:result,expressFlash: req.flash('success') })
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