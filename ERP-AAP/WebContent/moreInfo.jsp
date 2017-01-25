<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.UserMaster,bean.user_mgmt.Role" %>
<%@ page import="iFaces.user_mgmt.DaoMethods,dao.user_mgmt.DaoMethodsImp" %>
<%@ page import="generics.user_mgmt.GenericsMethod" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%
	String id= request.getParameter("id");
	DaoMethods d_obj= new DaoMethodsImp();
	ArrayList<UserMaster> lst=d_obj.viewAllData(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html lang="en">

<head>        
    
    
    <title>Add Country</title>
     <script type='text/javascript' src='js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery.mousewheel.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
     
    <script type='text/javascript' src='js/plugins/sparklines/jquery.sparkline.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/fullcalendar/fullcalendar.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/select2/select2.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/uniform/uniform.js'></script>
    
    <script type='text/javascript' src='js/plugins/maskedinput/jquery.maskedinput-1.3.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/validation/languages/jquery.validationEngine-en.js' charset='utf-8'></script>
    <script type='text/javascript' src='js/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>
    
    <script type='text/javascript' src='js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    <script type='text/javascript' src='js/plugins/animatedprogressbar/animated_progressbar.js'></script>
    
    <script type='text/javascript' src='js/plugins/qtip/jquery.qtip-1.0.0-rc3.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cleditor/jquery.cleditor.js'></script>
    
    <script type='text/javascript' src='js/plugins/dataTables/jquery.dataTables.min.js'></script>    
    
    <script type='text/javascript' src='js/plugins/fancybox/jquery.fancybox.pack.js'></script>
    
    <script type='text/javascript' src='js/plugins/pnotify/jquery.pnotify.min.js'></script>
    <script type='text/javascript' src='js/plugins/ibutton/jquery.ibutton.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/scrollup/jquery.scrollUp.min.js'></script>
    
    <script type='text/javascript' src='js/cookies.js'></script>
    <script type='text/javascript' src='js/actions.js'></script>
    <script type='text/javascript' src='js/charts.js'></script>
    <script type='text/javascript' src='js/plugins.js'></script>
    <script type='text/javascript' src='js/settings.js'></script>
    
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />  
    <!--[if lt IE 8]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->         
    <script type="text/javascript">
    	function validation(){
    		var c_name=document.country_form.country_name;
    		if(c_name.value==""){
    			alert("Enter the name of country");
    			c_name.focus();
    			return false;
    		}
    		return true;
    	}
    	
    	
    	function FBClose(){
    		var flg=validation();
    		if(flg){
    			parent.$.fancybox.close();
    			return true;
    		}
    		else{
    			return false;
    		}
    	}
    </script>      
</head>
<body>
    <div class="wrapper"> 
            
        <div class="header">
          <h3 style="color:#ffffff">&nbsp;More Info</h3>
        </div>


        <div class="content">


            <div class="workplace">
            <br />
<form name="country_form" action="" method="post">
<table style="font-size: 15px;">
		<tr>
			<th>Role:</th>
			<%
				String role_name=d_obj.getRole(lst.get(0).getRole_type());
			%>
			<td><%=role_name %></td>
		</tr>
		<tr>
			<th>Full Name:</th>
			<td><%=lst.get(0).getFull_name() %></td>
		</tr>
		<tr>
			<th>Gender:</th>
			<td><%=lst.get(0).getGender() %></td>
		</tr>
		<tr>
			<th>Birth Date:</th>
			<td><%=lst.get(0).getBirth_dt() %></td>
		</tr>
		<tr>
			<th>Address:</th>
			<td><%=lst.get(0).getAddress() %></td>
		</tr>
		<tr>
			<th>E-mail ID:</th>
			<td><%=lst.get(0).getEmail() %></td>
		</tr>
		<tr>
			<th>Contact-No:</th>
			<td><%=lst.get(0).getContact_no() %></td>
		</tr>
		
		
	</table>
	<br />
	
	</form>

            </div>

        </div>   
    </div>
</body>

</html>
    