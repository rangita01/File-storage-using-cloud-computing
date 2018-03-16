<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Data Owner Register Form</title>
 <script type="text/javascript" src="/CLOUD-21/js/validation.js"></script>   
    
    <link rel="stylesheet" href="/CLOUD-21/css/reset.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="/CLOUD-21/css/style.css">

    
    
    
  </head>

  <body>

    
<!-- Form Mixin-->
<!-- Pen Title-->
<div class="pen-title">
  <h1>Data Owner Register Form</h1><span><a href="DataOwnerLoginPage">Sign in</a>  &&  <a href="index.jsp">Home Page</a></span>
</div>
<!-- Form Module-->
<div class="module form-module">
   <div ><i ></i>
   
  </div> 
  
  <div class="form">
    <h2>Create an account</h2>
    <form  action="DataOwnerRegister" method="post" name="myform" onsubmit="return validateform()" enctype="multipart/form-data">
      <input type="text" placeholder="Username" name="username" required="required">
      <input type="password" placeholder="Password" name="password" required="required">
       <input type="password" placeholder="Confirm Password" name="repassword" required="required">
      <input type="email" placeholder="Email Address" name="email" required="required">
      <input type="text" placeholder="Designation" name="designation" required="required">
      <input type="file" placeholder="Choose ur profile pic" name="dp" required="required">
      <select name="gender"  style="width:240px;height: 35px;">
      <option value="" >Choose Your Gender</option>
         <option value="Male">Male</option>
         <option value="Female">Female</option>
         </select><br></br>
      <input type="number" placeholder="Phone Number" name="phone" required="required">
      <input type="text" placeholder="Address" name="address" required="required">
      <input type="submit" value="Register">
    </form>
  </div>
  
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='js/da0415260bc83974687e3f9ae.js'></script>

        <script src="js/index.js"></script>

    
    
    
  </body>
</html>
