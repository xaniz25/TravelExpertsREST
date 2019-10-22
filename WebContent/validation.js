//Shanice Talan October 20, 2019
//Validation for all forms

//verify if the user wants to reset the form
function resetForm() {
	  var conf = confirm('Reset form?');
	  if (conf==true)
	    return true;
	  else
	    return false;
}

//Register Form - verify if user has completed all required inputs
function validateRegForm() {
	  var check=true;
	  
	  //verify if first name is entered
	  var fnamelen=document.getElementById('custFirstName').value.length;
	  if(fnamelen==0)
	    {document.getElementById('custFirstName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custFirstName').style.borderColor='green';}
	  
	  //verify if last name is entered
	  var lnamelen=document.getElementById('custLastName').value.length;
	  if(lnamelen==0)
	    {document.getElementById('custLastName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custLastName').style.borderColor='green';}
	  
	  //verify if address is entered
	  var addrlen=document.getElementById('custAddress').value.length;
	  if(addrlen==0)
	    {document.getElementById('custAddress').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custAddress').style.borderColor='green';}
	
	  //verify if city is entered
	  var citylen=document.getElementById('custCity').value.length;
	  if(citylen==0)
	    {document.getElementById('custCity').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custCity').style.borderColor='green';}
	
	  //verify if postal code is entered and in correct format
	  var postaltest=/^[A-Z]\d[A-Z] ?\d[A-Z]\d$/;
	  var postalvalue=document.getElementById('custPostal').value;
	  var postallen=document.getElementById('custPostal').value.length;
	  if(postallen==0 || postaltest.test(postalvalue)==false)
	   {document.getElementById('custPostal').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custPostal').style.borderColor='green';}
	
	  //verify if phone is entered
	  var phonelen=document.getElementById('custPhone').value.length;
	  if(phonelen==0)
	    {document.getElementById('custPhone').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custPhone').style.borderColor='green';}
	
	  //verify if email is entered and in correct format
	  var emailtest=/(.+)@(.+){2,}\.(.+){2,}/;
	  var emailvalue=document.getElementById('custEmail').value;
	  var emaillen=document.getElementById('custEmail').value.length;
	  if(emaillen==0 || emailtest.test(emailvalue)==false)
	   {document.getElementById('custEmail').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custEmail').style.borderColor='green';}
	  
	  //verify if UserID is entered
	  var idlen=document.getElementById('custUserId').value.length;
	  if(idlen==0)
	    {document.getElementById('custUserId').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custUserId').style.borderColor='green';}
	  
	  //verify if Password is entered and more than 8 characters
	  var pwdlen=document.getElementById('custUserPwd').value.length;
	  var confirmlen=document.getElementById('confirmPwd').value.length;
	  if(pwdlen<8 || confirmlen==0)
	    {document.getElementById('custUserPwd').style.borderColor='red';
	    document.getElementById('confirmPwd').style.borderColor='red';
	    check = false;}
	  else
	    { //verify if password matches
		  var pwd=document.getElementById('custUserPwd').value;
		  var confirm=document.getElementById('confirmPwd').value;
		  var n = pwd.localeCompare(confirm);
		  if(n!=0)
		  {document.getElementById('custUserPwd').style.borderColor='red';
		   document.getElementById('confirmPwd').style.borderColor='red';
		   check=false;}
		  else
			  {document.getElementById('custUserPwd').style.borderColor='green';
			   document.getElementById('confirmPwd').style.borderColor='green';}
		  }
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}//function validateRegForm


//Modify Customer
function validateModifyCust() {
	  var check=true;
	  
	  //verify if custID is entered
	  var custid=document.getElementById('customerId').value.length;
	  if(custid==0)
	    {document.getElementById('customerId').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('customerId').style.borderColor='green';}
	
	  //verify if first name is entered
	  var fnamelen=document.getElementById('custFirstName').value.length;
	  if(fnamelen==0)
	    {document.getElementById('custFirstName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custFirstName').style.borderColor='green';}
	  
	  //verify if last name is entered
	  var lnamelen=document.getElementById('custLastName').value.length;
	  if(lnamelen==0)
	    {document.getElementById('custLastName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custLastName').style.borderColor='green';}
	  
	  //verify if address is entered
	  var addrlen=document.getElementById('custAddress').value.length;
	  if(addrlen==0)
	    {document.getElementById('custAddress').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custAddress').style.borderColor='green';}
	
	  //verify if city is entered
	  var citylen=document.getElementById('custCity').value.length;
	  if(citylen==0)
	    {document.getElementById('custCity').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custCity').style.borderColor='green';}
	  
	//verify if province is entered
	  var provlen=document.getElementById('custProv').value.length;
	  if(provlen==0)
	    {document.getElementById('custProv').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custProv').style.borderColor='green';}
	
	  //verify if postal code is entered and in correct format
	  var postaltest=/^[A-Z]\d[A-Z] ?\d[A-Z]\d$/;
	  var postalvalue=document.getElementById('custPostal').value;
	  var postallen=document.getElementById('custPostal').value.length;
	  if(postallen==0 || postaltest.test(postalvalue)==false)
	   {document.getElementById('custPostal').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custPostal').style.borderColor='green';}
	
	  //verify if phone is entered
	  var phonelen=document.getElementById('custPhone').value.length;
	  if(phonelen==0)
	    {document.getElementById('custPhone').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custPhone').style.borderColor='green';}
	
	  //verify if email is entered and in correct format
	  var emailtest=/(.+)@(.+){2,}\.(.+){2,}/;
	  var emailvalue=document.getElementById('custEmail').value;
	  var emaillen=document.getElementById('custEmail').value.length;
	  if(emaillen==0 || emailtest.test(emailvalue)==false)
	   {document.getElementById('custEmail').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custEmail').style.borderColor='green';}
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}//function validateModifyCust

function validateAcct() {
	  var check=true;
	  
	  //verify if first name is entered
	  var fnamelen=document.getElementById('custFirstName').value.length;
	  if(fnamelen==0)
	    {document.getElementById('custFirstName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custFirstName').style.borderColor='green';}
	  
	  //verify if last name is entered
	  var lnamelen=document.getElementById('custLastName').value.length;
	  if(lnamelen==0)
	    {document.getElementById('custLastName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custLastName').style.borderColor='green';}
	  
	  //verify if address is entered
	  var addrlen=document.getElementById('custAddress').value.length;
	  if(addrlen==0)
	    {document.getElementById('custAddress').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custAddress').style.borderColor='green';}

	  //verify if city is entered
	  var citylen=document.getElementById('custCity').value.length;
	  if(citylen==0)
	    {document.getElementById('custCity').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custCity').style.borderColor='green';}

	  //verify if prov is entered
	  var provlen=document.getElementById('custProv').value.length;
	  if(provlen==0)
	    {document.getElementById('custProv').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('custProv').style.borderColor='green';}

	  //verify if postal code is entered and in correct format
	  var postaltest=/^[A-Z]\d[A-Z] ?\d[A-Z]\d$/;
	  var postalvalue=document.getElementById('custPostal').value;
	  var postallen=document.getElementById('custPostal').value.length;
	  if(postallen==0 || postaltest.test(postalvalue)==false)
	   {document.getElementById('custPostal').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custPostal').style.borderColor='green';}

	  //verify if phone is entered
	  var phonelen=document.getElementById('custPhone').value.length;
	  if(phonelen==0)
	    {document.getElementById('custPhone').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custPhone').style.borderColor='green';}

	  //verify if email is entered and in correct format
	  var emailtest=/(.+)@(.+){2,}\.(.+){2,}/;
	  var emailvalue=document.getElementById('custEmail').value;
	  var emaillen=document.getElementById('custEmail').value.length;
	  if(emaillen==0 || emailtest.test(emailvalue)==false)
	   {document.getElementById('custEmail').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custEmail').style.borderColor='green';}
	  
	  //verify if UserID is entered
	  var idlen=document.getElementById('custUserId').value.length;
	  if(idlen==0)
	    {document.getElementById('custUserId').style.borderColor='red';
	    check = false;}
	  else
	    {document.getElementById('custUserId').style.borderColor='green';}
	  
	  //verify if password matches if customer decides to update it
	  var pwd=document.getElementById('custUserPwd').value;
	  var confirm=document.getElementById('confirmPwd').value;
	  var n = pwd.localeCompare(confirm);
	  if(n!=0)
	  {document.getElementById('custUserPwd').style.borderColor='red';
	   document.getElementById('confirmPwd').style.borderColor='red';
	   check=false;}
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}//function validateAcct

function validateAddBooking() {
	  var check=true;
	  
	  //verify if custID is entered
	  var custid=document.getElementById('customerId').value.length;
	  if(custid==0)
	    {document.getElementById('customerId').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('customerId').style.borderColor='green';}
	  
	  //verify if traveler count is entered
	  var trav=document.getElementById('travelerCount').value.length;
	  if(trav==0)
	    {document.getElementById('travelerCount').style.borderColor='red';
	    check= false;}
	  else
	  	{document.getElementById('travelerCount').style.borderColor='green';}
	  
	  //verify if pkgID is entered
	  var pkgid=document.getElementById('packageId').value.length;
	  if(pkgid==0)
	    {document.getElementById('packageId').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('packageId').style.borderColor='green';}
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}//function validateAddBooking

function validateModifyBooking() {
	  var check=true;
	
	  //verify if bookingID is entered
	  var bkid=document.getElementById('bookingId').value.length;
	  if(bkid==0)
	    {document.getElementById('bookingId').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('bookingId').style.borderColor='green';}
	  
	  //verify if booking date is entered
	  var date=document.getElementById('bookingDate').value;
	  if(date=="")
	  	{document.getElementById('bookingDate').style.borderColor='red';
	  	check=false;}
	  else
		{document.getElementById('bookingDate').style.borderColor='green';}
		  
	  //verify if custID is entered
	  var custid=document.getElementById('customerId').value.length;
	  if(custid==0)
	    {document.getElementById('customerId').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('customerId').style.borderColor='green';}
	  
	  //verify if traveler count is entered
	  var trav=document.getElementById('travelerCount').value.length;
	  if(trav==0)
	    {document.getElementById('travelerCount').style.borderColor='red';
	    check= false;}
	  else
	  	{document.getElementById('travelerCount').style.borderColor='green';}
	  
	  //verify if pkgID is entered
	  var pkgid=document.getElementById('packageId').value.length;
	  if(pkgid==0)
	    {document.getElementById('packageId').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('packageId').style.borderColor='green';}
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}//function validateModifyBooking

function validateAddPkg() {
	  var check=true;
	  
	  //verify if pkgname is entered
	  var name=document.getElementById('pkgName').value.length;
	  if(name==0)
	    {document.getElementById('pkgName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgName').style.borderColor='green';}
	  
	  //verify if pkgdesc is entered
	  var desc=document.getElementById('pkgDesc').value.length;
	  if(desc==0)
	    {document.getElementById('pkgDesc').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgDesc').style.borderColor='green';}
	  
	  //verify if start date is entered
	  var start=document.getElementById('pkgStartDate').value;
	  if(start=="")
	  	{document.getElementById('pkgStartDate').style.borderColor='red';
	  	check=false;}
	  else
		{document.getElementById('pkgStartDate').style.borderColor='green';}
	  
	  //verify if end date is entered
	  var end=document.getElementById('pkgEndDate').value;
	  if(end=="")
	  	{document.getElementById('pkgEndDate').style.borderColor='red';
	  	check=false;}
	  else
		{document.getElementById('pkgEndDate').style.borderColor='green';}
	  
	  //verify if pkgprice is entered
	  var price=document.getElementById('pkgBasePrice').value.length;
	  if(price==0)
	    {document.getElementById('pkgBasePrice').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgBasePrice').style.borderColor='green';}
	  
	  //verify if commission is entered
	  var comm=document.getElementById('pkgAgencyCommission').value.length;
	  if(comm==0)
	    {document.getElementById('pkgAgencyCommission').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgAgencyCommission').style.borderColor='green';}
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}//function validateAddPkg

function validateModifyPkg() {
	  var check=true;
	
	  //verify if pkgId is entered
	  var pkgid=document.getElementById('packageId').value.length;
	  if(pkgid==0)
	    {document.getElementById('packageId').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('packageId').style.borderColor='green';}
	  
	  //verify if pkgname is entered
	  var name=document.getElementById('pkgName').value.length;
	  if(name==0)
	    {document.getElementById('pkgName').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgName').style.borderColor='green';}
	  
	  //verify if pkgdesc is entered
	  var desc=document.getElementById('pkgDesc').value.length;
	  if(desc==0)
	    {document.getElementById('pkgDesc').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgDesc').style.borderColor='green';}
	  
	  //verify if start date is entered
	  var start=document.getElementById('pkgStartDate').value;
	  if(start=="")
	  	{document.getElementById('pkgStartDate').style.borderColor='red';
	  	check=false;}
	  else
		{document.getElementById('pkgStartDate').style.borderColor='green';}
	  
	  //verify if end date is entered
	  var end=document.getElementById('pkgEndDate').value;
	  if(end=="")
	  	{document.getElementById('pkgEndDate').style.borderColor='red';
	  	check=false;}
	  else
		{document.getElementById('pkgEndDate').style.borderColor='green';}
	  
	  //verify if pkgprice is entered
	  var price=document.getElementById('pkgBasePrice').value.length;
	  if(price==0)
	    {document.getElementById('pkgBasePrice').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgBasePrice').style.borderColor='green';}
	  
	  //verify if commission is entered
	  var comm=document.getElementById('pkgAgencyCommission').value.length;
	  if(comm==0)
	    {document.getElementById('pkgAgencyCommission').style.borderColor='red';
	    check= false;}
	  else
	    {document.getElementById('pkgAgencyCommission').style.borderColor='green';}
	  
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}//function validateModifyPkg

function validateCheckout(){
	  var check=true;
	
	  //verify if traveler count is entered
	  var trav=document.getElementById('travelerCount').value.length;
	  if(trav==0)
	    {document.getElementById('travelerCount').style.borderColor='red';
	    check= false;}
	  else
	  	{document.getElementById('travelerCount').style.borderColor='green';}
	  
	  if(check==false)
		    document.getElementById('registerError').style.visibility = "visible";
	  
	  return check;
}

//validates Customer and Agent Logins
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
    document.getElementById('loginError').style.visibility = "visible";

  return check;
}
