<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%

String userId = "", userCompId = "";
userId = (String) session.getAttribute("userId");
userCompId = (String) session.getAttribute("userCompId");
System.out.println("userId============(msg 51) " + userId + " " + userCompId);
String action = ""+request.getParameter("action");
if(action.equals("formSubmit1")){
	
	System.out.println("ACTION (msg 52) : "+action);
	String electionId = ""+request.getParameter("selel");
	System.out.println("electionId (msg 53) : "+electionId);
	session.setAttribute("electionId", electionId);
	response.sendRedirect("AdminDashboard.jsp");
	
}
else if(action.equals("getElectionId")){
	String electionId = ""+session.getAttribute("electionId");
	out.print(electionId);
}
else{
	session.setAttribute("electionId", null);
	response.sendRedirect("AdminDashboard.jsp");
}


%>