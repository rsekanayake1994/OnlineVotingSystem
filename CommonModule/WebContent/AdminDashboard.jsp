<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.dao.*"%>
<%@page import="com.evidu.bank.model.*"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import="com.evidu.bank.passwordgenerator.*"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->

<%
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = index.jsp");
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>

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



<!-- <link href="css1/elements.css" rel="stylesheet"> -->


<title>OVS</title>
<!-- Global site tag (gtag.js) - Google Analytics -->
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123964987-1"></script> -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-123964987-1');
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>



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





</head>
<script>function getSelectedValue() {

	var jqxhr = $.ajax({
		url : 'DashboardController.jsp?action=getElectionId',
		data : {
			name : "The name",
			desc : "The description"
		}
	}).done(function(response, textStatus, jqXHR) {
		// alert("res : "+response.trim());
		if (response.trim() != null) {
			// alert("RESPONSE not null");

			var slectedvalue = document.getElementById("selel");
			// alert("slectedvalue length : "+slectedvalue.length);

			for (var i = 0; i < slectedvalue.length; i++) {
				//  alert("dropdoun value : "+slectedvalue.options[i].value);
				if (slectedvalue.options[i].value == response.trim()) {
					//alert("TRUE");
					slectedvalue.value = slectedvalue.options[i].value;
					// document.getElementById(slectedvalue.value[i]).selected = true;
					return;
				}
			}
		}

	});

}
</script>
<body data-show-sidebar-toggle-button="false" data-fixed-sidebar="false"
	onload="toggle_visibility('form-add-new-election');getSelectedValue();">
	<%
		String electionCrateSatus = ""+session.getAttribute("createstatus");
		String userDeleteSatus = ""+session.getAttribute("deleteStatus");
		String candidateRemoveSatus = ""+session.getAttribute("removeStatus");
		
		String updateuserStatus = ""+session.getAttribute("updatestatus");
		String unlockStatus = ""+session.getAttribute("unlockStatus");
		String addOrg=""+session.getAttribute("addOrg");
		String replaceStatus = ""+session.getAttribute("replaceStatus");
		String editOrg =""+session.getAttribute("editOrg");
		
		
		System.out.println("*****addOrg****"+addOrg);
		System.out.println("*****editOrg****"+editOrg);
		System.out.println("****electionCrateSatus**"+electionCrateSatus);
		System.out.println("****updateuserStatus**"+updateuserStatus);
		System.out.println("****deleteuserStatus**"+userDeleteSatus);
		System.out.println("****deleteCandidateStatus**"+candidateRemoveSatus);
		System.out.println("****unlockStatus**"+unlockStatus);
		System.out.println("****replaceStatus**"+replaceStatus);
		
			String errCode = "" + request.getParameter("st");
			UserInfo userData = new UserInfo();
			userData = (UserInfo) session.getAttribute("current_user");

			String electionId=""+session.getAttribute("electionId");
			System.out.println("****electionId**"+electionId);
			
			String current_user = userData.getUser_id();
			String orgname=userData.getOrganization();
			String createdBy=userData.getCreated_by();
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
			   if(userRolesArr[j].equals("Admin Dashboard")){
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
                             <%if(pageList.get(i).getAutoId().equals("7") ){ %>
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
			<!-- 					<ul class="breadcrumb">

									<li><i class="icos-home"></i>Home <span class="divider">&raquo;</span>
									</li>
								</ul> -->

								<h3 id="main-heading">Admin Dashboard</h3>
							<!--  <button id="viewAll" class="btn btn-primary">View All</button>  -->
							<button id="msgbox" class="btn btn-primary"
									onclick="addNewElection()">Create new Election</button>
									
								
													
							</div>

							<div id="main-content">
			<form action="DashboardController.jsp" method="post">
			<div class="container1">
									<div class="row1">
									
									
					<table>
					<tr><td>
												<label for="selel"
												class="control-group" ><b>Select an Election: </b> </label></td><td> <select name="selel" id="selel" required ><option value="" selected disabled hidden>Choose here</option>
												 <%
												
												
												  ElectionsVO electionvo=new ElectionsVO();
												 ElectionDAO electiondao=new ElectionDAO();
												 
												 List<ElectionsVO> arrList01 = electiondao.getElectionInfo(current_user);
												  for (int i = 0; i < arrList01.size(); i++) {
													%>
													<option value="<%=arrList01.get(i).getElection_id() %>" id="<%=arrList01.get(i).getElection_id()%>"><%=arrList01.get(i).getElection_name()%></option>
												<%} %>  
												
												
											</select> 
											</td>
											<td>
											<input type="submit" class="btn btn-primary" value="Search"  style="position: relative; top: -5px;"></td> 
											<label for="chosen1" generated="true" class="error"
															style="display: none;"> </label> <input type="hidden"
															id="action" name="action" value="formSubmit1">
											</td>
											</tr>
											</table>
											
											 
											 </div>
											 </div>
											 </form>
											 <hr>
						

								<div class="row-fluid" id="codeRefer" style="display: block;">

									<div class="span12 widget" id="newid">
										<div class="widget-header">
											<span class="title">Registered Voters</span>
										</div>
										<div id="table1" class="widget-content table-container">
											<table id="demo-dtable-01" class="table table-striped">
											
												<thead>
													<tr>
														
														<th>Name</th>
														<th>Username</th>
														
														<th>Mobile No</th>
														<th>Email</th>  
														<th>Department</th>
														<th>Status</th>
														<th>Voting Status</th>
														<th></th>
													</tr>
												</thead>
												<tbody >
													<% 
													
												
													
														VoterVO voterVO = new VoterVO();
																									VoterDAO voterDAO = new VoterDAO();
																									List<VoterVO> arrList1 = voterDAO.getVoterInfo(current_user,electionId);
																									System.out.println("Voter array size: " + arrList1.size());
																									for (int i = 0; i < arrList1.size(); i++) {
																										System.out.println(arrList1.get(i).getVoter_name());
																										//createbyUname = userDAO.createdUser(arrList.get(i).getCreatedBy());
													
																										
																								
																									
																										
																								
													%>
													<tr>
														<td><%=arrList1.get(i).getVoter_name()%></td>
														<td><%=arrList1.get(i).getUsername()%></td>
														<td><%=arrList1.get(i).getMobile()%></td>
														<td><%=arrList1.get(i).getEmail()%></td>
														<td><%=arrList1.get(i).getDepartment()%></td>
														<td><%=arrList1.get(i).getLogin_status()%></td>
														<td><%=arrList1.get(i).getStatus()%></td>
														

														<td class="action-col"><span class="btn-group"
															style="position: relative; right: 5px;"> 
															<%-- <a href="#" class="btn btn-small" title="Edit User" onclick="editUser('<%=arrList1.get(i).getVoter_name()%>','<%=arrList1.get(i).getUsername()%>','<%=arrList1.get(i).getMobile()%>','<%=arrList1.get(i).getEmail()%>','<%=arrList1.get(i).getDepartment()%>','<%=arrList1.get(i).getLogin_status()%>')"><i
																	class="icon-edit"></i></a>  --%>
																<a href="#" class="btn btn-small" title="Remove Voter" onclick="deleteUser('<%=arrList1.get(i).getUsername()%>')" id="delete"><i class="icon-trash"></i></a> 
																<a href="#" class="btn btn-small" 
																<%if(arrList1.get(i).getLogin_status().equals("LOCKED")){ %>
																onclick="unlockUser('<%=arrList1.get(i).getVoter_id()%>','<%=arrList1.get(i).getUsername()%>')"
																<%} %>
																 id="unlock" title="Unlock Voter">
																<%if(arrList1.get(i).getLogin_status().equals("LOCKED")){ %>
																
																<i class="icon-lock"></i>
																<%}else{ %>
																	<i class="icos-unlocked"></i>
																	<!-- <i class="icon-unlock"></i> -->
																<%} %>
																</a>
																<%-- <a href="#" class="btn btn-small" title="User Profile" onclick="viewSubUser('<%=arrList.get(i).getId()%>','<%=arrList.get(i).getOrganization()%>')"><i class="icon-official"></i></a> 
																<a href="#" class="btn btn-small" title="Replace User"  onclick="replaceUser('<%=arrList.get(i).getId()%>','<%=arrList.get(i).getOrganization()%>')"><i  class="icon-refresh"></i></a>   --%>
																

														</span></td>
													</tr>
													<%
														}
													%>
												</tbody>
												
											</table>
										</div>
										
						
										
										
									</div>
								</div>
								
									<div class="row-fluid" id="codeRefer" style="display: block;">

									<div class="span12 widget" id="newid">
										<div class="widget-header">
											<span class="title">Registered Candidates</span>
										</div>
										<div id="table1" class="widget-content table-container">
											<table id="demo-dtable-01" class="table table-striped">
											
												<thead>
													<tr>
														
														<th>Name</th>
														<th>Position</th>
														
														<th>Mobile No</th>
														<th>Email</th>  
														<th>Department</th>
														
														<th></th>
													</tr>
												</thead>
												<tbody >
													<% 
													
												
													
														CandidatesVO candidatesVO = new CandidatesVO();
																									CandidatesDAO candidatesDAO = new CandidatesDAO();
																									List<CandidatesVO> arrList11 = candidatesDAO.getCandidatesInfo2(current_user,electionId);
																									System.out.println("Candidate array size: " + arrList1.size());
																									for (int i = 0; i < arrList11.size(); i++) {
																										System.out.println(arrList11.get(i).getCandidate_name());
																										//createbyUname = userDAO.createdUser(arrList.get(i).getCreatedBy());
													
																										
																								
																									
																										
																								
													%>
													<tr>
														<td><%=arrList11.get(i).getCandidate_name()%></td>
														<td><%=arrList11.get(i).getCandidate_position()%></td>
														<td><%=arrList11.get(i).getCandidate_telephone()%></td>
														<td><%=arrList11.get(i).getCandidate_email()%></td>
														<td><%=arrList11.get(i).getCandidate_department()%></td>
														
														

														<td class="action-col"><span class="btn-group"
															style="position: relative; right: 15px;"> 
															<%-- <a href="#" class="btn btn-small" title="Edit User" onclick="editCandidate('<%=arrList11.get(i).getCandidate_id()%>','<%=arrList11.get(i).getCandidate_name()%>','<%=arrList11.get(i).getCandidate_position()%>','<%=arrList11.get(i).getCandidate_telephone()%>','<%=arrList11.get(i).getCandidate_email()%>','<%=arrList11.get(i).getCandidate_department()%>','<%=arrList11.get(i).getElection_id()%>')"><i
																	class="icon-edit"></i></a>  --%>
																<a href="#" class="btn btn-small" title="Remove Candidate" onclick="deleteCandidate('<%=arrList11.get(i).getCandidate_id()%>')" id="delete"><i class="icon-trash"></i></a> 
															
																
																

														</span></td>
													</tr>
													<%
														}
													%>
												</tbody>
												
											</table>
										</div>
										
						
										
										
									</div>
								</div>
								
								
								<!-- add popup -->

								<div id='form-add-new-election' title="Create New Election">
									<form id='add-election-popup' method="POST" action="/CommonModule/AdminDashboard">
									<%-- <input type="hidden" name="createdby" id="createdby" value="<%=userData.getUser_auto_id() %>">	 --%>
									 <input type="hidden" name="userid" id="userid" value="<%=userData.getUser_id() %>"> 
									<%-- <input type="hidden" name="parentId" id="parentId" value="<%=userData.getUser_auto_id() %>"> --%>	

									<table>
										<div>
											<!-- <h3>Add New Election</h3> -->
											<tr> <td>
											<label for="electionname" class="control-group">Election Name*:</label>
											<input type="text" name="electionname" id="electionname" class="span4" onkeyup="checkExist()" placeholder="Election Name" required><br>
											<span id="isE" name="isE"></span>
											</td>
											<td>
											<label for="faculty"
												class="control-group">Faculty*:</label>
											
											<select name="faculty" id="faculty" class="span4" required>
												 <%
												
												OrgInfo orginfo=new OrgInfo();
												  OrganizationVO organizationvo=new OrganizationVO();
												  OrgDAO orgDAO = new  OrgDAO ();
												  
												  List<OrganizationVO> arrList3 = orgDAO.getOrgInfo();
												  for (int i = 0; i < arrList3.size(); i++) {
													%>
													<option><%=arrList3.get(i).getORGANIZATION_NAME() %></option>
												<%} %> 
											</select> 
											  </td></tr>
											  
											<tr><td>
											<div>											
												<label>Election Type</label> <select id="list1"
													name="list1" multiple="multiple" rows=2 class="span4">
													<%
														//while(resultset.next()){ 
																									ElectionTypeVO electionTypeVO = new ElectionTypeVO();
																									ElectionTypesDAO electionTypeDAO = new ElectionTypesDAO();
																									List<ElectionTypeVO> arrListElectionTypes = electionTypeDAO.getElectionTypes();
																									for (int i = 0; i < arrListElectionTypes.size(); i++) {
													%>
													
													<option><%=arrListElectionTypes.get(i).getElection_type_name()%></option>

													<%
														}
													%>
												</select> <br /> <input id="button1" name="button1" type="button"
													value="Add" />													
											</div>
											
											</td><td>
											
											<div>											
												<label>Assigned Election Types</label> <select id="list2"
													name="list2" multiple="multiple" rows=2 class="span4">
												
												</select> <br /> <input id="button2" name="button2" type="button"
													value="Delete" /> 
													<input type="hidden" name="isEE"
													id="isEE"><input type="hidden" name="isEdit"
													id="isEdit"> </label>
												<!-- <button type='button' id='selectall' >Select All </button> -->
												<input type="hidden" name="itemsP" id="itemsP"> 
												<input	type="hidden" name="isEdit" id="isEdit">
												
										</div>
											</td>
											</tr>
											<tr>
											<td>
														<label class="control-label">Start Date & Time </label>
																	<div class="controls">
																		<input id="timepicker-date" readonly name="timepicker-date" type="text" class="span12" style="width: 220px;">
																		
																	</div>
																	
															 <div class="controls">
                                                            <div class="datepicker-inline" style="display: none;"></div>
                                                            
                                                        </div>	
											
											</td>
											<td>
											<label class="control-label">End Date & Time </label>
																	<div class="controls">
																		<input id="timepicker-date1" readonly name="timepicker-date1" type="text" class="span12" style="width: 220px;" onchange="checkDate()">
																		
																	</div>
																	
															 <div class="controls">
                                                            <div class="datepicker-inline" style="display: none;"></div>
                                                            
                                                        </div>					
											</td>
											</tr>
											
											</table>
											</form>
											
							

											
											

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
	<script src="assets/jui/js/jquery-ui-1.9.2.min_Width_edited.js"></script>
	<script src="assets/jui/jquery-ui.custom.min.js"></script>
	<script src="assets/jui/timepicker/jquery-ui-timepicker.min.js"></script>
	<script src="assets/jui/jquery.ui.touch-punch.min.js"></script>

	<!-- Plugin Scripts -->

	<!-- Demo Scripts -->
	<script src="assets/js/demo/form_wizard.js"></script>

	<!-- Validation -->
	<script src="plugins/validate/jquery.validate.min.js"></script>

	<!-- Wizard -->
	<script src="custom-plugins/wizard/wizard.min.js"></script>
	<script src="custom-plugins/wizard/jquery.form.min.js"></script>


	<script src="plugins/flot/jquery.flot.js"></script>
	<script src="plugins/flot/plugins/jquery.flot.tooltip.min.js"></script>
	<script src="plugins/flot/plugins/jquery.flot.pie.min.js"></script>
	<script src="plugins/flot/plugins/jquery.flot.orderBars.min.js"></script>
	<script src="plugins/flot/plugins/jquery.flot.resize.min.js"></script>
	<!-- DataTables -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables/TableTools/js/TableTools.min.js"></script>
	<script src="plugins/datatables/FixedColumns/FixedColumns.min.js"></script>
	<script src="plugins/datatables/dataTables.bootstrap.js"></script>
	<script src="plugins/datatables/jquery.dataTables.columnFilter.js"></script>

	<!-- Demo Scripts -->
	<script src="assets/js/demo/dataTables.js"></script>

	<!-- newly added js -->
<!-- 	<script src="js/selection_js_me.js"></script> -->
	<!-- <script src="js/selection_js.js"></script> -->
<!-- 	<script src="js/my_js.js"></script> -->

	<!-- Demo Scripts -->
<!-- 	<script src="assets/js/getRefNumberDetail.js"></script> -->

	<script src="assets/js/demo/ui_comps.js"></script>
	<!--  --------------------------------------------------------->

	<!-- dfd -->
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

	<!-- msgBox -->
	<script src="plugins/msgbox/jquery.msgbox.min.js"></script>

	<!-- pnotify -->
	<script src="plugins/pnotify/jquery.pnotify.min.js"></script>

	<!-- Demo Scripts -->
	<script src="assets/js/demo/alerts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<!-- dfd -->


<script>



$(document).ready(function(){
	
	var dateToday = new Date(); 
	
		
	    $('#timepicker-date').datetimepicker({

 	        minDate: dateToday
	    		          
	    });
	    
	    $('#timepicker-date1').datetimepicker({

 	        minDate: dateToday
	    		          
	    });
	  
	});


 

 
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
	 function readURL1(input) {
		 
			
		 debugger;
		
	
         if (input.files && input.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 $('#editblah')
                     .attr('src', e.target.result)
                     .width(100)
                     .height(100);
             };

             reader.readAsDataURL(input.files[0]);
         }
     }
	 
	 
	 
	 
	 
	 function checkDate(){
		 debugger;
	 var start=document.getElementById("timepicker-date").value;
	 var end=document.getElementById("timepicker-date1").value;
	 if(start>=end){
		// alert("enter valid range")
		swal({title: "Alert", text: "Enter a valid date range.", icon: "warning",});
		 //document.getElementById("timepicker-date").value="";
		 document.getElementById("timepicker-date1").value="";
		 return
	 }
	 return
}
	 
</script>
<script type="text/javascript">

/* function searchElectionDetails(){
	
	var electionName=document.getElementById('selel').value;
	alert(electionName);
	
	if(electionName!=""){
        $.ajax({
            url: "GetElectionDetails",
            
            type: "Post",
            data: {"electionname":electionName},
            dataType: "json",
            success : function(data)
                {
                //here is where I want to access the returned arraylist
                }   
});
		
		
	}
	else
		alert("Plz select an Election");
} */

</script>
	<script type="text/javascript">

<%-- var lgname="<%=logoname%>"; --%>
	var lgname="uoklogo.png";
//alert(lgname);
debugger;
document.getElementById('imgbox').src = "assets/images/company_logo/"+lgname+"";

var createdBy= "<%=createdBy%>";
//alert(createdBy);
//var orgname="<%=orgname%>";
//document.getElementById("organizationREP").value=orgname;
//document.getElementById("organizationREP").disabled=true;

if(createdBy!=0){
	//alert("ne");
	//debugger;
	//alert(document.getElementById("msgbox"));
	//document.getElementById("msgboxOrg").style.visibility = "hidden";
	//document.getElementById("msgboxOrgedit").style.visibility = "hidden";
	
	debugger;
	//alert(document.getElementById("organization").value);
	//document.getElementById("organization").setAttribute("readOnly",true);
	var orgname="<%=orgname%>";
	//alert(orgname);
	 document.getElementById("faculty").value = orgname;
//document.getElementById("organization").setAttribute("readonly", true);
document.getElementById("faculty").disabled=true;
//alert( document.getElementById("organization").value);

}



</script>
	
	






	
	<%
									if(electionCrateSatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										
										swal({title: "Success", text: "Election Created Successfully.", icon: "success",});
										
										
										  
								        </script>
										
									<% 
									session.setAttribute("createstatus", false);
									}%>
									
									<%
									if(updateuserStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										swal({title: "Success", text: "User Updated Successfully.", icon: "success",});
										
										  
								        </script>
										
									<%
									session.setAttribute("updatestatus", false);
									}
									%>
									<%
									if(userDeleteSatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										swal({title: "Success", text: "Voter Deleted Successfully.", icon: "success",});
										
										  
								        </script>
										
									<% 
									session.setAttribute("deleteStatus", false);
									}%>
									
									<%
									if(unlockStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										
										swal({title: "Success", text: "Voter Unlocked Successfully.", icon: "success",});
										
										  
								        </script>
										
									<% 
									session.setAttribute("unlockStatus", false);
									}%>
									
									<%
									if(replaceStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										swal({title: "Success", text: "User Replaced Successfully.", icon: "success",});
										
								        </script>
										
									<% 
									session.setAttribute("replaceStatus", false);
									}%>
									
									<%
									if(candidateRemoveSatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										swal({title: "Success", text: "Candidate removed Successfully.", icon: "success",});
										
								        </script>
										
									<% 
									session.setAttribute("removeStatus", false);
									}%>
									

<!-- end -->
									
									
									
									
									
									
									
									
									
									<script type="text/javascript">

	function unlockUser(usr,name){
		
		
		var message = "Are you sure you want to unlock "+name+"?";
		var title = "Please confirm ";
		var buttonText = "Yes";
		var buttonText2 = "No";

		buttonText = (buttonText == undefined) ? "Yes" : buttonText;
		title = (title == undefined) ? "The page says:" : title;

		var div = $('<div>');
		div.html(message);
		div.attr('title', "Please confirm ");
		div
				.dialog({
					autoOpen : true,
					modal : false,
					draggable : false,
					resizable : false,
					position: 'top',
					buttons : {
						"Yes" : function() {
							var table = document
									.getElementById('demo-dtable-01'), cells = table
									.getElementsByTagName('td');
							window.location.href = "/CommonModule/VoterUnlocker?userid="
									+ usr;
							return true;
						},
						"No" : function() {
							$(this).dialog("close")
							return false;
						}

					}
				});		
	}
		
	function deleteUser(usr) {
		//alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
		var message = "Are you sure you want to delete?";
		var title = "Please confirm ";
		var buttonText = "Yes";
		var buttonText2 = "No";

		buttonText = (buttonText == undefined) ? "Yes" : buttonText;
		title = (title == undefined) ? "The page says:" : title;

		var div = $('<div>');
		div.html(message);
		div.attr('title', "Please confirm ");
		div
				.dialog({
					autoOpen : true,
					modal : false,
					draggable : false,
					resizable : false,
					position: 'top',
					buttons : {
						"Yes" : function() {
							var table = document
									.getElementById('demo-dtable-01'), cells = table
									.getElementsByTagName('td');
							//UserAction.java page in bank.sva package
							window.location.href = "/CommonModule/VoterAction?username="
									+ usr;
							return true;
						},
						"No" : function() {
							$(this).dialog("close")
							return false;
						}

					}
				});
	}
	
	
	
	function deleteCandidate(candidate_id) {
		//alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
		var message = "Are you sure you want to delete?";
		var title = "Please confirm ";
		var buttonText = "Yes";
		var buttonText2 = "No";

		buttonText = (buttonText == undefined) ? "Yes" : buttonText;
		title = (title == undefined) ? "The page says:" : title;

		var div = $('<div>');
		div.html(message);
		div.attr('title', "Please confirm ");
		div
				.dialog({
					autoOpen : true,
					modal : false,
					draggable : false,
					resizable : false,
					position: 'top',
					buttons : {
						"Yes" : function() {
							var table = document
									.getElementById('demo-dtable-01'), cells = table
									.getElementsByTagName('td');
							//UserAction.java page in bank.sva package
							window.location.href = "/CommonModule/CandidateAction?candidate_id="
									+ candidate_id;
							return true;
						},
						"No" : function() {
							$(this).dialog("close")
							return false;
						}

					}
				});
	}
	
	
	
</script>

<script>
	var GloblUID = "";
	var GloblOrg = "";
	function replaceUser(UID,org)
	{debugger;
	
	document.getElementById("organizationREP").value=org;
	document.getElementById("organizationREP").disabled=true;
		var message = "Are you sure you want to replace this user? This action is undone.";
		var title = "Please confirm ";
		var buttonText = "Yes";
		var buttonText2 = "No";

		buttonText = (buttonText == undefined) ? "Yes" : buttonText;
		title = (title == undefined) ? "The page says:" : title;

		var div = $('<div>');
		div.html(message);
		div.attr('title', "Please confirm ");
		div
				.dialog({
					autoOpen : true,
					modal : false,
					draggable : false,
					resizable : false,
					position: 'top',
					buttons : {
						"Replace user" : function() {
							var table = document
									.getElementById('demo-dtable-01'), cells = table
									.getElementsByTagName('td');
									GloblUID = UID;
									GloblOrg = org;
							//UserAction.java page in bank.sva package
							replacement();
							$(this).dialog("close")
							return true;
						},
						"No" : function() {
							$(this).dialog("close")
							return false;
						}

					}
				});
	}
		
													
	function replacement()
	{
		
	//document.getElementById("organizationREP").disbled=false;
 		//debugger;
 		//alert("UID "+GloblOrg);
 		var UID=GloblUID;
		<%PasswordGen pass1 = new PasswordGen();%>
		<%String passNew1 = pass1.getPassword();%>
		$("#passwordREP").val('<%=passNew1%>');
		$("#victimIDREP").val(UID);
		$('#form-rep-user').dialog({
			modal : true,
			close: function() {
				{
					$("#isUpdateREP").val("");
					$("#usernameREP").val("");
					$("#passwordREP").val("");
					$("#realnameREP").val("");
					$("#mobilenoREP").val("");
					$("#emailREP").val("");
					$("#oldusernameREP").val("");
					$("#organizationREP").val("");
					$("#list2REP").empty();
					
					$("#isEEREP").show();
					$("#createlocREP").show();
					$("#createloclREP").show();
					$("#victimIDREP").val("");
				}},
			"title" : "Replace User" ,
			 maxWidth:810,
	            maxHeight: 540,
	            width: 810,
	            height: 540,
			buttons : {
				"Cancel" : function() {
					$(this).dialog("close")
					{
						$("#isUpdateREP").val("");
						$("#usernameREP").val("");
						$("#passwordREP").val("");
						$("#realnameREP").val("");
						$("organizationREP").val("");
						$("#mobilenoREP").val("");
						$("#emailREP").val("");
						$("#oldusernameREP").val("");
						$("#list2REP").empty();
						
						$("#isEEREP").show();
						$("#createlocREP").show();
						$("#createloclREP").show();
						$("#victimIDREP").val("");
					}
				},
				"Submit" : function() {
					document.getElementById("organizationREP").disabled=false;
				//document.getElementById("organizationREP").disabled=false;
					//if (document.getElementById("isEE").value === '629') {
					loginSuccess();
					$("#isEE").hide();
					document.forms["add-popupREP"].submit();
					{debugger;
						$("#isUpdateREP").val("");
						$("#usernameREP").val("");
						$("#passwordREP").val("");
						//$("organizationREP").val("");
						$("#realnameREP").val("");
						$("#mobilenoREP").val("");
						$("#emailREP").val("");
						$("#oldusernameREP").val("");
						$("#list2REP").empty();
						$("#usernameREP").attr('readonly', false);
						$("organizationREP").attr('disabled',false);
						$("#isEEREP").show();
						$("#isEREP").hide();
						$("#createlocREP").show();
						$("#createloclREP").show();
						$("#victimIDREP").val("");
					}

				}
			}
		});
	}


</script>
			


									
<script>

	$(document).ready(function () {
		
		$( "#table2" ).hide();
		
		$('#viewAll').click(function () {
			
			if($('#viewAll').text()=="View All")
				{
					$( "#table1" ).hide();
					$('#viewAll').text("View Less");
					$( "#table2" ).show();
				}
			else
				{
					$( "#table2" ).hide();
					$('#viewAll').text("View All");
					$( "#table1" ).show();
				}
			
		});
			
	});



	$(function() {
		$("#button1").click(function() {
			$("#list1 > option:selected").each(function() {
				$(this).remove().appendTo("#list2");

			});
			colectSelAdd('list2', 'itemsP');
		});

		$("#button2").click(function() {
			$("#list2 > option:selected").each(function() {
				$(this).remove().appendTo("#list1");

			});
			colectSelDel('list2', 'itemsP');
		});
		
		$("#button1REP").click(function() {
			$("#list1REP > option:selected").each(function() {
				$(this).remove().appendTo("#list2REP");

			});
			colectSelAdd('list2REP', 'itemsPREP');
		});

		$("#button2REP").click(function() {
			$("#list2REP > option:selected").each(function() {
				$(this).remove().appendTo("#list1REP");

			});
			colectSelDel('list2REP', 'itemsPREP');
		});
		
		
	});

	/* $("#yesno").easyconfirm({
		locale : {
			title : 'Select Yes or No',
			button : [ 'No', 'Yes' ]
		}
	});
	$("#yesno").click(function() {
		alert("You clicked yes");
	}); */
	
	
</script>									

<script type="text/javascript">

	function deleteUser2(usr) {
		var retVal = confirm("Are you sure you want to delete?");
		if (retVal == true) {
			var table = document.getElementById('demo-dtable-01'), cells = table
					.getElementsByTagName('td');
			window.location.href = "/AdminM/UserAction?username=" + usr;
			return true;
		} else {
			//document.write("User does not want to continue!");
			return false;
		}

	}

	function editUser(usr, pwd, realname, mobileno, email, userRoles, allUserRoles,organizations) {

		
		var table = document.getElementById('demo-dtable-01'), cells = table
				.getElementsByTagName('td');
		updateUser(usr, pwd, realname, mobileno, email, userRoles,allUserRoles,organizations);

	}
	
	function getDifference(a, b)
	{
		var diff = $(b).not(a).get();	
		return diff;
	}

	function updateUser(usr, pwd, realname, mobileno, email, userRoles, allUserRoles,organizations) {
		
	//alert(organizations);	
	
		var isEdit = "edit";
		var usrRoles1 =   userRoles.split(",");
		var allUserRoles1 =allUserRoles.split(",");
		//var allUserRoles1 =allUserRoles.split(",").filter(function(i){return i});
		var result = getDifference(usrRoles1, allUserRoles1);
		var resultArr =result.join(",").split(",");
		//var resultArr =result.split(",").filter(function(i){return i});
		//alert(resultArr);
		
		$("#list1").empty();
		var sel1 = document.getElementById('list1');
		for(var i = 0; i < resultArr.length; i++) {
		    var opt = document.createElement('option');
		    opt.innerHTML = resultArr[i];
		   //if(!resultArr[i].localeCompare(''))
		    opt.value = resultArr[i];
		    sel1.appendChild(opt);
		}
		
		var sel = document.getElementById('list2');
		for(var i = 0; i < usrRoles1.length; i++) {
		    var opt = document.createElement('option');
		    opt.innerHTML = usrRoles1[i];
		    opt.value = usrRoles1[i];
		    sel.appendChild(opt);
		}
		
		
		$("#isUpdate").val(isEdit);
		debugger;
		//alert(usr);
		$("#username").val(usr);
		$("#organization").val(organizations);
		//$("#password").val(pwd);
		$("#realname").val(realname);
		$("#mobileno").val(mobileno);
		$("#email").val(email);
		$("#oldusername").val(usr);
		$("#username").attr('readonly', true);
		$("#organization").attr('disabled',true);
		$("#isEE").hide();
		$("#createloc").hide();
		$("#createlocl").hide();
		$('#form-add-new-user').dialog({
			modal : true,
			close: function() {
				{
					$("#isUpdate").val("");
					$("#username").val("");
					$("#organization").val("");
					$("#password").val("");
					$("#realname").val("");
					$("#mobileno").val("");
					$("#email").val("");
					$("#oldusername").val("");
					$("#list2").empty();
					$("#username").attr('readonly', false);
					$("#organizatoin").attr('disabled', false);
					$("#isEE").show();
					$("#createloc").show();
					$("#createlocl").show();
					
					window.location.reload(true);
				}},
			"title" : "Edit User" ,
			 maxWidth:810,
	            maxHeight: 540,
	            width: 810,
	            height: 540,
			buttons : {
				"Cancel" : function() {
					$(this).dialog("close")
					{
						$("#isUpdate").val("");
						$("#username").val("");
						$("#organization").val("");
						$("#password").val("");
						$("#realname").val("");
						$("#mobileno").val("");
						$("#email").val("");
						$("#oldusername").val("");
						$("#list2").empty();
						$("#username").attr('readonly', false);
						$("#organization").attr('disabled',false);
						$("#isEE").show();
						$("#createloc").show();
						$("#createlocl").show();
						window.location.reload(true);
					}
				},
				"Submit" : function() {
					//if (document.getElementById("isEE").value === '629') {
					loginSuccess();
					$("#isEE").hide();
					document.forms["add-election-popup"].submit();
					{
						$("#isUpdate").val("");
						$("#username").val("");
						$("#organization").val("");
						$("#password").val("");
						$("#realname").val("");
						$("#mobileno").val("");
						$("#email").val("");
						$("#oldusername").val("");
						$("#list2").empty();
						$("#username").attr('readonly', false);
						$("#organization").attr('disabled',false);
						$("#isEE").show();
						$("#isE").hide();
						$("#createloc").show();
						$("#createlocl").show();
						
					}

				}
			}
		});
	}

	function loginSuccess() {

		$('#login-success').dialog({
			modal : true,
			width : 210,
			buttons : {
				"Cancel" : function() {
					$(this).dialog("close")
				}
			}
		});
	}

	function addNewElection() {
	
	
		debugger;
			//alert(document.getElementById("organization").value);
	
			
			$('#form-add-new-election').dialog({
			modal : true,
			 close: function() {
					{
						//$("#isEdit").val("");
						$("#electionname").val("");
						$("#timepicker-date").val("");
						$("#timepicker-date1").val("");
						$("#faculty").val("");
						$("#list2").empty();
						$("#electionname").attr('readonly', false);
						$("#faculty").attr('disabled',false);
						$("#isEE").show();
					}},
			
			
			
			"title" : "Create New Election" ,
			dialogClass: 'dlgfixed',
		    position: "center",
		    maxWidth:810,
            maxHeight: 540,
            width: 810,
            height: 540,
			buttons : {
				"Cancel" : function() {
					$(this).dialog("close")
					{
						//$("#isEdit").val("");
						$("#electionname").val("");
						$("#faculty").val("");
						$("#timepicker-date").val("");
						$("#timepicker-date1").val("");
						$("#list2").empty();
						$("#electionname").attr('readonly', false);
						$("#faculty").attr('disabled',false);
						$("#isEE").show();
					}
				},
				"Submit" : function() {
				
				
					//put code here for form submission
					//alert(document.getElementById("isEE").value);
					debugger;
					//var startdate1=document.getElementById("startdate").value;
					//var enddate1=document.getElementById("enddate").value;
					//alert($("#timepicker-date").val());
					//alert($("#timepicker-date1").val());
					
					document.getElementById("faculty").disabled=false;
					//alert(document.getElementById("organization").value);
					//alert(document.getElementById("isEE").value);
					if (document.getElementById("isEE").value === '636') {
						loginSuccess();
						document.forms["add-election-popup"].submit();
						{
							//$("#isEdit").val("");
							$("#electionname").val("");
							$("#faculty").val("");
							$("#timepicker-date").val("");
							$("#timepicker-date1").val("");
							$("#list2").empty();
							$("#isE").hide();
							$("#electionname").attr('readonly', false);
							$("#faculty").attr('readonly',false);
							$("#isEE").show();
						}
					} else {
						//alert("en ne");
					
						document.getElementById("electionname").focus();
						//alert("Please enter different UserName!");
					}

				}
			}
		});
	}
	

	

	
	
	
	
	
	
	
	
	
	
	

	function lb_moveacrossAdd(sourceID, destID) {
		var src = document.getElementById(sourceID);
		var dest = document.getElementById(destID);

		for (var count = 0; count < src.options.length; count++) {

			if (src.options[count].selected == true) {
				var option = src.options[count];

				var newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.text = option.text;
				newOption.selected = true;
				try {
					dest.add(newOption, null); //Standard
					src.remove(count, null);
				} catch (error) {
					dest.add(newOption); // IE only
					src.remove(count);
				}
				count--;
			}
		}

	}

	function lb_moveacrossDel(sourceID, destID) {
		var src = document.getElementById(sourceID);
		var dest = document.getElementById(destID);

		for (var count = 0; count < src.options.length; count++) {

			if (src.options[count].selected == true) {
				var option = src.options[count];
				var newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.text = option.text;
				newOption.selected = true;
				try {
					dest.add(newOption, null); //Standard
					src.remove(count, null);
				} catch (error) {
					dest.add(newOption); // IE only
					src.remove(count);
				}
				count--;
			}

		}

	}

	function colectSelDel(selid, tbid) {

		var sel = document.getElementById(selid);
		var tb = document.getElementById(tbid);
		tb.value = '';
		for (var zxc0 = 0; zxc0 < sel.options.length; zxc0++) {
			tb.value += sel.options[zxc0].value + ',';
		}
	}

	function colectSelAdd(selid, tbid) {
		//alert(selid +tbid);
		var sel = document.getElementById(selid);
		var tb = document.getElementById(tbid);
		tb.value = '';
		for (var zxc0 = 0; zxc0 < sel.options.length; zxc0++) {
			tb.value += sel.options[zxc0].value + ',';
		}

	}

	function visibilitySuccessStatus(id) {
		//alert('test');
		var e = document.getElementById(id);
		if (e.style.display == 'block')
			e.style.display = 'none';
		else
			e.style.display = 'none';
	}

	function toggle_visibility(id) {
		// alert('test2');
		var e = document.getElementById(id);
		if (e.style.display == 'block')
			e.style.display = 'none';
		else
			e.style.display = 'none';
	}

	function checkExist() {
var xmlhttp = new XMLHttpRequest();
		
		var electionname = document.getElementById("electionname").value;
		
		{
			//alert('123');			
			var url = "ExistElection.jsp?electionname=" + electionname;
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					if (xmlhttp.responseText == "\n\n\n\n\nElection Name already exists")
						document.getElementById("isE").style.color = "red";
					else
						document.getElementById("isE").style.color = "green";
					document.getElementById("isE").innerHTML = xmlhttp.responseText;

					document.getElementById("isEE").value = xmlhttp.responseText.length;
					//alert(document.getElementById("isEE").innerHTML);
				}

			};
			try {
				xmlhttp.open("GET", url, true);
				xmlhttp.send();
			} catch (e) {
				alert("unable to connect to server");

			}
			
			addNewElection();
		}
	}
	

	
	
	
	
	

	
	
	
	function checkName(){
		//alert("awa");
		debugger;
			var orgname=document.getElementById("orgname").value;
			
			<%for (int i = 0; i < arrList3.size(); i++){%>
			var x="<%=arrList3.get(i).getORGANIZATION_NAME() %>";
			if(orgname==""){
				//alert("Username is Empty");
				swal({title: "Alert", text: "Username is Empty.", icon: "warning",});
				return false;
				
			}
			
			else if(orgname==x){
				 document.getElementById("orgname").value= "";
			//alert("Name is Exists");
				swal({title: "Alert", text: "Entered Name is Exists.", icon: "warning",});
				return false;	
			}
			//else{
				
			
			//return true;
			//}
			
		<%}%>
		}
	
	
		
	
	
	
		
	<%
	//List<UserVO> arrList4 = userDAO.getUserInfo2(userData.getUser_auto_id());
	
	%>
		
	
			
		
		function checkMobileNo(){
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
			
function checkFileSize(file){
		
		 var FileSize = file.files[0].size / 1024 / 1024; // in MB
	        if (FileSize > 0.0096) {
	        	
	       // debugger;
	           // alert('File size exceeds 2 MB');
	           debugger;
	           document.getElementById('blah').style.visibility='hidden';
	            swal({title: "Alert", text: "File size exceeds 10KB.", icon: "warning",});
	         
	            $(file).val(''); //for clearing with Jquery
	        
	        } else {
	        	 document.getElementById('blah').style.visibility='visible';
	        }
	
	}

	
		
	function checkEmail(){

			
		    var email = document.getElementById("email");
		    var filter = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		    if (!filter.test(email.value)) {
		        document.getElementById("email").value= "";
		   
		    //alert('Please provide a valid email address');
		    swal({title: "Alert", text: "Please provide a valid email address!", icon: "warning",});
		    email.focus;
		    return false;
		 }
			
		}
	
	
	
		   


		
			function ValidateRealName() 
			{
			    var val = document.getElementById('realname').value;
			    
			    if (!val.match(/^[a-z A-Z. ]+$/)) 
			    {
			    	swal({title: "Alert", text: "Please provide a valid Name!", icon: "warning",});
			    	$("#realname").val('');
			        return false;
			       
			    }
			    
			    return true;
			}
			
			
		
			
		
			
			   


			
			
			
			
		
		
		
		
	
	
	
	
	
	
	
	
</script>

<%
									if(addOrg.equals("add1")){
										System.out.println("true status dcdcdc");
									
									%>
								
									
									<% 
									session.setAttribute("addOrg", false);
									}%>
									
									
									
									<%
									if(editOrg.equals("edit")){
										System.out.println("edit status dcdcdc");
									
									%>
							
									
									<% 
									session.setAttribute("editOrg", false);
									}%>




</body>

</html>
