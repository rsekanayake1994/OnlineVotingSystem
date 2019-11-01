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
<script src="https://unpkg.com/sweetalert/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>


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

<body data-show-sidebar-toggle-button="false" data-fixed-sidebar="false"
	onload="toggle_visibility('form-add-new-user');toggle_visibility('form-add-new-organization');toggle_visibility('form-rep-user');toggle_visibility('form-edit-organization');">
	<%
		String userCrateSatus = ""+session.getAttribute("addstatus");
		String userDeleteSatus = ""+session.getAttribute("deleteStatus");
		String updateuserStatus = ""+session.getAttribute("updatestatus");
		String unlockStatus = ""+session.getAttribute("unlockStatus");
		String addOrg=""+session.getAttribute("addOrg");
		String replaceStatus = ""+session.getAttribute("replaceStatus");
		String editOrg =""+session.getAttribute("editOrg");
		
		
		System.out.println("*****addOrg****"+addOrg);
		System.out.println("*****editOrg****"+editOrg);
		System.out.println("****userCrateSatus**"+userCrateSatus);
		System.out.println("****updateuserStatus**"+updateuserStatus);
		System.out.println("****deleteuserStatus**"+userDeleteSatus);
		System.out.println("****unlockStatus**"+unlockStatus);
		System.out.println("****replaceStatus**"+replaceStatus);
		
			String errCode = "" + request.getParameter("st");
			UserInfo userData = new UserInfo();
			userData = (UserInfo) session.getAttribute("current_user");

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
			   if(userRolesArr[j].equals("Administrator")){
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
                             <%if(pageList.get(i).getAutoId().equals("1") ){ %>
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
							

								<h3 id="main-heading">User Creation</h3>
								<button id="viewAll" class="btn btn-primary">View All</button>
								<button id="msgbox" class="btn btn-primary"
									onclick="addNewUser()">Add New User</button>
									<button id="msgboxOrg" class="btn btn-primary" name="addneworg"
									onclick="addNewOrganization();">Add New Faculty</button>
									<button id="msgboxOrgedit" class="btn btn-primary" name="editorg"
									onclick="editOrganization();">Edit Faculty Details</button>
								
								
							</div>

							<div id="main-content">

								

			

								<div class="row-fluid" id="codeRefer" style="display: block;">

									<div class="span12 widget" id="newid">
										<div class="widget-header">
											<span class="title">Users</span>
										</div>
										<div id="table1" class="widget-content table-container">
											<table id="demo-dtable-01" class="table table-striped">
											
												<thead>
													<tr>
														<th>Username</th>
														<th>Faculty</th>
														<th>Real Name</th>
														<th>User Roles</th>
													
														<th>Mobile No</th>
														
														<th>CreatedBy</th>
														<th></th>
														
														
													</tr>
												</thead>
												<tbody >
													<% 
													String userRoles="";
													String createbyUname = "";
													UserRolesVO rolesVO= new UserRolesVO();
													UserRolesDAO rolesDAO = new UserRolesDAO();
													List<UserRolesVO> rolesArray = rolesDAO.getUserRoles();
													for (int i = 0; i < rolesArray.size(); i++) {
														if(i!=0)
															userRoles =userRoles+","+ rolesArray.get(i).getUSER_ROLE_ID();
														else
															userRoles =userRoles+ rolesArray.get(i).getUSER_ROLE_ID();
													}
													System.out.println("All  user roles: "+ userRoles);
													
														UserVO userVO = new UserVO();
																									UserDAO userDAO = new UserDAO();
																									List<UserVO> arrList = userDAO.getUserInfo(userData.getUser_auto_id());
																									//System.out.println("User array size: " + arrList.size());
																									for (int i = 0; i < arrList.size(); i++) {
																										//System.out.println(arrList.get(i).getCreatedBy());
																										createbyUname = userDAO.createdUser(arrList.get(i).getCreatedBy());
													
																										
																								
																									
																										
																								
													%>
													<tr>
														<td><%=arrList.get(i).getUsername()%></td>
														<td><%=arrList.get(i).getOrganization()%></td>
														<td><%=arrList.get(i).getRealName()%></td>
															<td ><%=doSomething(arrList.get(i).getUserRoles())%></td>
														<%-- <td><%=arrList.get(i).getLastLoggedIn()%></td> --%>
														<%-- <td><%=arrList.get(i).getComment()%></td>--%>
														<td><%=arrList.get(i).getMobileNo()%></td>
														<%--<td><%=arrList.get(i).getEmail()%></td> --%>
														<td><%=createbyUname%></td>
														<%
															//System.out.println("test: " + i);
														%>

														<td class="action-col"><span class="btn-group"
															style="position: relative; left: -15px;"> 
															<a href="#" class="btn btn-small" title="Edit User" onclick="editUser('<%=arrList.get(i).getUsername()%>','<%=arrList.get(i).getPassword()%>','<%=arrList.get(i).getRealName()%>','<%=arrList.get(i).getMobileNo()%>','<%=arrList.get(i).getEmail()%>','<%=arrList.get(i).getUserRoles()%>','<%=userRoles%>','<%=arrList.get(i).getOrganization()%>')"><i
																	class="icon-edit"></i></a> <%-- <% session.setAttribute("username", arrList.get(i).getUsername()); %> --%>
																<a href="#" class="btn btn-small" title="Remove User" onclick="deleteUser('<%=arrList.get(i).getUsername()%>')" id="delete"><i class="icon-trash"></i></a> 
																<a href="#" class="btn btn-small" 
																<%if(arrList.get(i).getStatus().equals("LOCKED")){ %>
																onclick="unlockUser('<%=arrList.get(i).getUserId()%>','<%=arrList.get(i).getUsername()%>')"
																<%} %>
																 id="unlock" title="Unlock User">
																<%if(arrList.get(i).getStatus().equals("LOCKED")){ %>
																
																<i class="icon-lock"></i>
																<%}else{ %>
																	<i class="icos-unlocked"></i>
																	<!-- <i class="icon-unlock"></i> -->
																<%} %>
																</a>
																<a href="#" class="btn btn-small" title="User Profile" onclick="viewSubUser('<%=arrList.get(i).getId()%>','<%=arrList.get(i).getOrganization()%>')"><i class="icon-official"></i></a> 
																<a href="#" class="btn btn-small" title="Replace User"  onclick="replaceUser('<%=arrList.get(i).getId()%>','<%=arrList.get(i).getOrganization()%>')"><i  class="icon-refresh"></i></a>  
																

														</span></td>
													</tr>
													<%
														}
													%>
												</tbody>
												
											</table>
										</div>
										
										<div id="table2" class="widget-content table-container">
											<table id="demo-dtable-02" class="table table-striped">
												<thead>
													<tr>
													 <th>Username</th> 
														<th>Faculty</th>
														<th>Real Name</th>
														<th>User Roles</th>
														<!-- <th>Last Logged in</th> -->
<!-- 														<th>Comment</th> -->
														<th>Mobile No</th>
<!-- 														<th>Email</th>  -->
														<th>CreatedBy</th>
														<th></th>
													</tr>
												</thead>
												<tbody >
													<% 
													String userRoles1="";
													String createbyUname1 = "";
													UserRolesVO rolesVO1= new UserRolesVO();
													UserRolesDAO rolesDAO1 = new UserRolesDAO();
													List<UserRolesVO> rolesArray1 = rolesDAO1.getUserRoles();
													for (int i = 0; i < rolesArray1.size(); i++) {
														if(i!=0)
															userRoles1 =userRoles1+","+ rolesArray1.get(i).getUSER_ROLE_ID();
														else
															userRoles1 =userRoles1+ rolesArray1.get(i).getUSER_ROLE_ID();
													}
													System.out.println("All  user roles: "+ userRoles1);
													
														UserVO userVO1 = new UserVO();
																									UserDAO userDAO1 = new UserDAO();
																									List<UserVO> arrList1 = userDAO1.getUserInfo1(userData.getUser_auto_id());
																									//System.out.println("User array size: " + arrList.size());
																									for (int i = 0; i < arrList1.size(); i++) {
																										createbyUname1 = userDAO.createdUser(arrList1.get(i).getCreatedBy());
													%>
													<%! 
   														public String doSomething(String userRoles) { 
														System.out.println("....................................");
														String returnImage="";
														String index[]=userRoles.split(",");
													    for(int i=0;i<index.length;i++){
													    	System.out.println("rusi"+index[i]);
														     if(index[i].equals("Administrator")){
														    		System.out.println("This "+index[i]);
														    	returnImage +="&nbsp  "+ "<img src='assets/images/Admin.png' width='15' height='15' title='Administrator'/>";
														    	System.out.println("returnImage= "+returnImage);
														    	}
														    	else if(index[i].equals("Admin Dashboard")){
														    	returnImage+="&nbsp  "+ "<img src='assets/images/charts.jpg' width='15' height='15' title='Admin Dashboard'/>";
														    	}
														    	else if(index[i].equals("Add Voters")){
															    	returnImage+="&nbsp  "+ "<img src='assets/images/cagent.png' width='15' height='15' title='Add Voters'/>";
															    	}
														    	
														    	else if(index[i].equals("Add Candidates")){
															    	returnImage+="&nbsp  "+ "<img src='assets/images/manage.png' width='15' height='15'title='Add Candidates'/>";
															    	}
														    	else if(index[i].equals("View Results")){
															    	returnImage+="&nbsp  "+ "<img src='assets/images/s.png' width='8' height='8' title='View Results'/>";
															    	}
													    }
      														return returnImage;
   														 
													}
														%>
													<tr>
														<td><%=arrList1.get(i).getUsername()%></td>
														<td><%=arrList1.get(i).getOrganization()%></td>
														<td><%=arrList1.get(i).getRealName()%></td>
													<td ><%=doSomething(arrList1.get(i).getUserRoles())%></td> 
														<%-- <td><%=arrList1.get(i).getLastLoggedIn()%></td> --%>
														<%-- <td><%=arrList.get(i).getComment()%></td>--%>
														<td><%=arrList1.get(i).getMobileNo()%></td>
														<%--<td><%=arrList.get(i).getEmail()%></td> --%>
														<td><%=createbyUname1%></td>
														
														<%
														
															System.out.println("userrolls="+i+" " + arrList1.get(i).getUserRoles());
														%>

														<td class="action-col"><span class="btn-group"
															style="position: relative; left: -15px;"> 
															<a href="#" class="btn btn-small" title="Edit User" onclick="editUser('<%=arrList1.get(i).getUsername()%>','<%=arrList1.get(i).getPassword()%>','<%=arrList1.get(i).getRealName()%>','<%=arrList1.get(i).getMobileNo()%>','<%=arrList1.get(i).getEmail()%>','<%=arrList1.get(i).getUserRoles()%>','<%=userRoles1%>','<%=arrList1.get(i).getOrganization()%>');"><i
																	class="icon-edit"></i></a> <%-- <% session.setAttribute("username", arrList.get(i).getUsername()); %> --%>
																<a href="#" class="btn btn-small" title="Remove User" onclick="deleteUser('<%=arrList1.get(i).getUsername()%>')" id="delete"><i class="icon-trash"></i></a> 
    															<a href="#" class="btn btn-small" 
																<%if(arrList1.get(i).getStatus().equals("LOCKED")){ %>
																onclick="unlockUser('<%=arrList1.get(i).getUserId()%>','<%=arrList1.get(i).getUsername()%>')"
																<%} %>
																 id="unlock" title="Unlock User">
																<%if(arrList1.get(i).getStatus().equals("LOCKED")){ %>
																
																<i class="icon-lock"></i>
																<%}else{ %>
																	<i class="icos-unlocked"></i>
																	<!-- <i class="icon-unlock"></i> -->
																<%} %>
																</a>
																<a href="#" class="btn btn-small" title="User Profile" onclick="viewSubUser('<%=arrList1.get(i).getId()%>','<%=arrList1.get(i).getOrganization()%>')"><i class="icon-official"></i></a> 
																<a href="#" class="btn btn-small" title="Replace User" onclick="replaceUser('<%=arrList1.get(i).getId()%>','<%=arrList1.get(i).getOrganization()%>')"><i  class="icon-refresh"></i></a> 
																

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

								<div id=form-add-new-user title="Add New User">
									<form id='add-user-popup' method="POST" action="/CommonModule/UserCreator">
									<input type="hidden" name="createdby" id="createdby" value="<%=userData.getUser_auto_id() %>">	
									<input type="hidden" name="userlevelP" id="userlevelP" value="<%=userData.getUser_level() %>">
									<input type="hidden" name="parentId" id="parentId" value="<%=userData.getUser_auto_id() %>">	

									<table>
										<div>
											<!-- <h3>Add New User</h3> -->
											<tr> <td>
											<label for="username" class="control-group">Username:</label>
											<input type="text" name="username" id="username" class="span4" onkeyup="checkExist()" placeholder="Username"><br>
											<span id="isE" name="isE"></span>
											</td>
											<td>
											<label for="organization"
												class="control-group">Faculty:</label>
											<!-- <input type="option" name="user" id="organization" > -->
											<select name="organization" id="organization" class="span4">
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
											<label for="password" class="control-group">Password:</label>
											<%
												PasswordGen pwd = new PasswordGen();
												String pwdNew = pwd.getPassword();
												System.out.println(pwdNew);
											%>
											<input type="text" name="password" id="password"
												 class="span4" placeholder="Password">
											</td><td>
											<label for="realname" class="control-group">Real
												Name:</label> <input type="text" class="span4" name="realname"
												id="realname" placeholder="Real Name" onchange="ValidateRealName()"> <input
												type="hidden" class="span4" name="isUpdate" id="isUpdate"
												placeholder="Real Name"> <input type="hidden"
												class="span4" name="oldusername" id="oldusername"
												placeholder="Real Name">
											<td></tr>

											
											<tr> <td>
											<label for="mobileno" class="control-group">Mobile
												No:</label> <input type="text" name="mobileno" id="mobileno"
												class="span4" placeholder="Mobile No" onchange="checkMobileNo1()"> 
												</td><td>
												<label
												for="email" class="control-group">Email:</label> <input
												type="text" name="email" id="email" class="span4"
												placeholder="Email" onchange="checkEmail()">
												</td> </tr>
											<!-- listbox -->
											<tr><td>
											<div>											
												<label>Available User Roles</label> <select id="list1"
													name="list1" multiple="multiple" rows=2 class="span4">
													<%
														//while(resultset.next()){ 
																									UserRolesVO userRolesVO = new UserRolesVO();
																									UserRolesDAO userRolesDAO = new UserRolesDAO();
																									List<UserRolesVO> arrListUserRoles = userRolesDAO.getUserRoles();
																									for (int i = 0; i < arrListUserRoles.size(); i++) {
													%>
													
													<option><%=arrListUserRoles.get(i).getUSER_ROLE_ID()%></option>

													<%
														}
													%>
												</select> <br /> <input id="button1" name="button1" type="button"
													value="Add" />													
											</div>
											
											</td><td>
											
											<div>											
												<label>Assigned User Roles</label> <select id="list2"
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
											</div>
											</table>
											</form>
											
							

											
											

						</section>
					</div>
				</div>
			</div>
		</div>
			
				<!-- repeation begins  -->
								
								<div id="form-rep-user" title="Replace User">
									<form id='add-popupREP' method="POST" action="/CommonModule/UserReplacement">
									<table>
										<div>											
											<tr> <td>
											<label for="usernameREP" class="control-group">Username:</label>
											<input type="text" name="usernameREP" id="usernameREP" class="span4" onkeyup="checkExistREP()" placeholder="Username"><br>
											<span id="isEREP" name="isEREP"></span>
											</td>
											<td>
											<label for="organization"
												class="control-group">Faculty:</label>
											
											<select name="organizationREP" id="organizationREP" class="span4">
												 <%
												
												
												  
												  
												  for (int i = 0; i < arrList3.size(); i++) {
													%>
													<option><%=arrList3.get(i).getORGANIZATION_NAME() %></option>
												<%} %> 
												
												
											</select> 
											  </td></tr>
											  
											<tr><td>
											<label for="password" class="control-group">Password:</label>
											<%
												PasswordGen pwd1 = new PasswordGen();
												String pwdNew1 = pwd1.getPassword();
												System.out.println(pwdNew1);
											%>
											<input type="text" name="passwordREP" id="passwordREP"
												value="<%=pwdNew%>" class="span4" placeholder="Password">
											</td><td>
											<label for="realname" class="control-group">Real
												Name:</label> <input type="text" class="span4" name="realnameREP"
												id="realnameREP" placeholder="Real Name"> <input
												type="hidden" class="span4" name="isUpdateREP" id="isUpdateREP"
												placeholder="Real Name"> <input type="hidden"
												class="span4" name="oldusernameREP" id="oldusernameREP"
												placeholder="Real Name">
											<td></tr>

											<tr> <td>
											<label for="mobileno" class="control-group">Mobile
												No:</label> <input type="text" name="mobilenoREP" id="mobilenoREP"
												class="span4" placeholder="Mobile No" onchange="checkMobileNo2()"> 
												</td><td>
												<label
												for="email" class="control-group">Email:</label> <input
												type="text" name="emailREP" id="emailREP" class="span4"
												placeholder="Email" onchange="checkEmail2()">
												</td> </tr>
											<!-- listbox -->
											<tr><td>
											<div>											
												<label>Available User Roles</label> <select id="list1REP"
													name="list1REP" multiple="multiple" rows=2 class="span4">
													<%
														
																									//UserRolesVO userRolesVO1 = new UserRolesVO();
																									UserRolesDAO userRolesDAO1 = new UserRolesDAO();
																									List<UserRolesVO> arrListUserRoles1 = userRolesDAO1.getUserRoles();
																									for (int i = 0; i < arrListUserRoles1.size(); i++) {
													%>
													
													<option><%=arrListUserRoles1.get(i).getUSER_ROLE_ID()%></option>

													<%
														}
													%>
												</select> <br /> <input id="button1REP" name="button1REP" type="button"
													value="Add" />													
											</div>
											
											</td><td>
											
											<div>											
												<label>Assigned User Roles</label> <select id="list2REP"
													name="list2REP" multiple="multiple" rows=2 class="span4">
												
												</select> <br /> <input id="button2REP" name="button2REP" type="button"
													value="Delete" /> 
													<input type="hidden" name="isEEREP"
													id="isEEREP"><input type="hidden" name="isEditREP"
													id="isEditREP"> </label>
											
												<input type="hidden" name="itemsPREP" id="itemsPREP"> 
												<input	type="hidden" name="isEditREP" id="isEditREP">
												<input type="hidden" name="victimIDREP" id="victimIDREP">
												
											</div>
											</td><tr>
											
										</div>
										</table>
									</form>
								</div>								
								
								
								
								
								
								
								
								
<!-- 								repeation ends -->				
								
								
								
								
								
								
								
								
								
								<!-- add new Faculty -->
								
							
							<div id="form-add-new-organization" title="Add New Organization">
									<form id='add-organization-popup' method="POST" action="/CommonModule/OrganizationCreate" onSubmit="return success1(this)"  enctype="multipart/form-data">
									

									<table>
										<div>
											<!-- <h3>Add New Faculty</h3> -->
											<tr> <td>
											<label for="orgname" class="control-group">Faculty Name:</label>
											<input type="text" name="orgname" 
												id="orgname"  class="span4" placeholder="Name"  onchange="checkName()"  />
												<br>
												<input
												type="hidden" class="span4" name="isUpdate1" id="isUpdate1"
												> 
											<span id="isEorg" name="isEorg"></span>
											</td>
											
											
											<td>
											<label for="contactperson" class="control-group">Contact Person:
												</label> <input type="text" class="span4" name="contactperson"
												id="contactperson" placeholder="Contact Person" onchange="ValidateRealName1()"> 
											<td></tr>
											
											<tr><td>
											<label for="contactno" class="control-group">Contact Number:
												</label> <input type="text" class="span4" name="contactno"
												id="contactno" onchange="checkMobileNo()" placeholder="Contact No"> 
											</td>
  
											<td>
											<label for="address" class="control-group">Address:</label>
											
											<input type="text" name="address" id="address"
												 class="span4" placeholder="Address">
											</td>
											
											
											
											</tr>
											
											<tr> <td>
												<label
												for="email1" class="control-group">Email:</label> <input
												type="text" name="email1" id="email1" class="span4"
												placeholder="Email" onchange="checkEmail1()"/>
												 
												</td> 
												
												 <td>
												<label
												for="datejoined" class="control-group">Date Joined:</label> <input
												type="text" name="datejoined" id="datejoined" class="span4"
												readonly>
												</td> </tr>
												<tr>
												<td style="vertical-align:top">
											<label for="logo" class="control-group">Faculty Logo:</label>
											<input type="file" name="logo" id="logo"
												 class="span4" onchange="readURL(this),checkFileSize(this);" accept="image/*"/>
												 </td><td>
												 <img name="blah" id="blah" src="#"  /> 
												 
												 <input type="hidden" name="isEE"
													id="isEE"/>
													<input type="hidden" name="isEE1"
													id="isEE1"/>
													<input type="hidden" id="logoname" name="logoname" value="" />
													
											</td></tr>
											<!-- listbox -->
										
											
											
											
											</div>
											</table>
											</form>

											
											

						
					</div>
					<!-- /add new faculty -->
					
					
					<!-- edit faculty details -->
								<div id="form-edit-organization" title="Edit Organization Details">
									<form id='edit-organization-popup' method="POST" action="/CommonModule/OrganizationEdit" onSubmit="return success1(this)"  enctype="multipart/form-data">
									
									
									<div class="container1">
									<div class="row1">
									<div class="col" style="margin-left:260px">
									<table style="width:15%"><tr>
									<td style="text-align:center">
												<label for="organizationedit"
												class="control-group" ><b>Select a Faculty:</label>
											
											<select name="organizationedit" id="organizationedit" >
												 <%
												
												
												  
												  
												  for (int i = 0; i < arrList3.size(); i++) {
													%>
													<option><%=arrList3.get(i).getORGANIZATION_NAME() %></option>
												<%} %> 
												
												
											</select> 
											</td></tr></table>
											 </div>
											 </div>
											 </div>
											 
									<table >
										<div>
										
									
									
									
												
										
										
											 
								<br>
											<tr>
										
											<td>
											<label for="editorgname" class="control-group">Faculty Name:</label>
											<input type="text" name="editorgname" 
												id="editorgname"  class="span4" placeholder="Name"  onchange="checkeditName()"  />
												<br>
												<input
												type="hidden" class="span4" name="isUpdate1" id="isUpdate1"
												> 
											<span id="isEorg" name="isEorg"></span>
											</td>
											<td>
											
											<label for="editcontactperson" class="control-group">Contact Person:
												</label> <input type="text" class="span4" name="editcontactperson"
												id="editcontactperson" placeholder="Contact Person" onchange="ValidateEditName()"> 
											</td>
											
											
											
											</tr>
											<tr><td>
											<label for="editcontactno" class="control-group">Contact Number:
												</label> <input type="text" class="span4" name="editcontactno"
												id="editcontactno" onchange="checkEditMobileNo()" placeholder="Contact No"> 
											</td>
  
											<td>
											<label for="editaddress" class="control-group">Address:</label>
											
											<input type="text" name="editaddress" id="editaddress"
												 class="span4" placeholder="Address"/>
												 <input type="hidden" name="isEE2"
													id="isEE2"/>
													<input type="hidden" id="editlogoname" name="editlogoname" value="" />
											</td>
											</tr>
											<tr>
												
												 <td>
												 <label
												for="editemail" class="control-group">Email:</label> <input
												type="text" name="editemail" id="editemail" class="span4"
												placeholder="Email" onchange="checkeditEmail()"/>
												 
												 </td>
												 <td style="vertical-align:top">
											<label for="editlogo" class="control-group">Faculty Logo:</label>
											<input type="file" name="editlogo" id="editlogo"
												 class="span4" onchange="readURL1(this),checkeditFileSize(this);" accept="image/*"/>
												 </td>
												 </tr><tr><td>
												 <img name="editblah" id="editblah" src="#"  /> 
												 
												
													
													
											</td>
											</tr>
											</div>
											</table>
											</form>

											
											

						
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert2.min.js"></script>
	<!-- dfd -->


<script>



 

 /* $( document ).ready(function() {
	
debugger;
    console.log( "ready!" );
    $("#").children().each(function() {
        $(this).html($(this).html().replace(/Administrator/g,"<img src='assets/images/Admin.png' width='15' height='15' title='Administrator'/>")); *
       $(this).html($(this).html().replace(/Charts/g,"<img src='assets/images/charts.jpg' width='15' height='15' title='Charts'/>"));
        $(this).html($(this).html().replace(/Connect to Agent/g,"<img src='assets/images/cagent.png' width='15' height='15' title='Connect to Agent'/>"));
        $(this).html($(this).html().replace(/Std. Campaign/g,"<img src='assets/images/s.png' width='8' height='8' title='Std.Campaign'/>"));
        $(this).html($(this).html().replace(/Dyn. Campaign/g,"<img src='assets/images/d.png' width='15' height='15' title='Dyn.Campaign'/>"));
        $(this).html($(this).html().replace(/Manage Campaign/g,"<img src='assets/images/manage.png' width='15' height='15'title='Manage Campaign'/>")); 
    });
    
        

});  */
 
 

 
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
	document.getElementById("msgboxOrg").style.visibility = "hidden";
	document.getElementById("msgboxOrgedit").style.visibility = "hidden";
	
	debugger;
	//alert(document.getElementById("organization").value);
	//document.getElementById("organization").setAttribute("readOnly",true);
	var orgname="<%=orgname%>";
	//alert(orgname);
	 document.getElementById("organization").value = orgname;
//document.getElementById("organization").setAttribute("readonly", true);
document.getElementById("organization").disabled=true;
//alert( document.getElementById("organization").value);

}



</script>
	
	






	
	<%
									if(userCrateSatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
									
										
										swal({title: "Success", text: "User Created Successfully.", icon: "success",});
										
										/* 	var message="User created Sucessfully.";
										var title="Customer Registration";
										var buttonText="OK";
										 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
										  title = (title == undefined) ? "The page says:" : title;

										  var div = $('<div>');
										  div.html(message);
										  div.attr('title', "Customer Registration");
										  div.dialog({
										      autoOpen: true,
										      modal: true,
										      draggable: false,
										      resizable: false,
										      buttons: [{
										          text: buttonText,
										          click: function () {
										              $(this).dialog("close");
										              div.remove();
										            
										          }
										      }]
										  }); */
										  
								        </script>
										
									<% 
									session.setAttribute("addstatus", false);
									}%>
									
									<%
									if(updateuserStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										swal({title: "Success", text: "User Updated Successfully.", icon: "success",});
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										/* var message="User Updated Sucessfully.";
										var title="Customer Registration";
										var buttonText="OK";
										 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
										  title = (title == undefined) ? "The page says:" : title;

										  var div = $('<div>');
										  div.html(message);
										  div.attr('title', "Customer Registration");
										  div.dialog({
										      autoOpen: true,
										      modal: true,
										      draggable: false,
										      resizable: false,
										      buttons: [{
										          text: buttonText,
										          click: function () {
										              $(this).dialog("close");
										              div.remove();
										            
										          }
										      }]
										  }); */
										  
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
										
										swal({title: "Success", text: "User Deleted Successfully.", icon: "success",});
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										/* var message="User Deleted Sucessfully.";
										var title="Customer Registration";
										var buttonText="OK";
										 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
										  title = (title == undefined) ? "The page says:" : title;

										  var div = $('<div>');
										  div.html(message);
										  div.attr('title', "Customer Registration");
										  div.dialog({
										      autoOpen: true,
										      modal: true,
										      draggable: false,
										      resizable: false,
										      buttons: [{
										          text: buttonText,
										          click: function () {
										              $(this).dialog("close");
										              div.remove();
										            
										          }
										      }]
										  }); */
										  
								        </script>
										
									<% 
									session.setAttribute("deleteStatus", false);
									}%>
									
									<%
									if(unlockStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										
										
										swal({title: "Success", text: "User Unlocked Successfully.", icon: "success",});
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										/* var message="User Unlocked Sucessfully.";
										var title="Customer Registration";
										var buttonText="OK";
										 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
										  title = (title == undefined) ? "The page says:" : title;

										  var div = $('<div>');
										  div.html(message);
										  div.attr('title', "Customer Registration");
										  div.dialog({
										      autoOpen: true,
										      modal: true,
										      draggable: false,
										      resizable: false,
										      buttons: [{
										          text: buttonText,
										          click: function () {
										              $(this).dialog("close");
										              div.remove();
										            
										          }
										      }]
										  }); */
										  
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
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
									/* 	var message="User Replaced Sucessfully.";
										var title="User Replacement";
										var buttonText="OK";
										 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
										  title = (title == undefined) ? "The page says:" : title;

										  var div = $('<div>');
										  div.html(message);
										  div.attr('title', "User Replacement");
										  div.dialog({
										      autoOpen: true,
										      modal: true,
										      draggable: false,
										      resizable: false,
										      buttons: [{
										          text: buttonText,
										          click: function () {
										              $(this).dialog("close");
										              div.remove();
										            
										          }
										      }]
										  }); */
										  
								        </script>
										
									<% 
									session.setAttribute("replaceStatus", false);
									}%>

<!-- end -->
									
									
									
									
									
									
									
									
									
									<script type="text/javascript">

	function unlockUser(usr,name){
		
		//alert()
		//alert2(usr+"user unlocked Sucessfully.", "Customer Registration", "OK");
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
							window.location.href = "/CommonModule/UserUnlocker?userid="
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
							window.location.href = "/CommonModule/UserAction?username="
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
					document.forms["add-user-popup"].submit();
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

	function addNewUser() {
		//var isEdit = "add";
		//$("#isUpdate").val(isEdit);
		debugger;
			//alert(document.getElementById("organization").value);
			<%PasswordGen pass = new PasswordGen();%>
			<%String passNew = pass.getPassword();%>
			$("#password").val('<%=passNew%>');
			
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
						$("#organization").attr('disabled',false);
						$("#isEE").show();
					}},
			
			
			
			"title" : "Add new user" ,
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
					}
				},
				"Submit" : function() {
					//put code here for form submission
					//alert(document.getElementById("isEE").value);
					debugger;
					document.getElementById("organization").disabled=false;
					//alert(document.getElementById("organization").value);
					//alert(document.getElementById("isEE").value);
					if (document.getElementById("isEE").value === '640') {
						//alert("isEE= "+document.getElementById("isEE").value);
						loginSuccess();
						document.forms["add-user-popup"].submit();
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
							$("#isE").hide();
							$("#username").attr('readonly', false);
							$("#organization").attr('readonly',false);
							$("#isEE").show();
						}
					} else {
						//alert("en ne");
					
						document.getElementById("username").focus();
						//alert("Please enter different UserName!");
					}

				}
			}
		});
	}
	
function addNewOrganization(){

		$('#form-add-new-organization').dialog({
			modal : true,
			"title" : "Add new Organization" ,
			dialogClass: 'dlgfixed',
		    position: "center",
		    maxWidth:810,
            maxHeight: 540,
            width: 810,
            height: 540,
            close: function() {
				{
					$("#orgname").val("");
					$("#address").val("");
					$("#contactperson").val("");
					$("#contactno").val("");
					$("#email1").val("");
					$("#datejoined").val("");
					$("#logo").val("");
					$("#blah").attr('src', 'assets/images/layout/space.JPG');
					$("#isEE1").val("");
					//$("#username").attr('readonly', false);
					$("#isEE").show();
				}},
            
            
            
			buttons : {
				"Cancel" : function() {
					$(this).dialog("close")
					{
						
					
						//$("#isUpdate1").val("");
						
						
						$("#orgname").val("");
						$("#address").val("");
						$("#contactperson").val("");
						$("#contactno").val("");
						$("#email1").val("");
						$("#datejoined").val("");
						$("#logo").val("");
						$("#blah").attr('src', 'assets/images/layout/space.JPG');
						$("#isEE1").val("");
						//$("#username").attr('readonly', false);
						$("#isEE").show();
					}
				},
				"Submit" : function() {
					var addOrg="add1";
					
				 document.getElementById("isEE1").value=addOrg;
					//put code here for form submission
				//alert(document.getElementById("isEE1").value);
					//alert(document.getElementById("logo").value);
					
					var orgname=document.getElementById("orgname").value;
					if (orgname!="") {
					//alert(document.getElementById("logo").value);
					var str =document.getElementById("logo").value;
					//alert("str="+str);
			  if(str==""){
				 //alert("str is null");
			
					str="C:\\fakepath\\mobios.png";
					
					//alert("now str is "+str);
				
			 } 
					 
					var words = str.split('\\');
					
					var str1=words[2];
					alert("str1 is"+str1);

				var logonmame=document.getElementById("logoname").value;
				//alert(logoname.value);
			
				logoname.value=str1;
			alert("logoname value is: "+logoname.value);
					

					

					
						document.forms["add-organization-popup"].submit();
						{
							//$("#isUpdate1").val("");
							debugger;
							$("#orgname").val("");
							$("#datatosend").val("");
						$("#address").val("");
						$("#contactperson").val("");
						$("#contactno").val("");
							$("#email1").val("");
							$("#datejoined").val("");
							$("#logo").val("");
							$("#logoname").val("");
							$("#blah").attr('src', '');
							$("#isEE1").value("");
							$("#isEE").show();
							
						}
					}else{
						
					
						document.getElementById("orgname").focus();
					}
					

				}
			}
		});
	
		
			//alert("enawa");
			
			//var dt = new Date();
			//var utcDate = dt.toUTCString();
			//var now = new Date();
			//var formatedDate = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();​
			
			//alert(utcDate);
			
			
		
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();

			if(dd<10) {
			    dd = '0'+dd
			} 

			if(mm<10) {
			    mm = '0'+mm
			} 

			today = mm + '/' + dd + '/' + yyyy;
		//alert(today);
		document.getElementById("datejoined").value = today;
	}
	
	function editOrganization(){
		$('#form-edit-organization').dialog({
			modal : true,
			"title" : "Edit Organization Details" ,
			dialogClass: 'dlgfixed',
		    position: "center",
		    maxWidth:810,
            maxHeight: 540,
            width: 810,
            height: 540,
            close: function() {
				{
					
					$("#organizationedit").val("");
					$("#editorgname").val("");
					$("#editaddress").val("");
					$("#editcontactperson").val("");
					$("#editcontactno").val("");
					$("#editemail1").val("");
					
					$("#editlogo").val("");
					$("#editblah").attr('src', 'assets/images/layout/space.JPG');
					$("#isEE2").val("");
					//$("#username").attr('readonly', false);
					$("#isEE").show();
				}},
            
            
            
			buttons : {
				"Cancel" : function() {
					$(this).dialog("close")
					{
						
					
						//$("#isUpdate1").val("");
						
						
						$("#organizationedit").val("");
					$("#editorgname").val("");
					$("#editaddress").val("");
					$("#editcontactperson").val("");
					$("#editcontactno").val("");
					$("#editemail1").val("");
					
					$("#editlogo").val("");
					$("#editblah").attr('src', 'assets/images/layout/space.JPG');
						$("#isEE2").val("");
						//$("#username").attr('readonly', false);
						$("#isEE").show();
					}
				},
				"Submit" : function() {
					var editOrg="edit";
					debugger;
				 document.getElementById("isEE2").value=editOrg;
					//put code here for form submission
				//alert(document.getElementById("isEE1").value);
					//alert(document.getElementById("isEE2").value);
					var editorgname=document.getElementById("editorgname").value;
					if (editorgname!="") {
					//alert(document.getElementById("editlogo").value);
					var str =document.getElementById("editlogo").value;

					
					 if(str==""){
						// alert("str is null");
					
							str="C:\\fakepath\\mobios.png";
							
							//alert("now str is "+str);
						
					 }
					
					var words = str.split('\\');
					
					var stredit=words[2];
					//alert(stredit);

				document.getElementById("editlogoname").value=stredit;
				
				
			//alert(editlogoname);
					

					

					
						document.forms["edit-organization-popup"].submit();
						{
							//$("#isUpdate1").val("");
							debugger;
							$("#organizationedit").val("");
							$("#editorgname").val("");
							//$("#datatosend").val("");
						$("#editaddress").val("");
						$("#editcontactperson").val("");
						$("#editcontactno").val("");
							$("#editemail").val("");
							
							$("#editlogo").val("");
							$("#editlogoname").val("");
							$("#editblah").attr('src', '');
							$("#isEE2").value("");
							$("#isEE").show();
							
							
						}
					}else{
						
					
						document.getElementById("editorgname").focus();
					}
					

				}
			}
		});
	}
	
// 	var p;
// 	var canvas = document.createElement("canvas");
// 	var img1=document.createElement("img"); 

// 	function getBase64Image(){     
// 	    debugger;
// 		p=document.getElementById("logo").value;
// 	    img1.setAttribute('src', p); 
// 	    canvas.width = img1.width; 
// 	    canvas.height = img1.height; 
// 	    var ctx = canvas.getContext("2d"); 
// 	    ctx.drawImage(img1, 0, 0); 
// 	    var dataURL = ctx.getImageData(img1.width,img1.width,img1.height,img1.height);
// 	    alert("from getbase64 function"+dataURL );    
// 	    return dataURL;
// 	} 
	
	
	
	
	
	
	
	
	
	
	
	

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
		
		var username = document.getElementById("username").value;
		
		{
		//	alert('123');			
			var url = "ExistUsername.jsp?username=" + username;
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					if (xmlhttp.responseText == "\n\n\n\n\nUser Name already exists")
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
			
			addNewUser();
		}
	}
	
	function checkExistREP() {
		var xmlhttp = new XMLHttpRequest();
		
		var usernameREP = document.getElementById("usernameREP").value;
		
		{
		//	alert('123');			
			var url = "ExistUsername.jsp?username=" + usernameREP;
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					if (xmlhttp.responseText == "\n\n\n\n\nUser Name already exists")
						document.getElementById("isEREP").style.color = "red";
					else
						document.getElementById("isEREP").style.color = "green";
					document.getElementById("isEREP").innerHTML = xmlhttp.responseText;

					document.getElementById("isEEREP").value = xmlhttp.responseText.length;
					//alert(document.getElementById("isEE").innerHTML);
				}

			};
			try {
				xmlhttp.open("GET", url, true);
				xmlhttp.send();
			} catch (e) {
				alert("unable to connect to server");

			}
			
			replacement();
		}
	}
	
	
	
	
	
	

	function pendingCustomer123() {

		document.getElementById("codeRefer").style.display = 'block';
		document.getElementById("rejectData").style.display = 'none';

	}

	function defaultPendingCus123() {
		//alert("default");
		document.getElementById("codeRefer").style.display = 'block';
	}

	function rejectCustomer1234() {
		//alert("REJECT");
		document.getElementById("rejectData").style.display = 'block';
		document.getElementById("codeRefer").style.display = 'none';
	}
	
	function passwordReset(){
	//	alert("passRESET");
	
		 var element = document.getElementById('passrest');
		 element.className += " " + "open"; 
	}
	
	function userUnlock(){
		alertOnload('Already unlocked user.',' Customer Registration', 'OK');
	}
	
	function alertOnload(message, title, buttonText) {
		 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
	    title = (title == undefined) ? "The page says:" : title;
	
	    var div = $('<div>');
	    div.html(message);
	    div.attr('title', "Customer Registration");
	    div.dialog({
	        autoOpen: true,
	        modal: true,
	        draggable: false,
	        resizable: false,
	        buttons: [{
	            text: buttonText,
	            click: function () {
	                $(this).dialog("close");
	                div.remove();
	              
	            }
	        }]
	    });
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
	
	
			function checkeditName(){
				//alert("awa");
				debugger;
					var orgname=document.getElementById("editorgname").value;
					
					<%for (int i = 0; i < arrList3.size(); i++){%>
					var x="<%=arrList3.get(i).getORGANIZATION_NAME() %>";
					if(orgname==""){
						//alert("Username is Empty");
						swal({title: "Alert", text: "Username is Empty.", icon: "warning",});
						return false;
						
					}
					
					else if(orgname==x){
						 document.getElementById("editorgname").value= "";
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
	List<UserVO> arrList4 = userDAO.getUserInfo2(userData.getUser_auto_id());
	
	%>
			function checkName1(){
				
				debugger;
					var username=document.getElementById("username").value;
					//alert(username);
					<%for (int i = 0; i < arrList4.size(); i++){%>
					var x="<%=arrList4.get(i).getUsername() %>";
				//alert(x);
					if(username==""){
						//alert("Username is Empty");
						swal({title: "Alert", text: "Username is Empty.", icon: "warning",});
						return false;
						
					}
					
					else if(username==x){
						 document.getElementById("username").value= "";
						//alert("Name is Exists");
						swal({title: "Alert", text: "Entered Name is Exists.", icon: "warning",});
						return false;	
					}
					//else{
						
					
					//return true;
					//}
					
				<%}%>
				}
	
	
			
		
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
			function checkEditMobileNo(){
				var mobnum=document.getElementById("editcontactno").value;
				if(mobnum.length==11){
					if(mobnum.startsWith("94")){
						//valid
						//disableTestFun();
						return true;
						
					}else{
						//error
						 document.getElementById("editcontactno").value = "";
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
						 document.getElementById("editcontactno").value = "";
						//alert("Enter a valid mobile number.");
						swal({title: "Alert", text: "Enter a valid mobile number.", icon: "warning",});
						//$("#testingNo").val('');
			   		 	//$("#testingNo").focus();
			   		 	
			   		 	return false;
					}
				}else{
					//error
						 document.getElementById("editcontactno").value = "";
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
function checkeditFileSize(file){
	
	 var FileSize = file.files[0].size / 1024 / 1024; // in MB
       if (FileSize > 0.0096) {
       	
      // debugger;
          // alert('File size exceeds 2 MB');
          debugger;
          document.getElementById('editblah').style.visibility='hidden';
           swal({title: "Alert", text: "File size exceeds 10KB.", icon: "warning",});
        
           $(file).val(''); //for clearing with Jquery
       
       } else {
       	 document.getElementById('editblah').style.visibility='visible';
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
	
	function checkeditEmail(){

		
	    var email = document.getElementById("editemail");
	    var filter = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	    if (!filter.test(email.value)) {
	        document.getElementById("editemail").value= "";
	   
	    //alert('Please provide a valid email address');
	    swal({title: "Alert", text: "Please provide a valid email address!", icon: "warning",});
	    email.focus;
	    return false;
	 }
		
	}
	
		    function checkMobileNo1(){
				var mobnum=document.getElementById("mobileno").value;
				if(mobnum.length==11){
					if(mobnum.startsWith("94")){
						//valid
						//disableTestFun();
						return true;
						
					}else{
						//error
						 document.getElementById("mobileno").value = "";
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
						 document.getElementById("mobileno").value = "";
						//alert("Enter a valid mobile number.");
						swal({title: "Alert", text: "Enter a valid mobile number.", icon: "warning",});
						//$("#testingNo").val('');
			   		 	//$("#testingNo").focus();
			   		 	
			   		 	return false;
					}
				}else{
					//error
						 document.getElementById("mobileno").value = "";
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
			    var val = document.getElementById('realname').value;
			    
			    if (!val.match(/^[a-z A-Z. ]+$/)) 
			    {
			    	swal({title: "Alert", text: "Please provide a valid Name!", icon: "warning",});
			    	$("#realname").val('');
			        return false;
			       
			    }
			    
			    return true;
			}
			function ValidateRealName1() 
			{
			    var val = document.getElementById('contactperson').value;
			    
			    if (!val.match(/^[a-zA-Z. ]+$/)) 
			    {
			    	swal({title: "Alert", text: "Please provide a valid Name!", icon: "warning",});
			    	$("#contactperson").val('');
			        return false;
			       
			    }
			    
			    return true;
			}
			
			function ValidateEditName() 
			{
			    var val = document.getElementById('editcontactperson').value;
			    
			    if (!val.match(/^[a-zA-Z. ]+$/)) 
			    {
			    	swal({title: "Alert", text: "Please provide a valid Name!", icon: "warning",});
			    	$("#editcontactperson").val('');
			        return false;
			       
			    }
			    
			    return true;
			}
			
			
		
			
			    function checkMobileNo2(){
					var mobnum=document.getElementById("mobilenoREP").value;
					if(mobnum.length==11){
						if(mobnum.startsWith("94")){
							//valid
							//disableTestFun();
							return true;
							
						}else{
							//error
							 document.getElementById("mobilenoREP").value = "";
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
							 document.getElementById("mobilenoREP").value = "";
							//alert("Enter a valid mobile number.");
							swal({title: "Alert", text: "Enter a valid mobile number.", icon: "warning",});
							//$("#testingNo").val('');
				   		 	//$("#testingNo").focus();
				   		 	
				   		 	return false;
						}
					}else{
						//error
							 document.getElementById("mobilenoREP").value = "";
						//alert("Enter a valid mobile number.");
						swal({title: "Alert", text: "Enter a valid mobile number.", icon: "warning",});
						//$("#testingNo").val('');
						 	//$("#testingNo").focus();
						 
						 	return false;
					}
					
				}


				function checkEmail2(){

					
				    var email = document.getElementById("emailREP");
				    var filter =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

				    if (!filter.test(email.value)) {
				        document.getElementById("emailREP").value= "";
				   
				    //alert('Please provide a valid email address');
				    swal({title: "Alert", text: "Please provide a valid email address!", icon: "warning",});
				    email.focus;
				    return false;
				 }
					
				}
			
			
			
			
		
		
		
		
	
	
	
	
	//new function to view subusers. 
	function viewSubUser(subuserId,parentorg)
	{
// 		debugger;
// 		alert(subuserId);
//alert(parentorg);

		var url = "/CommonModule/UserCreatorSub.jsp?subuserId="+subuserId+"&parentOrg="+parentorg;
		var res = encodeURI(url);

 		window.location.href = res;

// 		$.ajax({
// 		    url: "/AdminM/UserCreatorSub.jsp",
// 		    type: "POST",
// 		    data: {"subuserId":subuserId},
		    
		    
// 		    success: function(data){
// 		    	debugger;
// 		    	//window.location.replace("/AdminM/UserCreatorSub.jsp");
// 		    	window.open('/AdminM/UserCreatorSub.jsp');
// 		    }
// 		  });

// 			AJAX.onreadystatechange = handler;
// 		   AJAX.open("POST","/AdminM/UserCreatorSub.jsp",true);
// 		   AJAX.setRequestHeader("Content-type","application/x-www-form-urlencoded");
// 		   AJAX.send("subuserId="+encodeURIComponent(subuserId));
		
	}
	
	
	
//	$(document).ready(function(){

// 		var adminId = document.getElementById("createdby").value;
		
// 		var adminlist = [];
// 		$.ajax({
// 	        url: 'MainController.jsp?action=adminlist&adminId='+adminId+'',
// 	        contentType: 'application/json',
// 	        context: document.body
// 	    }).done(function (response) {
	    	
// 	    	adminlist = response.trim().split(',');
	          
// 	          $(function(){
	        	
// 	      				for (i = 0; i < adminlist.length; i++) {
// 						    var data = '<option>' + adminlist[i] + '</option>'
// 						    $('#createloc').append(data);
// 						}	
	      			
	      			
	      			
	      		
// 	      	});
	    	
//  	    });

	        
//	    });

	
	
	
	
</script>

<%
									if(addOrg.equals("add1")){
										System.out.println("true status dcdcdc");
									
									%>
									<script>
									
										
									swal({title: "Success", text: "Faculty Added Successfully.", icon: "success",});
									/* var message="Organization created Sucessfully.";
									var title="Create Organization";
									var buttonText="OK";
									 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
									  title = (title == undefined) ? "The page says:" : title;

									  var div = $('<div>');
									  div.html(message);
									  div.attr('title', "Create Organization");
									  div.dialog({
									      autoOpen: true,
									      modal: true,
									      draggable: false,
									      resizable: false,
									      buttons: [{
									          text: buttonText,
									          click: function () {
									              $(this).dialog("close");
									              div.remove();
									            
									          }
									      }]
									  }); */
									  
									
									
									</script>
									
									<% 
									session.setAttribute("addOrg", false);
									}%>
									
									
									
									<%
									if(editOrg.equals("edit")){
										System.out.println("edit status dcdcdc");
									
									%>
									<script>
									//swal({title: "Success", text: "Organization Updated Successfully.", icon: "success",});
										
									
									var message="Faculty Edited Sucessfully.";
									var title="Edit Organization";
									var buttonText="OK";
									 buttonText = (buttonText == undefined) ? "Ok" : buttonText;
									  title = (title == undefined) ? "The page says:" : title;

									  var div = $('<div>');
									  div.html(message);
									  div.attr('title', "Edit Organization");
									  div.dialog({
									      autoOpen: true,
									      modal: true,
									      draggable: false,
									      resizable: false,
									      buttons: [{
									          text: buttonText,
									          click: function () {
									              $(this).dialog("close");
									              div.remove();
									            
									          }
									      }]
									  });
									   
									
									
									</script>
									
									<% 
									session.setAttribute("editOrg", false);
									}%>




</body>

</html>
