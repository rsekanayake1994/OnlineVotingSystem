package com.evidu.bank.sva;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.evidu.bank.dao.Organization;
import com.evidu.bank.dao.UserDAO;
import com.evidu.bank.model.OrganizationVO;
import com.evidu.bank.model.UserVO;
import com.itextpdf.text.pdf.codec.Base64.InputStream;
import com.mobios.util.LogUtil;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
/**
 * Servlet implementation class OrganizationCreator
 */

@WebServlet("/OrganizationCreate")
public class OrganizationCreate extends HttpServlet{
	
	
	
	
	
	
	private static final long serialVersionUID = 1L;
	 public OrganizationCreate() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String str= "awa";
			str=str+"";
		}
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		 
		 DiskFileItemFactory factory = new DiskFileItemFactory();
		 ServletContext servletContext = this.getServletConfig().getServletContext();
		 File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		 factory.setRepository(repository);
		 ServletFileUpload upload = new ServletFileUpload(factory);
		
		 
			
			
			
			
		
			String orgname = null;
			String contactperson=null;
			String address=null;
			String contactno=null;
			String  email1=null;
			String datejoined=null;
			String logo=null;
			String logoname=null;
			String addOrg=null;
			OrganizationVO organization =new OrganizationVO();
			String logData = "";
			//Logger logs=new Logger();
			//logData = logs.LogInfo(request);
			logData = (String) request.getSession().getAttribute("logData");
			
			//logo uploading
			if(ServletFileUpload.isMultipartContent(request)){
			
	            try {
	                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                        String name = new File(item.getName()).getName();


	                        //String rootPath = System.getProperty("catalina.home");
	                        //System.out.println("root path - "+rootPath);
	                        //item.write( new File(rootPath+ "/webapps/obdV5/assets/images/company_logo" + File.separator + name));
	                        if(name!="")
	                        {
	                        	item.write( new File( "C:/guru/upload" + File.separator + name));
	                        }
	                        
	                    }
	                    
	                    
	                    String fieldname = item.getFieldName();
	                    String fieldvalue = item.getString();
	                    if (fieldname.equals("orgname")) {
	                    	 orgname=fieldvalue;
	                    	
	                    } else if (fieldname.equals("contactperson")) {
	                    	 contactperson=fieldvalue;
	                    	
	                    }else if (fieldname.equals("contactno")) {
	                    	contactno=fieldvalue;
	                    	
	                    }
	                    
	                    else if (fieldname.equals("address")) {
	                    	address=fieldvalue;
		                    	
		                    }
	                    
	                    
	                    else if (fieldname.equals("email1")) {
	                     email1=fieldvalue;
	                    	
	                    }
	                    else if (fieldname.equals("datejoined")) {
	                     datejoined=fieldvalue;
	                    	
	                    }
	                    
	                   
	                    else if (fieldname.equals("logoname")) {
	                    	logoname=fieldvalue;
		                    if (logoname=="")
		                    	{
		                    		logoname = "mobios.png";
		                    	}
		                    }
	                    else if(fieldname.equals("isEE1")){
	                    	addOrg=fieldvalue;
	                    }
	                    
	                    
	                }
	                    organization.setORGANIZATION_NAME(orgname);
	                    organization.setORGANIZATION_CPERSON(contactperson);
	                    organization.setORGANIZATION_ADDRESS(address);
	                    organization.setORGANIZATION_EMAIL(email1);
	                    organization.setORGANIZATION_DATEJOINED(datejoined);
	                    organization.setORGANIZATION_CONTACTNO(contactno);
	                	organization.setORGANIZATION_LOGO(logoname);
	                    
	        			Organization organizationDAO =new Organization();
	        			organizationDAO.addNewOrganization(organization);
	                    
	               
	               //File uploaded successfully
	               request.setAttribute("gurumessage", "File Uploaded Successfully");
	               request.getSession().setAttribute("addOrg", addOrg);
	            } catch (Exception ex) {
	            	System.out.println("Big error (File path error) "+ex);
	               request.setAttribute("gurumessage", "File Upload Failed due to " + ex);
	            }         		
	        }else{
	        	
	            request.setAttribute("gurumessage","No File found");
}
	       // request.getRequestDispatcher("/result.jsp").forward(request, response);
			
			
			
			
			
			
			
			
			
			
			 System.out.println("enawaoiiaaaa");
			 System.out.println(orgname);
			 System.out.println(contactperson);
			 System.out.println(address);
			 System.out.println(email1);
			 System.out.println(datejoined);
			 System.out.println(addOrg);
			 System.out.println("logoname: "+logoname);
			 //System.out.println(str1);
			//System.out.println("reddirected to jsp"+userlevelP);
			//RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/UserCreator.jsp");
			//requestDispatcher.forward(request, response);
			response.sendRedirect("/obdV5/UserCreator.jsp");
			 LogUtil.getLog("Events").debug(logData+"Add New Organization,Succes Creation,Organization Name: "+orgname+",,,,");
		//	LogUtil.getLog("Event").debug(logData+",LOGIN,status:errorLogin,username:"+user.getUsername()+",,,,,");
			//System.out.println("reddirected to jsp");
		}
	 
	 
	

}
