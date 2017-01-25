<%@page import="iFaces.user_mgmt.DaoMethods"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="bean.user_mgmt.UserMaster"%>
<%@page import="bean.sales.Logged_Call"%>
<%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="bean.sales.Customer"%>
<%@page import="javassist.runtime.Inner"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="generics.user_mgmt.GenericsMethod" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<head>
	<script type="text/javascript">
	
		function LoggedCall(){
			window.location.assign("home.jsp?p=Create Logged Call");
		}
		
		function clickrow(id){
			window.document.location="home.jsp?p=Logged Call Edit&id="+id;
		}
	</script>
</head>
<%
int uid=(Integer)session.getAttribute("user_id");
Logged_Call lc=new Logged_Call();
lc.setCreated_by(uid);
SalesDao sd_obj=new SalesDaoImp();
ArrayList<Logged_Call> call_list=sd_obj.viewLoggedCall(lc);
DaoMethods d_obj=new DaoMethodsImp();
%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Logged Calls</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        		
             				<input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="LoggedCall();" /><hr/>
                        	</div>
                        </div>
                            <table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Date</th>
                                        <th>Summary</th>
                                        <th>Contact</th>
                                        <th>Responsible</th>   
                                                                  
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                   <%
                                    	for(int i=0,k=1;i<call_list.size();i++,k++)
                                    	{
                                    		int cust_id=call_list.get(i).getContact();
                                    		ArrayList<Customer> cu_lst=sd_obj.CustomerInfo(cust_id);
                                    		int user_id=call_list.get(i).getResponsible();
                                    		ArrayList<UserMaster> res_lst=d_obj.viewAllData(user_id);
                                    %>  
                                    <tr onclick="clickrow(<%=call_list.get(i).getLogged_id()%>);" style="cursor: pointer;" onmouseover="changeApp();" >
                                    	 <td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%= call_list.get(i).getDate()%></td>
                                    	<td style="border:none;"><%=call_list.get(i).getSummary() %></td>
                                    	<td style="border:none;"><%=cu_lst.get(0).getCust_name() %></td>
                                    	<td style="border:none;"><%=res_lst.get(0).getFull_name() %></td>
                                    	
                                    	
                                    	
                                    	
                                    	
                                  </tr>
									<%
											
										}
									%>
                                   
                                                               
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div> 