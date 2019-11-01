<%@page import="com.evidu.bank.sva.*"%>
<%@page import="com.evidu.bank.sva.loginController"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="com.mobios.util.LogUtil"%>
<%@page import="com.evidu.bank.entitiy.*"%>
<%@page import= "com.evidu.secure.Secure"%> 
<%@page import="java.text.SimpleDateFormat" %>

<%
	loginController loginC = new loginController();
	MainController mc = new MainController();
	Logger logs=new Logger();
	String action = request.getParameter("action");
	UserInfo userData = new UserInfo();
	VoterInfo voterData= new VoterInfo();
	String query;
	SimpleDateFormat sdateformat = new SimpleDateFormat("yyyy-MM-dd");
	Secure sec = new Secure();


 	String ID = "";
	String userCompId = "";
	String name = "";
	String userType = "";

	
	Date date1 = new Date();
	int attempt = 0;
	int loginattempts=0;
	UserPages userPG = new UserPages();
	System.out.println("action" + action);
	List<UserPages> pageList = new ArrayList<UserPages>();
	try {

		if (action.equals("loginUser")) {

			String user_name = "" + request.getParameter("username");
			String passWord = "" + request.getParameter("password");

			System.out.println("usernameLC : " + user_name);
			System.out.println("passwordLC : " + passWord);

			
			

			boolean validator = mc.catchUser(user_name);
			boolean vali=mc.catchUser1(user_name);
		
			System.out.println(validator);
			System.out.println(vali);
			
			if (validator == true) {
				System.out.println("validatore true");
				String status = mc.catchStatus(user_name);
				System.out.println("STATUS : " + status);
				
				if (status.equals("LOCKED")) {
					response.sendRedirect("index.jsp?err=locked");
				}
				else if(status.equals("TERMINATED")){
					response.sendRedirect("index.jsp?err=terminated");
				}
				
				
				if (!(status.equals("LOCKED")) && !(status.equals("TERMINATED"))) {
					
					userData = loginC.loginUser(user_name, passWord);
					//System.out.println("userData : " + userData);
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					Date date = new Date();
					String CurrentDate = formatter.format(date);

					System.out.println("checkpoint checkuserid : " + userData.getUser_id());
					if (("" + userData.getUser_id()).equals("null")) {

						//LogUtil.getLog("Event")
								//.debug(logData + ",LOGIN,status:errorLogin,username:" + user_name + ",,,,,");
						//LogUtil.getLog("Error")
								//.error(logData + ",LOGIN,status:errorLogin,username:" + user_name + ",,,,,");
						//edited by Hasitha
						attempt = mc.catchAttempts(user_name);
						attempt++;
						if (attempt < 3) {
							
							boolean updator = mc.updatStatus(attempt, user_name);
							//LogUtil.getLog("LoginErrEvents").debug(logData+"ERROR,Status=PasswordMismatch[ Username: "+user_name+" Password: "+passWord+"], Attempt: "+attempt+" ,,,");
							//LogUtil.getLog("Events").debug(logData+"ERROR,ERROR,Status=PasswordMismatch[ Username: "+user_name+" Password: "+passWord+"], Attempt: "+attempt+" ,,,");
							response.sendRedirect("index.jsp?err=err5");
							
						}
						if (attempt == 3) {
							boolean updater = mc.updatLOckStatus(user_name);
							response.sendRedirect("index.jsp?err=locked");
						}
						return;
					}
					/* LogUtil.getEventLog()
							.debug(logData + ",LOGIN,status:validLogin,username:" + user_name + ",,,,,"); */
					
					//default path check system generated
					if (!("" + userData.getUser_id()).equals("null")) {
						System.out.println("user_id NOT NULL");
						boolean updator = mc.updatStatus(0, user_name);
						ID = userData.getUser_id();
						userCompId = userData.getCompanyid();
						name = userData.getName();
						userType = userData.getUsertype();
						
						//this below row is written to expire password in 3 months.
						//validator = mc.validatePassword(passWord, ID);
						
						if (validator == true) {
							
							if (userData.getStatus().equals("SYSTEM_GENERATED")) {
								System.out.println("SYSTEM_GENERATED ");
								ID = userData.getUser_id();
								session.setAttribute("user", user_name);
								session.setAttribute("id", ID);
								
								String id = (String) session.getAttribute("id");
								System.out.println(id);
								response.sendRedirect("InitialPasswordReset.jsp");
							}
							//End Hasitha's editing
							//default path check user roles and redirect to them
							if (!(userData.getStatus().equals("SYSTEM_GENERATED"))) {

								System.out.println("NOT SYSTEM_GENERATED");
								System.out.println("Date  "+CurrentDate);
																
								//session attribute set
								ID = userData.getUser_id();
								session.setAttribute("userid", ID); //simple i used
								session.setAttribute("userId", ID); //capital I used
								session.setAttribute("userCompId", userCompId);
								session.setAttribute("name", name);
								session.setAttribute("userType", userType);
								
								//last logged date
								loginC.lastloggedin(CurrentDate, ID);
								
								String[] userRoles = userData.getUsertype().split(",");
								userPG = loginC.getFirstpage(userRoles[0], 1);
								System.out.println("********1****************" + userRoles.length);
								pageList = loginC.getPagesList(userRoles);

								/*if (userData.getTNP_DATAENTRY_USER_ROLE().equalsIgnoreCase("ADMIN")) {
									session.setAttribute("current_user", userData);
									response.sendRedirect("UserCreator.jsp");
								}else */ if (!userRoles[0].equals("")) {
									System.out.println("********2****************" + userRoles.length);
									System.out.println(
											"********3****************" + userData.getStatus());
									session.setAttribute("current_user", userData);
									System.out.println("********4**************** : "
											+ userData.getStatus());
									session.setAttribute("currentUserPages", pageList);
									System.out.println("********5**************** : "
											+ userData.getStatus());
									session.setAttribute("userPG", userPG);
									System.out.println("********6**************** : "
											+ userData.getStatus());
									System.out.println("********7**************** : " + userPG.getPageName());
									System.out.println("********8**************** : " + (String)session.getAttribute("userId"));
									System.out.println("********9**************** : " + (String)session.getAttribute("userCompId"));
									response.sendRedirect(userPG.getPageName());
								}
							}
						} else {
							ID = userData.getUser_id();
							session.setAttribute("user", user_name);
							session.setAttribute("id", ID);
							response.sendRedirect("InitialPasswordReset.jsp?err=err4");
						}
					}
					//edited by Hasitha
				}
			} 
			
			//voter login
			else if(validator==false&&vali==true){
				voterData = loginC.loginVoter(user_name, passWord);
				System.out.println("checkpoint check voter id : " + voterData.getVoter_id());
				String loginStatus = mc.catchVoterStatus(user_name);
						System.out.println("STATUS : " + loginStatus);
				
							if (loginStatus.equals("LOCKED")) {
									response.sendRedirect("index.jsp?err=locked");
							}
							else if(loginStatus.equals("TERMINATED")){
									response.sendRedirect("index.jsp?err=teminated");
							}
							
								if (!(loginStatus.equals("LOCKED")) && !(loginStatus.equals("TERMINATED"))) {
									System.out.println("checkpoint check voter id : " + voterData.getVoter_id());
									if (("" + voterData.getVoter_id()).equals("null")) {

										
										loginattempts = mc.catchLoginAttempts(user_name);
										loginattempts++;
										if (loginattempts < 3) {
											
											boolean updator = mc.updateStatusVoter(loginattempts, user_name);
											//LogUtil.getLog("LoginErrEvents").debug(logData+"ERROR,Status=PasswordMismatch[ Username: "+user_name+" Password: "+passWord+"], Attempt: "+attempt+" ,,,");
											//LogUtil.getLog("Events").debug(logData+"ERROR,ERROR,Status=PasswordMismatch[ Username: "+user_name+" Password: "+passWord+"], Attempt: "+attempt+" ,,,");
											response.sendRedirect("index.jsp?err=err5");
											
										}
										if (loginattempts == 3) {
											boolean updater = mc.updatLOckStatusVoter(user_name);
											response.sendRedirect("index.jsp?err=locked");
										}
										return;
									}
									
									
									//default path check system generated
									if (!("" + voterData.getVoter_id()).equals("null")) {
										System.out.println("voter_id NOT NULL");
										boolean updator = mc.updateStatusVoter(0, user_name);
										ID = voterData.getVoter_id();
										//userCompId = userData.getCompanyid();
										name = voterData.getVoter_name();
										userType = voterData.getUsertype();
										
										//this below row is written to expire password in 3 months.
										//validator = mc.validatePassword(passWord, ID);
										
										if (vali == true) {
											System.out.println("vali==true");
											if (loginStatus.equals("SYSTEM GENERATED")) {
												System.out.println("Voter is SYSTEM_GENERATED ");
												ID = voterData.getVoter_id();
												session.setAttribute("voter", user_name);
												session.setAttribute("id", ID);
												
												String id = (String) session.getAttribute("id");
												System.out.println(id);
												response.sendRedirect("VoterPasswordReset.jsp");
											}
											//End Hasitha's editing
											//default path check user roles and redirect to them
											if (!(loginStatus.equals("SYSTEM GENERATED"))) {

												System.out.println("Voter is NOT SYSTEM_GENERATED");
												//System.out.println("Date  "+CurrentDate);
																				
												//session attribute set
												ID = voterData.getVoter_id();
												session.setAttribute("voterid", ID); //simple i used
												session.setAttribute("voterId", ID); //capital I used
												//session.setAttribute("userCompId", userCompId);
												session.setAttribute("name", name);
												session.setAttribute("userType", userType);
												
												//last logged date
												//loginC.lastloggedin(CurrentDate, ID);
												
												String userRole = voterData.getUsertype();
												//userPG = loginC.getFirstpage(userRole, 1);
												//System.out.println("********1****************" + userRole);
												//pageList = loginC.getPagesList(userRole);

												 if (!userRole.equals("")) {
													System.out.println("********2****************" + userRole);
													System.out.println(
															"********3****************" + voterData.getLogin_status());
													session.setAttribute("current_user", voterData);
													System.out.println("********4**************** : "
															+ voterData.getStatus());
													//session.setAttribute("currentUserPages", pageList);
													
													response.sendRedirect("Voting.jsp?");
												}
											}
										} else {
											ID = voterData.getVoter_id();
											session.setAttribute("voter", user_name);
											session.setAttribute("id", ID);
											response.sendRedirect("VoterPasswordReset.jsp?err=err4");
										}
									}
									//edited by Hasitha
									
									
									
									
									
									
									
									
									
								
								}
							
							
							
							
				
				//response.sendRedirect("Voting.jsp?");
				
			}
			//end voter login
			
			
			
			else {
				System.out.println("resrt your password");
				response.sendRedirect("index.jsp?err=err3");
			}
		} //login user end
			// edited by Hasitha
		if (action.equals("initialReset")) {
			String user = (String) session.getAttribute("user");
			String id = (String) session.getAttribute("id");

			String password = request.getParameter("new");

					
			//this below line is written to reset password more than 3 moths		
			//boolean validator = mc.validatePassword(password, ID);
			boolean validator = true;
			
			
			System.out.println(validator);

			if (validator == true) {
				//this below line will update password
				//boolean updator = mc.insertPasssword(password, user, id);
				
				boolean updator = true;
				updator = mc.updatePasssword(password, "ACTIVE", id);
				//updator = mc.updatePasssword(encryptedCheckPwd, "ACTIVE", id);
				session.invalidate();
				response.sendRedirect("index.jsp?msg=ok");
			} else {
				response.sendRedirect("InitialPasswordReset.jsp?err=err1");
			}

			
			
			
			
		}
		
		
		if (action.equals("initialResetVoter")) {
			String voter = (String) session.getAttribute("voter");
			String id = (String) session.getAttribute("id");

			String password = request.getParameter("new");

			System.out.println("voter "+voter);	
			System.out.println("id "+id);	
			System.out.println("password "+password);
			//this below line is written to reset password more than 3 moths		
			//boolean validator = mc.validatePassword(password, ID);
			boolean vali = true;
			
			
			System.out.println(vali);

			if (vali == true) {
				//this below line will update password
				//boolean updator = mc.insertPasssword(password, user, id);
				
				boolean updator = true;
				updator = mc.updateVoterPasssword(password, "ACTIVE", id);
				//updator = mc.updatePasssword(encryptedCheckPwd, "ACTIVE", id);
				session.invalidate();
				response.sendRedirect("index.jsp?msg=ok");
			} else {
				response.sendRedirect("VoterPasswordReset.jsp?err=err1");
			}

			
			
			
			
		}
		
		
		
		
		

	} catch (Exception e) {
		System.out.println(e);
	}
	//////////////////////////////////////////////////////////////////////////////////////
%>