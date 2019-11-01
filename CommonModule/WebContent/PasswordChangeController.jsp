<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%


UserInfo userData =new UserInfo();
userData= (UserInfo)session.getAttribute("current_user");

String action = ""+request.getParameter("action");
System.out.println("&*&*&*&*&*&*&*&*&*&*&*&*&"+action);
if(action.equals("resetPassword")){

String currentPW = ""+request.getParameter("currentPW");
String newPW = ""+request.getParameter("newPW");
String ReEnterPW = ""+request.getParameter("ReEnterPW");

MainController mc= new MainController();

/* String query = "SELECT * FROM tnp_password_history WHERE TNP_PASSWORD_HISTORY_CREATED_DATE >= DATE_SUB(NOW(),INTERVAL 2 MONTH) AND TNP_PASSWORD_HISTORY_UUID='"
		+ userData.getTNP_DATAENTRY_USER_ID() + "'AND TNP_PASSWORD_HISTORY_PASSWORD=  '" + newPW + "'"; */
//System.out.println(query);
//boolean validator = mc.validatePassword(newPW,userData.getUser_id()());

boolean validator = true;
boolean inseter=false;
boolean updator=false;
//System.out.println(validator);

if (validator == true) {

	/* query = "INSERT INTO tnp_password_history (TNP_PASSWORD_HISTORY_PASSWORD, TNP_PASSWORD_HISTORY_CREATED_DATE, TNP_PASSWORD_HISTORY_USER, TNP_PASSWORD_HISTORY_UUID) VALUES ('"
			+ newPW + "', now(),'" + userData.getTNP_DATAENTRY_USER_NAME() + "','" + userData.getTNP_DATAENTRY_USER_ID()  + "')"; */
			
	//inseter = mc.insertPasssword(newPW,userData.getTNP_DATAENTRY_USER_NAME(),userData.getTNP_DATAENTRY_USER_ID());
			
	/* query = "UPDATE `tnp_dataentry_users` SET TNP_DATAENTRY_STATUS = 'ACTIVE', TNP_DATAENTRY_USER_PASSWORD='"
			+ newPW + "' WHERE TNP_DATAENTRY_USER_ID='" + userData.getTNP_DATAENTRY_USER_ID()  + "'"; */
	//System.out.println();
	updator = mc.updatePasssword(newPW,"ACTIVE",userData.getUser_id());
	session.invalidate();
} else {
	updator=false;
}
out.print(updator);
}
if(action.equals("currentPassword")){
	System.out.println("QUERY 3______________________________________________ : " +action);
	String currentpassword=""+request.getParameter("password");
	
	userData= (UserInfo)session.getAttribute("current_user");
	loginController loginC = new loginController();
	/* String query = "SELECT * FROM `tnp_dataentry_users` WHERE TNP_DATAENTRY_USER_NAME='" + userData.getTNP_DATAENTRY_USER_NAME()
			+ "' AND TNP_DATAENTRY_USER_PASSWORD='" + currentpassword + "'"; */

	userData = loginC.loginUser(userData.getUsername(),currentpassword);
	
	if((""+userData.getUser_id()).equals("null") ){
		out.print("false");
	}else{
		out.print("true");
	}
	
	
}
%>