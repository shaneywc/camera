// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// Form Validation
/*fname*/
function validateForm()
{
var x=document.forms["myForm"]["fname"].value;
if (x==null || x=="")
  {
  alert("Your full name must be entered");
  return false;
  }

/*address*/
var x=document.forms["myForm"]["address"].value;
if (x==null || x=="")
  {
  alert("You must enter an address");
  return false;
  }


/*phone*/
var x=document.forms["myForm"]["phone"].value;
if (x==null || x=="")
  {
  alert("You must enter a phone number");
  return false;
  }


/*email*/
 var x=document.forms["myForm"]["email"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  alert("Not a valid e-mail address");
  return false;
  }

/*message*/
var x=document.forms["myForm"]["message"].value;
if (x==null || x=="")
  {
  alert("Please enter a message");
  return false;
  }
}