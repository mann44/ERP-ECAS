<%@page import="bean.purchase.Item"%>
<%@page import="dao.purchase.PurchaseDaoImp"%>
<%@page import="iFaces.purchase.PurchaseDao"%>
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
  function validation(){
		var it=document.item_size_form.item.selectedIndex;
		if(it==0){
			alert("Select the Item");
			document.item_size_form.item.focus();
			return false;
		}
		
		var isize=document.item_size_form.size;
		if(isize.value=="")
			{
				alert("Please Enter the Size of Item.");
				isize.focus();
				return false;
			}
		return true;
	}
  </script>
</head>
  <div class="row-fluid">

                        <div class="span5">
                         <div class="head clearfix">
                        		<h1>Add Item Size</h1>
                       		 </div>
                        <div class="block">                       
						  <form action="PurchaseStuff" method="post" name="item_size_form" onsubmit="return validation()">
						 	<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="#" onclick="window.history.back();" style="margin-left:10px;" >Discard</a>
						 	<hr />             
						  
							<br />
							<table style="margin-left: 25px;" cellpadding="8" cellspacing="8">
								<tr>
                            		<td>Item</td>
                            		<td>
                            						<select name="item">
                            							<option selected disabled>---Select Product---</option>
                            							<%
                            							PurchaseDao pd_obj=new PurchaseDaoImp();
                            							ArrayList<Item> i_lst=pd_obj.stockableItem();
                            							for(int i=0;i<i_lst.size();i++){
                            							%>
                            							<option value=<%=i_lst.get(i).getItem_id() %>><%=i_lst.get(i).getItem() %></option>
                            							<%} %>
                            						</select>
                            		</td>
                            		 <td><input type="button" class="btn button11"  value="+" onclick="window.location.assign='home.jsp?p=Add Item'" /></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Size</td>
                            <td>
                            	<input type="text" name="size" />
                            </td><td></td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid_val" value="Add Item Size" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   
