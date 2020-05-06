<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Doctor"%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

<title>Doctor Details</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/doctor.js"></script>

<style>
body  {
  background-image: url("a1.jpeg");
  background-color: #cccccc;
}
</style>
</head>

<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <ul>
      <li><i class="fa fa-clock-o"></i> Mon. - Fri. 8am - 5pm</li>
      <li><i class="fa fa-phone"></i> +00 (123) 256 7890</li>
      <li><i class="fa fa-envelope-o"></i> heathcare@support.com</li>
      <li><a href="#"><i class="fa fa-lg fa-home"></i></a></li>
      <li><a href="logn.html" title="Login"><i class="fa fa-lg fa-sign-in"></i></a></li>
      <li><a href="sgnup.html" title="Sign Up"><i class="fa fa-lg fa-edit"></i></a></li>
    </ul>
  </div>
</div>

<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <div id="logo" class="fl_left">
      <h1><a href="index.html">HEALTH CARE</a></h1>
    </div>
  </header>
</div>
  <div class="wrapper row2">
    <nav id="mainav" class="hoc clear"> 
      <ul class="clear">
        <li class="active"><a href="Home.html">Home</a></li>
        <li><a href="doctor.jsp">Doctor</a></li>
		 <li><a href="#">Patient</a></li>
        <li><a href="#">Testing</a></li>
        <li><a href="#">Channeling</a></li>
		<li><a href="#">Payment</a></li>
    </nav>
  </div>
  
</div>

<body>
<div class="container">  
		<div class="row">
			<div class="col-6">
				<h1>Doctor Details</h1>
				<p>Please File this form.</p>
				<form id="formDoctor" name="formDoctor" style="font-weight: bold">
					Doctor Name: 
					<input id="doctorName" name="doctorName" type="text" placeholder="Enter the doctor name" class="form-control form-control-sm" >
					<br> Age:
					<input id="doctorAge" name="doctorAge" type="text" placeholder="Enter the age" class="form-control form-control-sm"> 
					<br> Specialization: 
					<input id="doctorSpe" name="doctorSpe" type="text" placeholder="Enter the specialization" class="form-control form-control-sm"> 
					<br> Contact Number: 
					<input id="doctorContact" name="doctorContact" type="text" placeholder="Enter the valid contact number" class="form-control form-control-sm">
					<br> Email: 
					<input id="doctorEmail" name="doctorEmail" type="text" placeholder="Enter the valid email" class="form-control form-control-sm">
					<br> 
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
					<input type="hidden" id="hidDoctorIDSave" name="hidDoctorIDSave" value="">
				</form>
				
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divDoctorGrid">
					<%
					Doctor docObj = new Doctor();
					out.print(docObj.readDoctor());
					%>
				</div>
			</div>
		</div>
	</div>


</body>


<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
   
    <div class="one_third first">
      <h6 class="heading">CONTACT US</h6>
      <ul class="nospace btmspace-30 linklist contact">
        <li><i class="fa fa-map-marker"></i>
          <address>
          Street Name &amp; SLIIT, New Kandy Road, Malabe
          </address>
        </li>
        <li><i class="fa fa-phone"></i> +00 (123) 256 7890</li>
        <li><i class="fa fa-envelope-o"></i> heathcare@support.com</li>
      </ul>
      <ul class="faico clear">
        <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
        <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
        <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
        <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
        <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
        <li><a class="faicon-vk" href="#"><i class="fa fa-vk"></i></a></li>
      </ul>
    </div>
    <div class="one_third">
      <h6 class="heading">ABOUT US</h6>
      <ul class="nospace linklist">
        <li>
          <article>
            <h2 class="nospace font-x1"><a href="#">HEALTH CARE</a></h2>
            <time class="font-xs block btmspace-10" datetime="2045-04-06">Friday, 6<sup>th</sup> May 2020</time>
            <p class="nospace">We here to supply a our service best for your needs. And we happy to care about your self.</p>
          </article>
        </li>
      </ul>
    </div>
    <div class="one_third">
      <h6 class="heading">inquery</h6>
      <p class="nospace btmspace-30">If you have any inquery. Please contact us. Using following foram.</p>
      <form method="post" action="#">
        <fieldset>
          <legend>Newsletter:</legend>
          <input class="btmspace-15" type="text" value="" placeholder="Name">
          <input class="btmspace-15" type="text" value="" placeholder="Email">
          <button type="submit" value="submit">Submit</button>
        </fieldset>
      </form>
    </div>
  </footer>
</div>
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <p class="fl_left">Copyright &copy; 2020 - All Rights Reserved - <a href="#">HEALTH CARE</a></p>
    <p class="fl_right">Template by <a target="_blank" href="https://www.os-templates.com/" title="Free Website Templates">Methsarani Perera</a></p>
  </div>
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>