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

import com.evidu.bank.dao.Organization;
import com.evidu.bank.model.OrganizationVO;
import com.mobios.util.LogUtil;

/**
 * Servlet implementation class OrganizationEdit
 */
@WebServlet("/OrganizationEdit")
public class OrganizationEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrganizationEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str= "awado";
		str=str+"";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		 
		 DiskFileItemFactory factory = new DiskFileItemFactory();
		 ServletContext servletContext = this.getServletConfig().getServletContext();
		 File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		 factory.setRepository(repository);
		 ServletFileUpload upload = new ServletFileUpload(factory);
		
		 
		 
		 

			String editorgname = null;
			String editcontactperson=null;
			String editaddress=null;
			String editcontactno=null;
			String  editemail=null;
			
			String editlogo=null;
			String editlogoname=null;
			String editOrg=null;
			String logData="";
			String organizationedit=null;
			OrganizationVO editorganization =new OrganizationVO();
			logData = (String) request.getSession().getAttribute("logData");
			
			
			//logo uploading
			if(ServletFileUpload.isMultipartContent(request)){
			
	            try {
	                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                        String name = new File(item.getName()).getName();


	                       // String rootPath = System.getProperty("catalina.home");
	                        //System.out.println("root path - "+rootPath);
	                       // item.write( new File(rootPath+ "/webapps/obdV5/assets/images/company_logo" + File.separator + name));
	                        if(name!="")
	                        {
	                        	item.write( new File( "C:/guru/upload" + File.separator + name));
	                        }
	                    }
	                    
	                    
	                    String fieldname = item.getFieldName();
	                    String fieldvalue = item.getString();
	                    
	                    if (fieldname.equals("organizationedit")) {
	                    	 organizationedit=fieldvalue;
	                    	
	                    }
	                    
	                    
	                    if (fieldname.equals("editorgname")) {
	                    	 editorgname=fieldvalue;
	                    	
	                    } else if (fieldname.equals("editcontactperson")) {
	                    	 editcontactperson=fieldvalue;
	                    	
	                    }else if (fieldname.equals("editcontactno")) {
	                    	editcontactno=fieldvalue;
	                    	
	                    }
	                    
	                    else if (fieldname.equals("editaddress")) {
	                    	editaddress=fieldvalue;
		                    	
		                    }
	                    
	                    
	                    else if (fieldname.equals("editemail")) {
	                     editemail=fieldvalue;
	                    	
	                    }
	                   
	                    
	                   
	                    else if (fieldname.equals("editlogoname")) {
	                    	editlogoname=fieldvalue;
		                    if (editlogoname=="")
		                    	{
		                    	editlogoname = "mobios.png";
		                    	}
		                    }
		                    	
		                    
	                    else if(fieldname.equals("isEE2")){
	                    	editOrg=fieldvalue;
	                    }
	                    
	                    
	                }
	                    editorganization.setORGANIZATION_NAME(editorgname);
	                    editorganization.setORGANIZATION_CPERSON(editcontactperson);
	                    editorganization.setORGANIZATION_ADDRESS(editaddress);
	                    editorganization.setORGANIZATION_EMAIL(editemail);
	                    
	                    editorganization.setORGANIZATION_CONTACTNO(editcontactno);
	                	editorganization.setORGANIZATION_LOGO(editlogoname);
	                    
	        			Organization editorganizationDAO =new Organization();
	        			
	        			editorganizationDAO.editOrganization(editorganization,organizationedit);
	                    
	               
	               //File uploaded successfully
	               request.setAttribute("gurumessage", "File Uploaded Successfully");
	               request.getSession().setAttribute("editOrg", editOrg);
	               request.getSession().setAttribute("organizationedit", organizationedit);
	            } catch (Exception ex) {
	            	System.out.println("Big error (File path error) "+ex);
	               request.setAttribute("gurumessage", "File Upload Failed due to " + ex);
	            }         		
	        }else{
	        	
	            request.setAttribute("gurumessage","No File found");
}
			
			 System.out.println("enawaoiiaaaa");
			 System.out.println("oredit= "+organizationedit);
			 System.out.println(editorgname);
			 System.out.println(editcontactperson);
			 System.out.println(editaddress);
			 System.out.println(editemail);
			 System.out.println(editOrg);
			 
			
			 System.out.println("editlogoname: "+editlogoname);
			 response.sendRedirect("/obdV5/UserCreator.jsp");
			 LogUtil.getLog("Events").debug(logData+"Edit Organization,Sucssesfully Edited ,Organization Name: "+organizationedit+",New Name: "+editorgname + ",,,");
		 
	}

}
