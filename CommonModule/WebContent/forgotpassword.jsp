

<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = index.jsp");
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
session.invalidate();

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println("URL of the System (msg 1) - "+basePath);


String errCode=""+request.getParameter("err");
String message = ""+request.getParameter("msg");
%>



<!DOCTYPE html>
<html lang="en">
<script src="http://wcetdesigns.com/assets/javascript/jquery.js"></script>
<script src="http://wcetdesigns.com/assets/javascript/jquery/cookie-plugin.js"></script>
<script type="text/javascript">
window.history.forward();
function noBack() { 
	window.history.forward(); 
}

function remember_me(){
	var today = new Date();
	var exdays = today.getDate();
	
	var value = document.getElementById("username").value;
	var c_name = "input_usernameCP";
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	
	document.cookie=c_name + "=" + c_value;
	
	
	var value2 = document.getElementById("email").value;
	var c_name2 = "input_email";
	var exdate2=new Date();
	exdate2.setDate(exdate.getDate() + exdays);
	
	var c_value2=escape(value2) + ((exdays==null) ? "" : "; expires="+exdate2.toUTCString());
	
	document.cookie=c_name2 + "=" + c_value2;
	
	}
	//NEXT PAGE LOAD, THE USERNAME & PASSWORD WILL BE SHOWN IN THEIR FIELDS
	function load_em(){
		
		//alert("fderge");
		   var allcookies = document.cookie;
		  // alert("All Cookies : ");

		   // Get all the cookies pairs in an array
		   cookiearray  = allcookies.split(';');

		   // Now take key value pair out of this array
		   for(var i=0; i<cookiearray.length; i++){
		      name = cookiearray[i].split('=')[0];
		      value = cookiearray[i].split('=')[1];
		     //alert("name is : " + name + " and Value is : " + value);
		      if(name="input_usernameCP"){
		    	  document.getElementById("input_usernameCP").value=value;
				   //alert("ff"+value);
			   }
		    //  else{
		    //	  document.getElementById("input_usernameCP").value="user name";  
		    //  }
		      if(name="input_email"){
		    	  document.getElementById("input_email").value=value;
				 // alert("ff"+value);
			  }
		      //else{
			//	   document.getElementById("input_passwordCP").value="password";  
			 //  }
		   }
		   
		}
	




</script>

<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Stylesheet -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" media="screen">

<!-- Uniform Stylesheet -->
<link rel="stylesheet" href="plugins/uniform/css/uniform.default.css" media="screen">

<!-- Plugin Stylsheets first to ease overrides -->

<!-- End Plugin Stylesheets -->

<!-- Main Layout Stylesheet -->
<link rel="stylesheet" href="assets/css/fonts/icomoon/style.css" media="screen">
<link rel="stylesheet" href="assets/css/login.css" media="screen">
<link rel="stylesheet" href="plugins/zocial/zocial.css" media="screen">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<title> OVS- Forgot Password</title>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">


  <div id="login-wrap">

		<div id="login-buttons">
			
		<img border="0" src="assets/images/uoklogo.png" alt="mobios logo " width="60" height="60">	
		</div>

		<div id="login-inner" class="login-inset">

			<div id="login-circle">
				<section id="login-form" class="login-inner-form">
					<h1>Find Your Account</h1>
				<h5>
					&nbsp&nbspPlease enter the User Name and email address &nbsp&nbspassociated with your OVS account.
					</h5>
					<p>&nbsp&nbspWe'll send you a OTP and link to a page where &nbsp&nbspyou will be able to Reset your password.</p>
					<form class="form-vertical" action="forgotpasswordcontroller.jsp" >
					
						<%if(errCode.equalsIgnoreCase("locked")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Sorry! Your account has been locked..Contact Administrator</h5>
					        </div>
					        <%} %>
					        
					        
					<%if(message.equals("ok")){ %>
					        <div id="errDisplay" style="color:green;">
					        	<h5 align="center">You have successfully reset your password.</h5>
					        </div>
			        <%} %>
			        <%if(errCode.equals("terminated")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Sorry! Your Account has been Terminated.Contact Administrator</h5>
					        </div>
			        <%} %>
			      
			      
			        <%if(errCode.equals("locked")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Your account has been locked.</h5>
					        </div>
			        <%} %>
			      
					<%if(errCode.equalsIgnoreCase("err")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Sorry!</h5>
					        </div>
					        <%} %>
					<%if(errCode.equalsIgnoreCase("help")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Check your Username or Email</h5>
					        </div>
					        <%} %>
					
						<%if(errCode.equalsIgnoreCase("notsent")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Email not sent.Pleace try again.</h5>
					        </div>
					        <%} %>
						<div class="control-group-merged">
						
						<div class="control-group">
								<input type="text" placeholder="Username" name="username" id="username" class="big required" autocomplete="off">
							</div>
							<div class="control-group">
								<input type="text" placeholder="Email" name="email" id="email" class="big required" autocomplete="off">
							</div>
							
						</div>
					<div class="control-group">
							
						</div>
						<div class="form-actions">
							<input type="hidden" name="forgotaction" id="forgotaction" value="forgotloginUser" >
							<button type="submit" class="btn btn-success btn-block btn-large">Continue</button><br>
							<a class="list-group-item" href="index.jsp"><i class="fa fa-arrow-left" aria-hidden="true" ></i>Back</a>
						</div>
						
						
					</form>
				</section>
				
				
			</div>

		</div>

	    
    </div>


<!-- Core Scripts -->
	<script src="assets/js/libs/jquery-1.8.3.min.js"></script>
	<script src="assets/js/libs/jquery.placeholder.min.js"></script>
    
    <!-- Login Script -->
    <script src="assets/js/login.js"></script>

    <!-- Validation -->
    <script src="plugins/validate/jquery.validate.min.js"></script>
    
    <!-- Uniform Script -->
    <script src="plugins/uniform/jquery.uniform.min.js"></script>

</body>
</html>