  <%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.user_mgmt.LoginMethodsImp,bean.user_mgmt.Role,bean.user_mgmt.Country,bean.user_mgmt.State,bean.user_mgmt.City" %>
<%@ page import="bean.user_mgmt.UserMaster,iFaces.user_mgmt.DaoMethods,dao.user_mgmt.DaoMethodsImp" %>
<%
	System.out.println(request.getParameter("p"));
	System.out.println(request.getParameter("update_id"));
	String update_id=request.getParameter("update_id");
	DaoMethods d_obj= new DaoMethodsImp();
	ArrayList<UserMaster> user_lst=d_obj.viewAllData(Integer.parseInt(update_id));
	String udata=Integer.toString(user_lst.get(0).getRole_type());
%>
   <head>
   
  <meta charset="utf-8">
  <script>
function GoHome(){
	window.location.assign("home.jsp?p=View User");
}
  function validation(){
	  var dep=document.m_form.up_role.selectedIndex;
		if(dep==0)
		{
			alert("Please select the Role.");
			document.m_form.up_role.focus();
			return false;
		}
		
		var f_name=document.m_form.full_name;
		if(f_name.value=="")
			{
				alert("Please Enter the Full Name.");
				document.m_form.full_name.focus();
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
    	
		return true;
  }
  </script>
  <script type="text/javascript">
  var xmlHttp;
  function showState(id){
      if (typeof XMLHttpRequest != "undefined"){
          xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
      } 
      var url="State_Serv?count="+id;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }

  function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("state").innerHTML=xmlHttp.responseText;   
      }   
  }
  function showCity(s_id){
      if (typeof XMLHttpRequest != "undefined"){
          xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
      } 
      var url="City_Serv";
      url +="?count=" +s_id;
      xmlHttp.onreadystatechange = cityChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }
  function cityChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("city").innerHTML=xmlHttp.responseText;   
      }   
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
                <div class="row-fluid">

               
                        <div class="span12">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Update User</h1>
                        </div>
                        <div class="block">                  
						  <form action="UpdateServ" method="post" name="m_form" onsubmit="return validation()">
							<br />
							<table style="margin-left: 25px;" id="tbl1" cellpadding="5" cellspacing="5" border="0">
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="5" cellspacing="5" border="0">
													<tr>
												 <td>Role</td>
                            						<td>
                            						<select name="up_role" class="s_select">
                            							<option>---Select Role---</option>
                            							<%
                            							Role r=new Role();
                        								ArrayList<Role> list=new ArrayList<Role>();
                        								GenericsMethod<Role> gvd=new GenericsMethod<Role>();
                        								list= gvd.viewDate(r);
								for(int i=0;i<list.size();i++)
								{
									String idata=Integer.toString(list.get(i).getR_id());
									
								%>
             					<option value=<%=list.get(i).getR_id() %><%if(idata.equalsIgnoreCase(udata)){%> selected="selected" <%} %>><%=list.get(i).getRole() %></option>
             					<%} %>
                            						</select>
                            						
                           							 </td>
                           							 <td><input type="button" class="btn various fsv-update button11"   href="addRole.jsp" value="+" data-fancybox-type="iframe"/></td>
											</tr>
                            				<tr>
                            					<td>Full Name</td>
                            					<td><input type="text" id="full_id" name="full_name" value=<%=user_lst.get(0).getFull_name() %> /></td><td></td>
                            				</tr>
                            							<tr>
                            	<td>Email</td>
                            	<td><input type="text" id="email_id" name="email_name" value=<%=user_lst.get(0).getEmail() %> /></td><td></td>
                            </tr>
                              <tr>
                            	<td>Contact No&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            	<td><input type="text" id="contact_id" name="contact_name" value=<%=user_lst.get(0).getContact_no() %> /></td><td></td>
                            </tr>
                             
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="5" cellspacing="5" border="0" style="border-spacing: 100px 100px;">
								
											<tr>
                            	<td>Address</td>
                            	<td><textarea rows="3" cols="20" name="address"><%=user_lst.get(0).getAddress() %></textarea></td><td></td>
                            </tr>
				<tr>
					<td>Country</td>
					<td>
						<select name="country" onchange="showState(this.value)">
							<option value="-1">---Select Country---</option>
							<%
								Country cnt=new Country();
								GenericsMethod<Country> gm=new GenericsMethod<Country>();
								ArrayList<Country> lst=new ArrayList<Country>();
								lst=gm.viewDate(cnt);
								for(int i=0;i<lst.size();i++){
							%>
								<option value=<%=lst.get(i).getId() %> <%if(Integer.toString(lst.get(i).getId()).equalsIgnoreCase(Integer.toString(user_lst.get(0).getCountry()))){ %> selected<%} %>><%=lst.get(i).getC_name() %></option>
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
						<%
							ArrayList<State> s_list= d_obj.fetchState(user_lst.get(0).getCountry());
						for(int i=0;i<s_list.size();i++){
						%>
						<option value=<%=s_list.get(i).getState_id() %> <%if(Integer.toString(s_list.get(i).getState_id()).equals(Integer.toString(user_lst.get(0).getState()))){ %> selected <%} %>><%=s_list.get(i).getState_name() %></option>
						<%} %>
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_state.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city">
						<%
						ArrayList<City> city_list= d_obj.fetchCity(user_lst.get(0).getState());
						for(int i=0;i<city_list.size();i++){
						%>
						<option value=<%=city_list.get(i).getCity_id() %> <%if(Integer.toString(city_list.get(i).getCity_id()).equals(Integer.toString(user_lst.get(0).getCity()))){ %>  selected<%} %>><%=city_list.get(i).getCity_name() %></option>
						<% }%>
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_city.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				
                              
                           
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" cellspacing="5" cellpadding="5" border="0" style="border-spacing: 100px 100px;">
											
                            	 <tr>
                            	<td>Upload Image</td>
                            	<td><input type="file" id="img_id" name="img_name" value="choose file" /></td><td></td>
                            </tr>
                              <tr>
                            	<td><input type="hidden" value="update_user" name="hid_val" />
                            	<input type="hidden" value="<%=update_id %>" name="up_id"/>
                            	</td>
                            	<td><input type="submit" style="width:100px;" class="btn" name="add_user" value="Update User" onclick="return validation();"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	<input type="button" style="width:100px;" class="btn btn-danger" name="clear_b" value="cancel" onclick="GoHome();" />
                            	</td><td></td>
                            </tr>
										</table>
									</td>
								</tr>
								
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

