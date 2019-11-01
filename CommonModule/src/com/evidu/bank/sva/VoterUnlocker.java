package com.evidu.bank.sva;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.UserDAO;

/**
 * Servlet implementation class VoterUnlocker
 */
@WebServlet("/VoterUnlocker")
public class VoterUnlocker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoterUnlocker() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid= request.getParameter("userid");
		System.out.println("VoterID "+userid);
		UserDAO userDAO = new UserDAO();
		boolean isSuccess =userDAO.unlockVoter(userid);
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^"+userid);
		request.getSession().setAttribute("unlockStatus", isSuccess);
		
		//response.sendRedirect("UserCreator.jsp");
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/AdminDashboard.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
