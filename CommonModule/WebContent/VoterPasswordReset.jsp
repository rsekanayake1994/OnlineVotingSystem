<%@ page import="java.util.*"%>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	int timeout = session.getMaxInactiveInterval();
	response.setHeader("Refresh", timeout + "; URL = index.jsp");
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	//session.invalidate();
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("basepath>>>>>>>>>>>>>>>>>>>>>>>>" + basePath);

	//if (request.getParameter("username") == null) {
	//	response.sendRedirect("index.jsp");
	//}
%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->

<!-- <script src="http://wcetdesigns.com/assets/javascript/jquery.js"></script> -->
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Stylesheet -->
<link rel="stylesheet"
	href="bootstrap/css/bootstrap.min.css" media="screen">

<!-- Uniform Stylesheet -->
<link rel="stylesheet"
	href="plugins/uniform/css/uniform.default.css"
	media="screen">

<!-- Plugin Stylsheets first to ease overrides -->

<!-- End Plugin Stylesheets -->

<!-- Main Layout Stylesheet -->
<link rel="stylesheet"
	href="assets/css/fonts/icomoon/style.css" media="screen">
<link rel="stylesheet" href="assets/css/login.css"
	media="screen">
<link rel="stylesheet" href="plugins/zocial/zocial.css"
	media="screen">


<script type="text/javascript">
	function checkSet() {
		var set = document.getElementById('new').value;
		var confrm = document.getElementById('confirm').value;
		var errCount = 0;
		/*if (set != null || set != "") {
			if(confrm != ""){
				document.getElementById('show').innerHTML = "You should set password first!";
				return false;
			}
			else if (set.length < 5) {
				document.getElementById('show').innerHTML = "Password should contain atleast 5 charcters!";
				return false;
				errCount++;
			} else {
				var re1 = /[0-9]/;
				if (!re1.test(set)) {
					document.getElementById('show').innerHTML = "Password should contain at least one number (0-9)!";
					return false;
					errCount++;
				}
				var re2 = /[a-z]/;
				if (!re2.test(set)) {
					document.getElementById('show').innerHTML = "Password should contain at least one lower case letter (a-z)!";
					return false;
					errCount++;
				}
				var re3 = /[A-Z]/;
				if (!re3.test(set)) {
					document.getElementById('show').innerHTML = "Password should contain at least one upper case letter (A-Z)!";
					return false;
					errCount++;
				}
				if (errCount == 0) {
					document.getElementById('show').innerHTML = "";
				}
			}

		} 

		if(confrm != null || confrm != "") {
			if (confrm.length < 5) {
				errCount++;
				return false;
			} else {
				var re1 = /[0-9]/;
				if (!re1.test(confrm)) {
					errCount++;
					return false;
				}
				var re2 = /[a-z]/;
				if (!re2.test(confrm)) {
					errCount++;
					return false;
				}
				var re3 = /[A-Z]/;
				if (!re3.test(confrm)) {
					errCount++;
					return false;
				}
				if (errCount == 0) {
					document.getElementById('show').innerHTML = "";
					return false;
				}
			}
		}
		if(errCount == 0){
			if(set == confrm) {
				document.getElementById('show').innerHTML = "";
				document.getElementById('submit').disabled = false;
			}
		}*/
		if (set == null || set == "") {
			document.getElementById('show1').innerHTML = "You should enter a new password";
			return false;
		}
		if (confrm == null || confrm == "") {
			document.getElementById('show1').innerHTML = "You should enter a new password";
			return false;
		}
		if ((set != null || set != "") && (confrm != null || confrm != "")) {
			if (set.length < 6) {
				document.getElementById('show1').innerHTML = "Password should contain atleast 6 charcters!";
				return false;
			} else {
				if (set == confrm) {
					var re1 = /[0-9]/;
					if (!re1.test(set)) {
						errCount++;
					}
					var re2 = /[a-z]/;
					if (!re2.test(set)) {
						errCount++;
					}
					var re3 = /[A-Z]/;
					if (!re3.test(set)) {
						errCount++;
					}
					var re4 = /[~`!#$%\^&*+=\-\[\]\\;,/{}|\\":<>\?]/;
					if (!re4.test(set)) {
						errCount++;
						//alert(errCount);
					}
					if (errCount>1) {
						document.getElementById('show1').innerHTML = "Your password must have 3 of the following.<br>";
						document.getElementById('show2').innerHTML = "<ul><li>Upper case letters.</li><li>Lowercase letters.</li><li>Special characters.</li><li>A numeric letter.</li></ul>";
						return false;
					}
					if (errCount == 1){
						return true;
					}
				}
				else{
					document.getElementById('show1').innerHTML = "Entered Passwords are not matching!";
					return false;
				}
			}
		}
	}
</script>
<title>OVS- Login</title>

</head>

<body>
	<!-- onLoad="load_em()" -->
	<%
		String errCode = "" + request.getParameter("err");
	%>
	<%
	String user = (String)request.getSession().getAttribute("id"); 
	System.out.println("!!!!!####"+user);
	%>
	<div id="login-wrap">
		<div id="login-inner" class="login-inset">
			<div id="login-buttons">
				<img border="0" src="assets/images/uoklogo.png" width="60" height="60">
			</div>
			<div id="login-circle">
				<section id="update-form" class="login-inner-form">
					<h1>Reset Password</h1>
					<form class="form-vertical" action="loginController.jsp" method="post"
						onsubmit="return validation()" form="password">
						<%if(errCode.equals("err1")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Choose a password you haven't used within 90 days.</h5>
					        </div>
			        	<%} %>
			        	<%if(errCode.equals("err4")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">You should reset your password.</h5>
					        </div>
			        	<%} %>
						<div class="control-group-merged">
							<div class="control-group">
								<input type="password" placeholder="Enter New Password"
									name="new" id="new" class="big">
							</div>
							<div class="control-group">
								<input type="password" placeholder="Confirm New Password"
									name="confirm" id="confirm" class="big" autocomplete="off">
							</div>
							<div class="control-group">
								<div id="mydiv1" class="mydiv"></div>
							</div>
							<div class="control-group">
								<font color="red"><div id="show1" class="show" style="margin-top:10px;"></div></font>
								<font color="green"><div id="show2" class="show"></div></font>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" id="submit"
								class="btn btn-danger btn-block btn-large"
								onclick="return checkSet()">Submit</button>
							<input type="hidden" name="action" id="action"
								value="initialResetVoter">
						</div>
					</form>
				</section>
			</div>
		</div>

		<!-- <div id="login-social" class="login-inset">
	    	<button class="zocial facebook">Connect with Facebook</button>
	    	<button class="zocial twitter">Connect with Twitter</button>
	    </div> -->
	</div>

	<!-- Core Scripts -->
	<script src="assets/js/libs/jquery-1.8.3.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script src="assets/js/libs/jquery.placeholder.min.js"></script>

	<!-- Login Script -->
	<script src="assets/js/login.js"></script>

	<!-- Validation -->
	<script src="plugins/validate/jquery.validate.min.js"></script>

	<!-- Uniform Script -->
	<script src="plugins/uniform/jquery.uniform.min.js"></script>

</body>

</html>
