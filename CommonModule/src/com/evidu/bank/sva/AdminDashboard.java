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

import com.evidu.bank.dao.Election;
import com.evidu.bank.dao.UserDAO;
import com.evidu.bank.model.ElectionsVO;
import com.evidu.bank.model.UserVO;
import com.mobios.util.LogUtil;

/**
 * Servlet implementation class AdminDashboard
 */
@WebServlet("/AdminDashboard")
public class AdminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str1= request.getParameter("electionname");
		str1=str1+"";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String electionname= request.getParameter("electionname");
		String faculty= request.getParameter("faculty");
		String startdate= request.getParameter("timepicker-date");
		String enddate= request.getParameter("timepicker-date1");
		String[] listbox1 = request.getParameterValues("list1");
		String[] listbox2 = request.getParameterValues("list2");
		String itemsP =request.getParameter("itemsP");
		//String isEdit= request.getParameter("isEdit");
		String userid= request.getParameter("userid");
		String election_type="";
		
		
		if(!itemsP.equals(""))
			election_type=itemsP.substring(0, itemsP.length() - 1);
		startdate=startdate.replace('/', '-');
		String[] parts=startdate.split("-");
		String part1=parts[0];
		String part2=parts[1];
		String part3=parts[2];
		String[] sttime=part3.split(" ");
		String date=sttime[0];
		String time=sttime[1];
		
		
		startdate=date+"-"+part1+"-"+part2+" "+time+":"+"00";
		
		enddate=enddate.replace('/', '-');
		String [] parts2=enddate.split("-");
		String part12=parts2[0];
		String part22=parts2[1];
		String part32=parts2[2];
		String[] sttime1=part32.split(" ");
		String date1=sttime1[0];
		String time1=sttime1[1];
		
		enddate=date1+"-"+part12+"-"+part22+" "+time1+":"+"00";
		
		
		ElectionsVO election =new ElectionsVO();
		election.setElection_name(electionname);
		election.setStartdate(startdate);
		election.setEnddate(enddate);
		election.setFaculty(faculty);
		election.setUserid(userid);
		election.setElection_type(election_type);
		
		Election electionDAO =new Election();
		boolean isUpdateSuccess=false;
		boolean isAddedSuccess=false;
		
		
			   isAddedSuccess = electionDAO.addElection(election);
			   request.getSession().setAttribute("createstatus", isAddedSuccess);
			  
		
		System.out.println("Election Created "+electionname);
		
		response.sendRedirect("/CommonModule/AdminDashboard.jsp");
	}

}
