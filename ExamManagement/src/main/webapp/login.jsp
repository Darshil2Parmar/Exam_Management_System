<%@page import="com.exam.entity.Messages" %>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>


		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="ISO-8859-1">
			<title>Exam Management Login</title>
			 <link rel="icon" type="image/x-icon" href="ks-logo.ico">
			<link rel="stylesheet" type="text/css" href="css/style12F.css">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		</head>
	<style>
			    .errspan {
        float: right;
    margin-right: 21px;
    margin-top: -39px;
    position: relative;
    z-index: 2;
    color: black;
    }
    @media (max-width: 991.98px){
    	form {
    background-color: #FFFFFF;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 10px 33px;
    height: 100%;
    width: 376px;
    text-align: center;
    border-radius: 18px;
}
.container {
        background-color: #fff;
    background-color: #fff;
    border-radius: 40px;
    box-shadow: 0 14px 28px rgb(0 0 0 / 25%), 0 10px 10px rgb(0 0 0 / 22%);
    position: relative;
    overflow: hidden;
    width: 50%;
    padding: 1% 0%;
    min-height: 486px;
}
    }
	</style>
		<body>
			<div class="container" id="container">

				<form action="LoginServlet" method="post" class="login">
					<h1 class="login-h1">Login</h1>




					<span style="text-transform: uppercase;">use your account</span>

					<% Messages m=(Messages) session.getAttribute("msg"); if (m !=null) { %>

						<span class="<%=m.getCssClass()%>">
							<%=m.getContent()%>
						</span>
						<% session.removeAttribute("msg"); } %>

							<hr style="width: 100%;border: 4px solid #ffffff;border-radius: 31px;padding: 2% 0%;background: linear-gradient(to left, #ffd3f8, #fff8b6)">

							
							<div class="aarigato">
							<select title="Select User Type" name="utype" id="userType" class="userType" onchange="getData();"  required">
								<option value="" disabled selected>Select Type</option>
								<option value="faculty">Faculty</option>
								<option value="student">Student</option>
							</select>

							<!-- ----------------------textboxes----------------- -->
							<div id="meS">
								<input class="input" type="text" id="uid" title="Enter User Id" name="uname" placeholder="First Select Type"
								oninput="allnumeric(this.value)" required ><span class="fa fa-user errspan"></span> <input title="Enter Password" class="input" type="password"
								name="password" id="myInput" placeholder="Your Password" required ><span title="Show Password" id="togglePassword" class="fa fa-eye errspan"></span> 	
							</div>
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
								var selectBox1 = document.getElementById("userType");
								function getData() {
									var selectBox = document.getElementById("userType");
									var selectedValue = selectBox.options[selectBox.selectedIndex].value;
									//alert(selectedValue);
									if (selectedValue == "faculty") {
										var input = document.getElementById("uid");
										input.type="email";
										input.value ='';
										input.placeholder = "Enter Faculty Id";
									} else {
										var input = document.getElementById("uid");
										input.placeholder = "Enter Student Id";
										input.type="text";
										input.value='';
									}
								}

								var ids = document.getElementById("uname");
								function isNum(val) {
									return !isNaN(val)
								}

								function allnumeric(inputtxt) {
									var type = document.getElementById("utype");

									if (selectBox1.value == "student") {
										if (isNum(inputtxt) == false) {
											//alert('Please enter only 1-9 digit');
											document.getElementById('subme').style.display = 'none';
										}
										else {
											document.getElementById('subme').style.display = 'block';
											//alert("no need to check");
										}
									} else {
										document.getElementById('subme').style.display = 'block';
									}

								}
							</script>



							<!-- <a class="btn-msg" href="#">Forgot your password? click me</a> -->

							<button title="Log-In" name="submit" id="subme" type="submit">Log In</button>
				</form>
			</div>


		</body>

		</html>