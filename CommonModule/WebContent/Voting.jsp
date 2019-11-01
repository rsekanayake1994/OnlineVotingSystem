<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.dao.*"%>
<%@page import="com.evidu.bank.model.*"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import="com.evidu.bank.passwordgenerator.*"%>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	int timeout = session.getMaxInactiveInterval();
	response.setHeader("Refresh", timeout + "; URL = index.jsp");
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	//session.invalidate();
	String deadLine="";
%>

<%
		
			String retuenCode=""+session.getAttribute("isVoted");
			String errCode = "" + request.getParameter("st");
			VoterInfo voterData = new VoterInfo();
			voterData = (VoterInfo) session.getAttribute("current_user");

			String current_user = voterData.getVoter_id();
			
			String current_user_id = voterData.getVoter_id();
			System.out.println("****current_user_id**"+current_user_id);
			System.out.println("****Voting_status**"+retuenCode);
			

			if (voterData == null) {
				
				System.out.println("****@@@@@@@@@1**");
				response.sendRedirect("index.jsp");
				return;
			}
		
			 String rPath = getServletConfig().getServletContext().getRealPath("");
			  System.out.println("root path:= "+rPath);
			
	%>
 <link href='https://fonts.googleapis.com/css?family=Lato:100,400,300' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="assets/sweetalerts/sweetalert2.min.css">
<!-- fixed footer -->
<link rel="stylesheet" href="assets/css/fixed_footer.css" media="screen">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
      margin-top:55px; /* white above banner - delete it */
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


/* button CSS */
.btn.btn-outline{
  margin-top:10px;
  background-color:transparent;
  color: #fff;
  border-color: #fff;
  padding-left:90px;
  padding-right:90px;
  font-family:lato;
  font-weight:300;
  margin-bottom:40px;
  border-radius:0px;
}
.btn.btn-outline:hover{
  background-color:black;
  border-color:black;
  color: #fff;
}
.btn.btn-outline.a{
  background-color:black;
  border-color:black;
  color: #fff;
}
.btn.btn-outline:active{
  font-weight:300;
  font-size:20px;
  color: #fff;
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
height:120px;
width:150px;
}
input[type=radio] {
    width: 30px;
    height: 30px;
     
}
.glyphicon {  margin-bottom: 10px;margin-right: 10px;}

small {
display: block;
line-height: 1.428571429;
color: #999;
}
body{padding-top:30px;}

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
.container{
margin-top:0px}

h1{
  color: #396;
  font-weight: 100;
  font-size: 40px;
/*  margin: 40px 0px 20px; */
}

#clockdiv{
    font-family: sans-serif;
    color: #fff;
    display: inline-block;
    font-weight: 100;
    text-align: center;
    font-size: 30px;
}

#clockdiv > div{
    padding: 10px;
    border-radius: 3px;
    background: #00BF96;
    display: inline-block;
}

#clockdiv div > span{
    padding: 15px;
    border-radius: 3px;
    background: #00816A;
    display: inline-block;
}

.smalltext{
    padding-top: 5px;
    font-size: 16px;
}



</style>
<body class="hm-gradient" onload="checkVoted();">





    
    <main>
        
        <!--MDB Navbars-->
        <div class="container ">
         
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
                        <li class="nav-item active">
                            <a class="nav-link" href="#"><i class="fa fa-tachometer"></i> Dashboard <span class="sr-only">(current)</span></a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="ViewResults.jsp"><i class="fa fa-area-chart"></i> View Results</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                        
                        <!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-newspaper-o"></i> Account </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-cyan" aria-labelledby="navbarDropdownMenuLink-4">
                                <a class="dropdown-item" href="#">Facebook</a>
                                <a class="dropdown-item" href="#">Instagram</a>
                            </div>
                        </li> -->
                    </ul>
                </div>
            </nav>
            <!--/.Navbar -->
          
          <hr class="my-4">
          
           <div class="text-center darken-grey-text mb-4">
                <marquee> <h3 class="font-bold mb-3">Welcome to the Online Voting System University of Kelaniya.</h3></marquee>
               <!--  <a class="btn btn-danger" href="https://mdbootstrap.com/components/navbar/" target="_blank">Bootstrap Navbars</a> -->
            </div>
            
            <%
            String elctionnames="";
          ElectionsVO electionsVO= new ElectionsVO();
			ElectionDAONEW electionsDAO = new ElectionDAONEW();
			List<ElectionsVO> electionsArray = electionsDAO.getElectionInfo3(current_user_id);
			for (int i = 0; i < electionsArray.size(); i++) {
				if(i!=0)
					elctionnames =elctionnames+","+ electionsArray.get(i).getElection_name();
				else
					elctionnames =elctionnames+ electionsArray.get(i).getElection_name();
			}
			System.out.println("All  elctionnames: "+ elctionnames);
            
            
            
            
            %>
            
            
            
            
            
            
            
            
            
            
            
            <%int arrSize= electionsArray.size();
           
            
            
            
            if(!(arrSize==0)){
            	   for (int i = 0; i < electionsArray.size(); i++) {%>
                 

            	 
           	  
                 <div class="row">
                 <div class="col-md-12">
                 <div class="banner-example">
       <div id="banner">
         <div class="active bannerItem">
           <span class="banner-header display-1"><%=electionsArray.get(i).getElection_name()%></span>
           <div class="banner-text"> </div>

           <a class="btn btn-outline btn-lg" data-toggle="modal" data-target="#centralModalSm">Vote</a>
         </div>
       </div>
      
     </div>
     </div>

     </div>

              <% } %>
            	
           <% }else{%>
           

           
           <!-- clock -->
           
         <!--   <div class="row">
           <div class="col col-sm-12">
           </div>
           <div class="col col-sm-12">
           <h1>Countdown Clock</h1>
<div id="clockdiv">
  <div>
    <span class="days"></span>
    <div class="smalltext">Days</div>
  </div>
  <div>
    <span class="hours"></span>
    <div class="smalltext">Hours</div>
  </div>
  <div>
    <span class="minutes"></span>
    <div class="smalltext">Minutes</div>
  </div>
  <div>
    <span class="seconds"></span>
    <div class="smalltext">Seconds</div>
  </div>
</div>
</div>
<div class="col col-sm-12"></div>
</div> -->


<!-- end clock -->

            	           <div class="row">
                 <div class="col-md-12">
                 <div class="banner-example">
       <div id="banner">
         <div class="active bannerItem">
           <span class="banner-header display-1">No Election to Vote</span>
           <div class="banner-text">There are no Elections to Vote at this movement.</div>

           
         </div>
       </div>
      
     </div>
     </div>

     </div>
            	
            <% }%>
            
            
         
         <%
         
         String elctiontypes="";
         ElectionsVO electionTypesVO= new ElectionsVO();
			ElectionDAONEW electionTypesDAO = new ElectionDAONEW();
			List<ElectionsVO> electionTypesArray = electionsDAO.getElectionInfo3(current_user_id);
         
			for (int i = 0; i < electionTypesArray.size(); i++) {
				if(i!=0)
					elctiontypes =elctiontypes+","+ electionsArray.get(i).getElection_name();
				else
					elctiontypes =elctiontypes+ electionTypesArray.get(i).getElection_type();
			}
			System.out.println("All  elctiontypes: "+ elctiontypes);
            
			
			
			
         %>
         
         


<br>

          <%arrSize= electionsArray.size();
           
            if(!(arrSize==0)){
            	   for (int i = 0; i < electionsArray.size(); i++) {%>
                 

            	          	  
      <!-- Central Modal Small -->
<div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Change class .modal-sm to change the size of the modal -->
  <div class="modal-dialog modal-fluid" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="myModalLabel"><%=electionsArray.get(i).getElection_name()%></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <% 
            String candidates="";
        String positions="";
         // ElectionsVO electionsVO= new ElectionsVO();
			//ElectionDAONEW electionsDAO = new ElectionDAONEW();
			int election_id= electionsArray.get(i).getElection_id();
			CandidatesVO candidatesVO= new CandidatesVO();
			CandidatesDAO candidatesDAO = new CandidatesDAO();
			List<CandidatesVO> candidatesArray = candidatesDAO.getCandidatesInfo(election_id);
			for (int k = 0; k < candidatesArray.size(); k++) {
				if(k!=0){
					candidates =candidates+","+ candidatesArray.get(k).getCandidate_name();
					positions=positions+","+ candidatesArray.get(k).getCandidate_position();
				}else{
					candidates =candidates+ candidatesArray.get(k).getCandidate_name();
				positions=positions+ candidatesArray.get(k).getCandidate_position();
				}
			}
			System.out.println("All  candidates: "+ candidates);
			System.out.println("All  positions: "+ positions);
			int candidateArraySize=candidatesArray.size();
			String indexes[]=candidates.split(",");
            
            
            
            %>




       <% int electionArraySize= electionTypesArray.size();
       String index[]=elctiontypes.split(",");
            if(!(electionArraySize==0)){
            	   for (int j = 0; j < index.length; j++) {%>
      
     <!--  model content -->
<div class="card">
  <h5 class="card-header" id="position" name="position"><%=index[j] %></h5>
  <div class="card-body">
  
  
  <% List<CandidatesVO> candidatesArray2 = candidatesDAO.getCandidatesInfo1(index[j],election_id);
 
  System.out.println("candidates names:"+candidatesArray2.get(i).getCandidate_name());
  System.out.println("candidates images:"+candidatesArray2.get(i).getCandidate_image());
  %>
  
   <%int candidatesArray2Size= candidatesArray2.size();
   System.out.println("candidates arr size= "+ candidatesArray2.size());
            if(!(candidatesArray2Size==0)){
            	   for (int m = 0; m < candidatesArray2.size(); m++) {%>
          
  <div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src='assets\images\<%=candidatesArray2.get(m).getCandidate_image() %>' alt="" class="img-rounded img-responsive" id="candidateImg"/>
                    </div> 
                    <div class="col-sm-6 col-md-8">
                        <h4>
                          <%=candidatesArray2.get(m).getCandidate_name() %></h4>
                      
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i> <%=candidatesArray2.get(m).getCandidate_email() %>
                            <br />
                           </p>
                        <!-- Split button -->
                        <div class="btn-group">
                        
                            <input  type="radio" name="<%=index[j] %>" id="candidate" value="<%=candidatesArray2.get(m).getCandidate_id() %>" />
                          <%-- <input type="hidden" id="cposition" value="<%=candidatesArray2.get(m).getCandidate_position() %>">  --%>
                         
                        </div>
                    </div>
                </div>
                <br>
                
             
            </div>
        </div>
    </div>
</div>
  

  <%}} %>
  
  
   
  </div>
</div>

  <%}} %>
 <!-- End of model content -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="castVote()">Submit</button>
      </div>
    </div>
  </div>
</div>
<!-- Central Modal Small -->


  <%} }%>
            	
         




  <!--MDB Navbars-->
      	<footer id="footer" class="footerFixed">
            <div class="footer-left">Designed by - <a target="_blank" rel="noopener noreferrer" href="http://www.uok.lk">UOK</a></div>
            <div class="footer-right"><p>Copyright 2018 - University of Kelaniya. All Rights Reserved.</p></div>
        </footer> 



</div>

            
            

      
    </main>
    <script>
    function castVote(){
    	//alert("casting");
    	 var candies=[];
    	 //var position=[]
    	   <%int arrSize1= electionsArray.size();
           
            if(!(arrSize1==0)){
            	   for (int i = 0; i < electionsArray.size(); i++) {%>
    var election_id="<%=electionsArray.get(i).getElection_id()%>" 
            	   <%}}%>
    	 
    	// alert("election id is: "+election_id);
    	 var voter_id="<%=current_user_id%>";
    	// alert("voter_id is: "+voter_id);
    	  <% int electionArraySize= electionTypesArray.size();
          String index[]=elctiontypes.split(",");
               if(!(electionArraySize==0)){
               	   for (int j = 0; j < index.length; j++) {%>
 
               	 
               	   var candidates=document.getElementsByName("<%=index[j] %>");
               	   
    	 for(i = 0; i < candidates.length; i++) { 
    		
    		 if(candidates[i].checked) {
    		 //alert("candidates id: "+candidates[i].value)
    		 candies.push(candidates[i].value);
    		 }
    			
    	 }
    	
               	   <%}}%>
               	   
               //	 alert("candies: "+candies[0]);  	   
               	var jsonString = candies.toString();
    //alert(jsonString);
               	jQuery.ajax({
             	    url: "VotingController.jsp?election_id="+election_id+"&voter_id="+voter_id+"&candidates="+jsonString,
             	    data: candies,
             	  
             	    cache: false,
             	   //contentType: 'application/json; charset=utf-8',
             	  dataType: false,
             	    type: 'POST',
             	    success: function(data){
             	  //alert(data.trim());
             	         	    	
             	        	
             	        	try{
             	        		var obj = JSON.parse(data);
             	        		//alert("obj "+obj);
             	        		//alert("obj.count "+obj.countList[0]);
             	        		if(obj.countList[0]=="2"){
             	        		//swal({title: "Success", text: "Vote submitted successfully.", icon: "success",});	
             	        		location.reload();
             	        		}
             	        		else{
             	        			swal({title: "Alert", text: "Vote Not submitted succesfully.", icon: "warning",});
             	        		}
             	        	}catch( e){
             	        		swal({title: "Alert", text: "Vote Not submitted succesfully.", icon: "warning",});
             	        		//alert(e);
             	        	}
             	        	   	       
             	          	      
             	    }
             	});
    
    
    }
    
    
    function checkVoted(){
    	
    	var retuenCode="<%=retuenCode%>";
    	if(retuenCode=="2"){
    	swal({title: "Success", text: "Vote submitted successfully.", icon: "success",});
    	
    	}
    	
    	return;
    }
    
    </script>
   <%--  <script type="text/javascript">
    function getTimeRemaining(endtime) {
    	  var t = Date.parse(endtime) - Date.parse(new Date());
    	  var seconds = Math.floor((t / 1000) % 60);
    	  var minutes = Math.floor((t / 1000 / 60) % 60);
    	  var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
    	  var days = Math.floor(t / (1000 * 60 * 60 * 24));
    	  return {
    	    'total': t,
    	    'days': days,
    	    'hours': hours,
    	    'minutes': minutes,
    	    'seconds': seconds
    	  };
    	}

    	function initializeClock(id, endtime) {
    	  var clock = document.getElementById(id);
    	  var daysSpan = clock.querySelector('.days');
    	  var hoursSpan = clock.querySelector('.hours');
    	  var minutesSpan = clock.querySelector('.minutes');
    	  var secondsSpan = clock.querySelector('.seconds');

    	  function updateClock() {
    	    var t = getTimeRemaining(endtime);

    	    daysSpan.innerHTML = t.days;
    	    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
    	    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    	    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

    	    if (t.total <= 0) {
    	      clearInterval(timeinterval);
    	    }
    	  }

    	  updateClock();
    	  var timeinterval = setInterval(updateClock, 1000);
    	}

    	//var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
    	var deadline =<%=deadLine%>;
    	initializeClock('clockdiv', deadline);
    
    
    </script> --%>
  <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.1/js/mdb.min.js"></script>
</body>