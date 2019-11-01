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

String serverIP = "" + request.getLocalAddr();
	String ip = "" + request.getRemoteAddr();
	String ID = "" + UUID.randomUUID().toString();
  
	
	JSONObject obj = new JSONObject();
	JSONArray list = new JSONArray();
	
	String userId = "", userCompId = "";
	userId = (String) session.getAttribute("userId");
	userCompId = (String) session.getAttribute("userCompId");
	System.out.println("userId============(msg 70) " + userId + " " + userCompId);
	
	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	String itemName;
	String filePath;
	MainController main = MainController.getInstance();
	boolean dirCreation = false;
	boolean dirCreation2 = false;
	boolean dirCreation3 = false;
	String electionname = "";
	int election_id;
	electionname=request.getParameter("electionname");
	
	String retuenCode = "2";
	String returnval = "System Error.";
	String returnSt = "";
	String path = "http://localhost:8080/CommonModule/";
	
	//String totalVoterCount =(String)session.getAttribute("totalVoterCount");
	
	if(isMultipart){
		System.out.println("awoooo");
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		
		//Iterator itr = items.iterator();
		System.out.println("enawane");
							
			System.out.println("****Election name is****** " + electionname);
				}
			
			try{
				
				System.out.println("Election Name: " + electionname);
				String query1 = " select * from election USE INDEX(election_name_index) where election_name='"+electionname+"'";
				System.out.println("(msg 77.1 query - )"+query1);
				ElectionsVO election = main.getElectionID(query1);
				election_id=election.getElection_id();
				
				String updatequery= "UPDATE commonadminmodule.voter SET password = LOWER(lpad(conv(floor(rand()*pow(36,6)),10, 36), 6, 0)) WHERE election_id='"+election_id+"'";
				String updatequery1= "UPDATE commonadminmodule.election SET voters = 'Yes'  WHERE election_id='"+election_id+"'";
				boolean success1=main.updateData(updatequery1);
				boolean success=main.updateData(updatequery);
				if(success&&success1){
					retuenCode="1";
					returnval="Password Generated Susccesfully";
					//list.add(retuenCode);
				}
				else{
					retuenCode="2";
				}
				
			}
			catch(Exception e){
				e.printStackTrace();
				retuenCode="6";
				returnval="System error";
				System.out.println("****returnval:"+returnval+"***********************retuenCode:"+retuenCode+"*****************");
				
				
			}
			
			
			
		
	
	list.add(retuenCode);
	list.add(returnval);
	
	obj.put("countList", list);

	out.print(obj);


%>