<%@page import="bean.purchase.Product"%>
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

  <script type="text/javascript">
  function validation(){
		var p_id=document.item_form.product.selectedIndex;
		if(p_id==0){
			alert("Select the product");
			document.item_form.product.focus();
			return false;
		}
		
		var iname=document.item_form.item;
		if(iname.value=="")
			{
				alert("Please Enter the Component.");
				iname.focus();
				return false;
			}
		return true;
	}
  </script>
</head>
  <div class="row-fluid">

                        <div class="span5">
                         <div class="head clearfix">
                        		<h1>Add Item</h1>
                       		 </div>
                        <div class="block">                       
						  <form action="PurchaseStuff" method="post" name="item_form" onsubmit="return validation()">
						 	<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="home.jsp?p=Items" style="margin-left:10px;" >Discard</a>
						 	<input type="button" value="Add Item Size" class="btn btn-primary" style="margin-left: 40%;" onclick="window.location.assign('home.jsp?p=Add Item Size');">
						 	<hr />             
						  
							<br />
							<table style="margin-left: 25px;" cellpadding="5" cellspacing="5">
								<tr>
                            		<td>Product</td>
                            		<td>
                            						<select name="product">
                            							<option selected disabled>---Select Product---</option>
                            							<%
                            							Product pr=new Product();
                            							GenericsMethod<Product> gp_obj=new GenericsMethod<Product>();
                            							ArrayList<Product> p_list=gp_obj.viewDate(pr);
                            							for(int i=0;i<p_list.size();i++){
                            							%>
                            							<option value=<%=p_list.get(i).getProduct_id() %>><%=p_list.get(i).getProduct() %></option>
                            							<%} %>
                            						</select>
                            		</td>
                            		 <td><input type="button" class="btn vvarious fsv-update button11"   href="Add Product_f.jsp" value="+" data-fancybox-type="iframe"/></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Item</td>
                            <td>
                            	<input type="text" name="item" />
                            </td><td></td>
                            </tr>
                          
                            <tr>
                            <td colspan="3"><textarea rows="5" placeholder="Description" style="width: 96%;" name="description"></textarea> </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid_val" value="Add Item" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   
