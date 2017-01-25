<%@page import="bean.purchase.Item_Size"%>
<%@page import="bean.purchase.Product_Category"%>
<%@page import="bean.purchase.Item"%>
<%@page import="dao.purchase.PurchaseDaoImp"%>
<%@page import="iFaces.purchase.PurchaseDao"%>
<%@page import="bean.purchase.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.Privilege,generics.user_mgmt.GenericsMethod" %>
<%
	String info_id=request.getParameter("id");
	PurchaseDao pd=new PurchaseDaoImp();
	ArrayList<Item> i_list=pd.itemDetail(Integer.parseInt(info_id));
%>
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
		if(conf){
			window.location.assign("SaleDeleteServ?action=customer&?dv_d=5&id="+id+"");
		}
  }
  function createItem(){
	  window.location.assign("home.jsp?p=Add Item");
  }
  
  function editCustomer(edit_id) {
	window.location.assign("home.jsp?p=Edit Item&id="+edit_id+"");
}
 
  
  </script>
</head>
  <div class="row-fluid">

                        <div class="span7">
                         <div class="head clearfix">
                        		<h1>Item Information</h1>
                       		 </div>
                        <div class="block" style="font-size: 16px;">                       
							<input type="button" class="btn btn-success"  value="Edit" onclick="editCustomer(<%=info_id %>);" /><input type="button" class="btn btn-success"  value="Create" style="margin-left:15px;" onclick="createItem();" />
						 	<hr />             
						  								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
						
										<tr>
											<td>Product Type</td>
											<td style="border-left: 1px solid #cdcdcd;"><%String ptype=pd.getProductType(i_list.get(0).getProduct_type()); %><%=ptype %>
											</td>
										</tr>
										<tr>
											<td>Product Category</td>
											<td style="border-left: 1px solid #cdcdcd;"><%ArrayList<Product_Category> pc_lst=pd.getProductCategory(i_list.get(0).getProduct_category()); %>
											<%=pc_lst.get(0).getProduct_caegory() %>
											</td>
										</tr>
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="phn" cellpadding="10" cellspacing="10" style="border-spacing: 100px 100px;">
								
													<tr>
                            		<td>Product</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            		<%
                            			ArrayList<Product> p_lst=pd.productInfo(i_list.get(0).getProduct());
                            		%><%=p_lst.get(0).getProduct() %>			
                            		</td>
                           		 </tr>
                           		
                            <tr>
                            <td>Item</td>
                            <td style="border-left: 1px solid #cdcdcd;"><%=i_list.get(0).getItem() %></td>
                            </tr>
                         
											
				
                              
                           
										</table>
									</td>
								</tr>
								
                           
                          
                            
								
							</table>
							<%
								if(Integer.toString(i_list.get(0).getProduct_type()).equals("1")){
							%>
							Size:
							<%
								ArrayList<Item_Size> size_list=pd.getItemSize(i_list.get(0).getItem_id());
								String size="";
								for(int i=0;i<size_list.size();i++){
									if(i==size_list.size()-1)
										size+=size_list.get(i).getSize();
									else
										size+=size_list.get(i).getSize()+",";
								}
							%><%=size %>
							<br /><br />
							<%} %>
							 Description:<%=i_list.get(0).getDescription() %> <br /><br /><br />
							
						
		            </div>
					</div>
               </div>   
