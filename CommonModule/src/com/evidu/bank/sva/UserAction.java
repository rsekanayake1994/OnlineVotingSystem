package com.evidu.bank.sva;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.UserDAO_org;
import com.evidu.bank.model.UserVO;

/**
 * Servlet implementation class UserAction
 */
@WebServlet("/UserAction")
public class UserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String i= (String) request.getSession().getAttribute("i");
		String username= request.getParameter("username");
		
		//String username= (String) request.getSession().getAttribute("username");
		//List<UserVO> user= (List<UserVO>) request.getSession().getAttribute("userlist");
		
		UserDAO_org userDAO = new UserDAO_org();
		boolean isSuccess =userDAO.deleteUser(username);
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^"+username);
		request.getSession().setAttribute("deleteStatus", isSuccess);
		
		//response.sendRedirect("UserCreator.jsp");
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/UserCreator.jsp");
		requestDispatcher.forward(request, response);
		//System.out.println("reddirected to*********** jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
