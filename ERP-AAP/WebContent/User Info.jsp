  <%@page import="bean.user_mgmt.UserMaster"%>
<%@page import="iFaces.user_mgmt.DaoMethods"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.user_mgmt.Role,bean.user_mgmt.Country,bean.user_mgmt.State,bean.user_mgmt.City" %>
<%
	String info_id=request.getParameter("id");
	DaoMethods d_obj=new DaoMethodsImp();
	ArrayList<UserMaster> detail=d_obj.viewAllData(Integer.parseInt(info_id));
	String status=detail.get(0).getActive_flag();
	String sname;
	if(status.equals("1"))
		sname="  Block  ";
	else
		sname="Unblock";
%>
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
  function CreateUser() {
	  window.location.assign("home.jsp?p=Add User");
	
}
  
  function BlockUnblock(b_id) {
		window.location.assign("BlockServ?b_id="+b_id);
	}
  
  function editUser(id){
	  window.location.assign("home.jsp?p=Edit User&id="+id);
  }
  
  function deleteConform(id){
		var conf=confirm("Are you sure want to delete User?");
		var redirectUrl="DeleteServ?d_id="+id;
		if(conf){
			window.location.assign("DeleteServ?d_id="+id);
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
                <div class="row-fluid" style="margin-left: 46px;margin-top: 20px;">

               
                        <div class="span11">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;User Info</h1>
                        </div>
                        <div class="block" style="font-size: 16px;">                  
							<input type="button" class="btn btn-success"  value="Edit" onclick="editUser(<%=detail.get(0).getUser_id()%>)"/><input type="button" class="btn btn-primary"  value="Create" style="margin-left: 15px;" onclick="CreateUser();"/>
							<input type="button" class="btn btn-danger"  value="<%=sname %>" onClick="BlockUnblock(<%=detail.get(0).getUser_id()%>);" style="margin-left: 70%;" />&nbsp;&nbsp;
                             <input type="button" class="btn btn-inverse" value="Delete" onClick="deleteConform(<%=detail.get(0).getUser_id()%>);" />                                    									
							<hr />             
						  
							<br />
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
											
											 <tr>
                            					<td>Login ID</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getLogin_id() %></td>
                            				</tr>
                            				<tr>
                            					<td>Full Name</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getFull_name() %></td>
                            				</tr>
                           					 <tr>
                            					<td>Gender</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getGender() %>
                            					</td>
                            					</tr>
                            					<tr>
                            						<td>Birth Date</td>
               										<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getBirth_dt() %></td>
                            						</tr>
                            							<tr>
                            	<td>Email</td>
                            	<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getEmail() %></td>
                            </tr>
                              <tr>
                            	<td>Contact No&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            	<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getContact_no() %></td>
                            </tr>
                             
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="12" cellspacing="12" style="border-spacing: 100px 100px;">
										<tr>
												 <td>Role</td>
                            						<td style="border-left: 1px solid #cdcdcd;">
                            						<%
                            							int r_id=detail.get(0).getRole_type();
                            							String role=d_obj.getRole(r_id);
                            						%><%=role %>                            						
                           							 </td>
                           							
											</tr>
											<tr>
                            	<td>Address</td>
                            	<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getAddress() %></td>
                            </tr>
				<tr>
					<td>Country</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int c_id=detail.get(0).getCountry();
						String country=d_obj.getCountry(c_id);
					%><%=country %>
						</td>
						 <td></td>
				</tr>
				<tr>
					<td>State</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int s_id=detail.get(0).getState();
						String state=d_obj.getState(s_id);
					%><%=state %>
					</td>
						
				</tr>
				<tr>
					<td>City</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int city_id=detail.get(0).getCity();
						String city=d_obj.getCity(city_id);
					%><%=city %>
					</td>
						
				</tr>
				
                              
                           
										</table>
									</td>
								</tr>
								
							</table>
		     				<span style="margin-left: 30px;">Internal Note: <%=detail.get(0).getInternal_note() %></span><br /><br /><br /><br />
			 			</div>
						                      
                        </div>

               </div>   
                       

