<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.dao.*"%>
<%@page import="com.evidu.bank.model.*"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import="com.evidu.bank.passwordgenerator.*"%>

<%
	if (session.getAttribute("userId") == null || session.getAttribute("userId").equals("")){
		response.sendRedirect("index.jsp");
	}
	String view = "" + request.getParameter("view");
	String userId = "", userCompId = "";
	userId = (String)session.getAttribute("userId");
	userCompId = (String)session.getAttribute("userCompId");
	System.out.println("userId & userCompId (msg 4) " +userId+" "+userCompId);
	String start="";
	 start=""+request.getParameter("start");
	 String action =""+request.getParameter("action");
	System.out.println("Strart of the page (msg 5)- "+start);
	
%>
<%
UserInfo userData = new UserInfo();
userData = (UserInfo) session.getAttribute("current_user");
String orgname=userData.getOrganization();
String createdBy=userData.getCreated_by();
	String logoname=null;
	OrgInfo orginfo2=new OrgInfo();
	  OrgVO organizationvo2=new OrgVO();
	  OrgDAO orgDAO2 = new  OrgDAO ();
	  
	  List<OrgVO> arrList2 = orgDAO2.getLogo();
	  
	  System.out.println("arrlist 2 size in usercreator - "+arrList2.size());
	  for (int i = 0; i < arrList2.size(); i++) {
		  System.out.println("arrlist 2 organization - "+arrList2.get(i).getORGANIZATION_NAME());
		  String x=arrList2.get(i).getORGANIZATION_NAME();
		  if(orgname.equals(x))
		  {
			  logoname=arrList2.get(i).getORGANIZATION_LOGO();
		  }
		
		
	}
	  System.out.println("logoname "+logoname);
	
	
	
	
	%> 

	<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->

<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Stylesheet -->
<link rel="shortcut icon" href="assets/images/uoklogo.png" type="image/x-icon">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	media="all">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css"
	media="all">
<link rel="stylesheet" href="assets/sweetalerts/sweetalert2.min.css">
<!-- jquery-ui Stylesheets -->
<link rel="stylesheet" href="assets/jui/css/jquery-ui.css"
	media="screen">
<link rel="stylesheet" href="assets/jui/jquery-ui.custom.css"
	media="screen">
<link rel="stylesheet"
	href="assets/jui/timepicker/jquery-ui-timepicker.css" media="screen">

<!-- Uniform Stylesheet -->
<link rel="stylesheet" href="plugins/uniform/css/uniform.default.css"
	media="screen">

<!-- Plugin Stylsheets first to ease overrides -->

<!-- Wizard Stylesheet -->
<link rel="stylesheet" href="custom-plugins/wizard/wizard.css">

<!-- End Plugin Stylesheets -->

<!-- Main Layout Stylesheet -->
<link rel="stylesheet" href="assets/css/fonts/icomoon/style.css"
	media="screen">
<link rel="stylesheet" href="assets/css/main-style.css" media="screen">



<!-- dfd -->

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Bootstrap Stylesheet -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	media="all">

<!-- jquery-ui Stylesheets -->
<link rel="stylesheet" href="assets/jui/css/jquery-ui.css"
	media="screen">
<link rel="stylesheet" href="assets/jui/jquery-ui.custom.css"
	media="screen">
<link rel="stylesheet"
	href="assets/jui/timepicker/jquery-ui-timepicker.css" media="screen">

<!-- Uniform Stylesheet -->
<link rel="stylesheet" href="plugins/uniform/css/uniform.default.css"
	media="screen">

<!-- Plugin Stylsheets first to ease overrides -->

<!-- msgBox -->
<link rel="stylesheet" href="plugins/msgbox/jquery.msgbox.css"
	media="screen">

<!-- pnotify -->
<link rel="stylesheet" href="plugins/pnotify/jquery.pnotify.css"
	media="screen">

<!-- End Plugin Stylesheets -->

<!-- Main Layout Stylesheet -->
<link rel="stylesheet" href="assets/css/fonts/icomoon/style.css"
	media="screen">
<link rel="stylesheet" href="assets/css/main-style.css" media="screen">

<!-- fixed footer -->
<link rel="stylesheet" href="assets/css/fixed_footer.css" media="screen">
<!-- dfd -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>


<title>OVS</title>
<!-- Global site tag (gtag.js) - Google Analytics -->
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123964987-1"></script> -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-123964987-1');
</script>

<script>
    $('.checkbox-group.required :checkbox:checked').length > 1
    </script>

<style>

.row1{
width:790px;
}
.container1{
width:790px;
}
.ui-dialog-buttonset{
float:left;
}
    
td {
    padding: 5px;
}
.ui-dialog { position: fixed; padding: .1em; width: 300px; overflow: hidden; }

.ui-dialog .ui-dialog-buttonpane { 
    text-align: center;
}
.ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset { 
    float: none;
}

.hasTooltip span {
    display: none;
    color: #000;
    text-decoration: none;
    padding: 3px;
}

.hasTooltip:hover span {
    display: block;
    position: absolute;
    background-color: #FFF;
    border: 1px solid #CCC;
    margin: 2px 10px;
}
input[type=radio] {
    width: 25px;
    height: 25px;
}
</style>






<%
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = index.jsp");
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>
<title>OVS</title>
<!-- Global site tag (gtag.js) - Google Analytics -->
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123964987-1"></script> -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-123964987-1');
  window.history.forward();
  function noBack() { 
  	window.history.forward(); 
  }
</script>








</head>

<body data-show-sidebar-toggle-button="false" data-fixed-sidebar="false">

<%
			String errCode = "" + request.getParameter("st");
			userData = (UserInfo) session.getAttribute("current_user");
			String current_user = userData.getUser_id();
			String current_user_id = userData.getUser_auto_id();
			System.out.println("****current_user_id**"+current_user_id);
			

			if (userData == null) {
					System.out.println("****@@@@@@@@@1**");
					response.sendRedirect("index.jsp");
				return;
			}
			List<UserPages> pageList= new ArrayList<UserPages>();
			  //ession.setAttribute("currentUserPages", pageList);
			  pageList= (List<UserPages>)session.getAttribute("currentUserPages");
			  System.out.println("orgname1= "+orgname);
			  System.out.println("createdBy= "+createdBy);
			  System.out.println("userid= "+current_user);
			  System.out.println("****@@@@@@@@@1**"+pageList.size());
			  boolean pgSt=false;
			  String[] userRolesArr=userData.getUsertype().split(",");
			   for(int j=0;j<userRolesArr.length;j++){ 
			   if(userRolesArr[j].equals("Add Voters")){
			    pgSt=true;
			    System.out.println("****@@@@@@@@@2**"+pgSt);
			   }
			  }
			   System.out.println("****@@@@@@@@@2.1**"+pgSt);
			  if(!pgSt){
			   response.sendRedirect("index.jsp");
			   return;
			  }

			List<Account> pendingStatusList = new ArrayList<Account>();
			List<Account> rejectStatusList = new ArrayList<Account>();
			String satatus = "CHECKED";

			
	%>

	
	<%
	
	//String logoname=null;
	//OrgInfo orginfo2=new OrgInfo();
	 // OrgVO organizationvo2=new OrgVO();
	  //OrgDAO orgDAO2 = new  OrgDAO ();
	  
	  //List<OrgVO> arrList2 = orgDAO2.getLogo();
	  
	  System.out.println("arrlist 2 size in usercreator - "+arrList2.size());
	  for (int i = 0; i < arrList2.size(); i++) {
		  System.out.println("arrlist 2 organization - "+arrList2.get(i).getORGANIZATION_NAME());
		  String x=arrList2.get(i).getORGANIZATION_NAME();
		  if(orgname.equals(x))
		  {
			  logoname=arrList2.get(i).getORGANIZATION_LOGO();
		  }
		
		
	}
	  System.out.println("logoname "+logoname);
	
	
	
	
	%> 
	

	<div id="wrapper">
		<header id="header" class="navbar navbar-inverse">
			<div class="navbar-inner">
				<div class="container">
					<div class="brand-wrap pull-left">
						<div class="brand-img">
							<a class="brand" href="#"><img id="imgbox"
								src="" alt=""
								style="width: 75px;height:65px; position: relative; left: -17px;">
							</a>
						</div>
					</div>

					<div id="header-right" class="clearfix">

						

						<div id="header-functions" class="pull-right">
							<div id="user-info" class="clearfix">
								<span class="info"> Welcome <span class="name"><%=userData.getName()%></span>
								</span>
								<div class="avatar" id="passrest">
                                	<a class="dropdown-toggle" href="#" data-toggle="dropdown" onclick="passwordReset()">
                                    	<img src="assets/images/defaltUser.png" alt="Avatar">
                                    </a>
                                   <ul class="dropdown-menu pull-right">
                                    	 <li><a href="AccountSetting.jsp"><i class="icos-refresh-3"></i>Reset Password</a></li>
                                    	                                       
                                        <li class="divider"></li>
                                        <li><a href="index.jsp"><i class="icol-key"></i> Logout</a></li> 
                                    </ul>
                                </div>
							</div>
							<div id="logout-ribbon">
								<a href="index.jsp"><i class="icon-off"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div id="content-wrap">
			<div id="content" class="sidebar-minimized">
				<div id="content-outer">
					<div id="content-inner">
						<aside id="sidebar">
							<nav id="navigation" class="collapse">
								<ul>
									 <%for(int i=0;i<pageList.size();i++){ %>
                             <%if(pageList.get(i).getAutoId().equals("9") ){ %>
                               <li class="active"  >
                              <%}else{ %>
                               <li  >
                              <%} %><a href="<%=pageList.get(i).getPageName() %>" >
                                     <span title="<%=pageList.get(i).getSpanTitle()%>">
                                      <i class="<%=pageList.get(i).getIclass()%>"></i>
          								 <span class="nav-title"><%=pageList.get(i).getSpanTitle()%></span>
                                        </span>
                                     </a>
                                    </li>
                             <%} %> 
								</ul>
							</nav>
						</aside>

						<div id="sidebar-separator"></div>

						<section id="main" class="clearfix">
							<div id="main-header" class="page-header">
							<!-- 	<ul class="breadcrumb">

									<li><i class="icos-home"></i>Home <span class="divider">&raquo;</span>
									</li>
								</ul> -->

								<h3 id="main-heading">Add Candidates</h3>
							
							
									
								
													
							</div>

							<div id="main-content">
			<div class="container1">
									<div class="row1">
									
									
					<table>
					<tr><td>
												<label for="selel"
												class="control-group" ><b>Select an Election: </b> </label></td><td> <select name="selel" id="selel"  ><option value="" selected disabled hidden>Choose here</option>
												 <%
												
												
												  ElectionsVO electionvo=new ElectionsVO();
												 ElectionDAONEW electiondao=new ElectionDAONEW();
												 
												 List<ElectionsVO> arrList01 = electiondao.getElectionInfo2();
												  for (int i = 0; i < arrList01.size(); i++) {
													%>
													<option><%=arrList01.get(i).getElection_name() %></option>
												<%} %>  
												
												
											</select> 
											</td>
											</tr>
											</table>
											
											 
											 </div>
											 </div>
											 <hr>
						

							
							

												
								
								
								
							<br>
	<div id="main-content">
	<div class="w3-card-4">

<header class="w3-container w3-dark-grey" >
  <h3>Add New Candidate</h3>
</header>

<div class="w3-container">
  
  <div id="form-add-new-candidate" title="Add New Candidate" >
									<form id='add-candidate' method="POST" action="/CommonModule/OrganizationCreate" onSubmit="return success1(this)"  enctype="multipart/form-data">
									

									<table>
										<div>
											<!-- <h3>Add New Candidate</h3> -->
											<tr> <td>
											<label for="cname" class="control-group"><b>Candidate Name:<span class="required">*</span></b></label>
											<input type="text" name="cname" 
												id="cname"  class="span4" placeholder="Name" onchange="ValidateRealName()" style="height:25px"  />
												<br>
											
											
											</td>
											
											
											<td>
											<label for="department" class="control-group"><b>Department:<span class="required">*</span></b>
												</label> <input type="text" class="span4" name="department"
												id="department" placeholder="Department" style="height:25px" > 
											<td></tr>
											
											<tr><td>
											<label for="contactno" class="control-group"><b>Contact Number:<span class="required">*</span></b>
												</label> <input type="text" class="span4" name="contactno"
												id="contactno"  placeholder="Contact No" onchange="checkMobileNo1()" style="height:25px"> 
											</td>
  
										<td>
												<label
												for="email1" class="control-group" ><b>Email:<span class="required">*</span></b></label> <input
												type="text" name="email1" id="email1" class="span4"
												placeholder="Email" onchange="checkEmail1()" style="height:25px"/>
												 
												</td> 
											
											
											</tr>
											
											<tr> <td>
												<label
												for="position" class="control-group" ><b>Position:<span class="required">*</span></b></label> 
												<input type="radio" name="position" id="p" value="President" /> President&nbsp&nbsp&nbsp&nbsp
												 <input type="radio" name="position" id="vp" value="vice president"/>Vice President&nbsp&nbsp&nbsp&nbsp
												  <input type="radio" name="position" id="s" value="Secretary"/>Secretary&nbsp&nbsp&nbsp&nbsp
												  <input type="radio" name="position" id="t" value="Treasurer"/>Treasurer&nbsp&nbsp&nbsp&nbsp
												    <input type="radio" name="position" id="m" value="Member"/>Member
												  
												  <input type="hidden" id="position1" name="position1" value="0"> 
												</td> 
												
												 <td>
												
												</td> </tr>
												<tr>
												<td style="vertical-align:botom">
											<label for="logo" class="control-group"><b>Upload Photo:</b></label>
											<input type="file" name="photo" id="photo"
												 class="span4" onchange="readURL(this);" accept="image/png,image/jpg,image/jpeg" />
												 </td><td>
												 <img name="blah" id="blah" src="#" style="border:solid" /> 
												 
												<!--  <input type="hidden" id="image" name="image" value="0">   -->
												<br>	
											</td>
											<td><button type="button" class="btn btn-danger" style="vertical-align:text-bottom" id="clrBtn" onclick="clearFn()">Clear</button></td>
											</tr>
											
										
											
											
											
											</div>
											</table>
											</form>

											</div>
</div>

<button class="w3-button w3-block w3-indigo" id="addCandidate" onclick="addCandidate()"><b>+ Add Candidate</b></button>

</div>
	
	
	
	
	

											</div>
											

						</section>
					</div>
                        
                        
										</div>
										
										
											

					</div>
												
												

</div>


</div>
<br><br>



<footer id="footer" class="footerFixed">
 <div class="footer-left">Designed by - <a target="_blank" rel="noopener noreferrer" href="http://www.uok.lk">UOK</a></div>
<div class="footer-right"><p>Copyright 2018 - University of Kelaniya. All Rights Reserved.</p></div>
 </footer>

 <script type="text/javascript">
 
 function addCandidate(){
	 var electionname=document.getElementById('selel').value;
	
	//alert(electionname);
	 if(electionname=""||electionname==false){
		 swal({title: "Alert", text: "Please select a Election.", icon: "warning",});
	 }
	
	 else{
	 
	 var electionname=document.getElementById('selel').value;
	// document.getElementById('electionname').value=electionname;
	
	//alert(electionname);
	 var positions = document.getElementsByName('position');

	 for (var i = 0, length = positions.length; i < length; i++)
	 {
	  if (positions[i].checked)
	  {
	   document.getElementById('position1').value=positions[i].checked;
	   //alert(positions[i].value);

	   
	   break;
	  }
	 }
	    
	   // alert(document.getElementById('position1').value);
	   	
	 var fileName = document.getElementById('photo').value;
	 //document.getElementById('image').value=fileName;
	 //alert(document.getElementById("image").value);
 	var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
 	
 	var file=fileName.split('\\');
 	var filename=file[2];
 	//alert(filename);
 	
 	
 	
 	
 	
 	 var form= new FormData($("#add-candidate")[0]);
	 if(ext == "png" || ext == "PNG"||ext == "jpeg" ||ext == "JPEG" ||ext == "JPG" ||ext == "jpg" )
 	{
 		jQuery.ajax({
     	    url: "CandidateController.jsp?electionname="+electionname+"&image="+filename,
     	    data: form,
     	    cache: false,
     	    contentType: false,
     	    processData: false,
     	    type: 'POST',
     	    success: function(data){
     	   //alert(data.trim());
     	         	        	
     	        	
     	        	try{
     	        		var obj = JSON.parse(data);
     	        		if(obj.countList[0]=="2"){
     	        		swal({title: "Success", text: "Canidate Added successfully.", icon: "success",});	
     	        		
     	        		}
     	        		else{
     	        			swal({title: "Alert", text: "Candidate Not added succesfully.", icon: "warning",});
     	        		}
     	        	}catch( e){
     	        		swal({title: "Alert", text: "Candidate Not added succesfully.", icon: "warning",});
     	        		//alert(e);
     	        	}
     	        	   	       
     	          	      
     	    }
     	});
 		}
 	else
 	{
 		//alert("Please upload a CSV file.");
 		swal({title: "Alert", text: "Please upload a JPG/JPEG or PNG image.", icon: "warning",});
 		document.getElementById('photo').value="";
 	document.getElementById('blah').src="#";
 		return false;
 	}
	 
	 document.getElementById("add-candidate").reset();
		document.getElementById('blah').src="#";
 }
 }
 
 function checkMobileNo1(){
		var mobnum=document.getElementById("contactno").value;
		if(mobnum.length==11){
			if(mobnum.startsWith("94")){
				//valid
				//disableTestFun();
				return true;
				
			}else{
				//error
				 document.getElementById("contactno").value = "";
				//alert("Enter a valid mobile number.");
				swal({title: "Alert", text: "Enter a valid mobile number begin with 94.", icon: "warning",});
				//$("#testingNo").val('');
	   		 	//$("#testingNo").focus();
	   		 	
	   		 	return false;
			}
		}else if(mobnum.length==10){
			if(mobnum.startsWith("0")){
				//valid
				//disableTestFun();
				return true;
				
			}else{
				//error
				 document.getElementById("contactno").value = "";
				//alert("Enter a valid mobile number.");
				swal({title: "Alert", text: "Enter a valid mobile number.", icon: "warning",});
				//$("#testingNo").val('');
	   		 	//$("#testingNo").focus();
	   		 	
	   		 	return false;
			}
		}else{
			//error
				 document.getElementById("contactno").value = "";
			//alert("Enter a valid mobile number.");
			swal({title: "Alert", text: "Enter a valid mobile number.", icon: "warning",});
			//$("#testingNo").val('');
			 	//$("#testingNo").focus();
			 
			 	return false;
		}
		
	}


	function checkEmail1(){

		
	    var email = document.getElementById("email1");
	    var filter =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;;

	    if (!filter.test(email.value)) {
	        document.getElementById("email1").value= "";
	   
	    //alert('Please provide a valid email address');
	    swal({title: "Alert", text: "Please provide a valid email address!", icon: "warning",});
	    email.focus;
	    return false;
	 }
		
	}
	function ValidateRealName() 
	{
	    var val = document.getElementById('cname').value;
	    
	    if (!val.match(/^[a-z A-Z. ]+$/)) 
	    {
	    	swal({title: "Alert", text: "Please provide a valid Name!", icon: "warning",});
	    	$("#cname").val('');
	        return false;
	       
	    }
	    
	}
 
 function readURL(input) {
	 
		
	 debugger;
	

     if (input.files && input.files[0]) {
         var reader = new FileReader();

         reader.onload = function (e) {
             $('#blah')
                 .attr('src', e.target.result)
                 .width(150)
                 .height(150);
         };

         reader.readAsDataURL(input.files[0]);
     }
 }
 
 
 function clearFn(){
	 
	 $("#cname").val('');
	 $("#contactno").val('');
	 $("#department").val('');
	 $("#email1").val('');
	 document.getElementsByClassName("position").checked=false;
	 $('#photo').val('');
	 document.getElementById('blah').src="#";
	 document.getElementById('p').checked=false;
	 document.getElementById('vp').checked=false;
	 document.getElementById('s').checked=false;
	 document.getElementById('m').checked=false;
	 document.getElementById('t').checked=false;;
 }
 </script>
 
 
 
   <script type="text/javascript">
 
	
	var lgname="uoklogo.png";
	//alert(lgname);

	document.getElementById('imgbox').src = "assets/images/company_logo/"+lgname+"";
	
	$( document ).ready(function() {
		document.getElementById('blah').src="#";
	});
	</script>
   
   </script>
<!-- Core Scripts -->
	<script src="assets/js/libs/jquery-1.8.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/libs/jquery.placeholder.min.js"></script>
	<script src="assets/js/libs/jquery.mousewheel.min.js"></script>

    <!-- Template Script -->
    <script src="assets/js/template.js"></script>
    <script src="assets/js/setup.js"></script>

    <!-- Customizer, remove if not needed -->
    <script src="assets/js/customizer.js"></script>

    <!-- Uniform Script -->
    <script src="plugins/uniform/jquery.uniform.min.js"></script>
    
    <!-- jquery-ui Scripts -->
   <!--  <script src="assets/jui/js/jquery-ui-1.9.2.min.js"></script>
    <script src="assets/jui/jquery-ui.custom.min.js"></script>
    <script src="assets/jui/timepicker/jquery-ui-timepicker.min.js"></script>
	<script src="assets/jui/jquery.ui.touch-punch.min.js"></script> -->
	
    
    <!-- Plugin Scripts -->
    
	<!-- Validation -->
	<script src="plugins/validate/jquery.validate.min.js"></script>
	
	<!-- Wizard -->
<script src="custom-plugins/wizard/wizard.min_edited.js"></script>
	<script src="custom-plugins/wizard/wizard.js"></script>
    <script src="custom-plugins/wizard/jquery.form.min.js"></script>

    <!-- Demo Scripts -->
    <script src="assets/js/demo/form_wizard.js"></script>
    
    <!-- Plugin Scripts -->



	    <!-- Demo Scripts -->
	    <script src="assets/js/demo/alerts.js"></script>
		
    <!-- Zebra Datepicker -->
    <!-- <script src="plugins/zebradp/zebra_datepicker.min.js"></script> -->

	
    <!-- Demo Scripts -->
	<script src="assets/js/demo/dataTables.js"></script>
    <script src="assets/js/demo/ui_comps.js"></script>
    
	<!--     button logics -->
    <script src="assets/js/buttonLogics.js"></script>
</body>
</html>