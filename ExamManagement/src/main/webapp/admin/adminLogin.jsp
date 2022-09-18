<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.exam.entity.Messages"%>

<!DOCTYPE html>
<html lang="en">


<head>

    

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap2.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="../css/style12F.css">
	
    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="icon" type="image/x-icon" href="ks-logo.ico">
	
   
 

 
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>	

<script src="../js/jquery.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/1.0.0-alpha.2/classic/ckeditor.js"></script>

<style>

.panel-default{
	margin-top:50%;
}
body{
	    background: linear-gradient(88deg, #ffa7f8,#ffff6c, #bafaff);
}
.errspan {
    float: right;
    margin-right: 21px;
    margin-top: -39px;
    position: relative;
    z-index: 2;
    color: black;
}
</style>
 
</head>

<body>

<!-- Page Content -->

							


								<div class="container" id="container">
		<form action="../AdminServlet" method="post" class="login">
			<h1 class="login-h1"><i class="fa fa-user fa-1x"></i><br>Admin Login</h1>




			<span>use your account</span>

			<%
			
			Messages m = (Messages) session.getAttribute("msg");
			if (m != null) {
			%>

			<span class="<%=m.getCssClass()%>"> <%=m.getContent()%>
			</span>
			<%
			session.removeAttribute("msg");
			}
			%>

			<hr
				style="width: 100%;border: 4px solid #ffffff;border-radius: 31px;padding: 2% 0%;background: linear-gradient(to left, #ffd3f8, #fff8b6);">

			<div class="aarigato">
			 <input class="input" type="text" id="uid"  title="Enter Your Id" name="uname"
				placeholder="Enter Your Id" required /><span class="fa fa-user errspan"></span> 
				
				<input class="input"
				type="password" name="password" id="myInput" placeholder="Password"
				required /><span title="Show Password" id="togglePassword" class="fa fa-eye errspan"></span>
			</div>	
				
			<div class="show">
				<!-- <input type="checkbox" class="check" onclick="myFunction()"
					title="show password"><span>show password</span> -->
			</div>
		

			<script type="text/javascript">
			const togglePassword = document.querySelector('#togglePassword');
			  const password = document.querySelector('#myInput');

			  togglePassword.addEventListener('click', function (e) {
			    // toggle the type attribute
			    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
			    password.setAttribute('type', type);
			    // toggle the eye slash icon
			    this.classList.toggle('fa-eye-slash');
			});
			
			
				function myFunction() {
					var x = document.getElementById("myInput");
					if (x.type === "password") {
						x.type = "text";
					} else {
						x.type = "password";
					}
				}
			</script>



			<!-- <a class="btn-msg" href="#">Forgot your password? click me</a> -->

			<button name="submit" type="submit">Log In</button>
		</form>
	</div>
    
    
    <!-- /#wrapper -->

    <!-- jQuery -->
  

  
     <script src="js/scripts.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>