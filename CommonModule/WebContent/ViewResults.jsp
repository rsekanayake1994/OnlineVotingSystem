<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.dao.*"%>
<%@page import="com.evidu.bank.model.*"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import="com.evidu.bank.passwordgenerator.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.util.*" %>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	int timeout = session.getMaxInactiveInterval();
	response.setHeader("Refresh", timeout + "; URL = index.jsp");
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	String dataPoints=(String)session.getAttribute("dataPoints");
	System.out.println("dataPoints " + dataPoints );
%>
<%
		
		
			String errCode = "" + request.getParameter("st");
			VoterInfo voterData = new VoterInfo();
			voterData = (VoterInfo) session.getAttribute("current_user");

		
			
			
			String current_user = voterData.getVoter_id();
			
			String current_user_id = voterData.getVoter_id();
			System.out.println("****current_user_id**"+current_user_id);
			

			if (voterData == null) {
				
				System.out.println("****@@@@@@@@@1**");
				response.sendRedirect("index.jsp");
				return;
			}
		
			 String rPath = getServletConfig().getServletContext().getRealPath("");
			  System.out.println("root path:= "+rPath);
			
	%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<!------ Include the above in your HEAD tag ---------->
<style>
@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
@import url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css);

.hm-gradient {
    background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
}
.darken-grey-text {
    color: #2E2E2E;
}

.navbar .dropdown-menu a:hover {
    color: #616161 !important;
}
.darken-grey-text {
    color: #2E2E2E;
}

.bannerItem{
   /*  margin-bottom:2500px !important; /* white below banner - delete it */
   /* padding-top:10px; /* padding above the header */
  width:100%;
  margin:auto;
      margin-top:10px; /* white above banner - delete it */
  max-height:180px !important;
}

.banner-header{
    margin: 0;     
    color: #fff;
    padding-top:0px;
    font-size: 42px;  
    font-family:lato;
    padding-left: 10px;
    padding-right: 10px;
    padding-top:-190px;
    font-weigh:100;
}

.banner-text{
    margin: 0;     
    color: #fff;
    margin-top:0px;
    padding-bottom: 0px;
    font-family: lato;
    font-weight: 100;
    font-size: 20px;
    padding-left: 10px;
    padding-right: 10px;
}

.bannerItem{
    background: #333;    
    text-align: center;
    height: 100% !important;
    border-radius: 6px; /* rounded corners */
   background: linear-gradient(to top, rgba(0,0,0,0.7) 0%,rgba(255,255,255,0.4) 100%);
  background-width: 100%;
  background-attachment: fixed; 
  image-repeat: none;
  max-height: 0%;
  background-size:100%;
}



.banner-example{
	margin: 20px; /*padding around banner - delete for full width*/
}


/* Footer
================================================== */

#footer
{
    padding: 5px;
    color: #444;
    font-size: 11px;
    line-height: 2;
    border-top: 1px solid #ddd;
    *zoom: 1;
  
}

#footer:after, 
#footer:before
{
    display: table;
    content: "";
    line-height: 0;
}

#footer:after
{
    clear: both;
}

#footer p
{
	margin-right: 30px;
    margin-bottom: 0;
}

#footer .footer-left
{
    float: left;
}

#footer .footer-right
{
    float: right;
    text-align: right;
}
.footerFixed {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #E1E1E1;
    color: white; 
   text-align: center;   
   border-right:10px;
   padding-top:20px;
}
#candidateImg{
height:100px;
width:100px;


}


.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 70px;
  height: 70px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
 
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Style buttons */
.btn {
  background-color: DodgerBlue; /* Blue background */
  border: none; /* Remove borders */
  color: white; /* White text */
  padding: 12px 16px; /* Some padding */
  font-size: 16px; /* Set a font size */
  cursor: pointer; /* Mouse pointer on hover */

}
.container{
margin-top:0px}
/* Darker background on mouse-over */
.btn:hover {
  background-color: RoyalBlue;
}
@media (min-width: 1200px) {
    .container{
        max-width: 1800px;
    }
}
@media (max-width: 597px) {
    .container{
        max-width: 597px;
    }
}

@media (max-width: 768px)
.container {
    max-width: 900px!important;
}

#candidateIMG{
height:190px;
width:170px;
padding-top:15px;
padding-bottom:15px;
}

</style>
<body class="hm-gradient" >





    
    <main>
        
        <!--MDB Navbars-->
        <div class="container mt-4">
         
            <!--Navbar -->
            <nav class="mb-4 navbar navbar-expand-lg navbar-dark unique-color-dark">
                <a class="navbar-brand" href="#"><img src="assets/images/company_logo//uoklogo.png" height="40" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4" aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                    <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                            <a class="nav-link" href="#"></i> Welcome <%=voterData.getVoter_name()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Voting.jsp"><i class="fa fa-tachometer"></i> Dashboard <span class="sr-only">(current)</span></a>
                        </li>
                         <li class="nav-item active">
                            <a class="nav-link" href="#"><i class="fa fa-area-chart"></i> View Results</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                        
                       
                    </ul>
                </div>
            </nav>
            <!--/.Navbar -->
          
          <hr class="my-4">
          
           <div class="text-center darken-grey-text mb-4">
               <marquee> <h3 class="font-bold mb-3">Welcome to the Online Voting System University of Kelaniya.</h3></marquee>
               <!--  <a class="btn btn-danger" href="https://mdbootstrap.com/components/navbar/" target="_blank">Bootstrap Navbars</a> -->
            </div>
   
   <!--  <h4>Select an Election</h4> -->
  <!--  <select class="browser-default custom-select custom-select-lg mb-3" id="selel">
  <option value="" selected disabled hidden>Select an Election</option> -->
  <%
  									
  String returnVal="";
												String isVoted="";
												  VoterVO votervo=new VoterVO();
												 VoterDAO voterdao=new VoterDAO();
												 
												 List<VoterVO> arrList01 = voterdao.getVoterInfo1(current_user_id);
												  for (int i = 0; i < arrList01.size(); i++) {
													
													isVoted=arrList01.get(i).getStatus(); 
												}
												  System.out.println("isVoted: "+isVoted);
												  %>  


  <%
  int election_id=0;		
            String elctionnames="";
          ElectionsVO electionsVO= new ElectionsVO();
			ElectionDAONEW electionsDAO = new ElectionDAONEW();
			List<ElectionsVO> electionsArray = electionsDAO.getElectionInfo4(current_user_id);
			for (int i = 0; i < electionsArray.size(); i++) {
				if(i!=0){
					elctionnames =elctionnames+","+ electionsArray.get(i).getElection_name();
					election_id=electionsArray.get(i).getElection_id();
					System.out.println("elctionnames "+elctionnames);
					System.out.println("election_id "+election_id);

				}else
					elctionnames =elctionnames+ electionsArray.get(i).getElection_name();
				election_id=electionsArray.get(i).getElection_id();
			}
			System.out.println("All  elctionnames: "+ elctionnames);
			System.out.println("election_id: "+ election_id);
			
            
            
            
            %>
            
            
            
            
            
            
            
            
            
            
            
            <%int arrSize= electionsArray.size();
           
            if(!(arrSize==0)&&isVoted.equalsIgnoreCase("YES")){
            	returnVal="voted";
            	System.out.println("returnVal: "+returnVal);
            	   for (int i = 0; i < electionsArray.size(); i++) {%>
                 

            	 
           	  
                 <div class="row">
                 <div class="col-md-12">
                 <div class="banner-example">
       <div id="banner">
         <div class="active bannerItem">
           <span class="banner-header display-1"><%=electionsArray.get(i).getElection_name()%> Results</span>
           <div class="banner-text">You have Voted to the Election  </div>

        
         </div>
       </div>
      
     </div>
     </div>

     </div>
     
                 <div class="row">
                 <div class="col-md-12">
     <button class="btn float-right"><i class="fa fa-bar-chart " data-toggle="modal" data-target="#myModal" > View Statistics</i></button><br>
     </div></div>
     
     

<!-- Modal HTML -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Change class .modal-sm to change the size of the modal -->
  <div class="modal-dialog modal-lg" role="document">


    <div class="modal-content">
      <div class="modal-header" style="background-color:#037bfc">
        <h4 class="modal-title w-100" id="myModalLabel" ><font color="white"><%=electionsArray.get(i).getElection_name()%></font></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
       
 <%
     
     String elctiontypes="";
     ElectionsVO electionTypesVO1= new ElectionsVO();
		ElectionDAONEW electionTypesDAO = new ElectionDAONEW();
		List<ElectionsVO> electionTypesArray = electionsDAO.getElectionInfo5(current_user_id);
     
		for (int k = 0; k < electionTypesArray.size();k++) {
			if(i!=0)
				elctiontypes =elctiontypes+","+ electionsArray.get(k).getElection_name();
			else
				elctiontypes =elctiontypes+ electionTypesArray.get(k).getElection_type();
		}
		System.out.println("All  elctiontypes: "+ elctiontypes);
        
		
		
		
     
   
   
		int electionArraySize= electionTypesArray.size();
	       String index1[]=elctiontypes.split(",");
	       String electionType1="";
			if(elctiontypes==null){
				elctiontypes=electionType1;
			}else
				electionType1=elctiontypes;
	            if(!(electionArraySize==0)){
	            	   for (int j = 0; j < index1.length; j++) {%>
       
       
       						<div class="container">
       						<div class="row">
       						<div class="col col-sm-12">
							<div class="widget-content">
											<div class="demo-charts-0000" style="height: 250px;"><div id='chartContainer<%=index1[j]%>' style="height: 250px; width: 100%;"></div></div>
										</div>	
										</div>
										</div>
										</div>
										
										<% 
										CandidatesDAO candidatesDAO=new CandidatesDAO();
										List<CandidatesVO> candidatesArray2 = candidatesDAO.getCandidatesInfo1(index1[j],election_id);
										
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
										//session.setAttribute("dataPoints", dataPoints);
										
										%>
										
										
										
										
										
							<script>
							
								
							
											function getChart<%=index1[j]%>() { 
												var name = 'chartContainer<%=index1[j]%>';
												var chart = new CanvasJS.Chart(name, {
													animationEnabled: true,
													theme: "light2",
													title: {
														text: '<%=index1[j]%> '
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
											
											getChart<%=index1[j]%>();
							
											</script>
       
       
       
       <% }}%>
       
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
<!-- Central Modal Small -->
     
<hr class="my-4">
              <% } %>
            	
           <% }else if(!(arrSize==0)&&isVoted.equalsIgnoreCase("NO")){
        	   returnVal="notvoted";
           	System.out.println("returnVal: "+returnVal);
            for ( int j = 0; j < electionsArray.size();j++) {%>
            	           <div class="row">
                  <div class="col-md-12">
                 <div class="banner-example">
       <div id="banner">
         <div class="active bannerItem">
           <span class="banner-header display-1"><%=electionsArray.get(j).getElection_name()%> Results</span>
           <div class="banner-text">Please Vote For View Results </div>

        
         </div>
       </div>
      
     </div>
     </div>

     </div>
            <% }%>
            <% }else if((arrSize==0)&&isVoted.equalsIgnoreCase("YES")) {
            	  returnVal="ongoing";
                 	System.out.println("returnVal: "+returnVal);
            %>
   	           <div class="row">
               <div class="col-md-12">
              <div class="banner-example">
    <div id="banner">
      <div class="active bannerItem">
        <span class="banner-header display-1">Still the election process is going on </span>
        <div class="banner-text"> Please Come Back After Results are Published</div>

     
      </div>
    </div>
   
  </div>
  </div>

  </div>	
           
<%} %>




<%
	int totalVoters=0;
int totalVotes=0;
String unpublishedVotes="";
String percentage="";

VoterVO voterVO=new VoterVO();
VoterDAO voterdao1 = new VoterDAO();



totalVoters=voterdao1.getVoterInfo6(election_id);
System.out.println("totalVoters: "+totalVoters);

VotesVO votesVO=new VotesVO();
VotesDAO votesdao= new VotesDAO();

totalVotes=votesdao.getVotesInfo(election_id);
System.out.println("totalVotes: "+totalVotes);

%>




        <div class="container pb-4" id="countCards">
        <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3">
       <div class="card" style="text-align:center">
  <div class="card-header"><b>
    Registered Voters</b>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item" id="voterCount">0
</li>
    
  </ul>
</div>
   </div> 
         <div class="col-xs-12 col-sm-3 col-md-3">
       <div class="card" style="text-align:center">
  <div class="card-header">
    <b>Total Vote Count</b>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item" id="votesCount" >0</li>
    
  </ul>
</div>
   </div> 
          <div class="col-xs-12 col-sm-3 col-md-3">
       <div class="card" style="text-align:center">
  <div class="card-header">
    <b>Unpublished Votes</b>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item" id="unpublishedVotesCount">0</li>
    
  </ul>
</div>
   </div> 
         <div class="col-xs-12 col-sm-3 col-md-3">
       <div class="card" style="text-align:center">
  <div class="card-header">
  <b>Percentage Basic Votes</b>  
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item" id="percentage">0</li>
    
  </ul>
</div>
   </div> 
   </div>    
     </div>   
     
   
   <%
   CandidatesVO candidatesVO=new CandidatesVO();
   CandidatesDAO candidatesDAO=new CandidatesDAO();
   
   
   %>
   <%
   String candidates="";
   String positions="";%>
  
	
	
	
	
	 <%
     
     String elctiontypes="";
     ElectionsVO electionTypesVO= new ElectionsVO();
		ElectionDAONEW electionTypesDAO = new ElectionDAONEW();
		List<ElectionsVO> electionTypesArray = electionsDAO.getElectionInfo5(current_user_id);
     
		for (int i = 0; i < electionTypesArray.size(); i++) {
			if(i!=0)
				elctiontypes =elctiontypes+","+ electionsArray.get(i).getElection_name();
			else
				elctiontypes =elctiontypes+ electionTypesArray.get(i).getElection_type();
		}
		System.out.println("All  elctiontypes: "+ elctiontypes);
        
		
		
		
     
   
   
		int electionArraySize= electionTypesArray.size();
	       String index[]=elctiontypes.split(",");
	            if(!(electionArraySize==0)){
	            	   for (int j = 0; j < index.length; j++) {%>
	   
	   
   
		   
		   
   
  
     
   
		  
<div class="card " >
  <h5 class="card-header"><b><%=index[j] %></b></h5>
  <div class="card-body">
     
     
  
     
     
     
      <div class="container">
    <div class="row">
             <% List<CandidatesVO> candidatesArray2 = candidatesDAO.getCandidatesInfo1(index[j],election_id);
   
 
  
	for (int k = 0; k < candidatesArray2.size(); k++) {
		if(k!=0){
			candidates =candidates+","+ candidatesArray2.get(k).getCandidate_name();
			
		}else{
			candidates =candidates+ candidatesArray2.get(k).getCandidate_name();
		
		}
	}
	System.out.println("All  candidates: "+ candidates);
    %>
	 <%int candidatesArray2Size= candidatesArray2.size();
	   System.out.println("candidates arr size= "+ candidatesArray2.size());
	            if(!(candidatesArray2Size==0)){
	            	   for (int m = 0; m < candidatesArray2.size(); m++) {%> 
       
      <div class="col col-md-3">
<div class="card testimonial-card">

  <!-- Background color -->
  <div class="card-up indigo lighten-1"></div>

  <!-- Avatar -->
  <div class="avatar mx-auto white">
    <img src='assets\images\<%=candidatesArray2.get(m).getCandidate_image() %>'  alt="woman avatar" class="rounded-circle" id="candidateIMG">
  </div>

  <!-- Content -->
  <div class="card-body">
    <!-- Name -->
    <h4 class="card-title" style="text-align:center"><%=candidatesArray2.get(m).getCandidate_name() %></h4>
    <hr>
    <!-- Quotation -->
    
     
                      <%VotesVO votesVO1 =new VotesVO();
                        VotesDAO votesDAO= new VotesDAO();
                        int votes=0;
                        int candidate_id=candidatesArray2.get(m).getCandidate_id();
                        System.out.println("Candidate id= "+candidate_id);
                        votes = votesDAO.getVotesInfo1(candidate_id,election_id);
                        
                      
                      
                      %>
                      
    <p><i class="fa fa-thumbs-up" aria-hidden="true"></i> Votes:<%=votes %></p>
  </div>

</div>
</div>
        
        
    
        <%}} %> 
    
        
    </div>
     <hr class="my-4">
</div>
  
  </div>
</div>
<br>
<%}} %>

<br><br>


<br><br>

       
        
        <!--MDB Navbars-->
       
          	<footer id="footer" class="footerFixed">
            <div class="footer-left">Designed by - <a target="_blank" rel="noopener noreferrer" href="http://www.uok.lk">UOK</a></div>
            <div class="footer-right"><p>Copyright 2018 - University of Kelaniya. All Rights Reserved.</p></div>
        </footer> 
       
   </div>
      
       
       
       
    </main>
  <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.1/js/mdb.min.js"></script>
<script>
$( document ).ready(function() {
    
    
    var $returnVal="";
    var $totalVoters=0;
    totalVoters="<%=totalVoters%>";
	returnVal="<%=returnVal%>";
	
	var $totalVotes="";
	totalVotes="<%=totalVotes%>";
	
	var $unpublishedVotes=0;
	
	unpublishedVotes=totalVoters-totalVotes;
	var $percentage=0;
	percentage=totalVotes/totalVoters*100;
	percentage = Math.round( percentage * 10 ) / 10;
	
	
	 if(returnVal=="ongoing"){
		$("#voterCount").html('<div class="loader" ></div>');
		$("#votesCount").html('<div class="loader"></div>');	
		$("#unpublishedVotesCount").html('<div class="loader" ></div>');
		$("#percentage").html('<div class="loader"></div>');
	 
	 }

	else if(returnVal=="notvoted"){
		$("#voterCount").html('0');
		$("#votesCount").html('0');	
		$("#unpublishedVotesCount").html('0');
		$("#percentage").html('0');
	}
	
	else{
		$("#voterCount").html(totalVoters);
		$("#votesCount").html(totalVotes);
		$("#unpublishedVotesCount").html(unpublishedVotes);
		$("#percentage").html(percentage+"&#37");
	}
	 
	 
	
});

</script>
<script type="text/javascript">
$("#myModal").on("show.bs.modal", function(event){
    // Place the returned HTML into the selected element
    $(this).find(".modal-body").load("remote.php");
});

</script>


</body>