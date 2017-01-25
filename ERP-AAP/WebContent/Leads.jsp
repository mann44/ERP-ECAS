<%@page import="bean.sales.Lead"%>
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
	
	
	function clickrow(id){
		window.document.location="home.jsp?p=Lead Info&id="+id;
	}
		function createLead(){
			window.location.assign("home.jsp?p=Create Lead");
		}
		
		
	</script>
	
</head>
<%
int uid=(Integer)session.getAttribute("user_id");
Lead lead= new Lead();
lead.setCreated_by(uid);
SalesDao sd_obj=new SalesDaoImp();
ArrayList<Lead> lead_list=sd_obj.viewLeads(lead);
%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Leads</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        		
             				<input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="createLead();" /><hr/>
                        	</div>
                        </div>
                            <table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Creation Date</th>
                                        <th>Subject</th>
                                        <th>phone</th>
                                        <th>Stage</th>   
                                                                  
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                   <%
                                    	for(int i=0,k=1;i<lead_list.size();i++,k++)
                                    	{
                                    		
                                    %>  
                                    <tr onclick="clickrow(<%=lead_list.get(i).getLead_id()%>);" style="cursor: pointer;" onmouseover="changeApp();">
                                    	 <td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%= lead_list.get(i).getLead_dt()%></td>
                                    	<td style="border:none;"><%=lead_list.get(i).getSubject() %></td>
                                    	<td style="border:none;"><%=lead_list.get(i).getMobile_no1() %></td>
                                    	<td style="border:none;"><%=lead_list.get(i).getStage() %></td>
                                    	
                                    	
                                    	
                                    	
                                    	
                                  </tr>
									<%
											
										}
									%>
                                   
                                                               
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div> 