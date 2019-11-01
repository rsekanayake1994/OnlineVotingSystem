<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="com.evidu.bank.*"%>
<%@page import="com.evidu.bank.sva.*"%>
 <%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>

<% 
String retuenCode="2";
String returnval="System Error.";

String userId = "", userCompId = "";
userId = (String)session.getAttribute("userId");
userCompId = (String)session.getAttribute("userCompId");
System.out.println("userId============ " +userId+" "+userCompId);

MainController main = MainController.getInstance();
boolean inb= false;
String returnSt="";

response.sendRedirect("AddVoters.jsp");

%>