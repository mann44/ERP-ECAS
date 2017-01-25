  <%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="bean.sales.Meeting"%>
<%@page import="bean.user_mgmt.UserMaster"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="bean.sales.Customer"%>
<%@page import="bean.sales.Priority"%>
<%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.user_mgmt.Role,bean.user_mgmt.Country,bean.user_mgmt.State,bean.user_mgmt.City" %>
<%
int user_id=(Integer) session.getAttribute("user_id");
String i_id=request.getParameter("id");
SalesDao sd_obj=new SalesDaoImp();
ArrayList<Meeting> m_list=sd_obj.MeetingInfo(Integer.parseInt(i_id));
%>
   <head>  
   <script type="text/javascript">
   function createMeeting(){
	   window.location.assign("home.jsp?p=Add Meeting");
   }
   
   function editCustomer(edit_id) {
		window.location.assign("home.jsp?p=Meeting Edit&id="+edit_id+"");
	}
   
   function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		var redirectUrl="DeleteServ?d_id="+id;
		if(conf){
			window.location.assign("SaleDeleteServ?action=meeting&?dv_d=5&id="+id+"");
		}
			
	}
   </script>
</head>
                <div class="row-fluid">

               
                        <div class="span9">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Meeting Info</h1>
                        </div>
                        <div class="block" style="font-size: 16px;">                  
<input type="button" class="btn btn-success"  value="Edit" onclick="editCustomer(<%=i_id %>);"/>&nbsp;&nbsp;<input type="button" class="btn btn-success"  value="Create" onclick="createMeeting();"/>
<input type="button" class="btn btn-inverse" value="Delete" style="margin-left: 75%;" onclick="deleteConform(<%=i_id%>)">
<hr />             

								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
								<tr><td colspan="3">
                            					<span style="font-size: 25px;"><%=m_list.get(0).getSubject() %></span>
                            					</td>
                            				</tr>
                            				<tr>
                            						
               										<td colspan="3">Date: <%=m_list.get(0).getDate() %></td>
                            						</tr>
                            				
                            				
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="8" cellspacing="8">
						
					
											 			
                            					<tr>
											 				<td>Duration</td>
											 				<td style="border-left: 1px solid #cdcdcd;"><%=m_list.get(0).getDuration() %> hrs</td>
											 			</tr>
											 			<tr>
											 				<td>Attendees</td>
											 				<td style="border-left: 1px solid #cdcdcd;">
											 					<%=m_list.get(0).getAttendees_names() %>
											 				</td>
											 			</tr>
                            					
														
                                        						
                                                 
                                  
                            					
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="14" cellspacing="14" style="border-spacing: 100px 100px;">
								<tr>		
                            	<td>Responsible</td>
                            	<td style="border-left: 1px solid #cdcdcd;">
                            	
                            		<%
                            			DaoMethodsImp d_obj= new DaoMethodsImp();
                            			ArrayList<UserMaster> u_list=d_obj.viewAllData(user_id);
                            		%><%=u_list.get(0).getFull_name() %>
                            		
                            	</td><td><input type="hidden" name="hid_val" value="create meeting"/></td>
                            </tr>
											<tr>
												<td>Location</td>
												<td style="border-left: 1px solid #cdcdcd;"><%=m_list.get(0).getLocation() %></td>
											</tr>
											
				
										</table>
									</td>
								</tr>
								<tr><td colspan="3">Description:
										<%=m_list.get(0).getDescription() %>
										<br /><br /><br />
                            			</td>
                            				</tr>
								
							</table>
				       
			 			</div>
						                      
                        </div>

               </div>   
                       

