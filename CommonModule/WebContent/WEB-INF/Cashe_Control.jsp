<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	int timeout = session.getMaxInactiveInterval();
	response.setHeader("Refresh", timeout + "; URL = index.jsp");
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>