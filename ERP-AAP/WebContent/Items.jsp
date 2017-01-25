<%@page import="bean.purchase.Product"%>
<%@page import="bean.purchase.Product_Category"%>
<%@page import="dao.purchase.PurchaseDaoImp"%>
<%@page import="iFaces.purchase.PurchaseDao"%>
<%@page import="bean.purchase.Item"%>
<%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="bean.sales.Customer"%>
<%@page import="javassist.runtime.Inner"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="generics.user_mgmt.GenericsMethod" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%
	int uid=(Integer)session.getAttribute("user_id");
	Item item=new Item();
	GenericsMethod<Item> gi_obj=new GenericsMethod<Item>();
	ArrayList<Item> i_lst=gi_obj.viewDate(item);
	PurchaseDao pd_obj=new PurchaseDaoImp();
%>
<head>
<style type="text/css">
#waypointsTable tr:hover {
    background-color:yellow;
}
</style>

	<script type="text/javascript">
	

		function AddItem(){
			window.location.assign("home.jsp?p=Add Item");
		}
		
		function clickrow(id){
			window.document.location="home.jsp?p=Item Info&id="+id;
		}
		
		
		
	</script>
</head>
<%

%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Items</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        		
             				<input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="AddItem();" /><hr/>
                        	</div>
                        </div>
                            <table class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Product Category</th>
                                        <th>Product</th>
                                        <th>Item</th>
                                        <th></th>   
                                                                  
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                   <%
                                    	for(int i=0,k=1;i<i_lst.size();i++,k++)
                                    	{
                                    		int p_cat=i_lst.get(i).getProduct_category();
                                    		ArrayList<Product_Category> cat_lst=pd_obj.getProductCategory(p_cat);
                                    		ArrayList<Product> Pr_lst=pd_obj.productInfo(i_lst.get(i).getProduct());
                                    		
                                    %>  
                                    <tr onclick="clickrow(<%=i_lst.get(i).getItem_id()%>);" style="cursor: pointer;" onmouseover="changeApp();">
                                    	 <td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%=cat_lst.get(0).getProduct_caegory() %></td>
                                    	<td style="border:none;"><%=Pr_lst.get(0).getProduct() %></td>
                                    	<td style="border:none;"><%=i_lst.get(i).getItem() %></td>
                                    	<td style="border:none;"></td>
                                    	
                                    	
                                    	
                                    	
                                    	
                                  </tr>
									<%
											
										}
									%>
                                   
                                                               
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div> 