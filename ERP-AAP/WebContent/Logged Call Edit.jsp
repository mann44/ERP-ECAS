  <%@page import="bean.sales.Logged_Call"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="iFaces.sales.SalesDao"%>
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
String edit_id=request.getParameter("id");
SalesDao sd_obj= new SalesDaoImp();
ArrayList<Logged_Call> l_lst=sd_obj.viewDetailLoggedcall(Integer.parseInt(edit_id));
%>
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
  function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		var redirectUrl="DeleteServ?d_id="+id;
		if(conf){
			window.location.assign("SaleDeleteServ?action=logged call&?dv_d=5&id="+id+"");
		}
			
	}
 
  function validation(){
		
	  var sum=document.calllogged_form.summary;
    	if(sum.value=="")
    		{
    			sum.focus();
    			return false;
    		}
    	
    	  var date=document.calllogged_form.date_name;
      	if(date.value=="")
      		{
      			date.focus();
      			return false;
      		}
      	
      	var cont=document.calllogged_form.contact.selectedIndex;
   	 if(cont==0){
   		 alert("Select the contact");
   		 document.calllogged_form.contact.focus();
   		 return false;
   	 }
    	
      	var res=document.calllogged_form.responsible.selectedIndex;
   	 if(res==0){
   		 alert("Select the Responsible Person");
   		 document.calllogged_form.responsible.focus();
   		 return false;
   	 }
    
		return (true);
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
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Edit Logged Call</h1>
                        </div>
                        <div class="block">                  
<form name="calllogged_form" action="SalesUpdateServ" method="post" onsubmit="return validation();">
<input type="submit" class="btn btn-success"  value="Save" />&nbsp;&nbsp;or<a href="home.jsp?p=Logged Calls" style="margin-left:10px;" >Discard</a>
<input type="button" class="btn btn-inverse" value="Delete" style="margin-left: 75%;" onclick="deleteConform(<%=edit_id%>)"/>

<hr />             

								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
								<tr><td colspan="3">
                            					Call Summary<br />
                            					<input type="text"  name="summary" style="width:288px; height: 30px;" value="<%=l_lst.get(0).getSummary()%>"/></td>
                            				</tr>
                            				<tr>
                            						
               										<td colspan="3">Date<br /><input type="text" name="date_name" id="bdate_id" style="width: 288px; height: 30px;" value="<%=l_lst.get(0).getDate()%>"/></td>
                            						</tr>
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
						
											 
                            				
                            					
                            							<tr>
														<td>Contact&nbsp;&nbsp;&nbsp;</td>
														<td><select name="contact">
																<option disabled></option>
																<%
																	Customer cus= new Customer();
																	GenericsMethod<Customer> g_obj = new GenericsMethod<Customer>();
																	ArrayList<Customer> cus_list=g_obj.viewDate(cus);
																	for(int i=0;i<cus_list.size();i++){
																%>
																	<option value=<%=cus_list.get(i).getCust_id() %><%if(Integer.toString(cus_list.get(i).getCust_id()).equals(Integer.toString(l_lst.get(0).getContact()))){ %> selected<%} %>><%=cus_list.get(i).getCust_name() %></option>
																<%} %>
															</select>
														</td>
														</tr>
                            					
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="10" cellspacing="10" style="border-spacing: 100px 100px;">
										
											<tr>
                            	<td>Responsible</td>
                            	<td>
                            	<select name="responsible">
                            		<option disabled selected></option>
                            		<%
                            			DaoMethodsImp d_obj= new DaoMethodsImp();
                            			ArrayList<UserMaster> u_list=d_obj.viewAllData(user_id);
                            		%>
                            		<option value=<%=u_list.get(0).getUser_id() %> selected ><%=u_list.get(0).getFull_name() %></option>
                            	</select>
                            	</td><td><input type="hidden" name="hid_val" value="edit_logged_call"/><input type="hidden" name="edit_id" value="<%=edit_id %>" /></td>
                            </tr>
				
										</table>
									</td>
								</tr>
								
								
							</table>
	</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

