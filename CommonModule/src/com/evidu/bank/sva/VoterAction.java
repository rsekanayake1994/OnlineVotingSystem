package com.evidu.bank.sva;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.UserDAO;
import com.evidu.bank.dao.UserDAO_org;

/**
 * Servlet implementation class VoterAction
 */
@WebServlet("/VoterAction")
public class VoterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoterAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
				String username= request.getParameter("username");
				
				
				
				UserDAO userDAO = new UserDAO();
				boolean isSuccess =userDAO.deleteVoter(username);
				System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^"+username);
				request.getSession().setAttribute("deleteStatus", isSuccess);
				
				//response.sendRedirect("UserCreator.jsp");
				RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/AdminDashboard.jsp");
				requestDispatcher.forward(request, response);
				//System.out.println("reddirected to*********** jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
