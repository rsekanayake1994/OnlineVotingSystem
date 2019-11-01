<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>

<%@page import="com.evidu.bank.*"%>
<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.model.*"%>
 <%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>


<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>   

<%
JSONObject obj = new JSONObject();
JSONArray list = new JSONArray();
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
String voter_id = "";
voter_id = request.getParameter("voter_id");
System.out.println("Voter_id============(msg 01) " + voter_id);

MainController main = MainController.getInstance();
String election_id="";
election_id=request.getParameter("election_id");
System.out.println("Election_id============(msg 02) " + election_id);
String retuenCode = "1";
String returnval = "System Error.";
boolean inb = false; 
boolean inb2 = false; 

		String candidates="";
		candidates=	request.getParameter("candidates");
System.out.println("jsonString============(msg 03) " + candidates);

String index[]=candidates.split(",");
if (!isMultipart) {

	System.out.println("success(msg 04)");
	try{
		
		for(int i=0;i<index.length;i++){
			System.out.println("candidates: "+index[i]);
			String sql="INSERT INTO commonadminmodule.votes (voter_id,election_id,candidate_id) VALUES('"+ voter_id + "','" + election_id + "','"+index[i]+"') ";
			String sql1="UPDATE commonadminmodule.voter SET status = 'YES' WHERE voter_id='"+voter_id+"'";
			inb = main.insertData(sql);
			inb2=main.updateData(sql1);
			if(inb==true && inb2==true){
				returnval="Vote submitted successfully.";
				retuenCode="2";
				System.out.println("Vote submitted succes");
			session.setAttribute("isVoted", retuenCode);
				}
				else{
					returnval="Vote not submitted.";
					retuenCode="3";
					System.out.println("Vote not submitted.");
				}
			
		}
	}

	catch(Exception e){
		e.printStackTrace();
	}
	
	
	
	
}
else{
	System.out.println("Sorry (msg 05)");
}

list.add(retuenCode);
list.add(returnval);
obj.put("countList", list);

out.print(obj);


%>