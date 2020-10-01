const express = require('express')
const router = express.Router();
const { check, Validator } = require('node-input-validator');

const UserModel = require('../model/User');
var md5 = require('md5');
var session;
/** Load Login page */
router.get('/admin', (req, res) => {
  //session=req.session;
  //console.log(session.email); // Did not get session value
  res.render('pages/login',{expressFlash: req.flash('success') })
})
/**
 * Get post value from login page
 * @method post
 */
router.post('/validate',(req,res)=>{
 
  var password =  md5(req.body.password);
  UserModel.validateUser(req.body.emailid, password, (err, result) => {
     
    if(err) {
     res.redirect('/');
     }
    else if(result == '')
    {
      req.flash('success', 'invalid email or password');
      res.redirect('/');
    }
      else for (i in result) {
      req.session.email= result[i].id;
     // console.log(req.session.email)
     res.redirect('/dashboard');
     
    };
});
})

/**
 * Load dashboard page 
 * @method get
 */
router.get('/dashboard',(req,res)=>{
  res.render('pages/dashboard');
});
module.exports = router