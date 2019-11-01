<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
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

String userId = "", userCompId = "";
userId = (String) session.getAttribute("userId");
userCompId = (String) session.getAttribute("userCompId");
System.out.println("userId============(msg 51) " + userId + " " + userCompId);
String action = ""+request.getParameter("action");
if(action.equals("formSubmit1")){
	
	System.out.println("ACTION (msg 52) : "+action);
	String electionId = ""+request.getParameter("selel");
	System.out.println("electionId (msg 53) : "+electionId);
	
	String electionType="";
	ElectionsVO electionVo=new ElectionsVO();
	ElectionDAO electionDao=new ElectionDAO();
	int election_id=Integer.parseInt(electionId);	
	electionType=electionDao.getElectionType(election_id);
	session.setAttribute("electionId", electionId);
	session.setAttribute("electionType", electionType);
	System.out.println("electionType"+electionType);
	
	
	
	
	
	response.sendRedirect("Results.jsp");
	
	
	 
	
	
	
	
}

if(action.equals("getElectionId")){
	
	String electionId = ""+session.getAttribute("electionId");
	out.print(electionId);
}

%>