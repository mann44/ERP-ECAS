  <%@page import="iFaces.user_mgmt.DaoMethods"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="bean.sales.Customer"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="bean.sales.Company"%>
<%@page import="java.util.ArrayList,generics.user_mgmt.GenericsMethod"%>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.sales.Title,bean.user_mgmt.Country,bean.user_mgmt.State,bean.user_mgmt.City" %>
   <head>
  
  <script>
 
  function validation(){
	 var c_name=document.customer_edit_form.cust_name;
	 if(c_name.value==""){
		 alert("Please Enter the Name");
		 c_name.focus();
		 return false;
	 }
		
    	
    	var add_ress=document.customer_edit_form.address;
    	if(add_ress.value=="")
    		{
    			alert("Please Enter Address.");
    			add_ress.focus();
    			return false;
    		}
		
    	var ctry=document.getElementById("country").selectedIndex;
    	if(ctry==0)
    		{
    			alert("Please Select Country.");
    			document.customer_edit_form.country.focus();
    			return false;
    		}
    	
    	var sta=document.getElementById("istate").selectedIndex;
    	if(sta==0)
    		{
    			alert("Please Select State.");
    			document.customer_edit_form.state.focus();
    			return false;
    		}
    	
    	var cty=document.getElementById("icity").selectedIndex;
    	if(cty==0)
    		{
    			alert("Please Select City.");
    			document.customer_edit_form.city.focus();
    			return false;
    		}
    	
    	var phn=document.customer_edit_form.phn_no.value;
		var m1=document.customer_edit_form.m_no1.value;
		var m2=document.customer_edit_form.m_no2.value;
		if(phn=="" && m1=="" && m2==""){
			alert("Please provide phone no or one Mobile no");
			document.customer_edit_form.m_no1.focus();
			return false;
		}
    	var phoneno = /^\d{10}$/;  
    	if(m1 != ""){
    	if(!phoneno.test(m1))
    	{
    		alert("You have entered an invalid phone number");
    		document.customer_edit_form.m_no1.focus();
    		return false;
    	}
    	}
    	
    	if(m2 !=""){
    	if(!phoneno.test(m2))
    	{
    		alert("You have entered an invalid phone number");
    		document.customer_edit_form.m_no2.focus();
    		return false;
    	}
    	}
    	
    	var email=document.customer_edit_form.e_name;
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(email.value != ""){
    	if (!filter.test(email.value)) 
			{
    			alert('Please provide a valid email address');
   		 		document.customer_edit_form.e_name.focus();
    		 	return false;
			}
		}
    	
    	var com=document.customer_edit_form.company_field.selectedIndex;
    	if(com==0){
    		alert("Please Select the Company.")
    		document.customer_edit_form.company_field.focus();
    		return false;
    	}
    	
    	
    	var ttl=document.customer_edit_form.title_field.selectedIndex;
    	
    	if(ttl==0){
    		alert("Please Select the Title.")
    		document.customer_edit_form.title_field.focus();
    		return false;
    	}
    	
    	
    	
    
		
		
    	

		return (true);
  }
  
  </script>
  <script type="text/javascript">
  var xmlHttp;
  function showState(id){
      if (typeof XMLHttpRequest != "undefined"){
          xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
      } 
      var url="State_Serv?count="+id;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }

  function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("state").innerHTML=xmlHttp.responseText;   
      }   
  }
  function showCity(s_id){
      if (typeof XMLHttpRequest != "undefined"){
          xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
      } 
      var url="City_Serv";
      url +="?count=" +s_id;
      xmlHttp.onreadystatechange = cityChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }
  function cityChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("city").innerHTML=xmlHttp.responseText;   
      }   
  }
  
  function showDescription(){
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
	      document.getElementById("description").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","Ajax_Serv?value=description",true);
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
<%
	String edit_id=request.getParameter("id");
	SalesDaoImp sd_obj= new SalesDaoImp();
	ArrayList<Customer> e_list=sd_obj.CustomerInfo(Integer.parseInt(edit_id));
	String iscompany=e_list.get(0).getIs_company();
	String url="home.jsp?p=Customer_Info&id="+edit_id;
%>
                <div class="row-fluid">

               
                        <div class="span12">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Edit Customer</h1>
                        </div>
                        <div class="block">     
						  <form action="SalesUpdateServ" method="post" name="customer_edit_form" onsubmit="return validation()">
						   <input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="<%=url %>" style="margin-left:10px;" >Discard</a><hr />             
							
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="5" cellspacing="5">
											
											 <tr>
                            					<td>Name</td>
                            					<td><input type="text"  name="cust_name" onfocus="this.select();" value="<%=e_list.get(0).getCust_name() %>"></td><td></td>
                            				</tr>
                            				
                            				<tr>
                            					<td>Email</td>
                            					<td><input type="text" name="e_name" onfocus="this.select();" value="<%=e_list.get(0).getEmail_id() %>"></td><td></td>
                           						 </tr>
                             
                            				 <tr>
                            				  <tr>
                            					<td>Web Site</td>
                            					<td><input type="text" name="website" onfocus="this.select();" value="<%=e_list.get(0).getWebsite() %>"></td><td></td>
                           						 </tr>
                             					 
                            				
                           					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text" name="fax" onfocus="this.select();" value="<%=e_list.get(0).getFax() %>"></td>
                           		 </tr>
                           		  <tr>
                            					<td>Phone No</td>
                            					<td><input type="text" name="phn_no" onfocus="this.select();" value="<%=e_list.get(0).getPhone_no() %>"></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" name="m_no1" onfocus="this.select();" value="<%=e_list.get(0).getMobile_no1() %>"></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" name="m_no2" onfocus="this.select();" value="<%=e_list.get(0).getMobile_no2() %>"></td><td></td>
                           					 </tr>
                           					 	 	
				 						
                           	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="8" cellspacing="8">
										<%
											if(iscompany.equals("0")){
										%>
									<tr>
                            					<td>Company</td>
                            					<td><select name="company_field" id="s2_1" style="width: 100%;">
                            							<option disabled selected>--select company--</option>
                            							<%
                            								Company co= new Company();
                            								GenericsMethod<Company> gc_obj= new GenericsMethod<Company>();
                            								ArrayList<Company> com_list=gc_obj.viewDate(co);
                            								for(int i=0;i<com_list.size();i++)
                            								{
                            							%>
                            								<option value=<%=com_list.get(i).getCompany_id() %> <%if(Integer.toString(com_list.get(i).getCompany_id()).equalsIgnoreCase(Integer.toString(e_list.get(0).getCompany_id()))){ %> selected<%} %>><%=com_list.get(i).getCompany_name() %></option>
                            							<%} %>
                            						</select>
                            					</td>
                            					<td><input type="button" class="btn button11 vvarious fsv-update" href="Add Company.jsp" value="+" data-fancybox-type="iframe"/></td>
                            				</tr>
                            			<%} %>
								<tr>
                            		<td>Address</td>
                            		<td><textarea rows="3" cols="20" name="address" onfocus="this.select();"><%=e_list.get(0).getAddress() %></textarea></td><td></td>
                            	</tr>
								<tr>
									<td>Country</td>
								<td>
									<select name="country" onchange="showState(this.value)" id="country">
										<option disabled selected>---Select Country---</option>
										<%
											Country cnt=new Country();
											GenericsMethod<Country> gm=new GenericsMethod<Country>();
											ArrayList<Country> lst=new ArrayList<Country>();
											lst=gm.viewDate(cnt);
											for(int i=0;i<lst.size();i++){
										%>
											<option value=<%=lst.get(i).getId() %><%if(Integer.toString(lst.get(i).getId()).equalsIgnoreCase(Integer.toString(e_list.get(0).getCountry()))){ %> selected<%} %>><%=lst.get(i).getC_name() %></option>
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
						<select name="state" id="istate">
						<option>---Select State---</option>
						<%
						DaoMethods d_obj= new DaoMethodsImp();
						ArrayList<State> s_list= d_obj.fetchState(e_list.get(0).getCountry());
						for(int i=0;i<s_list.size();i++){
						%>	
							<option value=<%=s_list.get(i).getState_id()%><%if(Integer.toString(s_list.get(i).getState_id()).equalsIgnoreCase(Integer.toString(e_list.get(0).getState()))){ %> selected<%} %>><%=s_list.get(i).getState_name() %></option>
						<%} %>
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_state.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city" id="icity">
							<option>---Select City---</option>
							<%
								ArrayList<City> city_list= d_obj.fetchCity(e_list.get(0).getState());
							for(int i=0;i<city_list.size();i++){
							%>
								<option value=<%=city_list.get(i).getCity_id() %><%if(Integer.toString(city_list.get(i).getCity_id()).equalsIgnoreCase(Integer.toString(e_list.get(0).getCity()))){ %> selected<%} %>><%=city_list.get(i).getCity_name() %></option>
							<%} %>
						</select></div></td>
						 <td><input type="button" class="btn button11 various fsv-update" href="add_city.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
								<% 
									if(iscompany.equals("0")){
								%>
									<tr>
                           		 	<td>Job Position</td>
                           		 	<td><input type="text" name="job_position" onfocus="this.select();" value="<%=e_list.get(0).getJob_position() %>"></td><td></td>
                           		 </tr>
                           		<% }
									else{%>
									                            			<tr><td></td><td><br /><br /><br /><br /></td><td></td></tr>
									
									<% }%>
                           					 
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" cellspacing="5" cellpadding="5" border="0" style="border-spacing: 100px 100px;">
									
									<%
										if(iscompany.equals("0")){
									%>	
								<tr>
                          			<td>Title</td>
                          			<td>
                          			
                          				<select name="title_field">
                          					<option disabled selected>--Select Title--</option>
                          					<%
                          				GenericsMethod<Title> g_obj= new GenericsMethod<Title>();
                          				Title t= new Title();
                          				ArrayList<Title> t_list=g_obj.viewDate(t);
                          				for(int i=0;i<t_list.size();i++)
                          				{
                          				
                          					%>
                          					<option value=<%=t_list.get(i).getTitle_id() %><%if(Integer.toString(t_list.get(i).getTitle_id()).equalsIgnoreCase(Integer.toString(e_list.get(0).getTitle()))){ %> selected<%} %>><%=t_list.get(i).getTitle() %></option>
                          					<%} %>
                          				</select>
                          			</td>
						 		<td><input type="button" class="btn button11 various fsv-update" href="Title.jsp" value="+" data-fancybox-type="iframe"/></td>

                          		</tr>
                          		<%}
								%>
                          		
                          			<tr>
                           	<td>Internal Note</td>
                           	<td><textarea rows="3" cols="20" name="description" onfocus="this.select();"><%=e_list.get(0).getDescription() %></textarea></td>
                           	</tr>
                              <tr>
                            	<td><input type="hidden" value="edit_customer" name="hid_val" /><input type="hidden" value="<%=edit_id %>" name="cust_id"/></td>
                            	<td>
                            	</td><td></td>
                            </tr>
										</table>
									</td>
								</tr>
								
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

