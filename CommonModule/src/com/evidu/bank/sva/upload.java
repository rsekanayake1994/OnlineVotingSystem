package com.evidu.bank.sva;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.evidu.bank.dao.Campaigns;
import com.evidu.bank.dao.Organization;
import com.evidu.bank.model.CampaignsVO;
/**
 * Servlet implementation class upload
 */
@WebServlet("/upload")
public class upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload() {
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
		 String cname="";
		 String csvname="";
		 csvname=request.getParameter("excelfile");
			CampaignsVO campaign=new CampaignsVO();
		
		if(ServletFileUpload.isMultipartContent(request)){
	            try {
	                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                        String name = new File(item.getName()).getName();
	                        item.write( new File("c:/guru/upload" + File.separator + name));
	                    }
	                    
	                    else{
	                    	 String fieldname = item.getFieldName();
	 	                    String fieldvalue = item.getString();
	 	                   if (fieldname.equals("cname")) {
		                    	cname=fieldvalue;
		                    	
		                    }
	 	                   else if(fieldname.equals("excelfile")){
	 	                	   csvname=fieldvalue;
	 	                   }
	                    	
	                    }
	                }
	                
	                campaign.setCampname(cname);
	                campaign.setCsvname(csvname);
	                
	                Campaigns campaignDAO =new Campaigns();
	                campaignDAO.createCampaign(campaign);
	               //File uploaded successfully
	               request.setAttribute("gurumessage", "File Uploaded Successfully");
	            } catch (Exception ex) {
	               request.setAttribute("gurumessage", "File Upload Failed due to " + ex);
	            }         		
	        }else{
	
	            request.setAttribute("gurumessage","No File found");
}
		 
		
		
	        request.getRequestDispatcher("/uploadCSV.jsp").forward(request, response);
	        
	
	    }

	}


