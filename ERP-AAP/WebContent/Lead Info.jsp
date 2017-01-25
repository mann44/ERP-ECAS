<%@page import="bean.sales.Lead"%>
<%@page import="bean.user_mgmt.UserMaster"%>
<%@page import="bean.sales.Scheduled_Call"%>
<%@page import="bean.sales.Company"%>
<%@page import="iFaces.user_mgmt.DaoMethods"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="bean.sales.Customer"%>
<%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.sales.SalesDaoImp"%>
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
  
  function CreateLead(){
	  window.location.assign("home.jsp?p=Create Lead");
  }
  
  function editLead(edit_id) {
	window.location.assign("home.jsp?p=Lead Edit&id="+edit_id+"");
}
  
  function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		var redirectUrl="DeleteServ?d_id="+id;
		if(conf){
			window.location.assign("SaleDeleteServ?action=lead&?dv_d=5&id="+id+"");
		}
			
	}
 
  </script>
</head>
<%
	String info_id=request.getParameter("id");
	SalesDao sd_obj= new SalesDaoImp();
	ArrayList<Lead> l_list=sd_obj.LeadInfo(Integer.parseInt(info_id));
%>
  <div class="row-fluid">

                        <div class="span8">
                         <div class="head clearfix">
                        		<h1>Lead Information</h1>
                       		 </div>
                        <div class="block">                       
							<input type="submit" class="btn btn-success"  value="Edit" onclick="editLead(<%=info_id %>);" /><input type="submit" class="btn btn-success"  value="Create" style="margin-left:15px;" onclick="CreateLead();" />
							<input type="button" class="btn btn-inverse" value="Delete" style="margin-left: 70%;" onclick="deleteConform(<%=info_id%>)"/>
							<hr />    
                                           
                         
						 <span style="font-size: 16px;margin-left: 90%;"><%=l_list.get(0).getStage() %></span><br />
				<Span style="font-size: 25px;"><%=l_list.get(0).getSubject() %></Span><br /><br />
								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Date</td><td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getLead_dt() %></td><td></td>
                            						</tr>
                            				
                            					
                            							<tr>
														<td>Customer</td>
														<td style="border-left: 1px solid #cdcdcd;">
														<%
														int cust_id=l_list.get(0).getCustomer_id();
			                                    		ArrayList<Customer> cu_lst=sd_obj.CustomerInfo(cust_id);
														%><%=cu_lst.get(0).getCust_name() %>
														</td>
														</tr>
														 <tr>
                            						
               										<td>Contact Name</td><td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getContact_name() %></td><td></td>
                            						</tr>
                            						<tr>
														<td>Title</td>
														<td style="border-left: 1px solid #cdcdcd;">
														<%
														int ttl=l_list.get(0).getTitle();
			                                    		String title=sd_obj.getTitle(ttl);
														%><%=title %>
														</td>
														</tr>
														  
                             <tr>
                            						
					<td>Category</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int cat_id=l_list.get(0).getCategory();
						String category=sd_obj.getCategory(cat_id);
					%><%=category %>
					</td>
				</tr>
						<tr>
                            					<td>Priority</td>
                            					<td style="border-left: 1px solid #cdcdcd;">
                            					<%
                            						int pr_id=l_list.get(0).getPriority();
                            						String priority=sd_obj.getPriority(pr_id);
                            					%><%=priority %>
                            					</td>
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="phn" cellpadding="10" cellspacing="10" style="border-spacing: 100px 100px;">
											
											<tr>
                            					<td>Address</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getAddress() %></td>
                            				</tr>
                            				<tr>
                            					<td>Email</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getEmail() %></td>
                            				</tr>
                            				<tr>
                            					<td>Fax</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getFax() %></td>
                            				</tr>
												<tr>
                            					<td>Phone No</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getPhone_no() %></td>
                            				</tr>
                            				<tr>
                            					<td>Mobile No(1)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getMobile_no1() %></td>
                            				</tr>
											
                            				<tr>
                            					<td>Mobile No(2)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getMobile_no2() %></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
								
							</table>
		     				Description
									<%=l_list.get(0).getDescription() %><br /><br ><br /><br />
								
								
		            </div>
					</div>
               </div>   
