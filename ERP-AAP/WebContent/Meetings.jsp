<%@page import="bean.sales.Meeting"%>
<%@page import="iFaces.user_mgmt.DaoMethods"%>
<%@page import="dao.user_mgmt.DaoMethodsImp"%>
<%@page import="bean.user_mgmt.UserMaster"%>
<%@page import="bean.sales.Scheduled_Call"%>
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
		
	
		function createMeeting(){
			window.location.assign("home.jsp?p=Add Meeting");
		}
		
		function clickrow(id){
			window.document.location="home.jsp?p=Meeting Info&id="+id;
		}
	</script>
	
	
</head>
<%
int uid=(Integer)session.getAttribute("user_id");
Meeting mt=new Meeting();
mt.setCreated_by(uid);
SalesDao sd_obj=new SalesDaoImp();
ArrayList<Meeting> m_list=sd_obj.viewMeetings(mt);
DaoMethods d_obj=new DaoMethodsImp();

%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Meetings</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        		
             				<input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="createMeeting();" /><hr/>
                        	</div>
                        </div>
                            <table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Date</th>
                                        <th>Subject</th>
                                        <th>Attendees</th>
                                        <th>Location</th>   
                                                                  
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                   <%
                                    	for(int i=m_list.size()-1,k=1;i>=0;i--,k++)
                                    	{
                                    		//int cust_id=call_list.get(i).getContact();
                                    		//ArrayList<Customer> cu_lst=sd_obj.CustomerInfo(cust_id);
                                    		int user_id=m_list.get(i).getResponsible();
                                    		ArrayList<UserMaster> res_lst=d_obj.viewAllData(user_id);
                                    		
                                    		
                                    		
                                    %>  
                                    <tr onclick="clickrow(<%=m_list.get(i).getMeeting_id()%>);" style="cursor: pointer;" onmouseover="changeApp();" >
                                    	
                                    	<td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%=m_list.get(i).getDate() %></td>
                                    	<td style="border:none;"><%=m_list.get(i).getSubject() %></td>
                                    	<td style="border:none;"><%=m_list.get(i).getAttendees_names() %></td>
                                    	<td style="border:none;"><%=m_list.get(i).getLocation() %></td>
                                    	
                                   
                                    	
                                    	
                                    	
                                  </tr>
									<%
                                    	
											
										}
									%>
                                   
                                                               
                                </tbody>
                            </table>
                           
                        </div>
                    </div>                                

                </div> 