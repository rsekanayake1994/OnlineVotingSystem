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
	
	String msg=""+request.getParameter("msg");
	
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
.btn btn-primary pull-right{
    visibility: hidden;
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
                             <%if(pageList.get(i).getAutoId().equals("8") ){ %>
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
								<!-- <ul class="breadcrumb">

									<li><i class="icos-home"></i>Home <span class="divider">&raquo;</span>
									</li>
								</ul> -->

								<h3 id="main-heading">Add Voters</h3>
							
							
									
								
													
							</div>

							<div id="main-content">
			<div class="container1">
									<div class="row1">
									
									
					<table>
					<tr><td>
												<label for="selel"
												class="control-group" ><b>Select an Election: </b> </label></td><td> <select name="selel" id="selel" onchange="buttonHide()" ><option value="" selected disabled hidden>Choose here</option>
												 <%
												
												
												  ElectionsVO electionvo=new ElectionsVO();
												 ElectionDAONEW electiondao=new ElectionDAONEW();
												 
												 List<ElectionsVO> arrList01 = electiondao.getElectionInfo();
												  for (int i = 0; i < arrList01.size(); i++) {
													%>
													<option ><%=arrList01.get(i).getElection_name() %></option>
												<%} %>  
												
												
											</select> 
											</td>
											</tr>
											</table>
											
											 
											 </div>
											 </div>
											 <hr>
								

								<div class="row-fluid">
									<div id="pending_status_summery">
										<div class="controls">
										
										
										</div>
									</div>

								</div>

						
								
								
								
							<br>

											<div id="main-content">
                             <div id='static_cam_div'>
								<div class="row-fluid">
								
									<div class="span12 widget">
										<div class="widget-header">
											<span class="title"><i class="icol-wand"></i> Add Voters</span>
											<div class="toolbar">
												<div class="btn-group">
													<span class="btn" rel="popover" data-trigger="hover" data-placement="left" data-html="true" data-content='<code>[data-forward-only="true"]</code>' title="Standard Wizard">
													</span>
												</div>
											</div>
										</div>
									<div class="widget-content form-container">
											<form id="wizard-demo-1" class="form-horizontal" enctype="multipart/form-data" method="post" action="SendEmailNsms.jsp" data-forward-only="false">
											<input type="hidden" name="action" id="action" value="formSubmit">
											
											<input type="hidden" id="electionname" name="electionname" value="0">
											
																	
												<fieldset class="wizard-step">
													<legend class="wizard-label"><i class="icon-upload-2"></i>Upload CSV</legend>
													
													
													<div class="control-group">
												
													<label class="control-label">Upload CSV <span class="required">*</span></label>
																	<div class="controls">
																	
																		<input type="file" accept=".csv" name="excelfile" id="excelfile" data-provide="fileinput" style="width: 220px;" class="required span12" onchange="disableFun();chkFileType();">
																		<button type="button" id="submitVoterListBtn" name ="submitVoterListBtn" class="btn btn-primary" onclick="submitVoterListFun()" >Submit Voter List</button>
																	
														
														
																	</div>
																	
													
														
													</div>
							
												</fieldset>
												
											<fieldset class="wizard-step"  >
													<legend class="wizard-label"><i class="icon-check"></i> Generate Passwords</legend>
													
													<div  class="control-group">
													<table style="font-size: larger;">
														<tr>
															<td>Total Voter Count : </td><td id="totoalCount"></td>
														</tr>
													
														<tr>
														<td></td><td><button type="button" id="generatepwd" name ="generatepwd" class="btn btn-primary" onclick="generatePassword()" >Generate Passwords</button></td>
														<td>
														</tr>
															
													</table>
																</div>																																
																										
													
												</fieldset> 
												
						</form>						

</div>
						
			
	
		
		
		<footer id="footer" class="footerFixed">
            <div class="footer-left">Designed by - <a target="_blank" rel="noopener noreferrer" href="http://www.uok.lk">UOK</a></div>
            <div class="footer-right"><p>Copyright 2018 - University of Kelaniya. All Rights Reserved.</p></div>
        </footer>
		<script type="text/javascript">
		
		$(document).ready(function () {

			document.getElementById('submitVoterListBtn').disabled = true;
		
	                    $("#btnSubmit").prop("disabled", true);
	                	var elems = document.getElementsByClassName("btn");
	                	for(var i = 0; i < elems.length; i++) {
	                		if(i==5){
	   			    	    	elems[i].disabled = true;
	   			    
	   			    	    	//alert(0);
	   			    		}	
	    		    		
	   		    	
	   		    		if(i==6){
   			    	    	elems[i].disabled = true;
   			    	    	//alert(0);
   			    		}
	   		    		if(i==7){
   			    	    	elems[i].disabled = true;
   			    	    	//alert(0);
   			    		}
	                	}
	    }); 
		
		
		</script>
		<script>
		
		function buttonHide(){
			 //var selectBox = document.getElementById("selel");
			    //var selectedValue = selectBox.options[selectBox.selectedIndex].value;
			    //alert(selectedValue);
			document.getElementById('submitVoterListBtn').disabled = false;
			  
			
		}
		</script>
		
		<script>
		
	
		
		
		 function disableFun(){
		    	var elems = document.getElementsByClassName("btn");
		    	
		    	for(var i = 0; i < elems.length; i++) {
		    		
		    		
		    		 if(i==0){
			    	    	//elems[i].disabled = true;
			    	    	//alert(0);
			    		}
		    		/* if(i==1){
			    	    	//elems[i].disabled = true;
			    	    	alert(1);
			    		}
		    		 if(i==2){
			    	    	//elems[i].disabled = true;
			    	    	alert(2);
			    		}
		    		if(i==3){
		    	    	//elems[i].disabled = true;
		    	    	alert(3);
		    		}
		    		if(i==4){
		    	    	//elems[i].disabled = true;
		    	    	alert(4);
		    		} 
		    		if(i==5){
		    	    	//elems[i].disabled = true;
		    	    	alert(5);
		    		}
		    		if(i==6){//
		    	    	//elems[i].disabled = true;
		    	    	alert(6);
		    		}
		    	 if(i==7){//
		    	    	//elems[i].disabled = true;
		    	    	alert(7);
		    		} */
		    	}
		    }
		
	
		 
		</script>
		<script>
		 function submitVoterListFun(){
				var electionname=document.getElementById('selel').value;
		    	//alert(electionname);
		    	
		    	document.getElementById('electionname').value=electionname;
		    	
		    	//alert(document.getElementById('electionname').value);	
			 
			 var form = new FormData($("#wizard-demo-1")[0]);
		    	
		    
		    	var fileName = document.getElementById('excelfile').value;
		    	var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		    	
		    	if(ext == "csv" || ext == "CSV")
		    	{
		    		jQuery.ajax({
		        	    url: 'VoterController.jsp',
		        	    data: form,
		        	    cache: false,
		        	    contentType: false,
		        	    processData: false,
		        	    type: 'POST',
		        	    success: function(data){
		        	  //  alert(data.trim());
		        	     // if(data.trim()=='true'){
		        	        	
		        	        	
		        	        	try{
		        	        		var obj = JSON.parse(data);
			        	        	
		        	        	}catch( e){
		        	        		alert(e);
		        	        	}
		        	        	//alert("aas"+obj);
		        	        	//alert(obj.countList[0]);
		        	        	 document.getElementById('totoalCount').innerHTML = obj.countList[0];
		        	        	 
		        	      
		        	        	
		        	        	
		        	       
		        	        	swal({title: "Success", text: "Voter List submitted successfully.", icon: "success",});
		        	        	document.getElementById('selel').disabled = true;
		        	        	//  $("#btnSubmit").style.visibility=false;
		        	        	var elems = document.getElementsByClassName("btn");
		        	        	for(var i = 0; i < elems.length; i++) {
		        	        		
		        	        		
		        	        		if(i==6){//i=5 = submit no list
		        	        	    	elems[i].disabled = false;
		        	        	    	//alert(6);
		        	        		}
		        	        		if(i==7){//
		        	        	    	elems[i].disabled = false;
		        	        	    	//alert(7);
		        	        		}
		        	        		
		        	        	}
		        	     
		        	      
		        	    }
		        	});
		    	} 
		    	else
		    	{
		    		//alert("Please upload a CSV file.");
		    		swal({title: "Alert", text: "Please upload a CSV file.", icon: "warning",});
		    		document.getElementById('excelfile').value="";
		    		document.getElementById('excelfile').focus();
		    		return false;
		    	}
		    	
		    	
		    	
		    }
		 
		 
		 
		 
		
		 
		</script>
		
		
		<script>
		<%-- var lgname="<%=logoname%>"; --%>
		var lgname="uoklogo.png";
		//alert(lgname);

		document.getElementById('imgbox').src = "assets/images/company_logo/"+lgname+"";
		var elems2 = document.getElementsByClassName("btn");
		$(document).ready(function () {
			debugger;
			$(elems2[7]).prop("disabled",true);
		       /* checked = $("input[type=checkbox]:checked").length;

		      if(!checked) {
		        alert("You must check at least one checkbox.");
		       
		       
		           }
		      else{
		    	  elems2[7].prop("disabled",false);
		      }  */
		      
		      var msg="<%=msg%>";
		      if(msg=="sent"){
  	        	swal({title: "Success", text: "Emails and SMSs sent successfully.", icon: "success",});

		      }else if(msg=="notsent"){
		    	  swal({title: "Alert", text: "Emails and SMSs not sent successfully.Please retry", icon: "warning",});
		      }else
		    	  return;
		      

		    }); 
	
		
		$('.fuckyou').click(function() {
		    if ($(this).is(':checked')) {
		    
		    	 $(elems2[7]).prop("disabled",false);
		    	
		      //return confirm("Are you sure?");
		  
		     
		     
		    }
		    else{
		    	  $(elems2[7]).prop("disabled",true);
		    }
		  });
		
		
		
		</script>
		<script>
		
		function generatePassword(){
			 
			 var electionname=document.getElementById('selel').value;
		    	//alert(electionname);
		    	
		    		document.getElementById('electionname').value=electionname;
		    	
		  //  alert(document.getElementById('electionname').value);	
			 
			 var form = new FormData($("#wizard-demo-1")[1]);
			// alert(form);
				jQuery.ajax({
	        	    url: 'PasswordGenerator.jsp?electionname='+electionname,
	        	    data: form,
	        	    cache: false,
	        	    contentType: false,
	        	    processData: false,
	        	    type: 'POST',
	        	    success: function(data){
	        	   // alert(data.trim());
	        	     // if(data.trim()=='true'){
	        	        	
	        	        	
	        	        	try{
	        	        		var obj = JSON.parse(data);
	        	        		//alert("aas"+obj);
	        	        	}catch(e){
	        	        		alert(e);
	        	        	}
	        	        	//alert("aas"+obj);
	        	        	//alert(obj.countList[0]);
	        	        	// alert(obj.countList[0]);
	        	        	 
	        	      
	        	        	var success=obj.countList[0];
	        	        	if(success=="1"){
	        	       
	        	        	swal({title: "Success", text: "Passwords Generated successfully.", icon: "success",});
	        	        	document.getElementById('selel').disabled = true;
	        	        	document.getElementById('generatepwd').disabled = true;
	        	        	}
	        	        	else{
	        	        		swal({title: "Alert", text: "Passwords Not Generated.", icon: "warning",});
	        	        	}
	        	      
	        	    }
	        	});

			 
				}
		</script>
		<script type="text/javascript">
		 function readURL1(input) {
			 
				
			 debugger;
			
		
	         if (input.files && input.files[0]) {
	             var reader = new FileReader();

	             reader.onload = function (e) {
	                 $('#blah')
	                     .attr('src', e.target.result)
	                     .width(100)
	                     .height(100);
	             };

	             reader.readAsDataURL(input.files[0]);
	         }
	     }
		 
		 function checkeditFileSize(file){
				
			 var FileSize = file.files[0].size / 1024 / 1024; // in MB
		       if (FileSize > 0.0096) {
		       	
		      // debugger;
		          // alert('File size exceeds 2 MB');
		          debugger;
		          document.getElementById('blah').style.visibility='hidden';
		          // swal({title: "Alert", text: "File size exceeds 10KB.", icon: "warning",});
		        alert("File size exceeds 10KB");
		           $(file).val(''); //for clearing with Jquery
		       
		       } else {
		       	 document.getElementById('blah').style.visibility='visible';
		       }

		}
		 
		 
		</script>
		<script>
		
		 function chkFileType() {
		    	var fileName = document.getElementById('excelfile').value;
		    	var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		    	if(fileName == "" || fileName == null){
		    		//alert("Please upload a file of CSV type");
		    		swal({title: "Alert", text: "Please upload a file of CSV type", icon: "warning",});
		    		document.getElementById('excelfile').focus();
		    		return false;
		    	}
		    	if(ext == "csv" || ext == "CSV")
		    	{
		    		return true;
		    	} 
		    	else
		    	{
		    		//alert("Upload CSV type files only");
		    		swal({title: "Alert", text: "Upload CSV type files only", icon: "warning",});
		    		document.getElementById('excelfile').value="";
		    		document.getElementById('excelfile').focus();
		    		return false;
		    	}
		    }
		
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
    <script src="assets/jui/js/jquery-ui-1.9.2.min.js"></script>
    <script src="assets/jui/jquery-ui.custom.min.js"></script>
    <script src="assets/jui/timepicker/jquery-ui-timepicker.min.js"></script>
	<script src="assets/jui/jquery.ui.touch-punch.min.js"></script>
	
    
    <!-- Plugin Scripts -->
    
	<!-- Validation -->
	<script src="plugins/validate/jquery.validate.min.js"></script>
	
	<!-- Wizard -->
<!-- 	<script src="custom-plugins/wizard/wizard.min_edited.js"></script> -->
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
		

