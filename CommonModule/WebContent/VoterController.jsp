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
	
	String retuenCode = "2";
	String returnval = "System Error.";
	int totVoterCount = 0;
	int totalVoterCount=0;
	List<String> totalVoters = new ArrayList<String>();
	boolean inb = false;
	String returnSt = "";
	String path = "http://localhost:8080/CommonModule/";
	
	 int index =0;
	  
	  
		
		if (!isMultipart) {

			System.out.println("sorry. No file uploaded (msg 71)");
			return;
		}
		else{
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			
			try {
				items = upload.parseRequest(request);
				//System.out.println("items"+items); 
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					if (name.equals("electionname")) {
						
						electionname = value;
						System.out.println("****Election name is****** " + electionname);
					}
				}
				
				else{
					System.out.println("*************Cames Here**************(msg 72) " );
				
					
					try{
						String fieldName = item.getFieldName();
						if (fieldName.equals("excelfile")) {
							String rPath = getServletConfig().getServletContext().getRealPath("");
							//String rPath = "H:/Projects New/CommonModule/WebContent";
							System.out.println("Election Name&&&&&&&&&&&&(msg 73) " + electionname);
							String query1 = " select * from election USE INDEX(election_name_index) where election_name='"+electionname+"'";
							System.out.println("(msg 77.1 query - )"+query1);
							ElectionsVO election = main.getElectionID(query1);
							election_id=election.getElection_id();
							
							filePath = rPath + "/csv/" + electionname + "/";
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
									BufferedReader bufferedReader = null;
									String line = "";
									String mobileNum = "";
									
									String cvsSplitBy = ",";
									bufferedReader = new BufferedReader(new FileReader(filePath + itemName));
									while ((line = bufferedReader.readLine()) != null) {
										String[] value = line.split(cvsSplitBy);
										System.out.println("*************After Uploaded File,Came here**************(msg 77) " );
										System.out.println("value[2]"+value[2] );
										if (!value[2].equalsIgnoreCase("mobile")) {
											System.out.println("*************methentath enawa**************(msg 78) " );
											totVoterCount++;
											
											if (!value[2].equals("")) {
												System.out.println("*************wade goda**************(msg 79) " );
												totalVoters.add(value[2]);

												System.out.println(	"mobile[2]___________________________(msg 80) - " + value[2]);
												
												
												String sql="INSERT INTO commonadminmodule.voter(voter_name,username,mobile,department,email,status,usertype,election_id,password,login_status,login_attempts,userid) VALUES('"+ value[0] + "','" + value[1] + "','"+value[2]+"','"+ value[3]+"','"+value[4]+"','NO','Voter','"+election_id+"','00','SYSTEM GENERATED','0','"+userId+"')";
												inb = main.insertData(sql);
												returnval="Successfully submitted the voter list.";
												
												
											}

										}
										
										
									}// end while..
									bufferedReader.close();
									totalVoters = new ArrayList<String>(new LinkedHashSet<String>(totalVoters));
									totalVoterCount = totalVoters.size();
									System.out.println("totalVoterCount"+totalVoterCount);
									session.setAttribute("totalVoterCount", totalVoterCount);//
									list.add(list.add(totalVoterCount));
									
								}catch(Exception e){
									e.printStackTrace();
									retuenCode="6";
									returnval="System error";
									System.out.println("****returnval:"+returnval+"***********************retuenCode:"+retuenCode+"*****************");
									
									
								}
								
							}
							
							
						}
						
					}
					catch (Exception e) {
						e.printStackTrace();
						//out.print("false");
						retuenCode="6";
						returnval="System error";
						System.out.println("****returnval:"+returnval+"***********************retuenCode:"+retuenCode+"*****************");
						
					}
				
			} 
				
				
				
				
			}
			
			list.add(retuenCode);
			list.add(returnval);
			session.setAttribute("electionName", electionname);
			obj.put("countList", list);

			out.print(obj);
			
		}
	
	
    %>
    
    
    
  