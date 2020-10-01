const express = require('express')
const router = express.Router();
const { check, Validator } = require('node-input-validator');
const FlockModel = require('../model/Flock');
var md5 = require('md5');
const { exit } = require('process');
var session;
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })
  router.get('/flock/add', (req, res) => {

    res.render('pages/flock/addflock',{expressFlash: req.flash('success') })
  })
  /**
   * create or update flock data 
   * @method post
   * @param id
   */
  router.post('/flock/data',urlencodedParser,(req,res)=>{
    var today = new Date();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var CurrentDateTime = date+''+time;
    
    if(typeof req.body.id !='undefined'){
       
        var data ={'id':req.body.id,'name' : req.body.name,'flock_type':req.body.flock_type,'quantity':req.body.quantity,'version':req.body.version};
        FlockModel.updateflock(data, (err, result) => {
            if(result)
            {
              req.flash('success', 'Flock updated Successfull');
              res.redirect('/flock');
            }
          })
    }else{
        var data = {'name' : req.body.name,'flock_type':req.body.flock_type,'quantity':req.body.quantity};
        FlockModel.addFlock(data, (err, result) => {
          if(result.insertId>0)
          {
            req.flash('success', 'Flock added Successfull');
            res.redirect('/flock');
          }
        })
    }
  }) 
    /**
     * Get added flock data 
     * @method getFlock
     * @param null
     */
router.get('/flock',(req,res)=>{
    FlockModel.getFlock(null,(err, result) => {
      res.render('pages/flock/viewflock',{data:result,expressFlash: req.flash('success')})
    })
  })
/**
 * Edit flock detail
 * @method editflock
 * @param flock id
 */
router.get('/flock/edit/:id', (req, res) => {
    var id=req.params.id;
    FlockModel.getflockbyid(id,(err, result) => { 
    res.render('pages/flock/editflock',{flock:result,expressFlash: req.flash('success') })
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