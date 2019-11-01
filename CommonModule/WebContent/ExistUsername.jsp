<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.evidu.bank.sva.DatabaseController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Insert title here</title>

<script type="text/javascript">
function status(status){
	document.getElementById("isE").value=status;
	alert(document.getElementById("isE").value);
}	
</script>
</head>
<body>
<%
		Connection connection=null;    
		try{
    	
        DatabaseController d = DatabaseController.getInstance();
		connection = (Connection) d.getConnection();   
        PreparedStatement ps = connection.prepareStatement("SELECT  * FROM user WHERE " +
                    "username = ?");
            ps.setString(1,request.getParameter("username"));
            System.out.println("username: "+request.getParameter("username"));
            ResultSet res = ps.executeQuery();
            if(res.first()){
               // out.print("User already exists");
               System.out.println("hitt");
                out.print("<font color=red><b></b> UserName already exists...!");
                %>
                <label id="status" name="status"  value="1"> </label>
                <script type="text/javascript"> status(1); 
                
                </script>
                <%
            }else{
                //out.print("User name is valid");
                System.out.println("hitt1");
                out.print("<font color=green><b></b> UserName available...!");
                %>
                 <label id="status" name="status" value="2"> </label>
                <script> status(2); </script>
                <%
            }
        }catch (Exception e){
            System.out.println(e);  
        }
		finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
%>
</body>
</html>