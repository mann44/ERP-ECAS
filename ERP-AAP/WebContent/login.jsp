<%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.user_mgmt.Role" %>
<%

		response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
		String user_name=(String)session.getAttribute("user_name");
		if(user_name == null)
		{

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <![endif]-->
    
    <title>ECAS</title>

    <link rel="icon" type="image/ico" href="favicon.ico"/>
    
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->    
    <link rel='stylesheet' type='text/css' href='css/fullcalendar.print.css' media='print' />
    
    <script type='text/javascript' src='js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery.mousewheel.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/bootstrap.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/charts/excanvas.min.js'></script>
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.js'></script>    
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.stack.js'></script>    
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.pie.js'></script>
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.resize.js'></script>
    
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
    <script type="text/javascript">
    function comboValidate(){
    	var st =document.login_form.role.selectedIndex;
    	if(st == 0){
    		alert("Select the Role.");
    		document.login_form.role.focus();
    		return false;
    	}
    	return true;
    }
    </script>
</head>
<body>

    
    <div class="loginBlock" id="login" style="display: block;">
        <h1>Welcom. Please Sign In</h1>
        <div class="dr"><span></span></div>
        <div class="loginForm">
            <form class="form-horizontal" action="Login_Serv" method="post" id="validation" name="login_form" autocomplete="on">
             	<table cellpadding="3" cellspacing="3" align="center">
             		<tr>
             			
             			<td>
             				<select style="width:252px;" name="role">
             					<option>---Select Role---</option>
             					<%
             					Role r=new Role();
								ArrayList<Role> list=new ArrayList<Role>();
								GenericsMethod<Role> gvd=new GenericsMethod<Role>();
								list= gvd.viewDate(r);
								for(int i=0;i<list.size();i++)
								{
								%>
             					<option value=<%=list.get(i).getR_id() %>><%=list.get(i).getRole() %></option>
             					<%} %>
             				</select>
             			</td>
             		</tr>
             		<tr>
             			
             			<td><input type="text" placeholder="Email" class="validate[required]" name="email" /></td>
             		</tr>
             		<tr>
             			
             			<td><input type="password" placeholder="password" class="validate[required]" name="password" /></td>
             		</tr>
             		<tr>
             			<td>
             			 <div class="row-fluid">
                    <div class="span8">
                        <div class="control-group" style="margin-top: 5px;">
                            <label class="checkbox"><input type="checkbox"> Remember me</label>                                                
                        </div>                    
                    </div>
                    <div class="span4">
                        <button type="submit" class="btn btn-block" onClick="return comboValidate()">Sign in</button>       
                    </div>
                </div>
             			</td>
             		</tr>
             		
             	</table>		
             	
             	 
             	
            </form>  
            <div class="dr"><span></span></div>
            <div class="controls">
                <div class="row-fluid">
                    <div class="span6">
                        <button class="btn btn-link btn-block" onClick="loginBlock('#forgot');">Forgot your password?</button>
                    </div>
                    <div class="span2"></div>
                </div>
            </div>
        </div>
    </div>    
    
    <div class="loginBlock" id="forgot">
        <h1>Forgot your password?</h1>
        <div class="dr"><span></span></div>
        <div class="loginForm">
            <form class="form-horizontal" action="http://aqvatarius.com/themes/aquarius_v17/index.html" method="POST">
                <p>This form help you return your password. Please, enter your password, and send request</p>
                <div class="control-group">
                    <div class="input-prepend">
                        <span class="add-on"><span class="icon-envelope"></span></span>
                        <input type="text" placeholder="Your email"/>
                    </div>                
                </div>                
                <div class="row-fluid">
                    <div class="span8"></div>
                    <div class="span4">
                        <button type="submit" class="btn btn-block">Send request</button>       
                    </div>
                </div>
            </form>  
            <div class="dr"><span></span></div>
            <div class="controls">
                <div class="row-fluid">                    
                    <div class="span12">
                        <button class="btn btn-link" onClick="loginBlock('#login');">&laquo; Back</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
      
    
</body>
</html>
<%
	}
		else{%>
		<jsp:forward page="home.jsp"></jsp:forward>
		<%} %>
