<!DOCTYPE HTML>
<%@ page import="com.DAO.*" %>
<%@ page import="com.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pojo.*" %>
<!--
	Read Only by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Home page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets2/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
		<style type="text/css">
		
		#button
		{
		position:absolute;
		top:40px;
		left:270px;
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
	  
	  <%! String username; %>
	
	                   <%
						
						username =session.getAttribute("username").toString();
						
						System.out.println("DatauserHomepage.jsp username ="+username);
			
			            String userDp =session.getAttribute("UserDp").toString();
			
			            System.out.println("DatauserHomepage.jsp userDp ="+userDp);
						
                        String Designation =session.getAttribute("Designation").toString();
						
			            System.out.println("DatauserHomepage.jsp Designation ="+Designation);
						
						%>

		<!-- Header -->
			<section id="header">
				<header>
				<button id="button"><a href="index.jsp"><span style="color: blue;">SIGN-OUT</span></a></button>
					<span><img src="Dp/<%=userDp%>" alt="" width="200px" height="200px" style="border-radius:250px"/></span>
				
					<h1 id="logo"><a href="#"><%=username %></a></h1>
					<p><strong><span style="color: white;"><%=Designation %></span></strong><br />
					</p>
				</header>
				<nav id="nav">
					<ul>
						<li><a href="#one" class="active">Data Owner</a></li>
						<li><a href="#two">Data Owner Files</a></li>
						<li><a href="#three">Private Keys</a></li>
						<li><a href="#four">User Revocation</a></li>
						
					</ul>
				</nav>
				<footer>
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
					</ul>
				</footer>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one">
								<div class="container">
									<header class="major">
										<h3><span style="color: green;">Data Owner's</span></h3>
										
                <%! String ReqTo;
                String Ownername;
                ArrayList ar;  %>										
										
                <%
                
                
                Controller_DaoClass con =Controller.Connection();
                
                //Getting value from request table
                
                List ar =con.CheckingRequestTable(username);
                
                System.out.println("Arr ==="+ar);
                
                List list =con.ShowDataOwner();
                
                Iterator it = list.iterator();
                
                while(it.hasNext())
                {
                	
                	DataOwnerPojo dp=(DataOwnerPojo)it.next();
                	
                	Ownername = dp.getUsername();
                	
                	System.out.println("Ownername ="+Ownername);
                	
                    String Ownerdp =dp.getDp();
                    
                    System.out.println("Ownerdp ="+Ownerdp); 
                    
                    int f=0;
                    
                    for(int i=0; i<ar.size(); i++)
                    {
                    
                    	String Checking =ar.get(i).toString();
                    	
                    	System.out.println("Owner name ============================================================"+Checking);
                    	System.out.println("Checking ============================================================"+Checking);
                    	
                    if(Checking.equalsIgnoreCase(Ownername))
                    {
                    	f =1;
                    	System.out.println("Checking.equalsIgnoreCase(Ownername)"+Checking.equalsIgnoreCase(Ownername));
                    	System.out.println("f inside for loop ="+f);
                    	break;
                    	
                    	
                    }
                    
                    }
                    
                    if(f == 0)
                    {
                    %>
              
             
             <table>
           
            <tr> <td><span style="color: blue;background-color:aqua;"><%=Ownername %></span></td></tr>
              
            <tr><td><a href="RequestTable?ReqFrom=<%=username%>&&ReqTo=<%=Ownername%>&&UserDp=<%=userDp%>&&Ownerdp=<%=Ownerdp%>&&Status=Request"><img alt="" src="Dp/<%=Ownerdp%>" height="100px" width="100px" style="border-radius:250px"></a></td>
            
            </tr>  
            
            </table> 
              
                    
            <%  
                    
                    }
                    
                      
                    
                    } 
                
                
                    
                    %>
                
                
               




								</div>
							</section>

					 	<!-- Two -->
							<section id="two">
								<div class="container">
									<h3><span style="color: green;">Data Owner's Files</span></h3>
									
<!-- 									<ul class="feature-icons"> -->
<!-- 										<li class="fa-code">Write all the code</li> -->
<!-- 										<li class="fa-cubes">Stack small boxes</li> -->
<!-- 										<li class="fa-book">Read books and stuff</li> -->
<!-- 										<li class="fa-coffee">Drink much coffee</li> -->
<!-- 										<li class="fa-bolt">Lightning bolt</li> -->
<!-- 										<li class="fa-users">Shadow clone technique</li> -->
<!-- 									</ul> -->

                         <table border="1" width="800px" style="background-color: #ACF8FE">
                         
                         <th>Data Owner</th>
                         <th>Filename</th>
                         <th>Private Key</th>
                         <th>Download</th>
                         
                        <%! 
                        String PrivateKey;
                        %>


                      <%
                      
                       List list1 =con.ShowDataOwnerFiles();
                      
                      Iterator it1 = list1.iterator();
                      
                      while(it1.hasNext())
                      {
                      	
                    	FileUploadPojo fp=(FileUploadPojo)it1.next();
                      	
                      	String Ownername = fp.getOwnername();
                      	
                      	System.out.println("Ownername ="+Ownername);
                      	
                      	String Filename = fp.getFilename();
                      	
                      	System.out.println("Filename ="+Filename);
                      	
                        PrivateKey = fp.getPrivateKey();
                      	
                      	System.out.println("PrivateKey ="+PrivateKey);
                      	
                      	String status="Denied";
                      	
                      	List list7 =con.PermisionChecking(Ownername, username);
                      	
                        Iterator it7 =list7.iterator();
                        
                        while(it7.hasNext())
                        {
                        	PermissionPojo pp =(PermissionPojo)it7.next();
                        	
                        	status =pp.getStatus();
                        	
                        	System.out.println("status ="+status);
                        	
                        	
                        }
                        
                        if(status.equals("Reject"))
                        	
                    	{
                    		System.out.println("Data Owner Rejected This User");
                    	}
                        else
                        {	
                     
                      %>
                      
                      <tr>
                      <td><%=Ownername%></td>
                      <td><%=Filename%></td>
                      
                      <%
                      
                      if(status.equals("ALLOWED"))
                      {
                      %>
                      
                     <td> <%=PrivateKey %></td>
                     <%}else{ %> 
                      
                     <td>*****</td> 
                     
                     <%} %> 
                     
                      <td><a href="Download?Ownername=<%=Ownername%>&&Filename=<%=Filename%>">Download</a></td>
                      </tr>


                      <% } 
                      
                      }
                      
                      %>
                  
                               </table>
								</div>
							</section> 

						<!-- Three -->
							<section id="three">
								<div class="container">
									<h3>Private Keys</h3>
									 <table border="1" width="400px" style="background-color: #ACF8FE">
                         
                         <th>Data Owner</th>
                        
                         <th>Private Key</th>
                         
                         
                        <%! 
                        String PrivateKey1;
                        %>


                      <%
                      
                      List list11 =con.ShowDataOwner();
                      
                      Iterator it11 = list11.iterator();
                      
                      while(it11.hasNext())
                      {
                      	
                    	  DataOwnerPojo dp=(DataOwnerPojo)it11.next();
                      	
                      	String Ownername = dp.getUsername();
                      	
                      	System.out.println("Ownername ="+Ownername);
                      	
                        PrivateKey = dp.getPrivateKey();
                      	
                      	System.out.println("PrivateKey ="+PrivateKey);
                      	
                      	String status="Denied";
                      	
                      	List list7 =con.PermisionChecking(Ownername, username);
                      	
                        Iterator it7 =list7.iterator();
                        
                        while(it7.hasNext())
                        {
                        	PermissionPojo pp =(PermissionPojo)it7.next();
                        	
                        	status =pp.getStatus();
                        	
                        	System.out.println("status ="+status);
                        	
                        	
                        }
                        
                        if(status.equals("Reject"))
                        	
                    	{
                    		System.out.println("Data Owner Rejected This User");
                    	}
                        else
                        {	
                     
                      %>
                      
                      <tr>
                      <td><%=Ownername%></td>
                     
                      
                      <%
                      
                      if(status.equals("ALLOWED"))
                      {
                      %>
                      
                     <td> <%=PrivateKey %></td>
                     <%}else{ %> 
                      
                     <td>*****</td> 
                     
                     <%} %> 
                     
                     
                      </tr>


                      <% } 
                      
                      }
                      
                      %>
                  
                               </table>
								</div>
							</section>

						<!-- Four -->
							<section id="four">
								<div class="container">
									<h3>User Revocation Form</h3>
									
									<br>
									<form method="post" action="UserRevocation">
										<div class="row uniform">
											<div class="6u 12u(xsmall)" style="color: red"><input type="text" name="Username" id="name" placeholder="Name" value=<%=username %> /></div>
											<div class="6u 12u(xsmall)"><input type="hidden" name="email" id="email" placeholder="Email" /></div>
										</div>
										<div class="row uniform">
											<div class="12u" style="color: blue"><input type="text" name="Subject" id="subject" placeholder="Subject" /></div>
										</div>
										<div class="row uniform">
											<div class="12u" style="color: blue"><textarea name="Reason" id="message" placeholder="Reason" rows="6"></textarea></div>
										</div>
										<div class="row uniform">
											<div class="12u">
												<ul class="actions">
													<li><input type="submit" class="special" value="Send Message" /></li>
													<li><input type="reset" value="Reset Form" /></li>
												</ul>
											</div>
										</div>
									</form>
								</div>
							</section>

						<!-- Five -->
						<!--
							<section id="five">
								<div class="container">
									<h3>Elements</h3>

									<section>
										<h4>Text</h4>
										<p>This is <b>bold</b> and this is <strong>strong</strong>. This is <i>italic</i> and this is <em>emphasized</em>.
										This is <sup>superscript</sup> text and this is <sub>subscript</sub> text.
										This is <u>underlined</u> and this is code: <code>for (;;) { ... }</code>. Finally, <a href="#">this is a link</a>.</p>
										<hr />
										<header>
											<h4>Heading with a Subtitle</h4>
											<p>Lorem ipsum dolor sit amet nullam id egestas urna aliquam</p>
										</header>
										<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing blandit tempus accumsan.</p>
										<header>
											<h5>Heading with a Subtitle</h5>
											<p>Lorem ipsum dolor sit amet nullam id egestas urna aliquam</p>
										</header>
										<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing blandit tempus accumsan.</p>
										<hr />
										<h2>Heading Level 2</h2>
										<h3>Heading Level 3</h3>
										<h4>Heading Level 4</h4>
										<h5>Heading Level 5</h5>
										<h6>Heading Level 6</h6>
										<hr />
										<h5>Blockquote</h5>
										<blockquote>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum dolor sit amet nullam adipiscing eu felis.</blockquote>
										<h5>Preformatted</h5>
										<pre><code>i = 0;

	while (!deck.isInOrder()) {
	    print 'Iteration ' + i;
	    deck.shuffle();
	    i++;
	}

	print 'It took ' + i + ' iterations to sort the deck.';</code></pre>
									</section>

									<section>
										<h4>Lists</h4>
										<div class="row">
											<div class="6u 12u(xsmall)">
												<h5>Unordered</h5>
												<ul>
													<li>Dolor pulvinar etiam magna etiam.</li>
													<li>Sagittis adipiscing lorem eleifend.</li>
													<li>Felis enim feugiat dolore viverra.</li>
												</ul>
												<h5>Alternate</h5>
												<ul class="alt">
													<li>Dolor pulvinar etiam magna etiam.</li>
													<li>Sagittis adipiscing lorem eleifend.</li>
													<li>Felis enim feugiat dolore viverra.</li>
												</ul>
											</div>
											<div class="6u 12u(xsmall)">
												<h5>Ordered</h5>
												<ol>
													<li>Dolor pulvinar etiam magna etiam.</li>
													<li>Etiam vel felis at lorem sed viverra.</li>
													<li>Felis enim feugiat dolore viverra.</li>
													<li>Dolor pulvinar etiam magna etiam.</li>
													<li>Etiam vel felis at lorem sed viverra.</li>
													<li>Felis enim feugiat dolore viverra.</li>
												</ol>
												<h5>Icons</h5>
												<ul class="icons">
													<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
													<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
													<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
													<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
													<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
													<li><a href="#" class="icon fa-tumblr"><span class="label">Tumblr</span></a></li>
												</ul>
											</div>
										</div>
										<h5>Actions</h5>
										<ul class="actions">
											<li><a href="#" class="button special">Default</a></li>
											<li><a href="#" class="button">Default</a></li>
											<li><a href="#" class="button alt">Default</a></li>
										</ul>
										<ul class="actions small">
											<li><a href="#" class="button special small">Small</a></li>
											<li><a href="#" class="button small">Small</a></li>
											<li><a href="#" class="button alt small">Small</a></li>
										</ul>
										<div class="row">
											<div class="3u 6u(medium) 12u$(xsmall)">
												<ul class="actions vertical">
													<li><a href="#" class="button special">Default</a></li>
													<li><a href="#" class="button">Default</a></li>
													<li><a href="#" class="button alt">Default</a></li>
												</ul>
											</div>
											<div class="3u 6u$(medium) 12u$(xsmall)">
												<ul class="actions vertical small">
													<li><a href="#" class="button special small">Small</a></li>
													<li><a href="#" class="button small">Small</a></li>
													<li><a href="#" class="button alt small">Small</a></li>
												</ul>
											</div>
											<div class="3u 6u(medium) 12u$(xsmall)">
												<ul class="actions vertical">
													<li><a href="#" class="button special fit">Default</a></li>
													<li><a href="#" class="button fit">Default</a></li>
													<li><a href="#" class="button alt fit">Default</a></li>
												</ul>
											</div>
											<div class="3u 6u$(medium) 12u$(xsmall)">
												<ul class="actions vertical small">
													<li><a href="#" class="button special small fit">Small</a></li>
													<li><a href="#" class="button small fit">Small</a></li>
													<li><a href="#" class="button alt small fit">Small</a></li>
												</ul>
											</div>
										</div>
									</section>

									<section>
										<h4>Table</h4>
										<h5>Default</h5>
										<div class="table-wrapper">
											<table>
												<thead>
													<tr>
														<th>Name</th>
														<th>Description</th>
														<th>Price</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Item One</td>
														<td>Ante turpis integer aliquet porttitor.</td>
														<td>29.99</td>
													</tr>
													<tr>
														<td>Item Two</td>
														<td>Vis ac commodo adipiscing arcu aliquet.</td>
														<td>19.99</td>
													</tr>
													<tr>
														<td>Item Three</td>
														<td> Morbi faucibus arcu accumsan lorem.</td>
														<td>29.99</td>
													</tr>
													<tr>
														<td>Item Four</td>
														<td>Vitae integer tempus condimentum.</td>
														<td>19.99</td>
													</tr>
													<tr>
														<td>Item Five</td>
														<td>Ante turpis integer aliquet porttitor.</td>
														<td>29.99</td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="2"></td>
														<td>100.00</td>
													</tr>
												</tfoot>
											</table>
										</div>

										<h5>Alternate</h5>
										<div class="table-wrapper">
											<table class="alt">
												<thead>
													<tr>
														<th>Name</th>
														<th>Description</th>
														<th>Price</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Item One</td>
														<td>Ante turpis integer aliquet porttitor.</td>
														<td>29.99</td>
													</tr>
													<tr>
														<td>Item Two</td>
														<td>Vis ac commodo adipiscing arcu aliquet.</td>
														<td>19.99</td>
													</tr>
													<tr>
														<td>Item Three</td>
														<td> Morbi faucibus arcu accumsan lorem.</td>
														<td>29.99</td>
													</tr>
													<tr>
														<td>Item Four</td>
														<td>Vitae integer tempus condimentum.</td>
														<td>19.99</td>
													</tr>
													<tr>
														<td>Item Five</td>
														<td>Ante turpis integer aliquet porttitor.</td>
														<td>29.99</td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="2"></td>
														<td>100.00</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</section>

									<section>
										<h4>Buttons</h4>
										<ul class="actions">
											<li><a href="#" class="button special">Special</a></li>
											<li><a href="#" class="button">Default</a></li>
											<li><a href="#" class="button alt">Alternate</a></li>
										</ul>
										<ul class="actions">
											<li><a href="#" class="button special big">Big</a></li>
											<li><a href="#" class="button">Default</a></li>
											<li><a href="#" class="button alt small">Small</a></li>
										</ul>
										<ul class="actions fit">
											<li><a href="#" class="button special fit">Fit</a></li>
											<li><a href="#" class="button fit">Fit</a></li>
											<li><a href="#" class="button alt fit">Fit</a></li>
										</ul>
										<ul class="actions fit small">
											<li><a href="#" class="button special fit small">Fit + Small</a></li>
											<li><a href="#" class="button fit small">Fit + Small</a></li>
											<li><a href="#" class="button alt fit small">Fit + Small</a></li>
										</ul>
										<ul class="actions">
											<li><a href="#" class="button special icon fa-download">Icon</a></li>
											<li><a href="#" class="button icon fa-download">Icon</a></li>
											<li><a href="#" class="button alt icon fa-check">Icon</a></li>
										</ul>
										<ul class="actions">
											<li><span class="button special disabled">Special</span></li>
											<li><span class="button disabled">Default</span></li>
											<li><span class="button alt disabled">Alternate</span></li>
										</ul>
									</section>

									<section>
										<h4>Form</h4>
										<form method="post" action="#">
											<div class="row uniform">
												<div class="6u 12u(xsmall)">
													<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />
												</div>
												<div class="6u 12u(xsmall)">
													<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />
												</div>
											</div>
											<div class="row uniform">
												<div class="12u">
													<div class="select-wrapper">
														<select name="demo-category" id="demo-category">
															<option value="">- Category -</option>
															<option value="1">Manufacturing</option>
															<option value="1">Shipping</option>
															<option value="1">Administration</option>
															<option value="1">Human Resources</option>
														</select>
													</div>
												</div>
											</div>
											<div class="row uniform">
												<div class="4u 12u(medium)">
													<input type="radio" id="demo-priority-low" name="demo-priority" checked>
													<label for="demo-priority-low">Low Priority</label>
												</div>
												<div class="4u 12u(medium)">
													<input type="radio" id="demo-priority-normal" name="demo-priority">
													<label for="demo-priority-normal">Normal Priority</label>
												</div>
												<div class="4u 12u(medium)">
													<input type="radio" id="demo-priority-high" name="demo-priority">
													<label for="demo-priority-high">High Priority</label>
												</div>
											</div>
											<div class="row uniform">
												<div class="6u 12u(medium)">
													<input type="checkbox" id="demo-copy" name="demo-copy">
													<label for="demo-copy">Email me a copy of this message</label>
												</div>
												<div class="6u 12u(medium)">
													<input type="checkbox" id="demo-human" name="demo-human" checked>
													<label for="demo-human">I am a human and not a robot</label>
												</div>
											</div>
											<div class="row uniform">
												<div class="12u">
													<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
												</div>
											</div>
											<div class="row uniform">
												<div class="12u">
													<ul class="actions">
														<li><input type="submit" value="Send Message" /></li>
														<li><input type="reset" value="Reset" class="alt" /></li>
													</ul>
												</div>
											</div>
										</form>
									</section>

									<section>
										<h4>Image</h4>
										<h5>Fit</h5>
										<span class="image fit"><img src="images/banner.jpg" alt="" /></span>
										<div class="box alt">
											<div class="row 50% uniform">
												<div class="4u"><span class="image fit"><img src="images/pic01.jpg" alt="" /></span></div>
												<div class="4u"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
												<div class="4u"><span class="image fit"><img src="images/pic03.jpg" alt="" /></span></div>
											</div>
											<div class="row 50% uniform">
												<div class="4u"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
												<div class="4u"><span class="image fit"><img src="images/pic03.jpg" alt="" /></span></div>
												<div class="4u"><span class="image fit"><img src="images/pic01.jpg" alt="" /></span></div>
											</div>
											<div class="row 50% uniform">
												<div class="4u"><span class="image fit"><img src="images/pic03.jpg" alt="" /></span></div>
												<div class="4u"><span class="image fit"><img src="images/pic01.jpg" alt="" /></span></div>
												<div class="4u"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
											</div>
										</div>
										<h5>Left &amp; Right</h5>
										<p><span class="image left"><img src="images/avatar.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
										<p><span class="image right"><img src="images/avatar.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
									</section>

								</div>
							</section>
						-->

					</div>

				<!-- Footer -->
					<section id="footer">
						<div class="container">
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</section>

			</div>

		<!-- Scripts -->
			<script src="assets2/js/jquery.min.js"></script>
			<script src="assets2/js/jquery.scrollzer.min.js"></script>
			<script src="assets2/js/jquery.scrolly.min.js"></script>
			<script src="assets2/js/skel.min.js"></script>
			<script src="assets2/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets2/js/main.js"></script>

	</body>
</html>