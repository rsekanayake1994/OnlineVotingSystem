package com.evidu.bank.sva;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.CandidatesDAO;
import com.evidu.bank.dao.UserDAO;

/**
 * Servlet implementation class CandidateAction
 */
@WebServlet("/CandidateAction")
public class CandidateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String candidate_id= request.getParameter("candidate_id");
		
		
		
		CandidatesDAO candidateDAO = new CandidatesDAO();
		boolean isSuccess =candidateDAO.deleteCandidate(candidate_id);
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^"+candidate_id);
		request.getSession().setAttribute("removeStatus", isSuccess);
		
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
