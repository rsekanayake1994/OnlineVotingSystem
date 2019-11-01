<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.dao.*"%>
<%@page import="com.evidu.bank.model.*"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import="com.evidu.bank.passwordgenerator.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>

<html lang="en">


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
<link rel="stylesheet" href="assets/css/navigationbar.css" media="screen">


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


<title>Admin Module</title>
<!-- Global site tag (gtag.js) - Google Analytics -->
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123964987-1"></script> -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-123964987-1');
</script>



<style>

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
	onload="toggle_visibility('form-add-new-user');toggle_visibility('form-rep-user');">
	<%
		int checker=0;
		String AdminChecker = null;
		//get url parameter
		String subUser = request.getParameter("subuserId");
		String parentOrg=request.getParameter("parentOrg");
		System.out.println("****subUser**"+subUser);
		
		//GetSubUser roles. I used direct method eithout interrupting get set methods.
		//begin
		
		PreparedStatement statement;
		Connection con = null;
		Statement st = null;
		String output=null;
		try{
			String SQL = "SELECT * FROM `user` WHERE user_autoid=?";
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			statement = con.prepareStatement(SQL);
			statement.setString(1, subUser);
			ResultSet rs = statement.executeQuery();
			
			while (rs.next()) {
				output = rs.getString("usertype");
			}
			String[] userRoles = output.split(",");
			//System.out.println("****userRoles**"+output);
			for(int i=0;i<userRoles.length;i++){
				if(userRoles[i].equals("Administrator")){
					AdminChecker = "Administrator";
				}
			}
			//System.out.println("****AdminChecker**"+AdminChecker);
		}
		catch (Exception e) {
			System.out.println("Error On loginUser java : " + e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		//end
		
		String userCrateSatus = ""+session.getAttribute("addstatus");
		String userDeleteSatus = ""+session.getAttribute("deleteStatus");
		String updateuserStatus = ""+session.getAttribute("updatestatus");
		String unlockStatus = ""+session.getAttribute("unlockStatus");
		String replaceStatus = ""+session.getAttribute("replaceStatus");
		
		
		System.out.println("****userCrateSatus**"+userCrateSatus);
		System.out.println("****updateuserStatus**"+updateuserStatus);
		System.out.println("****deleteuserStatus**"+userDeleteSatus);
		System.out.println("****unlockStatus**"+unlockStatus);
		System.out.println("****replaceStatus**"+replaceStatus);
		
		
			String errCode = "" + request.getParameter("st");
			UserInfo userData = new UserInfo();
			userData = (UserInfo) session.getAttribute("current_user");

			String current_user = userData.getUser_id();
			String current_user_id = userData.getUser_auto_id();
			String orgname=userData.getOrganization();
			System.out.println("****current_user_id**"+current_user_id);

			if (userData == null) {
				
				System.out.println("****@@@@@@@@@1**");
				response.sendRedirect("index.jsp");
				return;
			}
			List<UserPages> pageList= new ArrayList<UserPages>();
			  //ession.setAttribute("currentUserPages", pageList);
			  pageList= (List<UserPages>)session.getAttribute("currentUserPages");
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
	  System.out.println(arrList2.size());
	  for (int i = 0; i < arrList2.size(); i++) {
		  System.out.println(arrList2.get(i).getORGANIZATION_NAME());
		  String x=arrList2.get(i).getORGANIZATION_NAME();
		  if(orgname.equals(x))
		  {
			  logoname=arrList2.get(i).getORGANIZATION_LOGO();
		  }
		
		
	}
	  System.out.println(logoname);
	
	
	
	
	%> 

	<div id="wrapper">
		<header id="header" class="navbar navbar-inverse">
			<div class="navbar-inner">
				<div class="container">
					<div class="brand-wrap pull-left">
						<div class="brand-img">
							<a class="brand" href="#"> <img id="imgbox"
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
								<ul class="breadcrumb">

									<li><i class="icos-home"></i>Home <span class="divider">&raquo;</span>
									</li>
								</ul>

								<h3 id="main-heading">User Creation</h3>
								<button id="msgbox" class="btn btn-primary"
									onclick="addNewUser()">Add New User</button>
									<button id="viewAll" class="btn btn-primary">View All</button>
								<!-- <span id="msgbox-trigger-6" class="btn btn-primary">Advanced Prompt MsgBox</span> -->
								<span class="pull-right"><button id="returnback" class="btn btn-primary" onclick="returnhome()">Return</button></span>

							</div>

							<div id="main-content">
								<div>
									<a id="manualA" href="#" onclick="returnhome()"><%=userData.getUsername()%>>></a>
									<%
										UserDAO userDAONav = new UserDAO();
										List<UserVO> arrListNav = userDAONav.getNavigationList(subUser,current_user_id);
										//for (int i = 0; i < arrListNav.size(); i++) {
										  for (int i = arrListNav.size(); i!=0 ; i--) {
										
									%>
										<a id="autoA" href="#" onclick="viewSubUser('<%=arrListNav.get(i-1).getId()%>','<%=arrListNav.get(i-1).getOrganization()%>')"><%=arrListNav.get(i-1).getUsername()%>>></a>
									<%
										}
									%>
								</div>
							

								<div class="row-fluid">
									<div id="pending_status_summery">
										<div class="controls"></div>
									</div>

								</div>

								<div class="row-fluid" id="codeRefer" style="display: block;">

									<div class="span12 widget">
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
														<th>Last Logged in</th>
														<!-- <th>Comment</th> -->
														<th>Mobile No</th>
														<!-- <th>Email</th>  -->
														<th>CreatedBy</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
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
																									List<UserVO> arrList = userDAO.getUserInfo(subUser);
																									//System.out.println("User array size: " + arrList.size());
																									for (int i = 0; i < arrList.size(); i++) {
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
															style="position: relative; left: -58px;"> 
															<a href="#" class="btn btn-small" title="Edit User" onclick="editUser('<%=arrList.get(i).getUsername()%>','<%=arrList.get(i).getPassword()%>','<%=arrList.get(i).getRealName()%>','<%=arrList.get(i).getMobileNo()%>','<%=arrList.get(i).getEmail()%>','<%=arrList.get(i).getUserRoles()%>','<%=userRoles%>');"><i
																	class="icon-edit"></i></a> <%-- <% session.setAttribute("username", arrList.get(i).getUsername()); %> --%>
																<a href="#" class="btn btn-small" title="Remove User" onclick="deleteUser('<%=arrList.get(i).getUsername()%>')" id="delete"><i class="icon-trash"></i></a> 
																<a href="#" class="btn btn-small" 
																<%if(arrList.get(i).getStatus().equals("LOCKED")){ %>
																onclick="unlockUser('<%=arrList.get(i).getUserId()%>')"
																<%} %>
																 id="unlock" title="Unlock User">
																<%if(arrList.get(i).getStatus().equals("LOCKED")){ %>
																
																<i class="icon-lock"></i>
																<%}else{ %>
																	<i class="icos-unlocked"></i>
																	<!-- <i class="icon-unlock"></i> -->
																<%} %>
																</a>
																<a href="#" class="btn btn-small" title="User Profile" onclick="viewSubUser('<%=arrList.get(i).getId()%>','<%=parentOrg%>')"><i class="icon-official"></i></a> 
																<a href="#" class="btn btn-small" title="Replace User"  onclick="replaceUser('<%=arrList.get(i).getId()%>','<%=parentOrg%>')"><i  class="icon-refresh"></i></a>  
																

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
														<th>Last Logged in</th>
<!-- 														<th>Comment</th> -->
														<th>Mobile No</th>
<!-- 														<th>Email</th>  -->
														<th>CreatedBy</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
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
																									List<UserVO> arrList1 = userDAO1.getUserInfo1(subUser);
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
														<td><%=arrList1.get(i).getLastLoggedIn()%></td>
														<%-- <td><%=arrList.get(i).getComment()%></td>--%>
														<td><%=arrList1.get(i).getMobileNo()%></td>
														<%--<td><%=arrList.get(i).getEmail()%></td> --%>
														<td><%=createbyUname1%></td>
														<%
															//System.out.println("test: " + i);
														%>

														<td class="action-col"><span class="btn-group"
															style="position: relative; left: -58px;"> 
															<a href="#" class="btn btn-small" onclick="editUser('<%=arrList1.get(i).getUsername()%>','<%=arrList1.get(i).getPassword()%>','<%=arrList1.get(i).getRealName()%>','<%=arrList1.get(i).getMobileNo()%>','<%=arrList1.get(i).getEmail()%>','<%=arrList1.get(i).getUserRoles()%>','<%=userRoles1%>');" title="Edit User"><i
																	class="icon-edit"></i></a> <%-- <% session.setAttribute("username", arrList.get(i).getUsername()); %> --%>
																<a href="#" class="btn btn-small" onclick="deleteUser('<%=arrList1.get(i).getUsername()%>')" id="delete" title="Remove User"><i class="icon-trash"></i></a> 
																<a href="#" class="btn btn-small" 
																<%if(arrList1.get(i).getStatus().equals("LOCKED")){ %>
																onclick="unlockUser('<%=arrList1.get(i).getUserId()%>')" title="Unlock User"
																<%} %>
																 id="unlock">
																<%if(arrList1.get(i).getStatus().equals("LOCKED")){ %>
																
																<i class="icon-lock"></i>
																<%}else{ %>
																	<i class="icos-unlocked"></i>
																	<!-- <i class="icon-unlock"></i> -->
																<%} %>
																</a>
																<a href="#" class="btn btn-small" onclick="viewSubUser('<%=arrList1.get(i).getId()%>','<%=parentOrg%>')" title="User Profile"><i class="icon-official"></i></a> 
																<a href="#" class="btn btn-small"  onclick="replaceUser('<%=arrList1.get(i).getId()%>','<%=parentOrg%>')" title="Replace User"><i  class="icon-refresh"></i></a>
																

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
									<form id='add-user-popup' method="POST" action="/CommonModule/UserCreator1">
									<input type="hidden" name="createdby" id="createdby" value="<%=userData.getUser_auto_id() %>">	
									<input type="hidden" name="userlevelP" id="userlevelP" value="<%=userData.getUser_level() %>">
									<input type="hidden" name="parentId" id="parentId" value="<%=subUser%>">		

									<table>
										<div>
											<!-- <h3>Add New User</h3> -->
											<tr> <td>
											<label for="username" class="control-group">Username:</label>
											<input type="text" name="username" onkeyup="checkExist()"
												id="username" class="span4" placeholder="Username"><br>
											<span id="isE" name="isE"></span>
											</td>
											<td>
											<label for="organization"
												class="control-group">Organization:</label>
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
												class="span4" placeholder="Mobile No"> 
												</td><td>
												<label
												for="email" class="control-group">Email:</label> <input
												type="text" name="email" id="email" class="span4"
												placeholder="Email" onchange="checkEmail1()">
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
											</td><tr>
	
										</div>
										</table>
									</form>
								</div>
								<!-- add popup -->
								
								
								
									<!-- repeation begins -->
								
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
												class="control-group">Organization:</label>
											
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
												value="<%=pwdNew1%>" class="span4" placeholder="Password">
											</td><td>
											<label for="realname" class="control-group">Real
												Name:</label> <input type="text" class="span4" name="realnameREP"
												id="realnameREP" placeholder="Real Name" onchange="validateRealName1()"> <input
												type="hidden" class="span4" name="isUpdateREP" id="isUpdateREP"
												placeholder="Real Name"> <input type="hidden"
												class="span4" name="oldusernameREP" id="oldusernameREP"
												placeholder="Real Name">
											<td></tr>

											<tr> <td>
											<label for="mobileno" class="control-group">Mobile
												No:</label> <input type="text" name="mobilenoREP" id="mobilenoREP"
												class="span4" placeholder="Mobile No"> 
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
														
																									UserRolesVO userRolesVO1 = new UserRolesVO();
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
								
								
								
								
								
								
								
								
								<!--repeation ends -->
								
								
							</div>
							
						</section>
					</div>
				</div>
			</div>
		</div>

		<footer id="footer" class="footerFixed">
            <div class="footer-left">Designed by - <a target="_blank" rel="noopener noreferrer" href="http://www.mobios.lk">UOK</a></div>
            <div class="footer-right"><p>Copyright 2018 - University of Kelaniya. All Rights Reserved.</p></div>
        </footer>

	</div>

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
	<script src="js/selection_js_me.js"></script>
	<!-- <script src="js/selection_js.js"></script> -->
	<script src="js/my_js.js"></script>

	<!-- Demo Scripts -->
	<script src="assets/js/getRefNumberDetail.js"></script>

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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	<!-- dfd -->
	
	
	<script>
	var lgname="uoklogo.png";
	//alert(lgname);
	document.getElementById('imgbox').src = "assets/images/company_logo/"+lgname+"";
	var parentOrg="<%=parentOrg%>";
	//alert(parentOrg);
	debugger;
	document.getElementById("organization").value=parentOrg;
	document.getElementById("organizationREP").value=parentOrg;
	//alert(document.getElementById("organization").value);
	//alert(document.getElementById("organizationREP").value);
	
	document.getElementById("organization").disabled=true;
	document.getElementById("organizationREP").disabled=true;
	
	</script>
	
	
	
	

	
	<%
									if(userCrateSatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										var message="User created Sucessfully.";
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
										  });
										  
								        </script>
										
									<% 
									session.setAttribute("addstatus", false);
									}%>
									
									<%
									if(updateuserStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										var message="User Updated Sucessfully.";
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
										  });
										  
								        </script>
										
									<%
									session.setAttribute("updatestatus", false);
									}%>
									<%
									if(userDeleteSatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										var message="User Deleted Sucessfully.";
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
										  });
										  
								        </script>
										
									<% 
									session.setAttribute("deleteStatus", false);
									}%>
									
									<%
									if(unlockStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										var message="User Unlocked Sucessfully.";
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
										  });
										  
								        </script>
										
									<% 
									session.setAttribute("unlockStatus", false);
									}%>
									
									
									<%
									if(replaceStatus.equals("true")){
										System.out.println("true status");
									
									%>
									
										<script type="text/javascript">
										//alert("true")
										  //alert2("Photo Image Updated Sucessfully.", "Customer Registration", "OK");
										var message="User Replaced Sucessfully.";
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
										  });
										  
								        </script>
										
									<% 
									session.setAttribute("replaceStatus", false);
									}%>
									
									<script type="text/javascript">

	function unlockUser(usr){
		
		//alert()
		//alert2(usr+"user unlocked Sucessfully.", "Customer Registration", "OK");
		var message = "Are you sure you want to unlock "+usr+"?";
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
		document.getElementById("organizationREP").value="<%=parentOrg%>";
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
 		//debugger;
 		//alert("UID"+GloblUID);
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
					$("#organizationREP").val("");
					$("#emailREP").val("");
					$("#oldusernameREP").val("");
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
					//if (document.getElementById("isEE").value === '629') {
					loginSuccess();
					$("#isEE").hide();
					document.forms["add-popupREP"].submit();
					{
						$("#isUpdateREP").val("");
						$("#usernameREP").val("");
						$("#passwordREP").val("");
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
/* $( document ).ready(function() {
	
	debugger;
	    console.log( "ready!" );
	    $("#codeRefer").children().each(function() {
	    	 $(this).html($(this).html().replace(/Administrator/g,"<img src='assets/images/Admin.png' width='15' height='15' title='Administrator'/>"));
	         $(this).html($(this).html().replace(/Charts/g,"<img src='assets/images/charts.jpg' width='15' height='15' title='Charts'/>"));
	         $(this).html($(this).html().replace(/Connect to Agent/g,"<img src='assets/images/cagent.png' width='15' height='15' title='Connect to Agent'/>"));
	         $(this).html($(this).html().replace(/Std. Campaign/g,"<img src='assets/images/s.png' width='8' height='8' title='Std.Campaign'/>"));
	         $(this).html($(this).html().replace(/Dyn. Campaign/g,"<img src='assets/images/d.png' width='15' height='15' title='Dyn.Campaign'/>"));
	         $(this).html($(this).html().replace(/Manage Campaign/g,"<img src='assets/images/manage.png' width='15' height='15'title='Manage Campaign'/>"));
	    });
	    
	       
	    

	}); */
	     

$(document).ready(function () {
	
	var AdminChecker = '<%=AdminChecker%>';
	//alert(AdminChecker);
	if(AdminChecker != "Administrator"){
		$('#msgbox').prop('disabled', true);
	}
	
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
			window.location.href = "/CommonModule/UserAction?username=" + usr;
			return true;
		} else {
			//document.write("User does not want to continue!");
			return false;
		}

	}

	function editUser(usr, pwd, realname, mobileno, email, userRoles, allUserRoles) {

		
		var table = document.getElementById('demo-dtable-01'), cells = table
				.getElementsByTagName('td');
		updateUser(usr, pwd, realname, mobileno, email, userRoles,allUserRoles);

	}
	
	function getDifference(a, b)
	{
		var diff = $(b).not(a).get();	
		return diff;
	}

	function updateUser(usr, pwd, realname, mobileno, email, userRoles, allUserRoles) {
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
		$("#username").val(usr);
		//$("#password").val(pwd);
		$("#realname").val(realname);
		$("#mobileno").val(mobileno);
		$("#email").val(email);
		$("#oldusername").val(usr);
		$("#username").attr('readonly', true);
		$("#isEE").hide();
		$("#createloc").hide();
		$("#createlocl").hide();
		$('#form-add-new-user').dialog({
			modal : true,
			close: function() {
				{
					$("#isUpdate").val("");
					$("#username").val("");
					$("#password").val("");
					$("#realname").val("");
					$("#mobileno").val("");
					$("#email").val("");
					$("#oldusername").val("");
					$("#list2").empty();
					$("#username").attr('readonly', false);
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
						$("#password").val("");
						$("#realname").val("");
						$("#mobileno").val("");
						$("#email").val("");
						$("#oldusername").val("");
						$("#list2").empty();
						$("#username").attr('readonly', false);
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
						$("#password").val("");
						$("#realname").val("");
						$("#mobileno").val("");
						$("#email").val("");
						$("#oldusername").val("");
						$("#list2").empty();
						$("#username").attr('readonly', false);
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
			
			<%PasswordGen pass = new PasswordGen();%>
			<%String passNew = pass.getPassword();%>
			$("#password").val('<%=passNew%>');
			
			$('#form-add-new-user').dialog({
			modal : true,
			"title" : "Add new user" ,
			dialogClass: 'dlgfixed',
		    position: "center",
		    maxWidth:810,
            maxHeight: 540,
            width: 810,
            height: 540,
			buttons : {
				"Cancel" : function() {
					document.getElementById("organization").disabled=false;
				
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
						$("#isEE").show();
						window.location.reload(true);
					}
				},
				"Submit" : function() {
					//put code here for form submission
					//alert(document.getElementById("isEE").value);
					debugger;
					document.getElementById("organization").disabled=false;
					if (document.getElementById("isEE").value === '640') {
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
							$("#username").attr('readonly', false);
							$("#organization").attr('disabled', false);
							$("#isEE").show();
						}
					} else {
						document.getElementById("username").focus();
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
	function ValidateRealName() 
	{
	    var val = document.getElementById('realname').value;
	    
	    if (!val.match(/^[a-zA-Z]+$/)) 
	    {
	    	swal({title: "Alert", text: "Please provide a valid Name!", icon: "warning",});
	    	$("#realname").val('');
	        return false;
	       
	    }
	    
	    return true;
	}
	function ValidateRealName1() 
	{debugger;
	    var val = document.getElementById('realnameREP').value;
	    
	    if (!val.match(/^[a-zA-Z]+$/)) 
	    {
	    	swal({title: "Alert", text: "Please provide a valid Name!", icon: "warning",});
	    	$("#realnameREP").val('');
	        return false;
	       
	    }
	    
	    return true;
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
		// var username = document.forms["form-add-new-user"]["username"].value;
		var username = document.getElementById("username").value;
		//document.getElementById("isE").style.color = "red";
		//if (username.trim() !== '')
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
	
	//new function to view subusers. 
	function viewSubUser(subuserId,parentOrg)
	{
		//alert(subuserId);
		
		window.location.href = "/CommonModule/UserCreatorSub.jsp?subuserId="+subuserId+"&parentOrg="+parentOrg;
		
	}
	
 	function returnhome()
 	{
		window.location.href = "/CommonModule/UserCreator.jsp";
		
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
function checkEmail1(){

		
	    var email = document.getElementById("email");
	    var filter =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	    if (!filter.test(email.value)) {
	        document.getElementById("email").value= "";
	   
	    //alert('Please provide a valid email address');
	    swal({title: "Alert", text: "Please provide a valid email address!", icon: "warning",});
	    email.focus;
	    return false;
	 }
		
	}
	

	
	
	
	
</script>

</body>

</html>
