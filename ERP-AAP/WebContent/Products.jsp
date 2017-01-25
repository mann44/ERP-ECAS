
<%@page import="bean.purchase.Product_type"%>
<%@page import="iFaces.purchase.PurchaseDao"%>
<%@page import="dao.purchase.PurchaseDaoImp"%>
<%@page import="bean.purchase.Product_Category"%>
<%@page import="bean.purchase.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="generics.user_mgmt.GenericsMethod" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<head>
<style type="text/css">
#waypointsTable tr:hover {
    background-color:yellow;
}
</style>

	<script type="text/javascript">
	

		function AddProcuct(){
			window.location.assign("home.jsp?p=Add Product");
		}
		
		function clickrow(id){
			window.document.location="home.jsp?p=Product Edit&id="+id;
		}
		
	
		
	</script>
</head>
<%
int uid=(Integer)session.getAttribute("user_id");
Product pr=new Product();
GenericsMethod<Product> g_pr=new GenericsMethod<Product>();
ArrayList<Product> pr_list=g_pr.viewDate(pr);
PurchaseDao prd_obj=new PurchaseDaoImp();
%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Products</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        		
             				<input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="AddProcuct();" /><hr/>
                        	</div>
                        </div>
                            <table class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Product type</th>
                                        <th>Product Category</th>
                                        <th>Product</th>
                                        <th></th>   
                                                                  
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                   <%
                                    	for(int i=pr_list.size()-1,k=1;i>=0;i--,k++)
                                    	{
                                    		ArrayList<Product_Category> c_list=prd_obj.getProductCategory(pr_list.get(i).getProduct_category());
                                    		String pr_type=prd_obj.getProductType(pr_list.get(i).getProduct_type());
                                    		
                                    %>  
                                    <tr onclick="clickrow(<%=pr_list.get(i).getProduct_id()%>);" style="cursor: pointer;" onmouseover="changeApp();">
                                    	 <td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%=pr_type %></td>
                                    	<td style="border:none;"><%=c_list.get(0).getProduct_caegory() %></td>
                                    	<td style="border:none;"><%=pr_list.get(i).getProduct() %></td>
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