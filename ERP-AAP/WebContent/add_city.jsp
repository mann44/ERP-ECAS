<!DOCTYPE html>
<html lang="en">
<%@ page import="bean.user_mgmt.State,bean.user_mgmt.City,bean.user_mgmt.Country,generics.user_mgmt.GenericsMethod" %>
<%@ page import="java.util.ArrayList" %>
<head>        
     <script type='text/javascript' src='js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery.mousewheel.min.js'></script>
    
<script type="text/javascript"
	src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>


<link rel="stylesheet"
	href="fancybox/source/jquery.fancybox.css?v=2.1.4" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="fancybox/source/jquery.fancybox.pack.js?v=2.1.4"></script>

<link rel="stylesheet"
	href="fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.5"></script>

<link rel="stylesheet"
	href="fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    
    <script type='text/javascript' src='js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/bootstrap.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/charts/excanvas.min.js'></script>
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.js'></script>    
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.stack.js'></script>    
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.pie.js'></script>
    <script type='text/javascript' src='js/plugins/charts/jquery.flot.resize.js'></script>
    
    <script type='text/javascript' src='js/plugins/sparklines/jquery.sparkline.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/fullcalendar/fullcalendar.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/select2/select2.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/uniform/uniform.js'></script>
    
    <script type='text/javascript' src='js/plugins/maskedinput/jquery.maskedinput-1.3.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/validation/languages/jquery.validationEngine-en.js' charset='utf-8'></script>
    <script type='text/javascript' src='js/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>
    
    <script type='text/javascript' src='js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    <script type='text/javascript' src='js/plugins/animatedprogressbar/animated_progressbar.js'></script>
    
    <script type='text/javascript' src='js/plugins/qtip/jquery.qtip-1.0.0-rc3.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cleditor/jquery.cleditor.js'></script>
    
    <script type='text/javascript' src='js/plugins/dataTables/jquery.dataTables.min.js'></script>    
    
    <script type='text/javascript' src='js/plugins/fancybox/jquery.fancybox.pack.js'></script>
    
    <script type='text/javascript' src='js/plugins/pnotify/jquery.pnotify.min.js'></script>
    <script type='text/javascript' src='js/plugins/ibutton/jquery.ibutton.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/scrollup/jquery.scrollUp.min.js'></script>
    
    <script type='text/javascript' src='js/cookies.js'></script>
    <script type='text/javascript' src='js/actions.js'></script>
    <script type='text/javascript' src='js/charts.js'></script>
    <script type='text/javascript' src='js/plugins.js'></script>
    <script type='text/javascript' src='js/settings.js'></script>
    
    
    <title>Add City</title>
    
    <script type="text/javascript">
       
    </script>

    <script type="text/javascript">
    
   
    	
    function validation(){
    	var c_index=document.city_form.c_country.selectedIndex;
    	if(c_index==0){
    		alert("Select the Country.");
    		document.city_form.c_country.focus();
    		return false;
    	}
    	
    	var s_index=document.city_form.c_state.selectedIndex;
    	if(s_index==0){
    		alert("Select the State.");
    		document.city_form.c_state.focus();
    		return false;
    	}
    	
    	var c_name=document.city_form.city_name;
    	if(c_name.value==""){
    		alert("Enter the name of city");
    		c_name.focus();
    		return false;
    	}
    	
    	return true;
    }
    
    function FBClose(){
		var flg=validation();
		if(flg){
			parent.$.fancybox.close();
			return true;
		}
		else 
			return false;
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
            document.getElementById("c_state").innerHTML=xmlHttp.responseText;   
        }   
    }
    </script>
    
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />  
    <!--[if lt IE 8]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->            
</head>
<body>
    <div class="wrapper"> 
            
        <div class="header">
          <h3 style="color:#ffffff">&nbsp;Add City</h3>
        </div>


        <div class="content" style="background-color: #F9F9F9;">


            <div class="workplace">
            <br />
<form name="city_form" action="Location" method="post" id="cityForm">
<table>
		<tr>
			<td>County</td>
			<td><select name="c_country" onchange="showState(this.value)">
					<option value="-1">Select Country</option>
							<%
								ArrayList<Country> co_list=new ArrayList<Country>();
								GenericsMethod<Country> gco_obj=new GenericsMethod<Country>();
								Country co_obj=new Country();
								co_list=gco_obj.viewDate(co_obj);
								for(int i=0;i<co_list.size();i++){
							%>
								<option value=<%=co_list.get(i).getId() %>><%=co_list.get(i).getC_name() %></option>
							<%} %>
				</select>
			</td>
		</tr>
		<tr>
			<td>State</td>
			<td><select name="c_state" id="c_state">
							<option value="-1">Select State</option>
							
				</select>
			</td>
		</tr>
		<tr>
			<td>City</td>
			<td><input type="text" placeholder="name of city" name="city_name" /></td>
		</tr>
		
	</table>
	<br />
	<input type="hidden" name="hid_val" value="city" />
	<input type="submit"  value="Add" class="btn" style="margin-left: 47px;" onclick="return FBClose()" />&nbsp;&nbsp;or&nbsp;&nbsp;
	<input type="button" value="discard" class="btn btn-danger" onclick="parent.$.fancybox.close();" />
	</form>

            </div>

        </div>   
    </div>
</body>

</html>
