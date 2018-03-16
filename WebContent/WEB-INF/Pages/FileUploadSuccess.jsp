<!DOCTYPE html>

<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Success Page</title>
    <!--REQUIRED STYLE SHEETS-->
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLE CSS -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Ruluko' rel='stylesheet' type='text/css' />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    
   function redirect()
    {
    	setTimeout(function(){document.getElementById("forward").submit();},3000);
    }
    
    
    </script>
</head>
<body onload="redirect()">

<form action="DataOwnerHomepage" id="forward">

</form>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
            </div>
            <!-- Collect the nav links for toggling -->
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!--End Navigation -->



    <!--About Section-->
    
    <!--End About Section-->

    <!-- Services Section-->
    
     
    <br></br>
    <section class="for-full-back color-white" id="services">
        <div class="container">

            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <br><br><br><br><br><br><br>
               <center>    <img alt="" src="/CLOUD-21/images2/ps_succes.gif">     </center>
                   
                </div>
           
            </div>
            
           <%--  <%
            
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy ");
    		
            Date date = new Date();
    		
    		String currentDate=dateFormat.format(date);
            
            System.out.println("currentDate ="+currentDate);
            
            %> --%>
            
           
            
           
           
                   
                
                <!-- <div class="col-md-3 ">

                    <div class="about-div text-center">


                          <i class="fa fa-envelope-o fa-4x color-blue"></i>
                        <h3>What We Deliver ? </h3>
                      
                         <p>
                           Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                       </p>
                    </div>

                </div> -->
            
       


    </section>  

     <!--End Services Section-->

    <!-- Free Section -->

    <!-- <section class="for-full-back color-light " id="free-text" >
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <h1>FREE TEXT SECTION</h1>
                    <h4>
                        <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                        </strong>
                    </h4>
                </div>

            </div>
            <div class="row text-center space-pad">
                <div class="col-md-4 ">

                    <div class="free-div">
                        <h3># GO LIVE TEXT</h3>
                            </div>

                </div>
                <div class="col-md-4 ">

                    <div class="free-div">
                         <h3># GO LIVE TEXT</h3>               

                    </div>

                </div>
                <div class="col-md-4 ">

                    <div class="free-div">
                          <h3># GO LIVE TEXT</h3>                       

                    </div>

                </div>
                
            </div>
                    </div>
    </section> -->    
    <!--End Free Section -->

    <!-- Contact Section -->
    <!-- <section class="for-full-back color-white " id="contact">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <h2>New Employ's Insert</h2>
                   
                </div>

            </div>

            <div class="row">
               
                <div class="col-md-7">
                    <h2>Add Personal Details :</h2>
                    <br>
                    
                    <form action="EmployInsert" method="post">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                 <h3> Employ Name : </h3>
                                 <input type="text" class="form-control" required="required" placeholder="Employ Name" name="EmployName">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                  <h3>Desigination : </h3>
                                  <input type="text" class="form-control" required="required" placeholder="Desigination" name="Desigination">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                 <h3> E-mail Address : </h3>
                                  <input type="text" class="form-control" required="required" placeholder="E-mail Address" name="EmailAddress">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                  <h3>Salary : </h3>
                                   <input type="text" class="form-control" required="required" placeholder="Salary" name="Salary">
                                </div>
                            </div>
                             <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                 <h3> Date Of Birth :</h3>
                                 <input type="text" class="form-control" required="required" placeholder="Salary" name="DateOfBirth">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                 <h3> Date Of Joining : </h3>
                                 <input type="text" class="form-control" required="required" placeholder="Salary" name="DateOfJoining">
                                </div>
                            </div>
                             <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                   <h3>Gender</h3> 
                                   <input type="text" class="form-control" required="required" placeholder="Gender" name="Gender">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                   <h3>Mobile Number</h3> 
                                   <input type="text" class="form-control" required="required" placeholder="Email address" name="MobileNumber">
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <textarea   required="required" class="form-control" rows="3" placeholder="Address" name="Address1"></textarea>
                                </div>
                                <br>
                                
                                <center>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default">Submit Request</button>
                                </div>
                                </center>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </section> -->
    
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
     
    <br></br>

    <!--End Contact Section -->
    <!--footer Section -->
    <div class="for-full-back " id="footer">
       
         
    </div>
    <!--End footer Section -->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP CORE SCRIPT   -->
    <script src="assets/plugins/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
    <script type="text/javascript" src="js/Attributes.js"></script>

</body>
</html>
