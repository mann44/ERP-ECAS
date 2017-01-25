<%@page import="javassist.runtime.Inner"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.UserMaster,bean.user_mgmt.Role" %>
<%@ page import="iFaces.user_mgmt.DaoMethods,dao.user_mgmt.DaoMethodsImp" %>
<%@ page import="generics.user_mgmt.GenericsMethod" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<head>
	<script type="text/javascript">
		
	
		
		function clickrow(id){
			window.document.location="home.jsp?p=User Info&id="+id;
		}
		
		
		
		
		function createUser(){
			window.location.assign("home.jsp?p=Add User");
		}
	</script>
</head>
<%


UserMaster us=new UserMaster();
int uid=(Integer)session.getAttribute("user_id");
us.setUser_id(uid);
DaoMethodsImp d_obj= new DaoMethodsImp();
ArrayList<UserMaster> list=d_obj.viewAllData(us);
%>
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Users</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>
                        	<div>
                        <input type="button"  class="btn btn-success" value="Create" style="margin-left: 1%;margin-top: 1%;" onclick="createUser();" /><hr/>
                        		
                        	</div>
                			<!-- <input type="button" value="filter" class="btn btn-warning various fsv-update button11" href="filter.jsp" style="width:100px;margin-left: 10px;margin-top: 10px;"" data-fancybox-type="iframe" />-->
                        </div>
                            <table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>E-mail</th>
                                        <th>phone</th>
                                        <th></th>   
                                                                  
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                   <%
                                    	for(int i=list.size()-1,k=1;i>=0;i--,k++)
                                    	{
                                    		
                                    %>  
                                    <tr onclick="clickrow(<%=list.get(i).getUser_id()%>);" style="cursor: pointer;" onmouseover="changeApp();">
                                    	 <td style="border:none;"><%=k %></td>
                                    	<td style="border:none;"><%=list.get(i).getFull_name() %></td>
                                    	<td style="border:none;"><%=list.get(i).getEmail() %></td>
                                    	<td style="border:none;"><%=list.get(i).getContact_no() %></td>
                                    	<td style="border:none;">
                                    	<%
                                    		int r_id=list.get(i).getRole_type();
                                    		String role=d_obj.getRole(r_id);
                                    	%><%=role %>
                                    	</td>
                                    	
                                    	
                                    	
                                    	
                                    	
                                  </tr>
									<%
											
										}
									%>
                                   
                                                               
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div> 