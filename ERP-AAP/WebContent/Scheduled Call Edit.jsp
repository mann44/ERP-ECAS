  <%@page import="bean.sales.Scheduled_Call"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="iFaces.sales.SalesDao"%>
<%@page import="bean.sales.Phone_Category"%>
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
%>
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
 
  
  
 
  function validation(){
	 var summ=document.callschedule_form.summary;
	 if(summ.value==""){
		 summ.focus();
		 return false;
	 }
	 var dt=document.callschedule_form.date_name;
	 if(dt.value==""){
		 alert("Select the date");
		 dt.focus();
		 return false;
	 }
	 
	 var cont=document.callschedule_form.contact.selectedIndex;
	 if(cont==0){
		 alert("Select the contact");
		 document.callschedule_form.contact.focus();
		 return false;
	 }
	 
	 var cat=document.callschedule_form.p_category.selectedIndex;
	 if(cat==0){
		 alert("Select the category");
		 document.callschedule_form.p_category.focus();
		 return false;
	 }
	 
	 var pri=document.callschedule_form.priority.selectedIndex;
	 if(pri==0){
		 alert("Select the Priority");
		 document.callschedule_form.priority.focus();
		 return false;
	 }
	 
	 var res=document.callschedule_form.responsible.selectedIndex;
	 if(res==0){
		 alert("Select the Responsible Person");
		 document.callschedule_form.responsible.focus();
		 return false;
	 }
		return (true);
  }
  </script>
  <script type="text/javascript">
  function viewCalls(id){
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
	      document.getElementById("phn").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("post","PhoneNumber?value="+id,true);
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
<%
String edit_id=request.getParameter("id");
SalesDao sd_obj= new SalesDaoImp();
ArrayList<Scheduled_Call> info_list=sd_obj.viewScheduleDetail(Integer.parseInt(edit_id));
String status=info_list.get(0).getStatus();
%>
                <div class="row-fluid">

               
                        <div class="span10">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Scheduled Call / Edit</h1>
                        </div>
                        <div class="block">                  
<form name="callschedule_form" action="SalesUpdateServ" method="post" onsubmit="return validation();">
<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="home.jsp?p=Scheduled Calls" style="margin-left:10px;" >Discard</a>
<div style="margin-left: 66%;">
<input type="radio" value="Confirmed" class="btn" name="status" <%if(status.equalsIgnoreCase("Confirmed")){ %> checked="checked"<%} %> />Confirmed
<input type="radio" value="Cancelled" class="btn" name="status" <%if(status.equalsIgnoreCase("Cancelled")){ %> checked="checked"<%} %> />Cancelled
<input type="radio" value="Pending" class="btn" name="status" <%if(status.equalsIgnoreCase("Pending")){ %> checked="checked"<%} %> />Pending
<input type="radio" value="Held" class="btn" name="status" <%if(status.equalsIgnoreCase("Held")){ %> checked="checked"<%} %> />Held
</div>
<hr />             

								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
								<tr><td colspan="3">
                            					
                            					<input type="text" name="summary" style="width:400px; height: 30px;" value="<%=info_list.get(0).getSummary()%>" onclick="this.select();" /></td>
                            				</tr>
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Date</td><td><input type="text" name="date_name" id="bdate_id" value="<%=info_list.get(0).getDate()%>"/></td><td></td>
                            						</tr>
                            				
                            					
                            							<tr>
														<td>Contact&nbsp;&nbsp;&nbsp;</td>
														<td><select onchange="viewCalls(this.value);" name="contact" id="s2_1" style="width: 100%;">
																<option disabled selected></option>
																<%
																	Customer cus= new Customer();
																	GenericsMethod<Customer> g_obj = new GenericsMethod<Customer>();
																	ArrayList<Customer> cus_list=g_obj.viewDate(cus);
																	for(int i=0;i<cus_list.size();i++){
																%>
																	<option value=<%=cus_list.get(i).getCust_id() %><%if(Integer.toString(cus_list.get(i).getCust_id()).equals(Integer.toString(info_list.get(0).getContact()))){ %> selected<%} %>><%=cus_list.get(i).getCust_name() %></option>
																<%} %>
															</select>
														</td>
														</tr>
														  
                             <tr>
                            						
					<td>Category</td>
					<td>
						<select name="p_category">
						<option disabled selected></option>
						<%
							Phone_Category ph_cat=new Phone_Category();
							GenericsMethod<Phone_Category> pg_obj= new GenericsMethod<Phone_Category>();
							ArrayList<Phone_Category> cat_list=pg_obj.viewDate(ph_cat);
							for(int i=0;i<cat_list.size();i++){
						%>
							<option value=<%=cat_list.get(i).getCategory_id() %><%if(Integer.toString(cat_list.get(i).getCategory_id()).equals(Integer.toString(info_list.get(0).getCategory()))){ %> selected<%} %>><%=cat_list.get(i).getCategory_name() %></option>
						<%} %>
						</select></td>
				</tr>
						<tr>
                            					<td>Priority</td>
                            					<td>
	                            					<select name="priority">
	                            						<option disabled></option>
	                            						<%
	                            							Priority pr= new Priority();
	                            						GenericsMethod<Priority> prg_obj = new GenericsMethod<Priority>();
	                            						ArrayList<Priority> pri_list=prg_obj.viewDate(pr);
	                            							for(int i=0;i<pri_list.size();i++)
	                            							{
	                            						%>
	                            							<option value=<%=pri_list.get(i).getPriority_id() %><%if(Integer.toString(pri_list.get(i).getPriority_id()).equals(Integer.toString(info_list.get(0).getPriority()))){ %> selected<%} %>><%=pri_list.get(i).getPriority() %></option>
	                            						<%} %>
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="phn" cellpadding="10" cellspacing="10" style="border-spacing: 100px 100px;">
												 <tr>
                            	<td>Responsible</td>
                            	<td>
                            	<select name="responsible">
                            		<option disabled selected></option>
                            		<%
                            			DaoMethodsImp d_obj= new DaoMethodsImp();
                            			ArrayList<UserMaster> u_list=d_obj.viewAllData(user_id);
                            		%>
                            		<option value=<%=u_list.get(0).getUser_id() %> selected><%=u_list.get(0).getFull_name() %></option>
                            	</select>
                            	</td><td></td>
                            </tr>
											
												<tr>
                            					<td>Phone No</td>
                            					<td><input type="text" name="phone" value="<%=info_list.get(0).getPhone_no() %>" onclick="this.select();" /></td>
                            				</tr>
                            				<tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" name="mobile1" value="<%=info_list.get(0).getMobile_no1()%>" onclick="this.select();" /></td>
                            				</tr>
											
                            				<tr>
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" name="mobile2" value="<%=info_list.get(0).getMobile_no2()%>" onclick="this.select();" /></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3"><textarea style="width: 95% !important;" rows="5" onclick="this.select();" name="description" placeholder="Description"><%=info_list.get(0).getDescription() %></textarea><input type="hidden" name="hid_val" value="edit_scheduledcall"/><input type="hidden" value="<%=edit_id %>" name="schedule_id"/></td>
									
								</tr>
								
							</table>
	</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

