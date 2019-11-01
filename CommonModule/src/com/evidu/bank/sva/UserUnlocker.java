package com.evidu.bank.sva;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.UserDAO;


@WebServlet("/UserUnlocker")
public class UserUnlocker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UserUnlocker() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid= request.getParameter("userid");
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^"+userid);
		UserDAO userDAO = new UserDAO();
		boolean isSuccess =userDAO.unlockUser(userid);
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^"+userid);
		request.getSession().setAttribute("unlockStatus", isSuccess);
		
		//response.sendRedirect("UserCreator.jsp");
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/UserCreator.jsp");
		requestDispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
