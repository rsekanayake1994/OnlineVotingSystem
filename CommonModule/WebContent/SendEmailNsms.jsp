<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.model.*"%>
<%@page import="com.evidu.bank.dao.*"%>
<%@ page import="java.util.*" %>

<%
String userId = "";
String sendMails="";
userId = (String) session.getAttribute("userId");
System.out.println("userId= " + userId );
String electionName=""+session.getAttribute("electionName");
System.out.println("electionName= " + electionName );
MainController mc=new MainController();

ElectionsVO electionData=new ElectionsVO();
	String query="SELECT * FROM election WHERE election_name='"+electionName+"'";
	 electionData=mc.getElectionID(query);
	 
	 int electionId=electionData.getElection_id();

	
	System.out.println("electionId (msg 53) : "+electionId);
	
	
	
	session.setAttribute("electionId", electionId);
	
	String election_id=Integer.toString(electionId);
	VoterVO voterVO=new VoterVO();
	VoterDAO voterDAO=new VoterDAO();
	ElectionDAO electionDAO=new ElectionDAO();
	String email="";
	String password="";
	String realName="";
	String userName="";
	String mobile="";
	
	List<VoterVO> arrayList=voterDAO.getVoterInfo(userId, election_id);
	String dates=electionDAO.getElectionDates(election_id);
	String[] datesindex=dates.split(",");
	String startdate=datesindex[0];
	String enddate=datesindex[1];
	String [] startdateIndex=startdate.split("\\s+");
	String [] enddateIndex=enddate.split("\\s+");
	String stdate=startdateIndex[0];
	String stime=startdateIndex[1];
	String endate=enddateIndex[0];
	String entime=enddateIndex[1];
	
	
	

	//String USER_NAME = "rsekanayake1994";// GMail user name (just the part before "@gmail.com")
	  //String PASSWORD = "ekanayake123"; // GMail password
	 
				 // String PASSWORD = "mobios@#1";
				//String RECIPIENT = email;
				 // String from = USER_NAME;
			       //String pass = PASSWORD;

				      //String subject = "OVS Security";

	for(int i=0;i<arrayList.size();i++){
		
		
		 
		 
	     
	      
	      if(i!=0){
	    	  email=email+","+arrayList.get(i).getEmail();
	    	  password=password+","+arrayList.get(i).getPassword();
	    	  realName=realName+","+arrayList.get(i).getVoter_name();
	    	  mobile=mobile+","+arrayList.get(i).getMobile();
	    	  userName=userName+","+arrayList.get(i).getUsername();
	    	  
	      }
	      else{
	    	  email=email+arrayList.get(i).getEmail();
	    	  password=password+arrayList.get(i).getPassword();
	    	  realName=realName+arrayList.get(i).getVoter_name();
	    	  mobile=mobile+arrayList.get(i).getMobile();
	    	  userName=userName+arrayList.get(i).getUsername();
	      }
	      
	      String emailIndex[]=email.split(",");
	      String passwordIndex[]=password.split(",");
	      String nameIndex[]=realName.split(",");
	      String userNameIndex[]=userName.split(",");
	      
	      String[] mobileIndex=mobile.split(",");
	      
	      
	      
	  String to = emailIndex[i] ;
	  String otp=passwordIndex[i];
	  String name=nameIndex[i];
	  String mobileNumber="94"+mobileIndex[i];
	  String usrName=userNameIndex[i];
	  String message="";
	  String link="localhost:8080/CommonModule";
	   message="Dear "+name+","+"\nPlease use this Credintials to login to the system!\nyour"+"\nUsername: "+usrName+"\nPassword: "+otp
			 +"\nThe election will be held From "+stime+" To "+entime+" on "+stdate+"\nLink: "+link; 
	      
			 // message="test";
			  // String []to={"rsekanayake1994@gmail.com"};
	     // String message1 = "Please use the following security code to login to  the Voting System";
			//String message2 =	"Your security code is "+passwordIndex[i] ;
			//String message = message1+"<br>" +message2;
			//System.out.println("message "+message);
			
			
			//String sendSms=mc.SendSMS(mobileNumber, message);
			//System.out.println("response"+sendSms);
			
			
			
	      boolean sent=mc.sendEmail(to, otp,usrName,name,stime,entime,stdate);
	       System.out.println("email "+sent);
	       
	       if(sent==true){
	    	   System.out.println("Email sent success ");
	    	   System.out.println("Sms sent success ");
	    	    
	       }
	       else{
	    	   response.sendRedirect("AddVoters.jsp?msg=notsent"); 
	    	   
	       }
	}
	response.sendRedirect("AddVoters.jsp?msg=sent");
	
	
	
	
	
	
	
	 
	
	
	


%>