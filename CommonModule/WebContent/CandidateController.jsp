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
	
	String electionname = "";
	int election_id;
	
	String retuenCode = "1";
	String returnval = "System Error.";
	
	List<String> totalVoters = new ArrayList<String>();

	String returnSt = "";
	String path = "http://localhost:8080/CommonModule/";
	electionname=request.getParameter("electionname");
	String candidatename="";
	String department="";
	String email="";
	String mobile="";
	String position="";
	String image="";
	image=request.getParameter("image");
	boolean dirCreation = false;
	boolean inb = false; 
	boolean inb2 = false; 
	String query1 = " select * from election USE INDEX(election_name_index) where election_name='"+electionname+"'";
	System.out.println("(msg 77.1 query - )"+query1);
	ElectionsVO election = main.getElectionID(query1);
	election_id=election.getElection_id();
	System.out.println("electionid is: "+election_id);
	System.out.println("photo name is: "+image);
		if (!isMultipart) {

			System.out.println("sorry. No file uploaded (msg 71)");
			return;
		}
		else{
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			
				items = upload.parseRequest(request);
				//System.out.println("items"+items); 
		
			
			
		
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					
					if (name.equals("cname")) {
						
						candidatename = value;
						System.out.println("****Candidate name is****** " + candidatename);
					}
					if (name.equals("department")) {
						
						department = value;
						System.out.println("****Department name is****** " + department);
					}
					if (name.equals("contactno")) {
		
						mobile = value;
						System.out.println("****Mobile is****** " + mobile);
					}
					if (name.equals("email1")) {
		
						email = value;
						System.out.println("****email is****** " + email);
					}
					if (name.equals("position")) {
	
						position = value;
						System.out.println("****position is****** " + position);
					}
				
					
	
				
			
				}else{
					System.out.println("*************Cames Here**************(msg 72) " );
				
					
					try{
						String fieldName = item.getFieldName();
						if (fieldName.equals("photo")) {
							String rPath = getServletConfig().getServletContext().getRealPath("");
							//String rPath = "H:/Projects New/CommonModule/WebContent";
							System.out.println("Election Name&&&&&&&&&&&&(msg 73) " + electionname);
							
							
							filePath = rPath + "/assets/images/" ;
							dirCreation = main.makeDir(filePath);//make a directory according to election name
							System.out.println("*************Directory created**************(msg 74) " );
							
							if (dirCreation) {
								itemName = item.getName();

								File savedFile = new File(filePath + itemName);

								item.write(savedFile);
								System.out.println("\nFile has successfully uploaded...!(msg 75) - " + rPath);
								System.out.println("\nitem name is...!(msg 75) - " + itemName);
							
								try{
									
									System.out.println("*************After Uploaded File**************(msg 76) " );
								
									try{
										String sql="INSERT INTO commonadminmodule.candidate(candidate_name,candidate_position,candidate_department,candidate_image,candidate_email,candidate_telephone,election_id,userid) VALUES('"+ candidatename + "','" + position + "','"+department+"','"+ image+"','"+email+"','"+mobile+"','"+election_id+"','"+userId+"')";
										String query="UPDATE commonadminmodule.election SET candidates = 'Yes' WHERE election_id='"+election_id+"'";
										inb2=main.updateData(query);
										inb = main.insertData(sql);
										if(inb==true && inb2==true){
										returnval="Candidate inserted successfully.";
										retuenCode="2";
										System.out.println("inserted succes");

										}
										else{
											returnval="Candidate not inserted .";
											retuenCode="3";
											System.out.println("Candidate not inserted succes");
										}
										
									}
									catch(Exception e){
										
									}
																									
																				
												
												
												
										

									
										
									
									
								}catch(Exception e){
									e.printStackTrace();
									retuenCode="3";
									returnval="System error";
									System.out.println("****returnval:"+returnval+"***********************retuenCode:"+retuenCode+"*****************");
									
									
								}
								
							}
							
							
						}
						
					}
					catch (Exception e) {
						e.printStackTrace();
						//out.print("false");
						retuenCode="4";
						returnval="System error";
						System.out.println("****returnval:"+returnval+"***********************retuenCode:"+retuenCode+"*****************");
						
					}
				
			} 
				
				
				
				
			}
			
			list.add(retuenCode);
			list.add(returnval);
			
			obj.put("countList", list);

			out.print(obj);
			
		}
	
	
    %>
    
    
    
  