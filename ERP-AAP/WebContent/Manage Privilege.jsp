<%@page import="java.util.ArrayList"%>
<%@ page import="bean.user_mgmt.Privilege,generics.user_mgmt.GenericsMethod" %>
<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
  function validation(){
		var p_id=document.privilege_bind.privilege_id.selectedIndex;
		if(p_id==0){
			alert("Select the Privilege");
			document.privilege_bind.privilege_id.focus();
			return false;
		}
		
		var com_name=document.privilege_bind.c_name;
		if(com_name.value=="")
			{
				alert("Please Enter the Component.");
				com_name.focus();
				return false;
			}
		return true;
	}
  </script>
</head>
  <div class="row-fluid">

                        <div class="span5">
                         <div class="head clearfix">
                        		<h1>Bind Components to Privilege</h1>
                       		 </div>
                        <div class="block">                       
						  <form action="Location" method="post" name="privilege_bind" onsubmit="return validation()">
						 	<input type="submit" class="btn btn-success"  value="Bind" />&nbsp;&nbsp;or<a href="home.jsp" style="margin-left:10px;" >Discard</a><hr />             
						  
							<br />
							<table style="margin-left: 25px;" cellpadding="5" cellspacing="5">
								<tr>
                            		<td>Privilege</td>
                            		<td>
                            						<select name="privilege_id">
                            							<option>---Select Privilege---</option>
                            							<%
                            								Privilege pr= new Privilege();
                            								GenericsMethod<Privilege> gen_obj=new GenericsMethod<Privilege>();
                            								ArrayList<Privilege> lst= gen_obj.viewDate(pr);
                            								for(int i=0;i<lst.size();i++){
                            							%>
                            							<option value=<%=lst.get(i).getPrivilege_id() %>><%=lst.get(i).getPrivilege_name() %></option>
                            							<%} %>
                            						</select>
                            		</td>
                            		 <td><input type="button" class="btn various fsv-update button11"   href="Add Privilege.jsp" value="+" data-fancybox-type="iframe"/></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Component</td>
                            <td>
                            	<input type="text" name="c_name" />
                            </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid_val" value="component_bind" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   
