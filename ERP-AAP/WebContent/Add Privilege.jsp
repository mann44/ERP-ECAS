<!DOCTYPE html>
<html lang="en">

<head>        
    
    
    <title>Create Privilege</title>
     <script type='text/javascript' src='js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery.mousewheel.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
     
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
    <style type="text/css">
    body{overflow: hidden;}
    </style>
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />  
    <!--[if lt IE 8]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->         
    <script type="text/javascript">
    	function validation(){
    		var c_name=document.privilege_form.privilege_name;
    		if(c_name.value==""){
    			alert("Enter the name of Privilege");
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
</head>
<body>
    <div class="wrapper"> 
            
        <div class="header">
          <h3 style="color:#ffffff">&nbsp;Create Privilege</h3>
        </div>


        <div class="content" style="background-color: #F9F9F9;">


            <div class="workplace">
            <br />
<form name="privilege_form" action="Location" method="post">
<table>
		<tr>
			<td>Privilege</td><td>&nbsp;&nbsp;</td>
			<td><input type="text" placeholder="name of Privilege" name="privilege_name"/></td>
		</tr>
		<tr>
			<td>Description</td><td>&nbsp;&nbsp;</td>
			<td><textarea name="pt_area" rows="3" cols="15" placeholder="Give Description"></textarea></td>
		</tr>
		
	</table>
	<br />
	<input type="hidden" name="hid_val" value="create_privilege" />
	<input type="submit"  value="Create" class="btn" style="margin-left: 74px;" onClick="return  FBClose();" />&nbsp;&nbsp;or&nbsp;&nbsp;
	<input type="button" value="discard" class="btn btn-danger" onclick="parent.$.fancybox.close();" />
	</form>
<br />
            </div>

        </div>   
    </div>
</body>

</html>
