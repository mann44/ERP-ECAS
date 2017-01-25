<%@page import="iFaces.purchase.PurchaseDao"%>
<%@page import="dao.purchase.PurchaseDaoImp"%>
<%@page import="bean.purchase.Supplier"%>
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
	

		function createQuotation(){
			window.location.assign("home.jsp?p=DemoPage");
		}
		
		function clickrow(id){
			window.document.location="home.jsp?p=Supplier Info&id="+id;
		}
		
		
		
		
	</script>
</head>
<%
int uid=(Integer)session.getAttribute("user_id");
Supplier sp=new Supplier();
sp.setCreated_by(uid);
PurchaseDao pd=new PurchaseDaoImp();
ArrayList<Supplier> s_list=pd.viewSupplier(sp);

%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Quotations</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        		
             				<input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="createQuotation();" /><hr/>
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
                                    	for(int i=s_list.size()-1,k=1;i>=0;i--,k++)
                                    	{
                                    %>  
                                    <tr onclick="clickrow(<%=s_list.get(i).getSupplier_id()%>);" style="cursor: pointer;" onmouseover="changeApp();">
                                    	 <td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%=s_list.get(i).getSupplier_name() %></td>
                                    	<td style="border:none;"><%=s_list.get(i).getAddress() %></td>
                                    	<td style="border:none;"><%=s_list.get(i).getMobile_no1() %></td>
                                    	<td style="border:none;"><%=s_list.get(i).getEmail_id() %></td>
                                    	
                                    	
                                    	
                                    	
                                    	
                                  </tr>
									<%
											
										}
									%>
                                   
                                                               
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div> 