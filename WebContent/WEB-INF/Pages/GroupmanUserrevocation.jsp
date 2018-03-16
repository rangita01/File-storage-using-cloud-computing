<!DOCTYPE HTML>
<%@ page import="com.DAO.*" %>
<%@ page import="com.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pojo.*" %>
<!--
	Twenty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Welcome Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets3/css1/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">   
    
    
  </head>
	
	<%
          HttpSession session1 =request.getSession();
          String Username =(String)session1.getAttribute("Uname");
        %>
	<body class="contact">
		<div id="page-wrapper">
		

			<!-- Header -->
				<header id="header">
					<h1 id="logo"><a href="index.html">WELCOME </a></h1>
					<nav id="nav">
						<ul>
							<li class="current"><a href="GroupmanHomepage">Home</a></li>
							
							<li class="current"><a href="index.jsp" >Log-Out</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
			
			<br><br><br><br>
				
				<h2><center><strong><span style="color: brown; background-color: white; height: 50px;">&nbsp;&nbsp;Group Manager&nbsp;&nbsp;</span></strong></center></h2>

<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="color: blue;">USER REVOCATION LIST</span></strong> 
                 

					<!-- One -->
						<section class="wrapper style4 special container 75%">
                          
							<!-- Content -->
								<div >
								
								  <table border="1" width="800px" style="background-color: #ACF8FE">
                         
                         <th><span style="color: blue;">User Name</span></th>
                         <th><span style="color: blue;">Subject</span></th>
                         <th><span style="color: blue;">Reason</span></th>
                         <th><span style="color: blue;">Accept</span></th>
                        
                         
                      
                      <%
                      
                      Controller_DaoClass con1 =Controller.Connection();
                      
                                            
                      List list1 =con1.ShowUserRevocationList();
                      
                      Iterator it1 = list1.iterator();
                      
                      while(it1.hasNext())
                      {
                      	
                    	  UserRevocationPojo up=(UserRevocationPojo)it1.next();
                      	
                      	String RUsername = up.getUsername();
                      	
                      	System.out.println("RUsername ="+RUsername);
                      	
                      	String Subject = up.getSubject();
                      	
                      	System.out.println("Subject ="+Subject);
                      	
                      	String Reason = up.getReason();
                      	
                      	System.out.println("Reason ="+Reason);
                      	
                        String Status = up.getStatus();
                       	
                      	System.out.println("Status ="+Status);
                      	
                      	
                      	if(Status.equals("Request"))
                      	{
                      	
                      %>
                      
                      <tr>
                      <td><%=RUsername%></td>
                      <td><%=Subject%></td>
                     
                      <td><%=Reason %></td>
                     
                     
                      <td><a href="UserRevocatonAccept?RUsername=<%=RUsername%>">ACCEPT</a></td>
                      </tr>


                      <% 
                      	}
                      }
                      
                      %>
                  
                               </table>
								
								
								
								</div>

						</section>


			<!-- Footer -->
				

		</div>

		<!-- Scripts -->
			<script src="assets/js1/jquery.min.js"></script>
			<script src="assets/js1/jquery.dropotron.min.js"></script>
			<script src="assets/js1/jquery.scrolly.min.js"></script>
			<script src="assets/js1/jquery.scrollgress.min.js"></script>
			<script src="assets/js1/skel.min.js"></script>
			<script src="assets/js1/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js1/main1.js"></script>

	</body>
</html>