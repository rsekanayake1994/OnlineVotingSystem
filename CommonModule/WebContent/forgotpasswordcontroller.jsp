<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.sva.loginController"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="com.mobios.util.LogUtil"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import= "com.evidu.secure.Secure"%> 
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%

loginController loginC = new loginController();
MainController mc = new MainController();
String action = request.getParameter("forgotaction");
UserInfo userData = new UserInfo();
String query;
SimpleDateFormat sdateformat = new SimpleDateFormat("yyyy-MM-dd");
Secure sec = new Secure();

//String serverIP = "" + request.getLocalAddr();
//String serv = "2013";//shortcode
//String ip = "" + request.getRemoteAddr();
//String softVersion = "V1.2";
//String platformID = "EVI-ETI";//+request.getHeader("");
//String ID = "" + UUID.randomUUID().toString();
//String userCompId = "";
String name = "";
String userType = "";
//String logData = "" + serverIP + "," + serv + "," + ip + "," + softVersion + "," + platformID + "," + ID;
String logData=(String)request.getAttribute("logData");
Date date1 = new Date();
int attempt = 0;
System.out.println("action" + action);


try{
	if (action.equals("forgotloginUser")) {

		String email = "" + request.getParameter("email");
		String username = "" + request.getParameter("username");

		System.out.println("emailLC : " + email);
		System.out.println("usernameLC : " + username);

		

		boolean validator = mc.forgotPassword(email,username);
	
		System.out.println(validator);
		
		if (validator == true) {
			System.out.println("validatorf true");
			String statusf = mc.catchStatusforgot(email,username);
			System.out.println("STATUSf : " + statusf);
			 LogUtil.getLog("Events").debug(logData+"Forgot password,Email & Username matched,User Name: "+username+", Email: "+email+",,,");
			if (statusf.equals("LOCKED")) {
				response.sendRedirect("forgotpassword.jsp?err=locked");
				//LogUtil.getLog("Events").debug(logData+"Forgot password,Status: error,User status LOCKED,,,,");
			}
			else if(statusf.equals("TERMINATED")){
				response.sendRedirect("forgotpassword.jsp?err=terminated");
				//LogUtil.getLog("Events").debug(logData+"Forgot password,Status: error,User status TERMINATED,,,,");
			}
			
		
			
			if (!(statusf.equals("LOCKED")) && !(statusf.equals("TERMINATED"))) {
				String authkey = "130491ADE9VcIY7WyB5vst82d3";
				Random rand = new Random();
				int otp = rand.nextInt(900000) + 100000;
				 //String OTP="12345";
				boolean updatorf=mc.updateForgotPassword(otp,username);
				
				if (updatorf==true){
					
					String message1 = "Please use the following security code for the OVS account";
					String message2 =	"Your OTP is "+otp ;
					String message = message1+"<br>" +message2;
					System.out.println("message "+message);
					
					String USER_NAME = "uokovs";// GMail user name (just the part before "@gmail.com")
					 String PASSWORD = "uokovs123"; // GMail password
					 
					String RECIPIENT = email;
					  String from = USER_NAME;
				       String pass = PASSWORD;
				  
				      String[] to ={RECIPIENT} ; // list of recipient email addresses
				     String subject = "OVS Security";
				      String body = message;
				      // boolean sent= mc.sendGoogleEmail(from,pass,to,subject,body);
				      boolean sent=mc.sendFromGMail(from, pass,to, subject,body);
				       System.out.println("email "+sent);
				       if(sent==true){
				    	   response.sendRedirect("index.jsp?msg=success");
				    	  // LogUtil.getLog("Events").debug(logData+"Forgot password,OTP sent Succesfully,OTP: "+otp+",To: "+email+",,,");
				       }
				       else{
				    	   response.sendRedirect("forgotpassword.jsp?err=notsent"); 
				    	  // LogUtil.getLog("Events").debug(logData+"Forgot password,OTP not sent,,,,,");
				       }
					return;
				}
				
				else{
					response.sendRedirect("forgotpassword.jsp?err=help");
					// LogUtil.getLog("Events").debug(logData+"Forgot password,OTP not sent,,,,,");
				}
				
			
			}
		} else {
			System.out.println("Contact Admin");
			response.sendRedirect("forgotpassword.jsp?err=help");
			//LogUtil.getLog("Events").debug(logData+"Forgot password,OTP not sent,,,,,");
		}
	}
	
	


}catch (Exception e) {
	
	System.out.println("there is a exception"+e);
	//LogUtil.getLog("Events").debug(logData+"Forgot password,OTP not sent,,,,,");
}





%>