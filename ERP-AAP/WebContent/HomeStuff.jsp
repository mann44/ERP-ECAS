<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
			response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
			response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
			response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
			response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
			String user_name=(String)session.getAttribute("user_name");
			if(user_name != null)
			{
%>
<!DOCTYPE html>
<html lang="en">
<head>        
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <![endif]-->
    
    <title>Erp</title>

    <link rel="icon" type="image/ico" href="favicon.ico"/>
    
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />  
    <!--[if lt IE 8]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->            
    <link rel='stylesheet' type='text/css' href='css/fullcalendar.print.css' media='print' />
    <link rel="stylesheet" type="text/css" href="css/aboutus.css"/>
    
    
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
<script>
	$(document).ready(function() {

		$('.various').fancybox({
			maxWidth : 800,
			maxHeight : 800,

			width : '26%',         
			height : '47%',
			autoSize : false,
			closeClick : false,
			openEffect : 'elastic',
			openSpeed : 500,

			closeEffect : 'elastic',
			closeSpeed : 500,

			fitToView : true,
			preload : true,
			 afterClose : function (){
	               parent.location.reload(true);
	            }
		});

	});
	
	function changeApp(){
		 $('tr').hover(function() {
	            $(this).css('background-color', '#FFFF99');
	            $(this).contents('td').css({'border': '1px solid #cdcdcd', 'border-left': 'none', 'border-right': 'none'});
	            $(this).contents('td:first').css('border-left', '1px solid #cdcdcd');
	            $(this).contents('td:last').css('border-right', '1px solid #cdcdcd');
	        },
	        function() {
	            $(this).css('background-color', '#FFFFFF');
	            $(this).contents('td').css('border', 'none');
	        });
	}
</script>
<script type="text/javascript">
   $('#datetimepicker').datetimepicker();
   </script>
<script>
	$(document).ready(function() {

		$('.vvarious').fancybox({
			maxWidth : 800,
			maxHeight : 800,

			width : '100%',         
			height : '88%',
			autoSize : false,
			closeClick : false,
			openEffect : 'elastic',
			openSpeed : 500,

			closeEffect : 'elastic',
			closeSpeed : 500,

			fitToView : true,
			preload : true,
			 afterClose : function (){
	               parent.location.reload(true);
	            }
		});

	});
</script>
    
</head>
<body>
    <div class="wrapper"> 
            
        <div class="header">
            <a class="logo" href="home.jsp?p=aboutUs"><img src="img/energy-corporation-logo.png" alt="Energy Corporation" title="Energy Corporation"/></a>
            <ul class="header_menu">
                <li class="list_icon"><a href="#">&nbsp;</a></li>
                <li class="settings_icon">
                    <a href="#" class="link_themeSettings">&nbsp;</a>
                    
                    <div id="themeSettings" class="popup">
                        <div class="head clearfix">
                            <div class="arrow"></div>
                            <span class="isw-settings"></span>
                            <span class="name">Theme settings</span>
                        </div>
                        <div class="body settings">
                            <div class="row-fluid">
                                <div class="span3"><strong>Style:</strong></div>
                                <div class="span9">
                                    <a class="styleExample tip active" title="Default style" data-style="">&nbsp;</a>                                    
                                    <a class="styleExample silver tip" title="Silver style" data-style="silver">&nbsp;</a>
                                    <a class="styleExample dark tip" title="Dark style" data-style="dark">&nbsp;</a>
                                    <a class="styleExample marble tip" title="Marble style" data-style="marble">&nbsp;</a>
                                    <a class="styleExample red tip" title="Red style" data-style="red">&nbsp;</a>                                    
                                    <a class="styleExample green tip" title="Green style" data-style="green">&nbsp;</a>
                                    <a class="styleExample lime tip" title="Lime style" data-style="lime">&nbsp;</a>
                                    <a class="styleExample purple tip" title="Purple style" data-style="purple">&nbsp;</a>                                    
                                </div>
                            </div>                            
                            <div class="row-fluid">
                                <div class="span3"><strong>Background:</strong></div>
                                <div class="span9">
                                    <a class="bgExample tip active" title="Default" data-style="">&nbsp;</a>
                                    <a class="bgExample bgCube tip" title="Cubes" data-style="cube">&nbsp;</a>
                                    <a class="bgExample bghLine tip" title="Horizontal line" data-style="hline">&nbsp;</a>
                                    <a class="bgExample bgvLine tip" title="Vertical line" data-style="vline">&nbsp;</a>
                                    <a class="bgExample bgDots tip" title="Dots" data-style="dots">&nbsp;</a>
                                    <a class="bgExample bgCrosshatch tip" title="Crosshatch" data-style="crosshatch">&nbsp;</a>
                                    <a class="bgExample bgbCrosshatch tip" title="Big crosshatch" data-style="bcrosshatch">&nbsp;</a>
                                    <a class="bgExample bgGrid tip" title="Grid" data-style="grid">&nbsp;</a>
                                </div>
                            </div>                            
                            <div class="row-fluid">
                                <div class="span3"><strong>Fixed layout:</strong></div>
                                <div class="span9">
                                    <input type="checkbox" name="settings_fixed" value="1"/>
                                </div> 
                            </div>
                            <div class="row-fluid">
                                <div class="span3"><strong>Hide menu:</strong></div>
                                <div class="span9">
                                    <input type="checkbox" name="settings_menu" value="1"/>
                                </div>                                           
                            </div>                            
                        </div>
                        <div class="footer">                            
                            <button class="btn link_themeSettings" type="button">Close</button>
                        </div>
                    </div>                    
                    
                </li>
            </ul>    
        </div>

        <div class="menu">                

            <div class="breadLine">            
                <div class="arrow"></div>
                <div class="adminControl active">
                    Hello, <%=user_name %>
                </div>
            </div>

            <div class="admin">
                <div class="image">
                    <img src="img/users/aqvatarius.jpg" class="img-polaroid"/>                
                </div>
                <ul class="control">                
                   
                    <li><span class="icon-cog"></span> <a href="home.jsp?p=Edit Profile">Edit Profile</a></li>
                    <li><span class="icon-share-alt"></span> <a href="logout.jsp">Logout</a></li>
                </ul>
                
            </div>

            <ul class="navigation">            
               
                <li class="openable">
                    <a href="#">
                        <span class="isw-user_mgmt"></span><span class="text">User Management</span>
                    </a>
                    <ul>
                        <li>
                            <a href="home.jsp?p=Add User">
                                <span class="icon-th"></span><span class="text">Add User</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="home.jsp?p=View User">
                                <span class="icon-th-large"></span><span class="text">View User</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="home.jsp?p=Assign Rights">
                                <span class="icon-chevron-right"></span><span class="text">Assign Rights</span>
                            </a>                  
                        </li>
                        <li>
                            <a href="home.jsp?p=Manage Privilege">
                                <span class="icon-th"></span><span class="text">Manage Privilege</span>
                            </a>                  
                        </li>                                   
                    </ul>                
                </li>
                
                <li class="openable">
                    <a href="#">
                        <span class="isw-sales"></span><span class="text">Sales</span>
                    </a>
                    <ul>
                        <li>
                            <a href="home.jsp?p=Customers">
                                <span class="icon-th"></span><span class="text">Customers</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="home.jsp?p=Leads">
                                <span class="icon-th-large"></span><span class="text">Leads</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="#">
                                <span class="icon-chevron-right"></span><span class="text">Quotations</span>
                            </a>                  
                        </li> 
                        <li>
                            <a href="icons.html">
                                <span class="icon-fire"></span><span class="text">Sales Orders</span>
                            </a>                  
                        </li>   
                         <li>
                            <a href="home.jsp?p=Meetings">
                                <span class="icon-align-justify"></span><span class="text">Meetings</span>
                            </a>                  
                        </li>           
                        <li>
                            <a href="home.jsp?p=Logged Calls">
                                <span class="icon-align-justify"></span><span class="text">Logged Calls</span>
                            </a>                  
                        </li>   
                         <li>
                            <a href="home.jsp?p=Scheduled Calls">
                                <span class="icon-align-justify"></span><span class="text">Scheduled Calls</span>
                            </a>                  
                        </li>
                                              
                    </ul>                
                </li>          
                <li class="openable">
                    <a href="#">
                        <span class="isw-purchase"></span><span class="text">Purchase</span>
                    </a>
                    <ul>
                        <li>
                            <a href="home.jsp?p=Products">
                                <span class="icon-th"></span><span class="text">Products</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="home.jsp?p=Items">
                                <span class="icon-th-large"></span><span class="text">Items</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="home.jsp?p=Suppliers">
                                <span class="icon-chevron-right"></span><span class="text">Suppliers</span>
                            </a>                  
                        </li> 
                        <li>
                            <a href="icons.html">
                                <span class="icon-fire"></span><span class="text">Icons</span>
                            </a>                  
                        </li>         
                        <li>
                            <a href="grid.html">
                                <span class="icon-align-justify"></span><span class="text">Grid system</span>
                            </a>                  
                        </li>                        
                    </ul>                
                </li>          
                <li class="openable">
                    <a href="#">
                        <span class="isw-production"></span><span class="text">Production</span>
                    </a>
                    <ul>
                        <li>
                            <a href="ui.html">
                                <span class="icon-th"></span><span class="text">UI Elements</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="widgets.html">
                                <span class="icon-th-large"></span><span class="text">Widgets</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="buttons.html">
                                <span class="icon-chevron-right"></span><span class="text">Buttons</span>
                            </a>                  
                        </li> 
                        <li>
                            <a href="icons.html">
                                <span class="icon-fire"></span><span class="text">Icons</span>
                            </a>                  
                        </li>         
                        <li>
                            <a href="grid.html">
                                <span class="icon-align-justify"></span><span class="text">Grid system</span>
                            </a>                  
                        </li>                        
                    </ul>                
                </li>          
                <li class="openable">
                    <a href="#">
                        <span class="isw-stock"></span><span class="text">Stock &amp; Inventory</span>
                    </a>
                    <ul>
                        <li>
                            <a href="ui.html">
                                <span class="icon-th"></span><span class="text">UI Elements</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="widgets.html">
                                <span class="icon-th-large"></span><span class="text">Widgets</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="buttons.html">
                                <span class="icon-chevron-right"></span><span class="text">Buttons</span>
                            </a>                  
                        </li> 
                        <li>
                            <a href="icons.html">
                                <span class="icon-fire"></span><span class="text">Icons</span>
                            </a>                  
                        </li>         
                        <li>
                            <a href="grid.html">
                                <span class="icon-align-justify"></span><span class="text">Grid system</span>
                            </a>                  
                        </li>                        
                    </ul>                
                </li>          
                <li class="openable">
                    <a href="#">
                        <span class="isw-accounting"></span><span class="text">Accounting</span>
                    </a>
                    <ul>
                        <li>
                            <a href="ui.html">
                                <span class="icon-th"></span><span class="text">UI Elements</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="widgets.html">
                                <span class="icon-th-large"></span><span class="text">Widgets</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="buttons.html">
                                <span class="icon-chevron-right"></span><span class="text">Buttons</span>
                            </a>                  
                        </li> 
                        <li>
                            <a href="icons.html">
                                <span class="icon-fire"></span><span class="text">Icons</span>
                            </a>                  
                        </li>         
                        <li>
                            <a href="grid.html">
                                <span class="icon-align-justify"></span><span class="text">Grid system</span>
                            </a>                  
                        </li>                        
                    </ul>                
                </li>          
                <li class="openable">
                    <a href="#">
                        <span class="isw-user_mgmt"></span><span class="text">Marketing</span>
                    </a>
                    <ul>
                        <li>
                            <a href="ui.html">
                                <span class="icon-th"></span><span class="text">UI Elements</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="widgets.html">
                                <span class="icon-th-large"></span><span class="text">Widgets</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="buttons.html">
                                <span class="icon-chevron-right"></span><span class="text">Buttons</span>
                            </a>                  
                        </li> 
                        <li>
                            <a href="icons.html">
                                <span class="icon-fire"></span><span class="text">Icons</span>
                            </a>                  
                        </li>         
                        <li>
                            <a href="grid.html">
                                <span class="icon-align-justify"></span><span class="text">Grid system</span>
                            </a>                  
                        </li>                        
                    </ul>                
                </li>          
                <li class="openable">
                    <a href="#">
                       <span class="isw-report"></span><span class="text">Report</span>
                    </a>
                    <ul>
                        <li>
                            <a href="ui.html">
                                <span class="icon-th"></span><span class="text">UI Elements</span>
                            </a>                  
                        </li>          
                        <li>
                            <a href="widgets.html">
                                <span class="icon-th-large"></span><span class="text">Widgets</span>
                            </a>                  
                        </li>                     
                        <li>
                            <a href="buttons.html">
                                <span class="icon-chevron-right"></span><span class="text">Buttons</span>
                            </a>                  
                        </li> 
                        <li>
                            <a href="icons.html">
                                <span class="icon-fire"></span><span class="text">Icons</span>
                            </a>                  
                        </li>         
                        <li>
                            <a href="grid.html">
                                <span class="icon-align-justify"></span><span class="text">Grid system</span>
                            </a>                  
                        </li>                        
                    </ul>                
                </li>          
                               
                          
                            </ul>

            <div class="dr"><span></span></div>

            <div class="widget-fluid">
                <div id="menuDatepicker"></div>
            </div>

                    </div>

        <div class="content">


            <div class="breadLine">
			
			 <%if(request.getParameter("p") == null)
			 {
				 %>
				 <ul class="breadcrumb">
				  <li class="active">Home</li></ul>
				 <%}
			 else if(request.getParameter("p").toString().equalsIgnoreCase("aboutUs")){
				 %>
				  <ul class="breadcrumb">
                    <li><a href="home.jsp">Home</a></li> 
                    </ul>
			<%  }
			 else{
				 %>
				  <ul class="breadcrumb">
                    <li><a href="home.jsp">Home</a> <span class="divider">></span></li> 
                    <li class="active"><%=request.getParameter("p").toString() %></li>
                </ul>
              <%} %>
              |&nbsp;&nbsp;&nbsp;<a href="home.jsp?p=aboutUs">About Us</a>
                <ul class="buttons">
                    <li>
                       

                        <div id="bcPopupList" class="popup">
                            <div class="head clearfix">
                                <div class="arrow"></div>
                                <span class="isw-users"></span>
                                <span class="name">List users</span>
                            </div>
                        
                            <div class="body-fluid users">

                                <div class="item clearfix">
                                    <div class="image"><a href="#"><img src="img/users/aqvatarius_s.jpg" width="32"/></a></div>
                                    <div class="info">
                                        <a href="#" class="name">Aqvatarius</a>                                    
                                        <span>online</span>
                                    </div>
                                </div>

                                <div class="item clearfix">
                                    <div class="image"><a href="#"><img src="img/users/olga_s.jpg" width="32"/></a></div>
                                    <div class="info">
                                        <a href="#" class="name">Olga</a>                                
                                        <span>online</span>
                                    </div>
                                </div>                        

                                <div class="item clearfix">
                                    <div class="image"><a href="#"><img src="img/users/alexey_s.jpg" width="32"/></a></div>
                                    <div class="info">
                                        <a href="#" class="name">Alexey</a>  
                                        <span>online</span>
                                    </div>
                                </div>                              

                                <div class="item clearfix">
                                    <div class="image"><a href="#"><img src="img/users/dmitry_s.jpg" width="32"/></a></div>
                                    <div class="info">
                                        <a href="#" class="name">Dmitry</a>                                    
                                        <span>online</span>
                                    </div>
                                </div>                         

                                <div class="item clearfix">
                                    <div class="image"><a href="#"><img src="img/users/helen_s.jpg" width="32"/></a></div>
                                    <div class="info">
                                        <a href="#" class="name">Helen</a>                                                                        
                                    </div>
                                </div>                                  

                                <div class="item clearfix">
                                    <div class="image"><a href="#"><img src="img/users/alexander_s.jpg" width="32"/></a></div>
                                    <div class="info">
                                        <a href="#" class="name">Alexander</a>                                                                        
                                    </div>
                                </div>                                  

                            </div>
                            <div class="footer">
                                <button class="btn" type="button">Add new</button>
                                <button class="btn btn-danger link_bcPopupList" type="button">Close</button>
                            </div>
                        </div>                    

                    </li>                
                    <li>
                        <a href="#" class="link_bcPopupSearch"><span class="icon-search"></span><span class="text">Search</span></a>

                        <div id="bcPopupSearch" class="popup">
                            <div class="head clearfix">
                                <div class="arrow"></div>
                                <span class="isw-zoom"></span>
                                <span class="name">Search</span>
                            </div>
                            <div class="body search">
                                <input type="text" placeholder="Some text for search..." name="search"/>
                            </div>
                            <div class="footer">
                                <button class="btn" type="button">Search</button>
                                <button class="btn btn-danger link_bcPopupSearch" type="button">Close</button>
                            </div>
                        </div>                
                    </li>
                </ul>

            </div>

            <div class="workplace">
<%
			String pages;
            if(request.getParameter("p") != null){
			 
					pages = request.getParameter("p").toString()
							+ ".jsp";
%>
		<jsp:include page="<%=pages%>" />
           <% }
			else{
		%>
		<%@include file="welcome.jsp"%>
		<%
			}
		%>



            </div>

        </div>   
    </div>
</body>

<!-- Mirrored from aqvatarius.com/themes/aquarius_v17/ by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 30 Dec 2013 11:17:15 GMT -->
</html>
<%
			}
			else{
				response.sendRedirect("login.jsp");
			}
%>