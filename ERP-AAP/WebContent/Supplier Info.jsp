
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="iFaces.user_mgmt.DaoMethods"%>
<%@page import="bean.purchase.Supplier_Company"%>
<%@page import="bean.purchase.Supplier"%>
<%@page import="dao.purchase.PurchaseDaoImp"%>
<%@page import="iFaces.purchase.PurchaseDao"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="generics.user_mgmt.GenericsMethod" %>
<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
  
  function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		/* if(conf){
			window.location.assign("SaleDeleteServ?action=customer&?dv_d=5&id="+id+"");
		} */
  }
  function createSupplier(){
	  window.location.assign("home.jsp?p=Create Supplier");
  }
  
  function editCustomer(edit_id) {
	window.location.assign("home.jsp?p=Edit Supplier&id="+edit_id+"");
}
 
  
  </script>
</head>
<%
	String info_id=request.getParameter("id");
	PurchaseDao ps=new PurchaseDaoImp();
	ArrayList<Supplier> s_lst=ps.supplierInfo(Integer.parseInt(info_id));
	String iscompany=s_lst.get(0).getIs_company();
%>
  <div class="row-fluid">

                        <div class="span9">
                         <div class="head clearfix">
                        		<h1>Supplier Information</h1>
                       		 </div>
                        <div class="block" style="font-size: 16px;">                       
							<input type="button" class="btn btn-success"  value="Edit" onclick="editCustomer(<%=info_id %>);" /><input type="button" class="btn btn-success"  value="Create" style="margin-left:15px;" onclick="createSupplier();" />
							<input type="button" class="btn btn-inverse" value="Delete" style="margin-left: 73%;" onclick="deleteConform(<%=info_id%>);" />
							
							<hr />             
						 <br />
							<table style="margin-left: 50px;" id="tbl1" cellpadding="8" cellspacing="8" align="center">
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="8" cellspacing="8">
										<tr>
                            		<td>Name</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getSupplier_name() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Email</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getEmail_id() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Website</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getWebsite() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Fax</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getFax() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Phone-No</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getPhone_no() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Mobile NO(1)</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getMobile_no1() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Mobile No(2)</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getMobile_no2() %>		
                            		</td>
                           		 </tr>	
											 
                            	
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="8" cellspacing="8" style="border-spacing: 100px 100px;">
										<%
                           		 	if(iscompany.equals("0")){
                           		 %>	
										<tr>
                            		<td>Company</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            					String company;
                            					String co_id=Integer.toString(s_lst.get(0).getCompany_id());
                            					if(co_id.equals("0")){
                            						company="No Company";
                            					}
                            					else{
                            					ArrayList<Supplier_Company> comp_list=ps.companyDetail(s_lst.get(0).getCompany_id());
                            					company=comp_list.get(0).getCompany_name();
                            					}
                            				%>		
                            				<%=company %>
                            		</td>
                           		 </tr>	
                              <%} %>
                              <tr>
                            		<td>Address</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getAddress() %>	
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>City</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            				int c=s_lst.get(0).getCity(); 
                            				DaoMethods d_obj= new DaoMethodsImp();
                            				String City=d_obj.getCity(c);
                            				%><%=City %>		
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>State</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            				int st=s_lst.get(0).getState();
                            				String State=d_obj.getState(st);
                            				%><%=State %>		
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>Country</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            					int cnt=s_lst.get(0).getCountry();
                            					String Country=d_obj.getCountry(cnt);
                            				%><%=Country %>		
                            		</td>
                           		 </tr>	
                           		  <%
                           		 	if(iscompany.equals("0")){
                           		 %>	
                           		 <tr>
                            		<td>Job Position</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getJob_position() %>	
                            		</td>
                           		 </tr>
                           		
                           		 <tr>
                            		<td>Title</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            					int ttl=s_lst.get(0).getTitle(); 
                            					SalesDao sd_obj=new SalesDaoImp();
                            					String title=sd_obj.getTitle(ttl);
                            				%><%=title %>
                            		</td>
                           		 </tr>	
                           		 <%
                           		 }
                           		 	else{%>
                           		 	<tr><td></td><td><br></td></tr>
                           		 	<tr><td></td><td><br></td></tr>
                           		 	<tr><td></td><td><br></td></tr>
                           		 	<% 
                           		 	}
                           		  %>
                           
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" cellspacing="8" cellpadding="8" style="border-spacing: 100px 100px;">
										<tr>
                            		<td>Internal Note</td>
                            		<td>
                            				<%=s_lst.get(0).getDescription() %>	
                            		</td>
                           		 </tr>		
                            	
                           
                             
										</table>
									
							</table>
		     	
		            </div>
					</div>
               </div>   
