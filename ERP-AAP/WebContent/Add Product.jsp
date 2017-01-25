<%@page import="bean.purchase.Product_Category"%>
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
  function validation(){
		var c_id=document.product_form.category_id.selectedIndex;
		if(c_id==0){
			alert("Select the Privilege");
			document.product_form.category_id.focus();
			return false;
		}
		
		var pr=document.product_form.product;
		if(pr.value=="")
			{
				alert("Select the Product.");
				pr.focus();
				return false;
			}
		return true;
	}
  </script>
</head>
  <div class="row-fluid">

                        <div class="span5">
                         <div class="head clearfix">
                        		<h1>Add Product</h1>
                       		 </div>
                        <div class="block">                       
						  <form action="PurchaseStuff" method="post" name="product_form" onsubmit="return validation()">
						 	<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="home.jsp?p=Products" style="margin-left:10px;" >Discard</a><hr />             
						  
							<br />
							<table style="margin-left: 25px;" cellpadding="5" cellspacing="5">
								<tr>
                            		<td>Product Category</td>
                            		<td>
                            						<select name="category_id">
                            							<option selected disabled>---Select Category---</option>
                            							<%
                            								Product_Category pc=new Product_Category();
                            								GenericsMethod<Product_Category> gpc_obj=new GenericsMethod<Product_Category>();
                            								ArrayList<Product_Category> pc_lst=gpc_obj.viewDate(pc);
                            								for(int i=0;i<pc_lst.size();i++){
                            							%>
                            								<option value=<%=pc_lst.get(i).getPc_id() %>><%=pc_lst.get(i).getProduct_caegory() %></option>
                            							<%} %>
                            						</select>
                            		</td>
                            		 <td><input type="button" class="btn various fsv-update button11"   href="Add Category.jsp" value="+" data-fancybox-type="iframe"/></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Product</td>
                            <td>
                            	<input type="text" name="product" />
                            </td><td></td>
                            </tr>
                            <tr>
                            <td colspan="3"><textarea rows="5" placeholder="Description"style="width: 96%;" name="description"></textarea> </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid_val" value="Add Product" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   
