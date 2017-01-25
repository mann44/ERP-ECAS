<%@page import="java.util.ArrayList"%>
<%@page import="generics.user_mgmt.GenericsMethod"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@ page import="bean.user_mgmt.UserMaster" %>
<%@ page import="iFaces.user_mgmt.DaoMethods,dao.user_mgmt.DaoMethodsImp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%


UserMaster us=new UserMaster();
ArrayList<UserMaster> list=new ArrayList<UserMaster>();
GenericsMethod<UserMaster> gen = new GenericsMethod<UserMaster>();
list=gen.viewDate(us);
%>

<html lang="en">
<!-- Mirrored from aqvatarius.com/themes/aquarius_v17/tables.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 30 Dec 2013 11:18:28 GMT -->
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <![endif]-->
    
    <title>Tables - Aquarius - responsive admin panel</title>

    <link rel="icon" type="image/ico" href="favicon.ico"/>
    
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />
    <![endif]-->    
    <link rel='stylesheet' type='text/css' href='css/fullcalendar.print.css' media='print' />
    
    <script type='text/javascript' src='js/plugins/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery.mousewheel.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/bootstrap.min.js'></script>
    
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
    
</head>
<body>
    <div class="wrapper"> 

        <div class="header">
            <a class="logo" href="index-2.html"><img src="img/logo.png" alt="Aquarius -  responsive admin panel" title="Aquarius -  responsive admin panel"/></a>
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
                    Hi, Aqvatarius
                </div>
            </div>

            <div class="admin">
                <div class="image">
                    <img src="img/users/aqvatarius.jpg" class="img-polaroid"/>                
                </div>
                <ul class="control">                
                    <li><span class="icon-comment"></span> <a href="messages.html">Messages</a> <a href="messages.html" class="caption red">12</a></li>
                    <li><span class="icon-cog"></span> <a href="forms.html">Settings</a></li>
                    <li><span class="icon-share-alt"></span> <a href="login.html">Logout</a></li>
                </ul>
                <div class="info">
                    <span>Welcom back! Your last visit: 24.10.2012 in 19:55</span>
                </div>
            </div>

            <ul class="navigation">            
                <li>
                    <a href="index-2.html">
                        <span class="isw-grid"></span><span class="text">Dashboard</span>
                    </a>
                </li>
                <li class="openable">
                    <a href="#">
                        <span class="isw-list"></span><span class="text">UI elements</span>
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
                <li>
                    <a href="forms.html">
                        <span class="isw-archive"></span><span class="text">Forms stuff</span>                 
                    </a>
                </li>                        
                <li class="openable">
                    <a href="#">
                        <span class="isw-chat"></span><span class="text">Messages</span>
                    </a>
                    <ul>
                        <li>
                            <a href="messages.html">
                                <span class="icon-comment"></span><span class="text">Messages widgets</span></a>

                                <a href="#" class="caption yellow link_navPopMessages">5</a>

                                <div id="navPopMessages" class="popup" style="display: none;">
                                    <div class="head clearfix">
                                        <div class="arrow"></div>
                                        <span class="isw-chats"></span>
                                        <span class="name">Personal messages</span>
                                    </div>
                                    <div class="body messages">

                                        <div class="item clearfix">
                                            <div class="image"><a href="#"><img src="img/users/aqvatarius.jpg" class="img-polaroid"/></a></div>
                                            <div class="info">
                                                <a href="#" class="name">Aqvatarius</a>
                                                <p>Lorem ipsum dolor. In id adipiscing diam. Sed lobortis dui ut odio tempor blandit. Suspendisse scelerisque mi nec nunc gravida quis mollis lacus dignissim.</p>
                                                <span>19 feb 2012 12:45</span>
                                            </div>
                                        </div>

                                        <div class="item clearfix">
                                            <div class="image"><a href="#"><img src="img/users/olga.jpg" class="img-polaroid"/></a></div>
                                            <div class="info">
                                                <a href="#" class="name">Olga</a>
                                                <p>Cras nec risus dolor, ut tristique neque. Donec mauris sapien, pellentesque at porta id, varius eu tellus.</p>
                                                <span>18 feb 2012 12:45</span>
                                            </div>
                                        </div>                        

                                        <div class="item clearfix">
                                            <div class="image"><a href="#"><img src="img/users/dmitry.jpg" class="img-polaroid"/></a></div>
                                            <div class="info">
                                                <a href="#" class="name">Dmitry</a>
                                                <p>In id adipiscing diam. Sed lobortis dui ut odio tempor blandit.</p>
                                                <span>17 feb 2012 12:45</span>
                                            </div>
                                        </div>                         

                                        <div class="item clearfix">
                                            <div class="image"><a href="#"><img src="img/users/helen.jpg" class="img-polaroid"/></a></div>
                                            <div class="info">
                                                <a href="#" class="name">Helen</a>
                                                <p>Sed lobortis dui ut odio tempor blandit. Suspendisse scelerisque mi nec nunc gravida quis mollis lacus dignissim. Donec mauris sapien, pellentesque at porta id, varius eu tellus.</p>
                                                <span>15 feb 2012 12:45</span>
                                            </div>
                                        </div>                                  

                                    </div>
                                    <div class="footer">
                                        <button class="btn link_navPopMessages" type="button">Close</button>
                                    </div>
                                </div>                                                                                                                          
                        </li>                                        
                    </ul>                


                </li>                                    
                <li>
                    <a href="statistic.html">
                        <span class="isw-graph"></span><span class="text">Statistics</span>
                    </a>
                </li>                                    
                <li class="active">
                    <a href="tables.html">
                        <span class="isw-text_document"></span><span class="text">Tables</span>
                    </a>
                </li>           
                <li class="openable">
                    <a href="#">
                        <span class="isw-documents"></span><span class="text">Sample pages</span>
                    </a>
                    <ul>
                        <li>
                            <a href="user.html">
                                <span class="icon-info-sign"></span><span class="text">User info</span>
                            </a>     
                        </li>
                        <li>
                            <a href="profile.html">
                                <span class="icon-user"></span><span class="text">User profile</span>
                            </a>                  
                        </li>                                                   
                        <li>
                            <a href="users.html">
                                <span class="icon-list"></span><span class="text">Users</span>
                            </a>
                        </li>              
                        <li>
                            <a href="stream.html">
                                <span class="icon-refresh"></span><span class="text">Stream activity</span>
                            </a>
                        </li>  
                        <li>
                            <a href="mail.html">
                                <span class="icon-envelope"></span><span class="text">Mailbox</span>
                            </a>
                        </li>
                        <li>
                            <a href="edit.html">
                                <span class="icon-pencil"></span><span class="text">User edit</span>
                            </a>                  
                        </li>   
                        <li>
                            <a href="faq.html">
                                <span class="icon-question-sign"></span><span class="text">FAQ</span>
                            </a>
                        </li>
                        <li>
                            <a href="search.html">
                                <span class="icon-search"></span><span class="text">Search</span>
                            </a>
                        </li>                        
                    </ul>                                
                </li>              
                <li class="openable">
                    <a href="#">
                        <span class="isw-zoom"></span><span class="text">Other</span>                    
                    </a>
                    <ul>
                        <li>
                            <a href="gallery.html">
                                <span class="icon-picture"></span><span class="text">Gallery</span>
                            </a>
                        </li>
                        <li>
                            <a href="typography.html">
                                <span class="icon-pencil"></span><span class="text">Typography</span>
                            </a>
                        </li>  
                        <li>
                            <a href="wizard.html">
                                <span class="icon-share"></span><span class="text">Wizard</span>
                            </a>
                        </li>                        
                        <li>
                            <a href="files.html">
                                <span class="icon-upload"></span><span class="text">File handling</span>
                            </a>
                        </li>                                                         
                    </ul>
                </li>    
                <li class="openable">
                    <a href="#">
                        <span class="isw-cancel"></span><span class="text">Error pages</span>                    
                    </a>
                    <ul>                    
                        <li><a href="403.html"><span class="icon-warning-sign"></span><span class="text">403 Forbidden</span></a></li>
                        <li><a href="404.html"><span class="icon-warning-sign"></span><span class="text">404 Not Found</span></a></li>
                        <li><a href="500.html"><span class="icon-warning-sign"></span><span class="text">500 Internal Server Error</span></a></li>
                        <li><a href="503.html"><span class="icon-warning-sign"></span><span class="text">503 Service Unavailable</span></a></li>
                        <li><a href="504.html"><span class="icon-warning-sign"></span><span class="text">504 Gateway Timeout</span></a></li>
                    </ul>
                </li>                         
            </ul>

            <div class="dr"><span></span></div>

            <div class="widget-fluid">
                <div id="menuDatepicker"></div>
            </div>

            <div class="dr"><span></span></div> 

            <div class="widget">

                <div class="input-append">
                    <input id="appendedInputButton" style="width: 118px;" type="text"><button class="btn" type="button">Search</button>
                </div>            

            </div>

            <div class="dr"><span></span></div>        

            <div class="widget-fluid">

                <div class="wBlock clearfix">
                    <div class="dSpace">
                        <h3>Last visits</h3>
                        <span class="number">6,302</span>                    
                        <span>5,774 <b>unique</b></span>
                        <span>3,512 <b>returning</b></span>
                    </div>
                    <div class="rSpace">
                        <h3>Today</h3>
                        <span class="mChartBar" sparkType="bar" sparkBarColor="white"><!--240,234,150,290,310,240,210,400,320,198,250,222,111,240,221,340,250,190--></span>                                                                                
                        <span>&nbsp;</span>
                        <span>65% <b>New</b></span>
                        <span>35% <b>Returning</b></span>
                    </div>
                </div>

            </div>        

        </div>

        <div class="content">


            <div class="breadLine">

                <ul class="breadcrumb">
                    <li><a href="#">Simple Admin</a> <span class="divider">></span></li>                
                    <li class="active">Tables</li>
                </ul>

                <ul class="buttons">
                    <li>
                        <a href="#" class="link_bcPopupList"><span class="icon-user"></span><span class="text">Users list</span></a>

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

                <div class="page-header">
                    <h1>Tables <small>And Sorting</small></h1>
                </div>                  
                
                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Simple table</h1>      
                            <ul class="buttons">
                                <li><a href="#" class="isw-download"></a></li>                                                        
                                <li><a href="#" class="isw-attachment"></a></li>
                                <li>
                                    <a href="#" class="isw-settings"></a>
                                    <ul class="dd-list">
                                        <li><a href="#"><span class="isw-plus"></span> New document</a></li>
                                        <li><a href="#"><span class="isw-edit"></span> Edit</a></li>
                                        <li><a href="#"><span class="isw-delete"></span> Delete</a></li>
                                    </ul>
                                </li>
                            </ul>                        
                        </div>
                        <div class="block-fluid">
                            <table cellpadding="0" cellspacing="0" width="100%" class="table">
                                <thead>
                                    <tr>                                    
                                        <th width="25%">ID</th>
                                        <th width="25%">Name</th>
                                        <th width="25%">E-mail</th>
                                        <th width="25%">Phone</th>                                    
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>                                    
                                        <td>101</td>
                                        <td>Dmitry</td>
                                        <td>dmitry@domain.com</td>
                                        <td>+98(765)432-10-98</td>                                    
                                    </tr>
                                    <tr>
                                        <td>102</td>
                                        <td>Alex</td>
                                        <td>alex@domain.com</td>
                                        <td>+98(765)432-10-99</td>                                    
                                    </tr>
                                    <tr>
                                        <td>103</td>
                                        <td>John</td>
                                        <td>john@domain.com</td>
                                        <td>+98(765)432-10-97</td>                                    
                                    </tr>
                                    <tr>
                                        <td>104</td>
                                        <td>Angelina</td>
                                        <td>angelina@domain.com</td>
                                        <td>+98(765)432-10-90</td>                                    
                                    </tr>
                                    <tr>
                                        <td>105</td>
                                        <td>Tom</td>
                                        <td>tom@domain.com</td>
                                        <td>+98(765)432-10-92</td>                                    
                                    </tr>                                
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div>            

                <div class="dr"><span></span></div>

                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Simple Sortable table</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                            <table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable_2">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name="checkall"/></th>
                                        <th width="25%">ID</th>
                                        <th width="25%">Name</th>
                                        <th width="25%">E-mail</th>
                                        <th width="25%">Phone</th>                                    
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>101</td>
                                        <td>Dmitry</td>
                                        <td>dmitry@domain.com</td>
                                        <td>+98(765)432-10-98</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>102</td>
                                        <td>Alex</td>
                                        <td>alex@domain.com</td>
                                        <td>+98(765)432-10-99</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>103</td>
                                        <td>John</td>
                                        <td>john@domain.com</td>
                                        <td>+98(765)432-10-97</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>104</td>
                                        <td>Angelina</td>
                                        <td>angelina@domain.com</td>
                                        <td>+98(765)432-10-90</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>105</td>
                                        <td>Tom</td>
                                        <td>tom@domain.com</td>
                                        <td>+98(765)432-10-92</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>106</td>
                                        <td>Helen</td>
                                        <td>helen@domain.com</td>
                                        <td>+98(765)432-11-33</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>107</td>
                                        <td>Aqvatarius</td>
                                        <td>aqvatarius@domain.com</td>
                                        <td>+98(765)432-15-66</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>108</td>
                                        <td>Olga</td>
                                        <td>olga@domain.com</td>
                                        <td>+98(765)432-11-97</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>109</td>
                                        <td>Homer</td>
                                        <td>homer@domain.com</td>
                                        <td>+98(765)432-11-90</td>                                    
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>110</td>
                                        <td>Tifany</td>
                                        <td>tifany@domain.com</td>
                                        <td>+98(765)432-11-92</td>                                    
                                    </tr>                                
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div>              

                <div class="dr"><span></span></div>

                <div class="row-fluid">

                    <div class="span12">                    
                        <div class="head clearfix">
                            <div class="isw-grid"></div>
                            <h1>Sortable table</h1>                               
                        </div>
                        <div class="block-fluid table-sorting clearfix">
                        <div>Select User 
                        <select><option>fgfg</option></select>
                        </div>
                            <table cellpadding="0" cellspacing="0" width="100%" class="table" id="tSortable">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name="checkall"/></th>
                                        <th width="25%">ID</th>
                                        <th width="25%">Name</th>
                                        <th width="25%">E-mail</th>
                                        <th width="25%">Phone</th>                                    
                                    </tr>
                                </thead>
                                <tbody>
                                		  <%
                                    	for(UserMaster u:list)
                                    	{
                                    %>  
                                    <tr>
                                    	 <td><input type="checkbox" name="checkall"/></td>
                                    	<td><%=u.getUser_id() %></td>
                                    	<td><%=u.getFull_name() %></td>
                                    	<td><%=u.getEmail() %></td>
                                    	<td><%=u.getContact_no() %></td>
                                    	
                                  </tr>
									<%}%>
                                     <tr>
                                        <td><input type="checkbox" name="checkbox"/></td>
                                        <td>110</td>
                                        <td>Tifany</td>
                                        <td>tifany@domain.com</td>
                                        <td>+98(765)432-11-92</td>                                    
                                    </tr>      
                                                              
                                </tbody>
                            </table>
                        </div>
                    </div>                                

                </div>            

                <div class="dr"><span></span></div>            

            </div>

        </div>   
    </div>
</body>

<!-- Mirrored from aqvatarius.com/themes/aquarius_v17/tables.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 30 Dec 2013 11:18:28 GMT -->
</html>