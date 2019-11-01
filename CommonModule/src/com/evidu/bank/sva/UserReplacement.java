package com.evidu.bank.sva;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.UserDAO;
import com.evidu.bank.model.UserVO;

/**
 * Servlet implementation class UserReplacement
 */
@WebServlet("/UserReplacement")
public class UserReplacement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReplacement() {
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
		// TODO Auto-generated method stub
		String victimID= request.getParameter("victimIDREP");
		String username= request.getParameter("usernameREP");
		//String organization= request.getParameter("organizationREP");
		String password= request.getParameter("passwordREP");
		String realName= request.getParameter("realnameREP");
		String comments= request.getParameter("commentsREP");
//		String createdBy= request.getParameter("createdby");
//		String userlevelP= request.getParameter("userlevelP");
//		String parentId= request.getParameter("parentId");
		String mobileNumber= request.getParameter("mobilenoREP");
		String email= request.getParameter("emailREP");
		String[] listbox1 = request.getParameterValues("list1REP");
		String[] listbox2 = request.getParameterValues("list2REP");
		String itemsP =request.getParameter("itemsPREP");
		String isEdit= request.getParameter("isUpdateREP");
		String oldUserName =request.getParameter("oldusernameREP");
		String orgname=request.getParameter("organizationREP");
		String userRoles="";
		if(!itemsP.equals(""))
		 userRoles=itemsP.substring(0, itemsP.length() - 1);
		
//		int userlevelint = Integer.parseInt(userlevelP);
//		userlevelint = userlevelint+1;
//		userlevelP= Integer.toString(userlevelint);
		
		UserVO user =new UserVO();
		user.setUsername(username);
		user.setOrganization(orgname);
		user.setPassword(password);
		user.setRealName(realName);
		user.setUserRoles(userRoles);
//		user.setLastLoggedIn(lastLoggedIn);
		user.setComment(comments);
		user.setMobileNo(mobileNumber);
		user.setEmail(email);
//		user.setCreatedBy(createdBy);
//		user.setLevel(userlevelP);
//		user.setParent(parentId);
		
		UserDAO userDAO =new UserDAO();
//		boolean isUpdateSuccess=false;
		boolean isReplacedSuccess=false;
		if(isEdit.equals("")){
			   isReplacedSuccess = userDAO.replaceUser(user,victimID);
			   request.getSession().setAttribute("replaceStatus", isReplacedSuccess);
		}
//		else{
//			   isUpdateSuccess= userDAO.updateUser(user,oldUserName);
//			   request.getSession().setAttribute("updatestatus", isUpdateSuccess);
//		 }
	
		
		
		
		
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+victimID);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+username);
	System.out.println("%%%%%%%%%%%%%%%%%%%"+orgname);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+password);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+realName);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+comments);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+mobileNumber);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+email);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+listbox1);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+listbox2);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+itemsP);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+isEdit);
//		System.out.println("%%%%%%%%%%%%%%%%%%%"+oldUserName);
		
	
		
		//RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/UserCreator.jsp");
		//requestDispatcher.forward(request, response);
		response.sendRedirect("/obdV5/UserCreator.jsp");
		//System.out.println("reddirected to jsp");
	}

}
