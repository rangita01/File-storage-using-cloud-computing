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
	
	<style type="text/css">
	
	.content1
	{
	position:absolute;
	top:220px;
	left: 480px;
	
	}
	
	
	
	
	</style>
		
 <SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">   
		<title>Welcome Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets3/css1/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		

		
		
	</head>
	<%
          HttpSession session1 =request.getSession();
          String Username =(String)session1.getAttribute("Uname");
        %>
	<body class="contact">
		<div id="page-wrapper">
		

			<!-- Header -->
				<header id="header">
					<h1 id="logo"><a href="index.html">WELCOME</a></h1>
					<nav id="nav">
						<ul>
							<li class="current"><a >Home</a></li>
							<li class="current"><a href="index.jsp" >Log-Out</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
			
			<br><br><br><br>
				
				<h2><center><strong><span style="color: brown; background-color: white; height: 50px;">&nbsp;&nbsp;Trust Authority&nbsp;&nbsp;</span></strong></center></h2>

<br>


					<!-- One -->
						

							<!-- Content -->
								
							<span class="content1">	 <table border="1" width="400px" style="background-color: #ACF8FE">
                         
                         <th>Data Owner</th>
                        
                         <th>Private Keys</th>
                         
                         
                        <%! 
                        String PrivateKey;
                        %>


                      <%
                      
                      Controller_DaoClass con =Controller.Connection();
                      
                                            
                      List list =con.ShowDataOwner();
                      
                      Iterator it = list.iterator();
                      
                      while(it.hasNext())
                      {
                      	
                        DataOwnerPojo fp=(DataOwnerPojo)it.next();
                      	
                      	String Ownername = fp.getUsername();
                      	
                      	System.out.println("Ownername ="+Ownername);
                      	
                       PrivateKey = fp.getPrivateKey();
                      	
                      	System.out.println("PrivateKey ="+PrivateKey);
                      	
                      	
                     
                      %>
                      
                      <tr>
                      <td><%=Ownername%></td>
                     
                     <td> <%=PrivateKey %></td>
                     
                      </tr>


                      <% } 
                      
                     
                      %>
                  
                               </table> </span>
								
								
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