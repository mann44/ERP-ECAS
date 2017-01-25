<%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.Privilege,bean.user_mgmt.UserMaster,generics.user_mgmt.GenericsMethod" %>
<%@ page import="dao.user_mgmt.DaoMethodsImp,iFaces.user_mgmt.DaoMethods" %>
<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
 
  function validation(){
		var p_id=document.privilege_bind.privilege_id;
		if(p_id.value==""){
			alert("Select the Privilege");
			c_name.focus();
			return false;
		}
		
		var com_name=document.privilege_bind.c_name;
		if(com_name.value=="")
			{
				alert("Please Enter the Component.");
				com_name.focus();
				return false;
			}
		return true;
	}
  
  function passwordValidation(){
	  var p1=document.getElementById("pass1");
	  if(p1.value==""){
		  alert("Enter the password");
		  p1.focus();
		  return false;
	  }
	  
	  var p2=document.getElementById("pass2");
	  if(p2.value==""){
		  alert("Re-Enter the password");
		  p2.focus();
		  return false;
	  }
	  
	  if(p1.value != p2.value){
		  alert("please Check the password");
		  return false;
	  }
	return true;
  }
  </script>
  
  <script type="text/javascript">
  
  function viewPassword(){
	  var xmlhttp;
	  if (window.XMLHttpRequest)
	    {// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	    }
	  else
	    {// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	  xmlhttp.onreadystatechange=function()
	    {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	      {
	      document.getElementById("password").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","SettingServ?value=get_password",true);
	  xmlhttp.send();
  }
  
 
  </script>
  
  <script type="text/javascript">
  	function Validation(){
  		var l=document.edit_profile.login_field;
  		if(l.value==""){
  			alert("Enter the Login-ID");
  			l.focus();
  			return false;
  		}
  		
  		var f=document.edit_profile.fname_field;
  		if(f.value==""){
  			alert("Enter the Full Name");
  			f.focus();
  			return false;
  		}
  		return true;
  	}
  </script>
</head>
<%
int user_id=(Integer) session.getAttribute("user_id");
DaoMethods d_obj= new DaoMethodsImp();
ArrayList<UserMaster> u_list= d_obj.viewAllData(user_id);
%>
  <div class="row-fluid">

                        <div class="span6">
                         <div class="head clearfix">
                        		<h1>Edit Profile</h1>
                       		 </div>
                        <div class="block">  
                            
                          <input type="button" value="Change Password" class="btn btn-warning" style="margin-left:25px;" onclick="viewPassword();" />
						<br /><br />
						<form id="password"></form>          
                                       
						  <form action="UpdateServ" method="post" name="edit_profile">
						
							<br />
							<table style="margin-left: 25px;" cellpadding="5" cellspacing="5">
								<tr>
                            		<td>Login_ID</td>
                            		<td><input type="text" value=<%=u_list.get(0).getLogin_id() %> name="login_field" /></td>
                           		 </tr>
                           		 <tr>
                            		<td>Full Name</td>
                            		<td><input type="text" value=<%=u_list.get(0).getFull_name() %> name="fname_field"/></td>
                           		 </tr>
                           		<tr>
                           			<td><input type="hidden" name="hid_val" value="edit_profile"/></td>
                           			<td><input type="submit" onClick="return Validation();" value="Change" class="btn btn-danger" /></td>
                           		</tr>
							</table>
						</form>
						<br />
						
		            </div>
					</div>
               </div>   
