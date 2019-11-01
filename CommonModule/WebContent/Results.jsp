<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.model.*"%>
<%@page import="com.evidu.bank.dao.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
	if (session.getAttribute("userId") == null || session.getAttribute("userId").equals("")) {
		response.sendRedirect("index.jsp");
	}
	String view = "" + request.getParameter("view");
	String userId = "", userCompId = "";
	userId = (String) session.getAttribute("userId");
	userCompId = (String) session.getAttribute("userCompId");
	System.out.println("userId============(msg 50) " + userId + " " + userCompId);

	String action = "" + request.getParameter("action");
	String electionType=(String)session.getAttribute("electionType");
	System.out.println("electionType " + electionType );
	String dataPoints=(String)session.getAttribute("dataPoints");
	System.out.println("dataPoints " + dataPoints );
	
	MainController mc = new MainController();
	
	
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


<!DOCTYPE html >
<html>
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

<!-- End Plugin Stylesheets -->

<!-- Main Layout Stylesheet -->
<link rel="stylesheet" href="assets/css/fonts/icomoon/style.css"
	media="screen">
<link rel="stylesheet" href="assets/css/main-style.css" media="screen">

<!-- fixed footer -->
<link rel="stylesheet" href="assets/css/fixed_footer.css" media="screen">

<title>OVS</title>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-123964987-1');
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<style>



</style>


</head>

<script>

window.history.forward();
function noBack() {
	window.history.forward();
}
function getSelectedValue() {

	var jqxhr = $.ajax({
		url : 'ResultsController.jsp?action=getElectionId',
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

<%-- <script>

function getChart() { 
	 debugger;
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "World Bauxite Production"
		},
		subtitles: [{
			text: "in tonnes"
		}],
		data: [{
			type: "doughnut",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}K",
			toolTipContent: "{y}K tonnes",
			dataPoints : <%out.print(dataPoints);%>
		}]
	});
	chart.render();
	 
	}

</script> --%>


<body data-show-sidebar-toggle-button="false" data-fixed-sidebar="false" onload="getSelectedValue();getChart()">

<%

String electionId=""+session.getAttribute("electionId");
if(electionId.equalsIgnoreCase("null")){
	electionId="1";
	
}
System.out.println("****electionId**"+electionId);

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
                             <%if(pageList.get(i).getAutoId().equals("10") ){ %>
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
			

								<h3 id="main-heading">Election Results</h3>
							
									
								
													
							</div>

							<div id="main-content">
			<form action="ResultsController.jsp" method="post">
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
											<input type="submit" class="btn btn-primary" onclick="getEtype();" value="Search"  style="position: relative; top: -5px;"></td> 
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
											 <%
											 int election_id = 0;
											 election_id= Integer.parseInt(electionId);		
													int totalVoters=0;
													int totalVotes=0;
													int unpublishedVotes=0;
													double percentage=0;
													int totalCandidates=0;
												VoterVO voterVO=new VoterVO();
												VoterDAO voterdao1 = new VoterDAO();



													totalVoters=voterdao1.getVoterInfo6(election_id);
															System.out.println("totalVoters: "+totalVoters);

													VotesVO votesVO=new VotesVO();
													VotesDAO votesdao= new VotesDAO();

													totalVotes=votesdao.getVotesInfo(election_id);
															System.out.println("totalVotes: "+totalVotes);

															unpublishedVotes=totalVoters-totalVotes;
															
															System.out.println("unpublishedVotes: "+unpublishedVotes);
															if (totalVoters==0){
																percentage=(totalVotes/1)*100;
																System.out.println("percentage: "+percentage);
															}else{
															percentage=((totalVotes*1.0)/(totalVoters*1.0))*100.0;
															
															System.out.println("percentage1: "+percentage);
															}
											
													CandidatesVO candidatesVO=new CandidatesVO();
													CandidatesDAO candidatesDAO=new CandidatesDAO();
													
													totalCandidates=candidatesDAO.getCandidatesInfo4(election_id);
													System.out.println("totalCandidates: "+totalCandidates);
											
													
													percentage=Math.round(percentage * 100.0) / 100.0;
													System.out.println("percentage is: "+percentage);
											%>
											
											 
											 
											 <div class="row-fluid">
									<div>
										<ul class="stats-container">
											<li><a class="stat summary"> <span
													class="icon icon-circle bg-blue"> <i
														class="icon-stats"></i>
												</span> <span class="digit"> <span class="text">Registered Voters</span> <%=totalVoters %>
												</span>
											</a></li>
											<li><a class="stat summary"> <span
													class="icon icon-circle bg-green"> <i
														class="icon-stats"></i>
												</span> <span class="digit"> <span class="text">Registered Candidates
													</span><%=totalCandidates %> 
												</span>
											</a></li>
											<li><a class="stat summary"> <span
													class="icon icon-circle bg-red"> <i
														class="icon-stats"></i>
												</span> <span class="digit"> <span class="text">Published Votes</span><%= totalVotes%> 
												</span>
											</a></li>
											<li><a class="stat summary"> <span
													class="icon icon-circle bg-orange"> <i
														class="icon-stats"></i>
												</span> <span class="digit"> <span class="text">Unpublished Votes</span><%=unpublishedVotes %>
												</span>
											</a></li>
											<li><a class="stat summary"> <span
													class="icon icon-circle bg-yellow"> <i
														class="icon-stats"></i>
												</span> <span class="digit"> <span class="text">Percentage</span><%=percentage %>&#37
														
												</span>
											</a></li> 
										
										</ul>
									</div>
								</div>
							
								
								<h3>Election to Select: <span id="eType"><%
								String electionType1="";
								if(electionType==null){
									electionType=electionType1;
								}else
									electionType1=electionType;
								%>
							
								
								<%=electionType1 %></span> </h3>
												<h4 class='sub'>
									<span>Graphic Illustrator</span>
								</h4>
								
								<%
								if(electionType!=""){
								
								 String index[]=electionType.split(",");
								if(index.length!=0){%><div class="row-fluid">
								<%for (int j = 0; j < index.length; j++) {%>
										
										<% 
										
										List<CandidatesVO> candidatesArray2 = candidatesDAO.getCandidatesInfo1(index[j],election_id);
										
										Gson gsonObj = new Gson();
										Map<Object,Object> map = null;
										List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
										
										for(int m=0;m<candidatesArray2.size();m++){
										
											int candidate_id=candidatesArray2.get(m).getCandidate_id();
											VotesDAO votesDAO=new VotesDAO();
											
											int votes = votesDAO.getVotesInfo1(candidate_id, election_id);

										 
											map = new HashMap<Object,Object>(); 
											map.put("label", candidatesArray2.get(m).getCandidate_name()); 
											map.put("y", votes); 
											list.add(map);
										}
										dataPoints = gsonObj.toJson(list);
										//session.setAttribute("dataPoints", dataPoints1);
										
										%>
										
										

										
									<div class="span6 widget" >
										<div class="widget-header">
											<span class="title" ><i class="icon-pie-chart"></i><%=index[j] %> </span>
										</div>
										<div class="widget-content">
											<div class="demo-charts-0000" style="height: 300px;"><div id='chartContainer<%=index[j]%>' style="height: 300px; width: 100%;"></div></div>
										</div>
										
										<script>

											function getChart<%=index[j]%>() { 
												var name = 'chartContainer<%=index[j]%>';
												var chart = new CanvasJS.Chart(name, {
													animationEnabled: true,
													theme: "light2",
													title: {
														text: '<%=index[j]%> Results'
													},
													subtitles: [{
														text: ""
													}],
													data: [{
														type: "doughnut",
														yValueFormatString: "#,##0",
														indexLabel: "{label}: {y}",
														toolTipContent: "{y} ",
														dataPoints : <%out.print(dataPoints);%>
													}]
												});
												chart.render();
												 
												}
											
											getChart<%=index[j]%>();
											
											</script>
									</div>
								
								
								<%}%></div><%}}%>
								
										<div class="row-fluid">
									<div class="span12">
										<div class="widget">
											<div class="widget-header">
												<span class="title">Results </span>
											</div>
											<div class="widget-content table-container">
												<table id="demo-dtable-01" class="table table-striped">
													<thead>
														<tr>
															<th><b>Candidate ID</b></th>
															<th>Image</th>
															
															<th>Name</th>
															<th>Position</th>
															<th><b>Votes</b></th>

														</tr>
													</thead>

													
													<%
														

														CandidatesVO candidatesVO1=new CandidatesVO();
														CandidatesDAO candidatesDAO1=new CandidatesDAO();
														 List<CandidatesVO> candidatesArray = candidatesDAO1.getCandidatesInfo(election_id);
														 int candidatesArraySize= candidatesArray.size();
																
													%> 
													<tbody>
												<% if(!(candidatesArraySize==0)){
	            	   for (int m = 0; m < candidatesArraySize; m++) {%> 
														<tr>
															<td><%=candidatesArray.get(m).getCandidate_id()%></td>
															<td><img src='assets\images\<%=candidatesArray.get(m).getCandidate_image() %>' alt="" class="img-rounded img-responsive" style="height:40px;width:40px;radius:50%"/></td>
															<td><%=candidatesArray.get(m).getCandidate_name()%></td>
															<td><%=candidatesArray.get(m).getCandidate_position()%></td>
															<%VotesDAO votesDAO= new VotesDAO();
									                      	int votes=0;
									                      	int candidate_id=candidatesArray.get(m).getCandidate_id(); 
									                      	votes = votesDAO.getVotesInfo1(candidate_id,election_id);%>
															
															<td><%=votes %></td>
														</tr>
														<%
																}
																	}

																
															%> 
														
													</tbody>
												</table>
											</div>
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

</body>



<script>
var lgname="uoklogo.png";
//alert(lgname);

document.getElementById('imgbox').src = "assets/images/company_logo/"+lgname+"";





</script>

</html>