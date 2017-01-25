 <%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bean.purchase.Product_Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.Privilege,generics.user_mgmt.GenericsMethod" %>
<html lang="en">

<head>        
    
    
    <title>Add Product</title>
     <script type='text/javascript' src='js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery.mousewheel.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
     
    <script type='text/javascript' src='js/plugins/sparklines/jquery.sparkline.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/fullcalendar/fullcalendar.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/select2/select2.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/uniform/uniform.js'></script>
    
    <script type='text/javascript' src='js/plugins/maskedinput/jquery.maskedinput-1.3.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/validation/languages/jquery.validationEngine-en.js' charset='utf-8'></script>
    <script type='text/javascript' src='js/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>
    
    <script type='text/javascript' src='js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    <script type='text/javascript' src='js/plugins/animatedprogressbar/animated_progressbar.js'></script>
    
    <script type='text/javascript' src='js/plugins/qtip/jquery.qtip-1.0.0-rc3.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cleditor/jquery.cleditor.js'></script>
    
    <script type='text/javascript' src='js/plugins/dataTables/jquery.dataTables.min.js'></script>    
    
    <script type='text/javascript' src='js/plugins/fancybox/jquery.fancybox.pack.js'></script>
    
    <script type='text/javascript' src='js/plugins/pnotify/jquery.pnotify.min.js'></script>
    <script type='text/javascript' src='js/plugins/ibutton/jquery.ibutton.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/scrollup/jquery.scrollUp.min.js'></script>
    
    <script type='text/javascript' src='js/cookies.js'></script>
    <script type='text/javascript' src='js/actions.js'></script>
    <script type='text/javascript' src='js/charts.js'></script>
    <script type='text/javascript' src='js/plugins.js'></script>
    <script type='text/javascript' src='js/settings.js'></script>
    
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />  
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" /> 
    <!--[if lt IE 8]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->   
    <style type="text/css">
    	body{overflow: hidden;}
    </style>      
    <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>

   
    	
    	<script>
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
    	function FBClose(){
    		var flg=validation();
    		if(flg){
    			parent.$.fancybox.close();
    			return true;
    		}
    		else{
    			return false;
    		}
    	}
    </script> 
     
</head>
<body>
    <div class="wrapper"> 
            
        <div class="header">
          <h3 style="color:#ffffff">&nbsp;Add Product</h3>
        </div>


        <div class="content" style="background-color: #F9F9F9;">


            <div class="workplace">
            <br />
								 						  <form action="PurchaseStuff" method="post" name="product_form" onsubmit="return FBClose()">
						 	<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="#" onclick="parent.$.fancybox.close();" style="margin-left:10px;" >Discard</a><hr />             
						  
							<br />
							<table style="margin-left: 25px;" cellpadding="12" cellspacing="12">
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
                            		 <td></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Product</td>
                            <td>
                            	<input type="text" name="product" style="width: 222px;height:30px;" />
                            </td><td></td>
                            </tr>
                            <tr>
                            <td colspan="3"><textarea rows="5" placeholder="Description"style="width: 95%;" name="description"></textarea> </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid_val" value="Add Product" /><br /><br /><br /><br /></td>
                            </tr>
							</table>
						</form>
            </div>

        </div>   
    </div>
</body>

</html>
