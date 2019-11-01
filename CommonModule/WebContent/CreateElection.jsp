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
			   if(userRolesArr[j].equals("Create Election")){
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
								style="width: 105px;height:65px; position: relative; left: -17px;">
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
								<ul class="breadcrumb">

									<li><i class="icos-home"></i>Home <span class="divider">&raquo;</span>
									</li>
								</ul>

								<h3 id="main-heading">Create an Election</h3>
								
						
		</div>
		
						<div id="main-content">
                             <div id='static_cam_div'>
								<div class="row-fluid">
								
									<div class="span12 widget">
										<div class="widget-header">
											<span class="title"><i class="icol-wand"></i> Campaign Configuration</span>
											<div class="toolbar">
												<div class="btn-group">
													<span class="btn" rel="popover" data-trigger="hover" data-placement="left" data-html="true" data-content='<code>[data-forward-only="true"]</code>' title="Standard Wizard">
													</span>
												</div>
											</div>
										</div>
<!-- 										<div class="widget-content form-container">
											<form id="wizard-demo-3" class="form-horizontal" enctype="multipart/form-data" method="post" action="campaignController.jsp" data-forward-only="false">
											<input type="hidden" name="action" id="action" value="start">
											<input type="hidden" name="camptype" id="camptype" value="std">
											<input type="hidden" id="cptestedid" name="cptestedid" value="0">
											<input type="hidden" id="cnamesave" name="cnamesave" value="0">
																	
												<fieldset class="wizard-step">
													<legend class="wizard-label"><i class="icon-book"></i>Campaign Info</legend>
													<input type="hidden" id="camaignID" name="camaignID">
													
													<div class="control-group">
														<label class="control-label">Election Name <span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="electionname" id="electionname" class="required span12" style="width: 220px;">
															<label  id="namediv" style="display: block;"></label>
														</div>
													</div>
													
													<div class="control-group">
																	<label class="control-label" for="input04">Election Type <span class="required">*</span></label>
																	
																	<div class="controls">
																		<input id="checkboxs1" type="checkbox"  class="span12 fuckyou" style="width: 50px;" name="option[]" value="President">President</option>
																		<input id="checkboxs2" type="checkbox"  class="span12 fuckyou" style="width: 50px;" name="option[]" value="Vice President">Vice President</option>
																	</div>
																	<div class="controls">
																		
																	<input id="checkboxs3"  type="checkbox" class="span12 fuckyou" style="width: 50px;" name="option[]" value="Secretary">Secretary
																	<input id="checkboxs4"  type="checkbox" class="span12 fuckyou" style="width: 50px;" name="option[]" value="Treasurer">Treasurer
																	</div>
																	<div class="controls">
																		<input id="checkboxs5"  type="checkbox" class="span12 fuckyou" style="width: 50px;" name="option[]" value="Editor">Editor&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																		<input id="checkboxs6"  type="checkbox" class="span12 fuckyou" style="width: 50px;" name="option[]" value="Member">Member
																	</div>
						
																
																	
																	</div>
												</fieldset>
												
												<fieldset class="wizard-step"  >
													<legend class="wizard-label"><i class="icon-check"></i> Add Candidates</legend>
													
													<div id="excelDiv" class="control-group">
													<table>
													<tbody>
													<tr>
													<td>
														<label class="control-label">Name <span class="required">*</span></label>
																	<div class="controls">
																	<input type="text" name="candidatename" id="candidatename" class="required span12" style="width: 220px;">
																		<label  id="namediv" style="display: block;"></label>
																	
																	</div>
																	
																	<label class="control-label">Email <span class="required">*</span></label>
																	<div class="controls">
																	<input type="email" name="emailaddress" id="candidateemail" class="required span12" style="width: 220px;">
																	<label  id="namediv" style="display: block;"></label>
																	</div>
																
																
							
																	<label class="control-label">Department <span class="required">*</span></label>
																	<div class="controls">
																	<input type="text" name="department" id="department" class="required span12" style="width: 220px;">
																	<label  id="namediv" style="display: block;"></label>
																	</div>
																	
																	</td>
																	<td>
																	</td>
																	<td>
																	</td><td>
																	</td>
																	<td>
																	
																	<label class="control-label">Telephone No <span class="required">*</span> </label>
																	<div class="controls">
																		<input type="number" maxlength="11" min="0" max="99999999999" name="testingNo" id="testingNo"  class=" span12 required" style="width: 220px;">
																		<label  id="namediv" style="display: block;"></label>
																	
																	</div>
																
																	<label class="control-label">City <span class="required">*</span></label>
																	<div class="controls">
																	<input type="text" name="city" id="city" class="required span12" style="width: 220px;">
																	<label  id="namediv" style="display: block;"></label>
																	</div>
																	
																	<label class="control-label">Age <span class="required">*</span> </label>
																	<div class="controls">
																		<input type="number" maxlength="3" min="30" max="200" name="pNo" id="pNo"  class=" span12 required" style="width: 220px;">
																		<label  id="namediv" style="display: block;"></label>
																	
																	</div>
																	</td>
																	</tr>
																	<tr>
																	<td>
																	<label class="control-label">Position <span class="required">*</span> </label>
																	<div class="controls">
																	<input type="radio" name="position" value="prsident" id="position"> President<br>
																	<input type="radio" name="position" value="prsident" id="position"> Vice President<br>
																	<input type="radio" name="position" value="prsident" id="position"> Secretary<br>
																	<input type="radio" name="position" value="prsident" id="position"> Treasurer<br>
																	<input type="radio" name="position" value="prsident" id="position"> Editor<br>
																	<input type="radio" name="position" value="prsident" id="position"> Member<br>
  
																		
																		<label  id="namediv" style="display: block;"></label>
																	
																	</div>
																	
																	</td>
																	<td>
																	<td></td>
																	<td></td>
																	<td>
																	<label for="photo" class="control-lable">Candidate Photo<span class="required">*</span></label>
											<input type="file" name="photo" id="photo"
												 class="span4" onchange="readURL1(this),checkeditFileSize(this);"  accept="image/*"/>
												 
												 
												 <img name="blah" id="blah" src="#"  /> 
												 </td>
												</tr>
												<tr>
												<td></td>
												<td>
												 <button id="msgbox" class="btn btn-primary"
									onclick="addNewUser()">Add New Candidate</button>
													</td>
													<td></td>
																	</tr>
																
																	</tbody>
																	</table>
													</div>
												
												
													
													
													
													
												</fieldset>
												
												<fieldset class="wizard-step">
													<legend class="wizard-label"><i class="icon-upload-2"></i> Add Voters</legend>
													<div id="excelDiv" class="control-group">
													<label class="control-label">Upload CSV <span class="required">*</span></label>
																	<div class="controls">
																	
																		<input type="file" accept=".csv" name="excelfile" id="excelfile" data-provide="fileinput" style="width: 220px;" class="required span12" onchange="disableFun();chkFileType();">
																		<button type="button" id="submitNoListBtn" name ="submitNoListBtn" class="btn btn-primary" onclick="submitNoListFun()" >Submit Voter List</button>
																	
														
														
																	</div>
																	
													</div>
												
												</fieldset>
												
												<fieldset class="wizard-step">
													<legend class="wizard-label"><i class="icon-off"></i> Schedule /Start</legend>
													<div  class="control-group">
													<table style="font-size: larger;">
														<tr>
															<td>Total Voter Count : </td><td id="totoalCount"></td>
														</tr>
														
														
														
														<tr>
															<td>Duplicate Voter Count : </td><td id="duplicateCount"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td><td></td><td></td></tr> --><!-- <tr>
														<td><button type="button" id="deleteBtn" name ="deleteBtn" class="btn btn-danger" onclick="deleteDuplicate();" >Remove Duplicates</button></td>
														</tr>
														<tr>
														<td>
														<button type="button" id="pwdBtn" name ="pwdBtn" class="btn btn-primary" onclick="pwdGenerate();" >Generate Passwords</button>
														</td>
														</tr>
														
													</table>		
														</div>
													<div id="excelDiv" class="control-group">
													<table>
													<tbody>
													<tr>
													<td>
														<label class="control-label">Start Date & Time </label>
																	<div class="controls">
																		<input id="timepicker-date"  name="timepicker-date" type="text" class="span12" style="width: 220px;">
																		
																	</div>
																	
															 <div class="controls">
                                                            <div class="datepicker-inline" style="display: none;"></div>
                                                            
                                                        </div>
                                                        </td>
                                                        <td></td>
                                                        <td></td></tr>
                                                        <tr>
                                                        <td>
                                                        <label class="control-label">End Time </label>
																	<div class="controls">
																		<input id="timepicker-date"  name="timepicker-date" type="text" class="span12" style="width: 220px;">
																	
																	</div>
																	 <div class="controls">
                                                            <div class="datepicker-inline" style="display: none;"></div>
                                                            
                                                        </div>
															
                                                        </td>
                                                        </tr>
                                                        </tbody>		
														</table>	
													</div>
												
												</fieldset>
												
											</form>
										</div> -->
									
									</div>
								
								</div>
								</div>
								
							</div>
							
		</section>
		</div>
		</div>
		</div>
		</div>
		</div>
		
		<footer id="footer" class="footerFixed">
            <div class="footer-left">Designed by - <a target="_blank" rel="noopener noreferrer" href="http://www.uok.lk">UOK</a></div>
            <div class="footer-right"><p>Copyright 2018 - University of Kelaniya. All Rights Reserved.</p></div>
        </footer>
		<script>
		<%-- var lgname="<%=logoname%>"; --%>
	var lgname="uoklogo.png";
		//alert(lgname);

		document.getElementById('imgbox').src = "assets/images/company_logo/"+lgname+"";
		var elems2 = document.getElementsByClassName("btn");
		$(document).ready(function () {
			//alert("enawa");
			$(elems2[7]).prop("disabled",true);
		       /* checked = $("input[type=checkbox]:checked").length;

		      if(!checked) {
		        alert("You must check at least one checkbox.");
		       
		       
		           }
		      else{
		    	  elems2[7].prop("disabled",false);
		      }  */

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
		    		alert("Please upload a file of CSV type");
		    		//swal({title: "Alert", text: "Please upload a file of CSV type", icon: "warning",});
		    		document.getElementById('excelfile').focus();
		    		return false;
		    	}
		    	if(ext == "csv" || ext == "CSV")
		    	{
		    		return true;
		    	} 
		    	else
		    	{
		    		alert("Upload CSV type files only");
		    		//swal({title: "Alert", text: "Upload CSV type files only", icon: "warning",});
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
		

