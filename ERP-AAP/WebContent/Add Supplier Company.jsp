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
  function showState(id){
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
	      document.getElementById("state").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("GET","State_Serv?count="+id,true);
	  xmlhttp.send();
  }
  
  function showCity(s_id){
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
	      document.getElementById("city").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("GET","City_Serv?count="+s_id,true);
	  xmlhttp.send();
  }
  
  var xmlHttp;
  
  </script>
      <script type="text/javascript">
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

               
                        <div class="span9">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Create Company</h1>
                        </div>
                        <div class="block">                  
<form name="company_form" action="PurchaseStuff" method="post" onsubmit="return validation();">
	<input type="submit" class="btn btn-success"  value="Save"/>&nbsp;&nbsp;or<a href="home.jsp?p=Create Supplier" style="margin-left:10px;" >Discard</a>
						 	<hr />   
							<table style="margin-left: 25px;" id="tbl1" cellpadding="5" cellspacing="5">
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="5" cellspacing="5">
											
											 <tr>
                            					<td>Name</td>
                            					<td><input type="text"  name="company_name"/></td><td></td>
                            				</tr>
                            				
                            				<tr>
                            					<td>Email</td>
                            					<td><input type="text" name="e_name"/></td><td></td>
                           						 </tr>
                             
                            				 <tr>
                            				  <tr>
                            					<td>Web Site</td>
                            					<td><input type="text" name="website"/></td><td></td>
                           						 </tr>
                             					 
                            				 <tr>
                            					<td>Phone No</td>
                            					<td><input type="text" name="phn_no"/></td><td></td>
                           					 </tr>
                           					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text" name="fax" /></td>
                           		 </tr>
                           					 <tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" name="m_no1"/></td><td></td>
                           					 </tr>
                           			
                           					 	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="5" cellspacing="5" border="0" style="border-spacing: 100px 100px;">

								<tr>
                            		<td>Address</td>
                            		<td><textarea rows="3" cols="20" name="address"></textarea></td><td></td>
                            	</tr>
								<tr>
									<td>Country</td>
								<td>
									<select name="country" onchange="showState(this.value)">
										<option value="-1">---Select Country---</option>
										<%
											Country cnt=new Country();
											GenericsMethod<Country> gm=new GenericsMethod<Country>();
											ArrayList<Country> lst=new ArrayList<Country>();
											lst=gm.viewDate(cnt);
											for(int i=0;i<lst.size();i++){
										%>
											<option value=<%=lst.get(i).getId() %>><%=lst.get(i).getC_name() %></option>
										<%
											}
										%>
									</select>
								</td>
						 		<td><input type="button" class="btn button11 various fsv-update" href="add_country.jsp" value="+" data-fancybox-type="iframe"/></td>
								</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state">
						<option>---Select State---</option>
							
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_state.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city">
							<option>---Select City---</option>
							
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_city.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
								
                           			
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" cellspacing="5" cellpadding="5" border="0" style="border-spacing: 100px 100px;">
										
										
                           			
                               
                            <tr >
                            		
                            	</tr>
                            		 
				 						<tr>
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" name="m_no2"/></td><td></td>
                           					 </tr>
                           					 
                          			<tr>
                           	<td>Description</td>
                           	<td><textarea rows="3" cols="20" name="description"></textarea></td>
                           	</tr>
                            <tr>
                            	<td></td>
                            	<td>
                            		<input type="hidden" name="hid_val" value="add company" />
									
                            	</td>
                            </tr>
                             
										</table>
									</td>
								</tr>
								
							</table>
	
	</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

