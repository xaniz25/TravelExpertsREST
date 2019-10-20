//Shanice Talan
//Registration page

//verify if the user wants to reset the form
function resetForm() {
  var conf = confirm('Reset form?');
  if (conf==true)
    return true;
  else
    return false;
}

//verify if user has completed all required inputs
function validateForm() {
  var check=true;
  //verify if full name is entered
  var fnamelen=document.getElementById('fname').value.length;
  if(fnamelen==0)
    {document.getElementById('fname').style.borderColor='red';
    check= false;}
  else
    {document.getElementById('fname').style.borderColor='green';}

  //verify if phone is entered
  var phonelen=document.getElementById('phone').value.length;
  if(phonelen==0)
    {document.getElementById('phone').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('phone').style.borderColor='green';}

  //verify if address is entered
  var addresslen=document.getElementById('address').value.length;
  if(addresslen==0)
    {document.getElementById('address').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('phone').style.borderColor='green';}

  //verify if email is entered and in correct format
  var emailtest=/(.+)@(.+){2,}\.(.+){2,}/;
  var emailvalue=document.getElementById('email').value;
  var emaillen=document.getElementById('email').value.length;
  if(emaillen==0 || emailtest.test(emailvalue)==false)
   {document.getElementById('email').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('email').style.borderColor='green';}

  //verify if postal code is entered and in correct format
  var postaltest=/^[A-Z]\d[A-Z] ?\d[A-Z]\d$/;
  var postalvalue=document.getElementById('postal').value;
  var postallen=document.getElementById('postal').value.length;
  if(postallen==0 || postaltest.test(postalvalue)==false)
   {document.getElementById('postal').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('postal').style.borderColor='green';}

  if(check==false)
    document.getElementById('registerError').style.visibility = "visible";

  return check;
}//function validateForm


//Add Agent
//verify if user has completed all required inputs
function validateAgentForm() {
  var check=true;
  //verify if first name is entered
  var fnamelen=document.getElementById("fname").value.length;
  if(fnamelen==0)
    {document.getElementById('fname').style.borderColor='red';
    check= false;}
  else
    {document.getElementById('fname').style.borderColor='green';}

  //verify if last name is entered
  var lnamelen=document.getElementById("lname").value.length;
  if(lnamelen==0)
    {document.getElementById('lname').style.borderColor='red';
    check= false;}
  else
    {document.getElementById('lname').style.borderColor='green';}

  //verify if phone is entered
  var phonelen=document.getElementById('phone').value.length;
  if(phonelen==0)
    {document.getElementById('phone').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('phone').style.borderColor='green';}

  //verify if email is entered and in correct format
  var emailtest=/(.+)@(.+){2,}\.(.+){2,}/;
  var emailvalue=document.getElementById("email").value;
  var emaillen=document.getElementById("email").value.length;
  if(emaillen==0 || emailtest.test(emailvalue)==false)
   {document.getElementById('email').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('email').style.borderColor='green';}

  //verify if position is entered
  var poslen=document.getElementById("position").value.length;
  if(poslen==0)
    {document.getElementById('position').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('position').style.borderColor='green';}

  //verify if agency id is entered
  var idlen=document.getElementById("agencyid").value.length;
  if(idlen==0)
    {document.getElementById('agencyid').style.borderColor='red';
    check = false;}
  else
    {document.getElementById('agencyid').style.borderColor='green';}

  //verify if user id is entered
  var uidlen=document.getElementById('uid').value.length;
  if(uidlen==0)
    {document.getElementById('uid').style.borderColor='red';
    check= false;}
  else
    {document.getElementById('uid').style.borderColor='green';}

  //verify if password is entered
  var pwdlen=document.getElementById('pwd').value.length;
  if(pwdlen==0)
    {document.getElementById('pwd').style.borderColor='red';
    check= false;}
  else
    {document.getElementById('pwd').style.borderColor='green';}

  if(check==false){
    document.getElementById('registerError').style.visibility = "visible";}

  return check;
}

function checkLogin() {
  var check=true;
  //verify if user id is entered
  var uidlen=document.getElementById('uid').value.length;
  if(uidlen==0)
    {document.getElementById('uid').style.borderColor='red';
    check= false;}
  else
    {document.getElementById('uid').style.borderColor='green';}

  //verify if password is entered
  var pwdlen=document.getElementById('pwd').value.length;
  if(pwdlen==0)
    {document.getElementById('pwd').style.borderColor='red';
    check= false;}
  else
    {document.getElementById('pwd').style.borderColor='green';}

  if(check==false)
    document.getElementById('registerError').style.visibility = "visible";

  return check;
}
