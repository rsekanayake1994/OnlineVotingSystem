package com.evidu.bank.sva;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.evidu.bank.dao.Election;
import com.evidu.bank.dao.Organization;
import com.evidu.bank.model.ElectionsVO;
import com.evidu.bank.model.OrganizationVO;

/**
 * Servlet implementation class CreateElection
 */
@WebServlet("/CreateElection")
public class CreateElection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateElection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str= "awa";
		str=str+"";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		 
		 DiskFileItemFactory factory = new DiskFileItemFactory();
		 ServletContext servletContext = this.getServletConfig().getServletContext();
		 File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		 factory.setRepository(repository);
		 ServletFileUpload upload = new ServletFileUpload(factory);
		
		 
		 String electionname = null;
			String status=null;
			String startdate=null;
			String enddate=null;
			String  userid=null;
			String excelfile=null;
			String createelection=null;
			String userId = "";
			userId = (String) request.getSession().getAttribute("userId");
		
			ElectionsVO election =new ElectionsVO();
			if(ServletFileUpload.isMultipartContent(request)){
				
	            try {
	                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                     System.out.println("not multipart form data");
	                        
	                    }
	                    
	                    
	                    String fieldname = item.getFieldName();
	                    String fieldvalue = item.getString();
	                    if (fieldname.equals("electionname")) {
	                    	electionname=fieldvalue;
	                    	
	                    } else if (fieldname.equals("excelfile")) {
	                    	excelfile=fieldvalue;
	                    	
	                    }else if (fieldname.equals("timepicker-date")) {
	                    	startdate=fieldvalue;
	                    	
	                    }
	                    
	                    else if (fieldname.equals("timepicker-date2")) {
	                    	enddate=fieldvalue;
		                    	
		                    }
	                    
	                    
	                  
	             
	                    
	                    
	                }
	                    election.setElection_name(electionname);;
	                    election.setStatus(status);
	                   election.setStartdate(startdate);
	                   election.setEnddate(enddate);
	                   election.setUserid(userId);;
	                   
	                    
	        			Election electiondao =new Election();
	        			electiondao.createNewElection(election);
	                    
	               
	               
	               request.getSession().setAttribute("createelection", createelection);
	            } catch (Exception ex) {
	            	System.out.println("Big error (File path error) "+ex);
	               request.setAttribute("gurumessage", "File Upload Failed due to " + ex);
	            }         		
	        }else{
	        	
	            request.setAttribute("gurumessage","No File found");
}
			
	}

}
