<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Doctor"%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
</html>