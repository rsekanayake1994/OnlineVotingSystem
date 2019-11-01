package com.evidu.bank.sva;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.UserDAO;
import com.evidu.bank.model.UserVO;
import com.mobios.util.LogUtil;

/**
 * Servlet implementation class UserCreator1
 */
@WebServlet("/UserCreator1")
public class UserCreator1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreator1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username= request.getParameter("username");
		String organization= request.getParameter("organization");
		String password= request.getParameter("password");
		String realName= request.getParameter("realname");
		
		String createdBy= request.getParameter("createdby");
		String userlevelP= request.getParameter("userlevelP");
		String parentId= request.getParameter("parentId");
		String parentOrg=request.getParameter("organization");
		String mobileNumber= request.getParameter("mobileno");
		String email= request.getParameter("email");
		String[] listbox1 = request.getParameterValues("list1");
		String[] listbox2 = request.getParameterValues("list2");
		String itemsP =request.getParameter("itemsP");
		String isEdit= request.getParameter("isUpdate");
		String oldUserName =request.getParameter("oldusername");
		String userRoles="";
		String logData = "";
		
		Logger logs=new Logger();
		logData = logs.LogInfo(request);
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
	
		user.setMobileNo(mobileNumber);
		user.setEmail(email);
		user.setCreatedBy(createdBy);
		user.setLevel(userlevelP);
		user.setParent(parentId);
		
		UserDAO userDAO =new UserDAO();
		boolean isUpdateSuccess=false;
		boolean isAddedSuccess=false;
		if(isEdit.equals("")){
			   isAddedSuccess = userDAO.addUser(user);
			   request.getSession().setAttribute("addstatus", isAddedSuccess);
			   LogUtil.getLog("Events").debug(logData+"Add New User,Succes Creation,New User: "+username+" Created By:"+createdBy+",Organization: "+organization+",,,");
		}else{
			   isUpdateSuccess= userDAO.updateUser(user,oldUserName);
			   request.getSession().setAttribute("updatestatus", isUpdateSuccess);
			   LogUtil.getLog("Events").debug(logData+"Update User,Status=Succes,Updated User: "+oldUserName+" New User Name:"+username+",Updated By: "+createdBy+",,,");
		 }
		
		
		//UserCreater
		
		System.out.println("organization is:"+organization);
		System.out.println("reddirected to jsp"+userlevelP);
		
		String theURL = "/obdV5/UserCreatorSub.jsp?subuserId="+parentId+"&parentOrg="+parentOrg;
		theURL = theURL.toString();
		response.sendRedirect(theURL);
		
	}

}
