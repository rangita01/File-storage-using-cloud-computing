<!DOCTYPE HTML>
<%@ page import="com.DAO.*" %>
<%@ page import="com.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pojo.*" %>
<!--
	Prologue by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Home page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets1/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		<style type="text/css">
		
		#fileupload
		{
		position:relative;
		left:100px;
		width: 800px;
		height: 400px;
		background-color: white;
		}
		
	    #Accept
		{
		
		position:relative;
		top:-50px;
		left:-180px;
		
		}
		
	    #Reject
		{
		position:relative;
		top:-50px;
		left:-280px;
		
		} 
		
		 #Image
		{
		position:relative;
		top:10px;
		left:10px;
		
		} 
		
		</style>
		
	</head>
	
	
 <SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">   
    
    
  </head>
	<body>

		<!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
						
						<%!String ownername; %>
						<%
						
						String ownername =session.getAttribute("ownername").toString();
						
						System.out.println("DataOwnerHomepage.jsp ownername ="+ownername);
			
			            String OwnerDp =session.getAttribute("OwnerDp").toString();
			
			            System.out.println("DataOwnerHomepage.jsp OwnerDp ="+OwnerDp);
			            
			            String Designation =session.getAttribute("Designation").toString();
						
			            System.out.println("DataOwnerHomepage.jsp Designation ="+Designation);
			            
                        String PrivateKey =session.getAttribute("PrivateKey").toString();
						
			            System.out.println("DataOwnerHomepage.jsp PrivateKey ="+PrivateKey);
						
						
						
						%>
			<center>	<img src="Dp/<%=OwnerDp%>" alt="" width="200px" height="200px" style="border-radius:250px"/>
										<h1 id="title"><%=ownername%></h1>
							<h6><strong><span style="color: white;"><%=Designation %></span></strong></h6>   </center>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<!--

								Prologue's nav expects links in one of two formats:

								1. Hash link (scrolls to a different section within the page)

								   <li><a href="#foobar" id="foobar-link" class="icon fa-whatever-icon-you-want skel-layers-ignoreHref"><span class="label">Foobar</span></a></li>

								2. Standard link (sends the user to another page/site)

								   <li><a href="http://foobar.tld" id="foobar-link" class="icon fa-whatever-icon-you-want"><span class="label">Foobar</span></a></li>

							-->
							<ul>
								<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Home</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">File Upload</span></a></li>
								<li><a href="#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">User Requests</span></a></li>
								<li><a href="index.jsp" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">Log-Out</span></a></li>
								

							</ul>
						</nav>

				</div>

				<div class="bottom">

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>

				</div>

			</div>

		<!-- Main -->
			<div id="main">

				<!-- Intro -->
					<section id="top" class="one dark cover">
						<div class="container">

							<header>
								<h2 style="font-family: Calibri">Flexible and Fine-Grained Attribute Based</h2>
					                 <h2 style="font-family: Calibri">Data Storage in Cloud Computing</h2>
								
							</header>

						
						</div>
					</section>

				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>File Upload</h2>
							</header>

							<div id="fileupload"><Br><br>
							<form action="FileUpload" method="post"  enctype="multipart/form-data">
							Choose your Upload :<input type="file" name="Filename"><Br><br>
							<input type="submit" value="Upload">
							</form>
							
							</div>
<br><br><br>

						</div>
					</section>

				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
								<h2>User's Request</h2>
							</header>

							<!-- <a href="#" class="image featured"><img src="images1/pic08.jpg" alt="" /></a> -->
            <%
            
            Controller_DaoClass con = Controller.Connection();
            
            List list =con.ShowRequestUser(ownername);
            
            Iterator it =list.iterator();
            
            String Status;
            
            ArrayList ar = new ArrayList();
            
            while(it.hasNext())
            {
            	
            	
            	Status="Denied";
            	
            	RequestTablePojo_Owner rp =(RequestTablePojo_Owner)it.next();
            	
            	String ReqFrom =rp.getReqFrom();
            	
            	System.out.println("ReqFrom ="+ReqFrom);
            	
                String UserDp =rp.getUserDp();
            	
            	System.out.println("UserDp ="+UserDp);
            	
                Status =rp.getStatus();
            	
            	System.out.println("Status ="+Status);
            	
            	if(!ar.contains(ReqFrom+","+ownername))
            		
            	{	
            	
            	if(Status.equals("Request"))
            		
            	{	
            
            %>	
            	
           <table><tr><td> 	<%=ReqFrom %> </td></tr>
            	
        <tr><td><div id="Image">  <img alt="" src="\CLOUD-21\Dp\<%=UserDp%>" width="120px" height="120px" style="border-radius:250px"></div> </td>
        
        <td><div id="Accept"><a href="Permission?Owner=<%=ownername%>&&User=<%=ReqFrom%>&&Status=ALLOWED">Accept</a></div></td>
        
        <td><div id="Reject"><a href="ReqTableDataOwnerReject?ReqFrom=<%=ReqFrom%>&&ReqTo=<%=ownername%>">Reject</a></div></td>
        
        </tr> 	
            	
           </table> 	
            	
         <%  
            	}
            	
            	}
            	
            	ar.add(ReqFrom+","+ownername);
            	
            	}  
            	
            	
            	%> 
            
            			<p></p>

						</div>
					</section>

				<!-- Contact -->
<!-- 					<section id="contact" class="four"> -->
<!-- 						<div class="container"> -->

<!-- 							<header> -->
<!-- 								<h2>Contact</h2> -->
<!-- 							</header> -->

<!-- 							<p>Elementum sem parturient nulla quam placerat viverra -->
<!-- 							mauris non cum elit tempus ullamcorper dolor. Libero rutrum ut lacinia -->
<!-- 							donec curae mus. Eleifend id porttitor ac ultricies lobortis sem nunc -->
<!-- 							orci ridiculus faucibus a consectetur. Porttitor curae mauris urna mi dolor.</p> -->

<!-- 							<form method="post" action="#"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="6u 12u$(mobile)"><input type="text" name="name" placeholder="Name" /></div> -->
<!-- 									<div class="6u$ 12u$(mobile)"><input type="text" name="email" placeholder="Email" /></div> -->
<!-- 									<div class="12u$"> -->
<!-- 										<textarea name="message" placeholder="Message"></textarea> -->
<!-- 									</div> -->
<!-- 									<div class="12u$"> -->
<!-- 										<input type="submit" value="Send Message" /> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</form> -->

<!-- 						</div> -->
<!-- 					</section> -->

			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">JSP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="assets1/js/jquery.min.js"></script>
			<script src="assets1/js/jquery.scrolly.min.js"></script>
			<script src="assets1/js/jquery.scrollzer.min.js"></script>
			<script src="assets1/js/skel.min.js"></script>
			<script src="assets1/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets1/js/main.js"></script>

	</body>
</html>