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
							<li class="current"><a >Home</a></li>
							<li class="current"><a href="GroupmanUserrevocation">User Revocation Request</a></li>
							<li class="current"><a href="index.jsp" >Log-Out</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
			
			<br><br><br><br>
				
				<h2><center><strong><span style="color: brown; background-color: white; height: 50px;">&nbsp;&nbsp;Group Manager&nbsp;&nbsp;</span></strong></center></h2>

<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="color: blue;">USER REQUEST'S</span></strong> 
                 

					<!-- One -->
						<section class="wrapper style4 special container 75%">
                          
							<!-- Content -->
								<div class="content">
								
								 <table>
           
           <th><span style="color: red">Data User's</span></th>
           <th><span style="color: red">Data Owner's</span><br><br></th>
								
															<%
            
            Controller_DaoClass con = Controller.Connection();
            
            List list =con.ShowAllRequestUser();
            
            Iterator it =list.iterator();
            
            String Status;
            
            ArrayList ar = new ArrayList();
            
            while(it.hasNext())
            {
                
            	Status="Denied";
            	
            	RequestTablePojo rp =(RequestTablePojo)it.next();
            	
            	if(!ar.contains(rp.getReqFrom()+","+rp.getReqTo()))
            	
            	{
            	
            	String ReqFrom =rp.getReqFrom();
            	
            	System.out.println("ReqFrom ="+ReqFrom);
            	
                String UserDp =rp.getUserDp();
            	
            	System.out.println("UserDp ="+UserDp);
            	
                String ReqTo =rp.getReqTo();
            	
            	System.out.println("ReqTo ="+ReqTo);
            	
                String OwnerDp =rp.getOwnerDp();
            	
            	System.out.println("OwnerDp ="+OwnerDp);
            	
            	Status =rp.getStatus();
             	
             	System.out.println("Status ="+Status);
            	
            	if(Status.equals("Request"))
            	
            	{	
            		
            	ar.add(rp.getReqFrom()+","+rp.getReqTo());	
            
            %>	
            	
          
           
           
           <tr><td> <span style="color: blue;">	<%=ReqFrom %> </span></td><td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: blue;"><%=ReqTo %></span></td></tr>
            	
        <tr><td>  <img alt="" src="\CLOUD-21\Dp\<%=UserDp%>" width="120px" height="120px" style="border-radius:250px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        
            <td>  <img alt="" src="\CLOUD-21\Dp\<%=OwnerDp%>" width="120px" height="120px" style="border-radius:250px">
            
       <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="InsertReqTableOwner?ReqFrom=<%=ReqFrom%>&&ReqTo=<%=ReqTo%>&&UserDp=<%=UserDp%>&&Status=Request">Accept</a></td>
        
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ReqTableGroManagerReject?ReqFrom=<%=ReqFrom%>&&ReqTo=<%=ReqTo%>">Reject</a></td> 
        
        </tr> 	
            	
          
            	
         <%    
            	}
            	
            	}
         
            	
            	}  %> 
            
            
          
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