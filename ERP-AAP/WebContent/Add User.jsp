  <%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.user_mgmt.Role,bean.user_mgmt.Country,bean.user_mgmt.State,bean.user_mgmt.City" %>
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
 
  /*<a href="update_new_item.jsp" class="various fsv-update"  data-fancybox-type="iframe" />*/
  function validation(){
	  var dep=document.m_form.s_dep.selectedIndex;
		if(dep==0)
		{
			alert("Please select the Role.");
			document.m_form.s_dep.focus();
			return false;
		}
		
		var u_name=document.m_form.user_name;
		if(u_name.value=="")
			{
				alert("Please Enter the User Name.");
				document.m_form.user_name.focus();
				return false;
			}
		
		var f_name=document.m_form.full_name;
		if(f_name.value=="")
			{
				alert("Please Enter the Full Name.");
				document.m_form.full_name.focus();
				return false;
			}
		
		var gender=document.m_form.gen_name;
		if(gender.value=="")
			{
				alert("Please Select the Gender.");
				document.m_form.gen_name.focus();
				return false;
			}
		
		var b_date=document.m_form.bdate_name;
		if(b_date.value=="")
			{
				alert("Please Enter birth date.");
				document.m_form.bdate_name.focus();
				return false;
			}
		
		var email=document.m_form.email_name;
		if(email.value=="")
			{
				alert("Please Enter Email-ID.");
				document.m_form.email_name.focus();
				return false;
			}
		
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    	if (!filter.test(email.value)) 
			{
    			alert('Please provide a valid email address');
   		 		document.m_form.email_name.focus();
    		 	return false;
			}
    	
    	var add_ress=document.m_form.address;
    	if(add_ress.value=="")
    		{
    			alert("Please Enter Address.");
    			document.m_form.address.focus();
    			return false;
    		}
		
    	var ctry=document.m_form.country.selectedIndex;
    	if(ctry==0)
    		{
    			alert("Please Select Country.");
    			document.m_form.country.focus();
    			return false;
    		}
    	
    	var sta=document.m_form.state.selectedIndex;
    	if(sta==0)
    		{
    			alert("Please Select State.");
    			document.m_form.state.focus();
    			return false;
    		}
    	
    	var cty=document.m_form.city.selectedIndex;
    	if(cty==0)
    		{
    			alert("Please Select City.");
    			document.m_form.city.focus();
    			return false;
    		}
    	
    	var contact=document.m_form.contact_name;
    	if(contact.value=="")
    		{
    			alert("please Enter Contact No.");
    			document.m_form.contact_name.focus();
    			return false;
    		}
    	
    	var phoneno = /^\d{10}$/;  
    	if(!phoneno.test(contact.value))
    	{
    		alert("You have entered an invalid phone number");
    		document.m_form.contact_name.focus();
    		return false;
    	}
    	
		return (true);
  }
  </script>
  <script type="text/javascript">
  function showState(id){
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
	      document.getElementById("state").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("GET","State_Serv?count="+id,true);
	  xmlhttp.send();
  }
  
  function showCity(s_id){
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
	      document.getElementById("city").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("GET","City_Serv?count="+s_id,true);
	  xmlhttp.send();
  }
  
  var xmlHttp;
  
  function showNote(){
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
	      document.getElementById("internal_note").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","SettingServ?value=inote",true);
	  xmlhttp.send();
  }
  </script>
  <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
</head>
                <div class="row-fluid" style="margin-left: 46px;margin-top: 20px;">

               
                        <div class="span11">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Add User</h1>
                        </div>
                        <div class="block">                  
						  <form action="Location" method="post" name="m_form" onsubmit="return validation()">
							<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="home.jsp?p=View User" style="margin-left:10px;" >Discard</a><hr />             
						  
							<br />
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10" align="center" >
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
											
											 <tr>
                            					<td>Login ID</td>
                            					<td><input type="text" id="user_id" name="user_name" /></td><td></td>
                            				</tr>
                            				<tr>
                            					<td>Full Name</td>
                            					<td><input type="text" id="full_id" name="full_name" /></td><td></td>
                            				</tr>
                           					 <tr>
                            					<td>Gender</td>
                            					<td><input type="radio"  name="gen_name" value="male" checked="checked" />Male
                            						<input type="radio"  name="gen_name" value="female" />Female
                            					</td>
                            					</tr>
                            					<tr>
                            						<td>Birth Date</td>
               										<td><input type="text" name="bdate_name" id="bdate_id" /></td><td></td>
                            						</tr>
                            							<tr>
                            	<td>Email</td>
                            	<td><input type="text" id="email_id" name="email_name"/></td><td></td>
                            </tr>
                              <tr>
                            	<td>Contact No&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            	<td><input type="text" id="contact_id" name="contact_name"/></td><td></td>
                            </tr>
                             
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="12" cellspacing="12" style="border-spacing: 100px 100px;">
										<tr>
												 <td>Role</td>
                            						<td>
                            						<select name="s_dep" class="s_select">
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
                            							<!--  <option onClick="fancyboxMe('addRole.jsp')"> Create and Edit</option>-->
                            						</select>
                            						<!-- <input type="button" style="margin-left: 10px;"  href="department.jsp" class="various fsv-update"  data-fancybox-type="iframe"/> -->
                            						
                           							 </td>
                           							 <td><input type="button" class="btn various fsv-update button11"   href="addRole.jsp" value="+" data-fancybox-type="iframe"/></td>
											</tr>
											<tr>
                            	<td>Address</td>
                            	<td><textarea rows="3" cols="20" name="address"></textarea></td><td></td>
                            </tr>
				<tr>
					<td>Country</td>
					<td>
						<select name="country" onchange="showState(this.value)">
							<option disabled selected>---Select Country---</option>
							<%
								Country cnt=new Country();
								GenericsMethod<Country> gm=new GenericsMethod<Country>();
								ArrayList<Country> lst=new ArrayList<Country>();
								lst=gm.viewDate(cnt);
								for(int i=0;i<lst.size();i++){
							%>
								<option value=<%=lst.get(i).getId() %>><%=lst.get(i).getC_name() %></option>
							<%
								}
							%>
						</select></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_country.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state">
						<option>---Select State---</option>
							
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_state.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city">
							<option>---Select City---</option>
							
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_city.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				
                              
                           
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" cellspacing="10" cellpadding="10" border="0" style="border-spacing: 100px 100px;">
											
                            	 <tr>
                            	<td>Upload Image</td>
                            	<td><input type="file" id="img_id" name="img_name" value="choose file"/></td><td></td>
                            </tr>
                           
                           
                              <tr>
                            	<td><input type="hidden" value="add_user" name="hid_val" /></td>
                            	<td>
                            	</td><td></td>
                            </tr>
										</table>
									</td>
								</tr>
								 <tr><td colspan="3"><textarea rows="7" style="width: 100%;" placeholder="Internal Note" name="note"></textarea></td></tr>
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

