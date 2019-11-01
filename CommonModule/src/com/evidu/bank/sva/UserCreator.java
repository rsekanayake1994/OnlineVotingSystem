package com.evidu.bank.sva;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.evidu.bank.dao.UserDAO;
import com.evidu.bank.model.UserVO;
import com.mobios.util.LogUtil;

/**
 * Servlet implementation class UserCreator
 */
@WebServlet("/UserCreator")
public class UserCreator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//HttpSession session = request.getSession(); 
	
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str= request.getParameter("username");
		str=str+"";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username= request.getParameter("username");
		String organization= request.getParameter("organization");
		String password= request.getParameter("password");
		String realName= request.getParameter("realname");
		
		String createdBy= request.getParameter("createdby");
		String userlevelP= request.getParameter("userlevelP");
		String parentId= request.getParameter("parentId");
		String mobileNumber= request.getParameter("mobileno");
		String email= request.getParameter("email");
		String[] listbox1 = request.getParameterValues("list1");
		String[] listbox2 = request.getParameterValues("list2");
		String itemsP =request.getParameter("itemsP");
		String isEdit= request.getParameter("isUpdate");
		String oldUserName =request.getParameter("oldusername");
		String userRoles="";
		String logData = "";
		//String serverIP=""+request.getLocalAddr();
		//String serv="2013";//shortcode
		//String serv = "115148222";//0115148220
		//String ip =""+request.getRemoteAddr();
		//String softVersion="V5.1";
		//String platformID="EVI-OBD";//+request.getHeader("");
		//String ID = ""+UUID.randomUUID().toString();
		//String logData=""+serverIP+","+serv+","+ip+","+softVersion+","+platformID+","+ID;
		
		//Logger logs=new Logger();
	logData = (String) request.getSession().getAttribute("logData");
		if(!itemsP.equals(""))
		 userRoles=itemsP.substring(0, itemsP.length() - 1);
		
//		int userlevelint = Integer.parseInt(userlevelP);
//		userlevelint = userlevelint+1;
//		userlevelP= Integer.toString(userlevelint);
		
		UserVO user =new UserVO();
		user.setUsername(username);
		user.setOrganization(organization);
		user.setPassword(password);
		user.setRealName(realName);
		user.setUserRoles(userRoles);
		//user.setLastLoggedIn(lastLoggedIn);
		
		user.setMobileNo(mobileNumber);
		user.setEmail(email);
		user.setCreatedBy(createdBy);
		user.setLevel(userlevelP);
		user.setParent(parentId);
		
		UserDAO userDAO =new UserDAO();
		boolean isUpdateSuccess=false;
		boolean isAddedSuccess=false;
		System.out.println("isEdit "+isEdit);
		if(isEdit.equals("")){
			   isAddedSuccess = userDAO.addUser(user);
			   request.getSession().setAttribute("addstatus", isAddedSuccess);
			  // LogUtil.getLog("Events").debug(logData+"Add New User,Succes Creation,New User: "+username+" Created By:"+createdBy+",Organization: "+organization+",,,");
		}else{
			   isUpdateSuccess= userDAO.updateUser(user,oldUserName);
			   request.getSession().setAttribute("updatestatus", isUpdateSuccess);
			  // LogUtil.getLog("Events").debug(logData+"Update User,Status=Succes,Updated User: "+oldUserName+" New User Name:"+username+",Updated By: "+createdBy+",,,");
		 }
		
		
		
		
		System.out.println("Organization "+organization);
		System.out.println("reddirected to jsp"+userlevelP);
		//RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/UserCreator.jsp");
		//requestDispatcher.forward(request, response);
		response.sendRedirect("/CommonModule/UserCreator.jsp");
	//LogUtil.getLog("Events").debug(logData+",Add New User,status:Succes Creation,"+"New User: "+username+"Created By:"+createdBy);
	//LogUtil.getLog("Events").debug(logData+"Add New User,Succes Creation,New User: "+username+" Created By:"+createdBy+",Organization: "+organization+",,,");
		//System.out.println("reddirected to jsp");
	}

}
