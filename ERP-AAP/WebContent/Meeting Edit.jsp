  <%@page import="bean.sales.Meeting"%>
<%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.sales.SalesDaoImp"%>
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
String edit_id=request.getParameter("id");
SalesDao sd_obj=new SalesDaoImp();
ArrayList<Meeting> m_list=sd_obj.MeetingInfo(Integer.parseInt(edit_id));
%>
   <head>  
   
 
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });  
 </script>
 <script type="text/javascript">
  function validation(){
		
	  var sub=document.meeting_form.subject;
    	if(sub.value=="")
    		{
    			sub.focus();
    			return false;
    		}
    	
    	  var date=document.meeting_form.date_name;
      	if(date.value=="")
      		{
      			date.focus();
      			return false;
      		}
      	
      	var cont=document.meeting_form.attendies.selectedIndex;
   	 if(cont==-1){
   		 alert("Select the attendees");
   		 document.meeting_form.attendies.focus();
   		 return false;
   	 }
    	
      	var res=document.meeting_form.responsible.selectedIndex;
   	 if(res==0){
   		 alert("Select the Responsible Person");
   		 document.meeting_form.responsible.focus();
   		 return false;
   	 }
   	 
   	 var loc=document.meeting_form.location;
   	 if(loc==""){
   		 loc.focus();
   		 return false;
   	 }
    
		return true;
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

               
                        <div class="span9">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Add Meeting</h1>
                        </div>
                        <div class="block">                  
<form name="meeting_form" action="SalesUpdateServ" method="post" onsubmit="return validation();">
<input type="submit" class="btn btn-success"  value="Save" onclick="return validation();" />&nbsp;&nbsp;or<a href="home.jsp?p=Meetings" style="margin-left:10px;" >Discard</a><hr />             

								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
								<tr><td colspan="3">
                            					Meeting Subject<br />
                            					<input type="text"  name="subject" style="width:290px; height: 30px;" value="<%=m_list.get(0).getSubject() %>" /></td>
                            				</tr>
                            				<tr>
                            						
               										<td colspan="3">Date<br /><input type="text" name="date_name" id="bdate_id" style="width: 288px; height: 30px;" value="<%=m_list.get(0).getDate() %>" /></td>
                            						</tr>
                            				
                            				
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="8" cellspacing="8">
						
					
											 			
                            					<tr>
											 				<td>Duration</td>
											 				<td><input type="text" style="width:80px;" value="24:00" name="duration" value="<%=m_list.get(0).getDuration()%>"></td>
											 			</tr>
											 			<tr>
											 				<td>Attendees</td>
											 				<td>
											 					<select  id="s2_2" style="width: 220px;;" multiple="multiple" name="attendies">
                                        <option value="0"  disabled></option>
                                       <%
																	Customer cus= new Customer();
																	GenericsMethod<Customer> g_obj = new GenericsMethod<Customer>();
																	ArrayList<Customer> cus_list=g_obj.viewDate(cus);
																	String a_id=m_list.get(0).getAttendies();
																	String[] a_ids=a_id.split(",");
																	for(int i=0;i<cus_list.size();i++){
												
																		
																%>
																	<option value=<%=cus_list.get(i).getCust_id() %><%for(int j=0;j<a_ids.length;j++){if(Integer.toString(cus_list.get(i).getCust_id()).equals(a_ids[j])){ %> selected<%}} %>><%=cus_list.get(i).getCust_name() %></option>
																<%
																		}%>                   
                                    </select>
											 				</td>
											 			</tr>
                            					
														
                                        						
                                                 
                                  
                            					
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="14" cellspacing="14" style="border-spacing: 100px 100px;">
								<tr>		
                            	<td>Responsible</td>
                            	<td>
                            	<select name="responsible">
                            		<option disabled selected></option>
                            		<%
                            			DaoMethodsImp d_obj= new DaoMethodsImp();
                            			ArrayList<UserMaster> u_list=d_obj.viewAllData(user_id);
                            		%>
                            		<option value=<%=u_list.get(0).getUser_id() %><%if(Integer.toString(u_list.get(0).getUser_id()).equals(Integer.toString((m_list.get(0).getResponsible())))){ %> selected<%} %>><%=u_list.get(0).getFull_name() %></option>
                            	</select>
                            	</td><td><input type="hidden" name="hid_val" value="edit meeting"/><input type="hidden" name="edit_id" value="<%=m_list.get(0).getMeeting_id()%>"/></td>
                            </tr>
											<tr>
												<td>Location</td>
												<td><input type="text" name="location" value="<%=m_list.get(0).getLocation()%>"/></td>
											</tr>
											
				
										</table>
									</td>
								</tr>
								<tr><td colspan="3">
										<textarea rows="7" style="width:93%;" placeholder="Description" name="description"><%=m_list.get(0).getDescription() %></textarea>
                            			</td>
                            				</tr>
								
							</table>
							                          
	</form>
	
	
	                             
                                    
                               
			 			</div>
						                      
                        </div>

               </div>   
                       

