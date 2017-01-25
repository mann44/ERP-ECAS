  <%@page import="bean.sales.Customer"%>
<%@page import="bean.sales.Priority"%>
<%@page import="bean.sales.Categories"%>
<%@page import="bean.sales.Title"%>
<%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.user_mgmt.Role,bean.user_mgmt.Country,bean.user_mgmt.State,bean.user_mgmt.City" %>
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
 
  
  function validation(){
	  var sub=document.lead_form.subject;
	  if(sub.value==""){
		  alert("Describe the lead");
		  sub.focus();
		  return false;
	  }
	  
	  var dt=document.lead_form.lead_date;
	  if(dt.value==""){
		  alert("Please select the lead date");
		  dt.focus();
		  return false;
	  }
	  var cus=document.lead_form.customer.selectedIndex;
		if(cus==0)
		{
			alert("Please select the customer");
			document.lead_form.customer.focus();
			return false;
		}
		
		 var cat=document.lead_form.category.selectedIndex;
		if(cat==0)
		{
			alert("Please select lead category");
			document.lead_form.category.focus();
			return false;
		}
		
		 var pri=document.lead_form.priority.selectedIndex;
		if(pri==0)
		{
			alert("Please select lead category");
			document.lead_form.priority.focus();
			return false;
		}
		
		var add_ress=document.lead_form.address;
    	if(add_ress.value=="")
    		{
    			alert("Please Enter Address.");
    			add_ress.focus();
    			return false;
    		}
		
    	var phn=document.lead_form.phn_no.value;
		var m1=document.lead_form.m_no1.value;
		var m2=document.lead_form.m_no2.value;
		if(phn=="" && m1=="" && m2==""){
			alert("Please provide phone no or one Mobile no");
			document.lead_form.m_no1.focus();
			return false;
		}
    	var phoneno = /^\d{10}$/;  
    	if(m1 != ""){
    	if(!phoneno.test(m1))
    	{
    		alert("You have entered an invalid phone number");
    		document.lead_form.m_no1.focus();
    		return false;
    	}
    	}
    	
    	if(m2 !=""){
    	if(!phoneno.test(m2))
    	{
    		alert("You have entered an invalid phone number");
    		document.lead_form.m_no2.focus();
    		return false;
    	}
    	}
		
		
		var email=document.lead_form.e_name;
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(email.value != ""){
    	if (!filter.test(email.value)) 
			{
    			alert('Please provide a valid email address');
   		 		email.focus();
    		 	return false;
			}
    	}
    	
    
    	
		return true;
  }
  </script>
  <script type="text/javascript">
  
  
  
  
  function fillInfo(cu_id){
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
	      document.getElementById("cu_info").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("post","Ajax_Serv?value="+cu_id,true);
	  xmlhttp.send();
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

               
                        <div class="span11" >   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Create Lead</h1>
                        </div>
                        <div class="block"> 
                                       
						  <form action="SalesStuff" method="post" name="lead_form" onsubmit="return validation();">
							<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="home.jsp?p=Leads" style="margin-left:10px;" >Discard</a>
							<div style="margin-left: 88%;"><input type="radio" name="stage" value="New" checked="checked" />New &nbsp;
							<input type="radio" name="stage" value="Dead" />Dead</div>
							<hr />             
							
							<table style="margin-left: 25px;" id="tbl1" cellpadding="8" cellspacing="8" align="center">
							 <tr>
                            					
                            					<td colspan="3">Subject<br /><input type="text" name="subject" style="width:310px;height: 30px;" placeholder="Describe the lead"/>
                            				</tr>
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="8" cellspacing="8">
											
											<tr>
                            						<td>Lead Date</td>
               										<td><input type="text" name="lead_date" id="bdate_id" /></td><td></td>
                            						</tr>
										<tr>
                            				
                           					<tr>
                            					<td>Customer</td>
                            					<td>
	                            					<select onchange="fillInfo(this.value);" name="customer" id="s2_1" style="width: 100%;">
	                            						<option disabled selected>--Select Customer--</option>
	                            						<%
	                            							Customer cus= new Customer();
	                            							GenericsMethod<Customer> cug_obj= new GenericsMethod<Customer>();
	                            							ArrayList<Customer> cu_list=cug_obj.viewDate(cus);
	                            							for(int i=0;i<cu_list.size();i++){
	                            						%>
	                            						<option value=<%=cu_list.get(i).getCust_id() %>><%=cu_list.get(i).getCust_name() %></option>
	                            						<%} %>
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>
                            				<tr>
                            					<td>Contact Name</td>
                            					<td>
	                         						<input type="text" name="con_name"/>
                            					</td>
                            					<td></td>
                            				</tr>
                            				<tr id="title">
                          			<td>Title</td>
                          			<td>
                          			
                          				<select name="title_field">
                          					<option selected value="0">--Select Title--</option>
                          					<%
                          				GenericsMethod<Title> g_obj= new GenericsMethod<Title>();
                          				Title t= new Title();
                          				ArrayList<Title> t_list=g_obj.viewDate(t);
                          				for(int i=0;i<t_list.size();i++)
                          				{
                          				
                          					%>
                          					<option value=<%=t_list.get(i).getTitle_id() %>><%=t_list.get(i).getTitle() %></option>
                          					<%} %>
                          				</select>
                          			</td>
						 		<td><input type="button" class="btn button11 various fsv-update" href="Title.jsp" value="+" data-fancybox-type="iframe"/></td>

                          		</tr>
                            				
                          						
                           						 <tr>
                            					<td>Categories</td>
                            					<td>
	                            					<select name="category">
	                            						<option disabled selected>--Select Category--</option>
	                            						<%
	                            							Categories cat= new Categories();
	                            						GenericsMethod<Categories> cg_obj= new GenericsMethod<Categories>();
	                            						ArrayList<Categories> cg_list=cg_obj.viewDate(cat);
	                            						for(int i=0;i<cg_list.size();i++)
	                            						{
	                            						%>
	                            							<option value=<%=cg_list.get(i).getCategory_id() %>><%=cg_list.get(i).getCategory() %></option>
	                            						<%} %>
	                            					</select>
                            					</td>
                            					<td><input type="button" class="btn button11 various fsv-update" href="Add Categories.jsp" value="+" data-fancybox-type="iframe"/></td>
                            				</tr>
                            				<tr>
                            					<td>Priority</td>
                            					<td>
	                            					<select name="priority">
	                            						<option disabled selected>--Select priority--</option>
	                            						<%
	                            							Priority pr= new Priority();
	                            						GenericsMethod<Priority> prg_obj = new GenericsMethod<Priority>();
	                            						ArrayList<Priority> pri_list=prg_obj.viewDate(pr);
	                            							for(int i=0;i<pri_list.size();i++)
	                            							{
	                            						%>
	                            							<option value=<%=pri_list.get(i).getPriority_id() %>><%=pri_list.get(i).getPriority() %></option>
	                            						<%} %>
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>
                            				
                           		  <tr>
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="cu_info" cellpadding="5" cellspacing="5" border="0" style="border-spacing: 100px 100px;">
										
									<tr>	
                            		<td>Address</td>
                            		<td><textarea rows="3" cols="20" name="address"></textarea></td><td></td>
                            	</tr>
								<tr>
                            					<td>Email</td>
                            					<td><input type="text" name="e_name"/></td><td></td>
                           						 </tr>
				
				
                            					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text" name="fax" /></td>
                           		 </tr>				
								<tr>
								<tr>
                            					<td>Phone No</td>
                            					<td><input type="text" name="phn_no"/></td><td></td>
                           					</tr>
                              <tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" name="m_no1"/></td><td></td>
                           					 </tr>
                           					  <tr>
                           					 
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" name="m_no2"/></td><td></td>
                           					 </tr>
                           
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3"><textarea style="width: 96% !important;" rows="5" onclick="this.select();" placeholder="Description" name="description"></textarea></td>
									
								</tr>
								<tr><td><input type="hidden" name="hid_val" value="creat_lead"> </td></tr>
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

