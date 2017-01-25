<%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.Privilege,generics.user_mgmt.GenericsMethod" %>
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
  </script>
  
  <script type="text/javascript">
  function viewAccountSet(){
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
	      document.getElementById("account_setting").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","SettingServ?value=account_setting",true);
	  xmlhttp.send();
  }
  
  function viewLoginId(){
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
	      document.getElementById("login_id").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","SettingServ?value=get_login_id",true);
	  xmlhttp.send();
  }
  
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
  
  function viewFullName(){
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
	      document.getElementById("fullname").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","SettingServ?value=get_fullname",true);
	  xmlhttp.send();
  }
  </script>
  
  <script type="text/javascript">
  	function l_id_Validation(){
  		var l=document.login-id_f.login_field;
  		if(l.value==""){
  			alert("Enter the Login-ID");
  			l.focus();
  			return false;
  		}
  		return true;
  	}
  </script>
</head>
  <div class="row-fluid">

                        <div class="span12">
                         <div class="head clearfix">
                        		<h1>Settings</h1>
                       		 </div>
                        <div class="block">      
                                       
						  <form action="" method="post" name="settings" onsubmit="return validation()">
						
							<br />
							<table style="margin-left: 25px;" cellpadding="5" cellspacing="5">
								<tr>
                            		<td><input type="button" value="Account setting" class="btn" onclick="viewAccountSet()"/></td>
                            		
                           		 </tr>
                           		<tr><td><div id="account_setting"></div></td></tr>
                           		
                           
                           
							</table>
						</form>
						
		            </div>
					</div>
               </div>   
