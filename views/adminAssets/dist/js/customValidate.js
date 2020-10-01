function validateForm() {
  var email = document.forms["myForm"]["emailid"].value;
  var pw = document.forms["myForm"]["password"].value;
  if (email == "" ) {
   document.getElementById('emailError').innerHTML='Email id is required';
    return false;
  }
  else{
    document.getElementById('emailError').innerHTML='';
  }
  if (pw == "" ) {
    document.getElementById('passwordError').innerHTML='Password is required';
     return false;
   }else{
    document.getElementById('passwordError').innerHTML='';
   }
}