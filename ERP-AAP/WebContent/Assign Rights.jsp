<%@page import="bean.user_mgmt.Privilege"%>
<%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.user_mgmt.Role" %>
<head>
	<script type="text/javascript">
		function validation()
		{
			var r=document.assign_right_form.role.selectedIndex;
			if(r==0)
				{
					alert("Please Select the Role.");
					document.assign_right_form.role.focus();
					return false;
				}
			
			
			var user=document.assign_right_form.user_id.selectedIndex;
			if(user==0)
				{
					alert("Please Select the User.");
					document.assign_right_form.user_id.focus();
					return false;
				}
			var pr=document.assign_right_form.p_names.selectedIndex;
			if(pr==0)
				{
					alert("Please do not select First privilege");
					document.assign_right_form.p_names.focus();
					return false;
				}
			if(pr==-1){
				alert("please select the Privilege");
				document.assign_right_form.p_names.focus();
				return false;
				
			}
			
			
			
			
			return (true);
		}
	</script>
	<script type="text/javascript">
	
	  
	  function showUser(id){
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
		      document.getElementById("user_stuff").innerHTML=xmlhttp.responseText;
		      }
		    }
		  xmlhttp.open("post","UserDetail?count="+id,true);
		  xmlhttp.send();
	  }

	 

	</script>
</head>   
                <div class="row-fluid">

               
                        <div class="span5">
                         <div class="head clearfix">
                        		<h1>Assign Rights</h1>
                       		 </div>
                        <div class="block">                       
						  <form action="Location" method="post" name="assign_right_form" onsubmit="return validation()">
						  	<input type="submit" class="btn btn-success"  value="Assign" />&nbsp;&nbsp;or<a href="home.jsp" style="margin-left:10px;" >Discard</a><hr />             
						  
							<br />
							<table style="margin-left: 25px;" cellpadding="5" cellspacing="5">
							 <tr>
                            		<td>Role</td>
                            		<td>
             				<select name="role" onchange="showUser(this.value)">
             					<option disabled selected>---Select Role---</option>
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
								<tr id="user_stuff">
                            		
                           		 </tr>
                            <tr>
                            <td>Select Privilege</td>
                            <td>
                            						<select multiple="multiple" name="p_names">
                            						<option disabled>---select Privileges---</option>
                            							<%
                            								GenericsMethod<Privilege> g_obj= new GenericsMethod<Privilege>();
                            								Privilege pr= new Privilege();
                            								ArrayList<Privilege> p_list=g_obj.viewDate(pr);
                            								for(int i=0;i<p_list.size();i++)
                            								{
                            							%>
                            								<option value=<%=p_list.get(i).getPrivilege_id() %>><%=p_list.get(i).getPrivilege_name() %></option>
                            							<%} %>
                            						</select>
                            </td>
                            </tr>
                            <tr>
                            	<td><input type="hidden" name="hid_val" value="assign_right" /></td>
                            	<td></td>
                            </tr>
							</table>
						</form>
		            </div>
					</div>
               </div>   

