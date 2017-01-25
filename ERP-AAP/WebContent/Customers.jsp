<%@page import="iFaces.sales.SalesDao"%>
<%@page import="dao.sales.SalesDaoImp"%>
<%@page import="bean.sales.Customer"%>
<%@page import="javassist.runtime.Inner"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="generics.user_mgmt.GenericsMethod" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<head>
<style type="text/css">
#waypointsTable tr:hover {
    background-color:yellow;
}
</style>

	<script type="text/javascript">
	

		function createCustomer(){
			window.location.assign("home.jsp?p=Add Customer");
		}
		
		function clickrow(id){
			window.document.location="home.jsp?p=Customer_Info&id="+id;
		}
		
		
		
		
	</script>
</head>
<%
int uid=(Integer)session.getAttribute("user_id");
Customer cus= new Customer();
cus.setCreated_by(uid);
SalesDao cd_obj= new SalesDaoImp();
ArrayList<Customer> cu_list=cd_obj.viewCustomer(cus);

%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Customers</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        		
             				<input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="createCustomer();" /><hr/>
                        	</div>
                        </div>
                            <table class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>phone</th>
                                        <th>Email</th>   
                                                                  
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                   <%
                                    	for(int i=cu_list.size()-1,k=1;i>=0;i--,k++)
                                    	{
                                    		String link="home.jsp?p=Customer_Info&id="+cu_list.get(i).getCust_id();
                                    %>  
                                    <tr onclick="clickrow(<%=cu_list.get(i).getCust_id()%>);" style="cursor: pointer;" onmouseover="changeApp();">
                                    	 <td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%=cu_list.get(i).getCust_name() %></td>
                                    	<td style="border:none;"><%=cu_list.get(i).getAddress() %></td>
                                    	<td style="border:none;"><%=cu_list.get(i).getMobile_no1() %></td>
                                    	<td style="border:none;"><%=cu_list.get(i).getEmail_id() %></td>
                                    	
                                    	
                                    	
                                    	
                                    	
                                  </tr>
									<%
											
										}
									%>
                                   
                                                               
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div> 