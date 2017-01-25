 <%@page import="bean.purchase.Item"%>
<%@page import="bean.purchase.Quotation_Detail"%>
<%@page import="dao.purchase.PurchaseDaoImp"%>
<%@page import="iFaces.purchase.PurchaseDao"%>
<%@page import="bean.purchase.Product"%>
<%@page import="bean.purchase.Supplier"%>
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
   
   <script type="text/javascript">
        function addRow(tableID) {
 
            var table = document.getElementById(tableID);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[0].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[0].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                }
            }
        }
        
        function deleteRow(tableID) {
            try {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
 
            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                if(null != chkbox && true == chkbox.checked) {
                    if(rowCount <= 1) {
                        alert("Cannot delete all the rows.");
                        break;
                    }
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }
 
 
            }
            }catch(e) {
                alert(e);
            }
        }

   </script>
<script type="text/javascript">

$(document).ready(function(){
	  $(".eee").focus(function(){
	    $(this).css("border-top","1px solid #DDD");
	  });
	  $(".eee").blur(function(){
	    $(this).css("border-top","none");
	  });
	});


function getItem(id){
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
	      document.getElementById("itm").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","PurchaseAjax?value="+id,true);
	  xmlhttp.send();
}

function submitData(){
	var product=document.getElementById("pro").value;
	alert(product);
	var item=document.getElementById("i_id").value;
	var desc=document.getElementById("desc").value;
	var fdate=document.getElementById("sdate").value;
	var qnty=document.getElementById("qty").value;
	var price=document.getElementById("u_pri").value;
	var ta_x=document.getElementById("tx").value;
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
	      document.getElementById("abc").innerHTML=xmlhttp.responseText;
	      }
	    };
	    var url="FormSubmit?product="+product+"&item="+item+"&desc="+desc+"&fdate="+fdate+"&qnty="+qnty+"&price="+price+"&ta_x="+ta_x+"";
	  xmlhttp.open("post",url,true);
	  xmlhttp.send();
}
</script>
      <script type="text/javascript">
      
      function submitForm(){
    	  document.q_detail.submit();
      }
      
      $(function() {
    	    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
    	  });
      
      $(function() {
  	    $( "#sdate" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  	  });
      
      $(function() {
    	    $( "#edate" ).datepicker({dateFormat: 'yy-mm-dd'});
    	  });
    	function validation(){
    		var c_name=document.company_form.company_name;
    		if(c_name.value==""){
    			alert("Enter the Name of Company");
    			c_name.focus();
    			return false;
    		}
    		
    		
    	
    		var adr=document.company_form.address;
    		if(adr.value==""){
    			alert("Please Enter the Address");
    			adr.focus();
    			return false;
    		}
    		
    		var ctry=document.company_form.country.selectedIndex;
        	if(ctry==0)
        		{
        			alert("Please Select Country.");
        			document.company_form.country.focus();
        			return false;
        		}
        	
        	var sta=document.company_form.state.selectedIndex;
        	if(sta==0)
        		{
        			alert("Please Select State.");
        			document.company_form.state.focus();
        			return false;
        		}
        	
        	var cty=document.company_form.city.selectedIndex;
        	if(cty==0)
        		{
        			alert("Please Select City.");
        			document.company_form.city.focus();
        			return false;
        		}
        	
        	var phn=document.company_form.phn_no.value;
    		var m1=document.company_form.m_no1.value;
    		var m2=document.company_form.m_no2.value;
    		if(phn=="" && m1=="" && m2==""){
    			alert("Please provide phone no or one Mobile no");
    			document.company_form.m_no1.focus();
    			return false;
    		}
        	var phoneno = /^\d{10}$/;  
        	if(m1 != ""){
        	if(!phoneno.test(m1))
        	{
        		alert("You have entered an invalid phone number");
        		document.company_form.m_no1.focus();
        		return false;
        	}
        	}
        	
        	if(m2 !=""){
        	if(!phoneno.test(m2))
        	{
        		alert("You have entered an invalid phone number");
        		document.company_form.m_no2.focus();
        		return false;
        	}
        	}
        	
        	
    		var email=document.company_form.e_name;
    		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if(email.value != ""){
        	if (!filter.test(email.value)) 
    			{
        			alert('Please provide a valid email address');
       		 		document.company_form.e_name.focus();
        		 	return false;
    			}
			}
    		
    		return true;
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
                <div class="row-fluid">

               
                        <div class="span12">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Create Quotation</h1>
                        </div>
                        <div class="block">                  
<form name="company_form" action="PurchaseStuff" method="post" onsubmit="return validation();">
	<input type="submit" class="btn btn-success"  value="Save"/>&nbsp;&nbsp;or<a href="#" onclick="window.history.back();" style="margin-left:10px;" >Discard</a>
	<div style="margin-left: 72%;">
		<input type="radio" name="status" value="Draft PO" checked="checked"/>Draft PO
		<input type="radio" name="status" value="RFQ Sent"/>RFQ Sent
		<input type="radio" name="status" value="Purchase Order"/>Purchase Order
		<input type="radio" name="status" value="Done"/>Done
	</div>					 	
						 	<hr />   
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
							<tr>
								<td></td>
							</tr>
									<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
										
									<tr>
									<td>
										Supplier
									</td>
									<td>
										<select id="s2_1" style="width: 100%" name="supplier">
											<option selected>--Select Supplier--</option>
											<%
												Supplier s= new Supplier();
												GenericsMethod<Supplier> g_obj=new GenericsMethod<Supplier>();
												ArrayList<Supplier> s_list=g_obj.viewDate(s);
												for(int i=0;i<s_list.size();i++){
											%>
											<option value=<%=s_list.get(i).getSupplier_id() %>><%=s_list.get(i).getSupplier_name() %></option>
											<% }%>
										</select>
									</td>
									<td><input type="button" class="btn button11" onclick="window.location.assign('home.jsp?p=Create Supplier');" value="+"/></td>
									
								</tr>
								<tr>
									<td>Supplier Reference</td>
									<td><input type="text" name="sref" /></td><td></td>
								</tr>
	
                           			
                           					 	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="10" cellspacing="10" style="border-spacing: 100px 100px;">
											<tr>
												<td>Order Date</td>
												<td><input type="text" id="bdate_id" name="odate" style="width:130px;"/></td>
											</tr>
											<tr>
                               		<td>Expected Date</td>
                               		<td><input type="text" id="edate" style="width:130px;" name="edate"/><input type="hidden" name="hid_val" value="Create Quotation" /></td>
                               	</tr>
											
                           			
										</table>
									</td>
								</tr>
													
							</table>
							
		</form>
                        <div class="tabs" style="border-bottom: none;">

                            <ul style="background-color: transparent;">
                                <li ><a href="#tabs-1" class="eee">Purchase Order</a></li>
                                <li ><a href="#tabs-2" class="eee">Incoming Shipments &amp; Invoices</a></li>
                            </ul>                        

                            <div id="tabs-1">
                            <form action="PurchaseStuff" name="q_detail" method="post">
                               <table id="dataTable">
                               		<tr style="background-color: #DDD;" >
                               			<th width="14%" style="border-right: 1px solid #ffffff;">Product</th>
                               			<th width="14%" style="border-right: 1px solid #ffffff;">Item</th>
                               			<th width="14%" style="border-right: 1px solid #ffffff;">Description</th>
                               			<th width="12%" style="border-right: 1px solid #ffffff;">Schedule Date</th>
                               			<th width="12%" style="border-right: 1px solid #ffffff;">Quantity</th>
                               			<th width="12%" style="border-right: 1px solid #ffffff;">Unit price</th>
                               			<th width="12%" style="border-right: 1px solid #ffffff;">Taxes</th>
                               			<th width="12%">Subtotal</th>
                               			<th></th>
                               			
                               		</tr>
                               		
                               		
                               		<%
                               			PurchaseDao pd=new PurchaseDaoImp();
                               			ArrayList<Quotation_Detail> qd_list=pd.view_QDetail_byQ_id(pd.nextInc());
                               			for(int i=0;i<qd_list.size();i++){
                               		%>
                               		
                               		<tr style="border-bottom:1px solid #cdcdcd; height: 40px;">
                               			<td style="text-align: center;"><%
                               					ArrayList<Product> pr_lst=pd.productInfo(qd_list.get(i).getProduct());
                               				%><%=pr_lst.get(0).getProduct() %></td>
                               			<td style="text-align: center;"><%ArrayList<Item> i_lst=pd.itemDetail(qd_list.get(i).getItem());%><%=i_lst.get(0).getItem() %></td>
                               			<td style="text-align: center;"><%=qd_list.get(i).getDescription() %></td>
                               			<td style="text-align: center;"><%=qd_list.get(i).getSchedule_dt() %></td>
                               			<td style="text-align: right;"><%=qd_list.get(i).getQuantity() %></td>
                               			<td style="text-align: right;"><%=qd_list.get(i).getUnit_price() %></td>
                               			<td style="text-align: right;"><%=qd_list.get(i).getTaxs() %></td>
                               			<td style="text-align: right;"><%=qd_list.get(i).getSubtotal() %></td>
                               		</tr>
                               		<%} %>
                               		<tr style="border-bottom:1px solid #cdcdcd;">
                               			<td>
                               				<select name="product" onchange="getItem(this.value);" style="width: 100%;margin-top: 5px;" id="pro">
                            							<option selected disabled></option>
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
                               			<td id="itm">
                  
                               			</td>
                               			<td><input type="text" style="width:90%; margin-top: 5px;" name="description" id="desc"/></td>
                               			<td><input type="text" id="sdate" style="width: 90%; margin-top: 5px;" name="s_date" /></td>
                               			<td><input type="text" style="width:90%; text-align: right;margin-top: 5px;" value="1.000" name="quantity" id="qty" /></td>
                               			<td><input type="text" style="width:90%; text-align: right; margin-top: 5px;" value="0.00" name="u_price" id="u_pri" /></td>
                               			<td><input type="text" style="width:90%; text-align: right; margin-top: 5px;" name="tax" value="0.00" id="tx"/></td>
                               			<td></td>
                               		</tr>
                               		<tr style="border-bottom: 1px solid #cdcdcd;  height: 40px;">
                               			<td align="center"><a href="#" style="color: #335A85;font-size: 14px;" onclick="addRow('dataTable');">Add an Item</a></td>
                               			<td><input type="hidden" name="hid_val" value="Quotation Detail" /></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               		</tr>
                               		<tr style="border-bottom: 1px solid #cdcdcd;  height: 40px;">
                               			<td>&nbsp;</td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               		</tr>
                               		<tr style="border-bottom: 1px solid #cdcdcd;  height: 40px;">
                               			<td>&nbsp;</td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               		</tr>
                               		<tr style="border-bottom: 1px solid #cdcdcd;  height: 40px;">
                               			<td>&nbsp;</td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               		</tr>
                               </table>
                               </form>
                            </div>                        

                            <div id="tabs-2">
                               <table style="margin-top: 40px;margin-left: 25px;">
                               	<tr>
                               		<td>Expected Date</td>
                               		<td><input type="text" id="edate" style="width:130px;margin-left: 5px;"/></td>
                               	</tr>
                               	<tr><td></td><td><br /><br /></td></tr>
                               </table>
                            </div>

                           
                    </div>
			 			</div>
						                      
                        </div>

               </div>   
                       

