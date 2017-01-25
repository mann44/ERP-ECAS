<%@page import="bean.user_mgmt.UserMaster"%>
<%@page import="bean.sales.Scheduled_Call"%>
<%@page import="bean.sales.Company"%>
<%@page import="iFaces.user_mgmt.DaoMethods"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="bean.sales.Customer"%>
<%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.Privilege,generics.user_mgmt.GenericsMethod" %>
<%
int user_id=(Integer) session.getAttribute("user_id");

%>
<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
  
  $(function() {
	    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
	  });
  function ScheduledCall(){
	  window.location.assign("home.jsp?p=Scheduled Calls New");
  }
  
  function editSchedule(edit_id) {
	window.location.assign("home.jsp?p=Scheduled Call Edit&id="+edit_id+"");
}
  
  function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		var redirectUrl="DeleteServ?d_id="+id;
		if(conf){
			window.location.assign("SaleDeleteServ?action=schedule call&?dv_d=5&id="+id+"");
		}
			
	}
  function otherValidation(){
	  var summ=document.schedule_other_form.summary;
	  if(summ.value==""){
		  summ.focus();
		  return false;
	  }
	  var assign=document.schedule_other_form.assignto.selectedIndex;
	  if(assign==0){
		  document.schedule_other_form.assignto.focus();
		  return false;
	  }
	  var acn=document.getElementById("action").selectedIndex;
	  if(acn==1){
		  var dt=document.schedule_other_form.date_name;
		  if(dt.value==""){
			  alert("Select the Date");
			  dt.focus();
			  return false;
		  }
	  }
	  return true;
	  
  }
  
  $(document).ready(function(){
		
		$("#action").change(function() {
		
		if ($("#action").val() == 2)
		{
			$("#date").hide();
			$("#fbutton").val('Logged Call');
		}
		else
		{      
			$("#date").show();
			$("#fbutton").val('Schedule Call');
		}
		
		});
		
		
		
	});
 
  </script>
</head>
<%
	String info_id=request.getParameter("id");
	SalesDao sd_obj= new SalesDaoImp();
	ArrayList<Scheduled_Call> sc_list=sd_obj.viewScheduleDetail(Integer.parseInt(info_id));
%>
  <div class="row-fluid">

                        <div class="span8">
                         <div class="head clearfix">
                        		<h1>Scheduled Call Information</h1>
                       		 </div>
                        <div class="block">                       
							<input type="submit" class="btn btn-success"  value="Edit" onclick="editSchedule(<%=info_id %>);" /><input type="submit" class="btn btn-success"  value="Create" style="margin-left:15px;" onclick="ScheduledCall();" />
							<input type="button" value="Delete" class="btn btn-inverse" style="margin-left: 71%;" onclick="deleteConform(<%=info_id%>)"/>
							<br /><a href="#fModal" role="button" class="btn" data-toggle="modal" style="margin-left: 60%;">Schedule Other Call</a>
							<a href="#" role="button" class="btn" data-toggle="modal">Schedule a Meeting</a>
							
							<hr />    
                                           
                         
						 <span style="margin-left: 85%;font-size: 16px;"><%=sc_list.get(0).getStatus() %></span><br />
				<Span style="font-size: 25px;"><%=sc_list.get(0).getSummary() %></Span><br /><br />
								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Date</td><td style="border-left: 1px solid #cdcdcd;"><%=sc_list.get(0).getDate() %></td><td></td>
                            						</tr>
                            				
                            					
                            							<tr>
														<td>Contact&nbsp;&nbsp;&nbsp;</td>
														<td style="border-left: 1px solid #cdcdcd;">
														<%
														int cust_id=sc_list.get(0).getContact();
			                                    		ArrayList<Customer> cu_lst=sd_obj.CustomerInfo(cust_id);
														%><%=cu_lst.get(0).getCust_name() %>
														</td>
														</tr>
														  
                             <tr>
                            						
					<td>Category</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int cat_id=sc_list.get(0).getCategory();
						String category=sd_obj.getPhoneCategoty(cat_id);
					%><%=category %>
					</td>
				</tr>
						<tr>
                            					<td>Priority</td>
                            					<td style="border-left: 1px solid #cdcdcd;">
                            					<%
                            						int pr_id=sc_list.get(0).getPriority();
                            						String priority=sd_obj.getPriority(pr_id);
                            					%><%=priority %>
                            					</td>
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="phn" cellpadding="10" cellspacing="10" style="border-spacing: 100px 100px;">
												 <tr>
                            	<td>Responsible</td>
                            	<td style="border-left: 1px solid #cdcdcd;">
                            	
                            		<%
                            			int res_id=sc_list.get(0).getResponsible();
                            			DaoMethodsImp d_obj= new DaoMethodsImp();
                            			ArrayList<UserMaster> u_list=d_obj.viewAllData(res_id);
                            		%><%=u_list.get(0).getFull_name() %>
                            		
                            	</td><td></td>
                            </tr>
											
												<tr>
                            					<td>Phone No</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=sc_list.get(0).getPhone_no() %></td>
                            				</tr>
                            				<tr>
                            					<td>Mobile No(1)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=sc_list.get(0).getMobile_no1() %></td>
                            				</tr>
											
                            				<tr>
                            					<td>Mobile No(2)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=sc_list.get(0).getMobile_no2() %></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
								
							</table>
		     				Description
									<%=sc_list.get(0).getDescription() %><br /><br ><br /><br />
								
								
		            </div>
					</div>
               </div>   

							        <!-- Bootrstrap modal form -->
        <div id="fModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Schedule Other Call</h3>
            </div>        
            <div class="row-fluid">
                <div class="block-fluid">
                  <form name="schedule_other_form" action="ButtonServ" method="post" onsubmit="return otherValidation();">            
								<br /><br />
								
								<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10" style="text-align:center;" align="center">
								<tr>
                            	<td>Action</td>
                            	<td>
                            	<select name="responsible" id="action">
                            		<option disabled></option>
                            		<option value="1" selected>Schedule a call</option>
                            		<option value="2">Log a call</option>
                            	</select>
                            	</td><td><input type="hidden" name="hid_val" value="create_logged_call"/></td>
                            </tr>
								<tr><td colspan="2">
                            					
                            					<input type="text"  name="summary" style="width:300px; height: 30px;" placeholder="Call Summary" value="<%=sc_list.get(0).getSummary() %>"/></td>
                            				</tr>
                            				<tr id="date">
                            						
               										<td>Planned Date</td><td><input type="text" name="date_name" id="bdate_id" placeholder="Select Date"/></td>
                            						</tr>
                            							<tr>
														<td>Assigned To</td>
														<td><select name="assignto">
																<option disabled selected></option>
																<%
                            			ArrayList<UserMaster> ua_list=d_obj.viewAllData(user_id);
                            		%>
                            		<option value=<%=ua_list.get(0).getUser_id() %>><%=ua_list.get(0).getFull_name() %></option>
															</select>
														</td>
														<td><input type="hidden" value="<%=info_id %>" name="sc_id"/></td><td></td>
														</tr>
														
								     						
                      
                      <tr><td colspan="2"><hr /><input type="submit" class="btn btn-success"  value="Schedule Call" id="fbutton" name="dButton" />&nbsp;&nbsp;or<a href="#" style="margin-left:10px;" data-dismiss="modal" aria-hidden="true">Discard</a>
                      </td></tr>
							</table>
							
	</form> 
	  </div>                
           
            </div>                    
           
        </div>  