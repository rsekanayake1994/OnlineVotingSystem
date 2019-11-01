<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="com.mobios.util.LogUtil"%>
<%@page import="com.evidu.bank.*" %>

 

<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%
	

	String retuenCode="2";
	String returnval="System Error.";
	
	
	String userId = "", userCompId = "";
	userId = (String)session.getAttribute("userId");
	userCompId = (String)session.getAttribute("userCompId");
	System.out.println("userId============ " +userId+" "+userCompId);
	
	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	String electionname = "";
	String electiontype = "";
	String itemName;
	String excelfile;
	String camptype = "";
	String timepickerdate="";
	String timepickerdate2="";
	//String camaignID="";
	
	//String testedId="0";
	
	
	 // boolean inb= false;
	  String returnSt="";
	  
		//String serv = "115148222";//115148220,"115148221"
		//String cptestedid="";
	if (!isMultipart) {

		System.out.println("sorry. No file uploaded");
		return;
	} else {

		
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
			//System.out.println("items"+items); 
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		Iterator itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();

			if (item.isFormField()) {

				String name = item.getFieldName();
				String value = item.getString();//testNo cpName
				if (name.equals("camptype")) {
					camptype = value;
					System.out.println("****camptype****** " + camptype);
				}
				
				if (name.equals("electionname")) {
					electionname = value;
					System.out.println("****electionname****** " + electionname);
				}
				if(name.equals("excelfile")){
					excelfile=value;
					System.out.println("****testedId****** " + excelfile);
				}
				if(name.equals("timepicker-date")){
					timepickerdate=value;
					System.out.println("****timepickerdate****** " + timepickerdate);
				}

				if(name.equals("timepicker-date2")){
					timepickerdate2=value;
					System.out.println("****timepickerdate2****** " + timepickerdate2);
				}
			} else {
				
			} //else
		}
		
		 //////////////////////////////////////////

	}
%>