<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<link rel="icon" type="image/x-icon" href="ks-logo.ico">
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>ExamPaper : Exam Management</title>
		<%@ include file="pages/headers.jsp" %>


			<style>
				.card-small {
					position: relative;
				    display: -webkit-box;
				    display: -ms-flexbox;
				    display: flex;
				    -webkit-box-orient: vertical;
				    -webkit-box-direction: normal;
				    -ms-flex-direction: column;
				    flex-direction: column;
				    min-width: 0;
				    width: 69%;
				    word-wrap: break-word;
				    background-color: #fff;
				    background-clip: border-box;
				    border: 1px solid rgba(0, 0, 0, 0.125);
				    border-radius: 1.25rem;
				    box-shadow: -1px 18px 20px 0px silver;
				    padding: 0.2% 2%;
				    margin: 1% auto;
				}

				.noCOunt {
				    background-color: #ffffff;
				    float: left;
				    padding: 1% 2%;
				    border-radius: 2vh;
				    margin: 0% 1%;
				    box-shadow: 0px 2px 13px 3px #c2c2c2;
				}
	
				.number {
				   	background-color: #ffffff;
				    float: right;
				    padding: 1% 2%;
				    border-radius: 3vh;
				    margin: 0% 1%;
				    width: 25%;
				    outline: none;
				    border: 3px solid #fec8fa !important;
				    box-shadow: 0px 0px 15px 1px #bebebe !important;
				}


				.number:hover,
				.number:focus {
					box-shadow: 0px 0px 6px 1px #aeaeae;
				}
								.question:hover,
				
				.question:focus,
				{
					box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
				}
				#option{
				    box-shadow: 0px 0px 12px -3px #979797;
				    padding: 1% 4%;
				    margin: 3% 1%;
				   background: white;
				    border-radius: 4vh;
				    font-size: 3vh;
				    outline: none;
				    border: 3px solid white;
				    color: black !important;
				    padding: 2% 5%;
				    width: 83%;
				    margin: 2% 0%;
				    border: 4px solid #ffcaf9;
				    border-radius: 3vh;
				    font-size: 2.5vh;
				    box-shadow: 0px 0px 11px 0px #d0d0d0;
				    outline: #fecbff;
				}
				.question:hover,.question:focus,.number:focus,.number:hover,#option:hover,#option:focus{
				    border: 3px solid white !important;
				    color: #000000 !important;
				    outline: solid;
				    outline-color: #ffffff;
				    font-weight: 600;
				    box-shadow: 0px 0px 12px 3px #ffc0f6 !important;
				    background: linear-gradient(to right, #ffcaff, #fff7ae);
				}
				.question {
					box-shadow: 0px 0px 12px -3px #353535;
				    padding: 0.5% 1%;
				    width: -webkit-fill-available;
				    margin: 3% 1%;
				    background: white;
				    border-radius: 3vh;
				    font-size: 3.0vh;
				    outline: none;
				    border: 5px solid #ffcbfc !important;
				    color: black !important;
				}
.mySubIsAdd {
	border-radius: 2vh;
    border: 2px solid white !important;
    background: linear-gradient(90deg, #abfffa 0%, #f8ffba 51%, #ffb8fa 100%);
    font-size: 12px;
    color: black;
    outline-color: white;
    font-weight: bold;
    background-size: 200% auto;
    padding: 2% 3%;
    letter-spacing: 1px;
    margin: auto;
    width: 33%;
    text-transform: uppercase;
    transition: all 2s;
    box-shadow: 0px 0px 16px 1px #95ffe9;
    transition-timing-function: cubic-bezier(0.68, -0.55, 0.27, 1.55);
}

.mySubIsAdd:hover {
	transform: scale(1.03);
    box-shadow: 0px 0px 7px 4px rgb(245 185 255);
    background-position: top right;
}				
			</style>

	<body>
		<% int totMark=Integer.parseInt(request.getParameter("marks")); %>
			<%--<% String type2=request.getParameter("uname"); %>
				<% String type3=request.getParameter("password"); %> --%>
					<% int cou=Integer.parseInt(request.getParameter("count")); %>

						<section>
						<div class=" container">
							<div class="card-small scrollbar-near-moon" id="card-first" style="">
								<div class="card-body">
										<h4 class="section1-fog">
											<strong>Instruction For Paper : </strong>
										</h4>
										<hr>
										<div id="anouncements-contain">
											<ul>
												<li>* All Input Must Not Empty.</li>
												<li>* About Four Option There Must be one Answer.</li>
												<li>* Value Of Answer Chosen by Radio Button.</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</section>
						<br>

						<form action="QuestionMcqServlet" method="post">

					<!-- 		<div id=" OptionValue" class="OptionValue"> -->
					<div class=" container">
							<div class="card-small scrollbar-near-moon" id="card-first" style="">
								<div class="card-body">
								<div class="flex-parent-element">
									<div id="noCOunt" class="flex-child-element noCOunt">
										<%=cou%>&nbsp;)
									</div>
									<% System.out.println("here count " + cou);
				%>
				<span id=" hid"></span>
										<!-- javascript for totmark < inputtype -->
								<input type="number" id="qm" placeholder="Mark Of Question" name="mark"
											class="number" onchange="fun();" required />

								</div>
								<textarea name="question" id="question" class="question" rows="3"
									placeholder="Describe Question here..." required></textarea>
								<br> 
								<div class="row">
									<div class="col">
										<input type="radio" value="a" name="QuesOption" id=""onclick="show1();">&nbsp;
										<input type="text" name="a" id="option" placeholder="Option (A)" required />
									</div>
									<div class="col">
										<input type="radio" value="b" name="QuesOption" id="" onclick="show1();">&nbsp;
										<input type="text" name="b" id="option" placeholder="Option (B)" required />
									</div>
								</div>
								<div class="row">
									<div class="col">
										<input type="radio" value="c" name="QuesOption" id="" onclick="show1();">&nbsp;
										<input type="text" name="c" id="option"	placeholder="Option (C)" required />
									</div>
									<div class="col">	
										<input type="radio" value="d" name="QuesOption" id="" onclick="show1();">&nbsp;
										<input type="text" name="d" id="option" placeholder="Option (D)" required />
									</div>
								</div>
								<br> 
								<input type="hidden" name="totmark" id="nm" value="<%=totMark%>">
								<input type="hidden" name="count" id="ls" value="<%=cou%>">

								<script type="text/javascript">
									var v = document.getElementById("qm");
									var m = document.getElementById("nm");
									var sp = document.getElementById("hid");
									//v.enabled = true;
									function fun() {
										if (m.value >= v.value) {
											//v.disabled = true;
											//alert("Value of m" + m.value);
										} else {
											sp.value = m.value + " must > than " + v.value;
										}
									}



								</script>
								<input type="submit" id="subbtn" class="mySubIsAdd" name="submit" value="Add Question"
									style="display:none;" />

								<% %>
							</div>
							</div>
							</div>
						
						</form>

						<br>

						<script>
							function show1() {
								document.getElementById('subbtn').style.display = 'block';
							}

							function fileValidation() {
								var fileInput = document.getElementById('marks');

								var filePath = fileInput.value;

								// Allowing file type
								var allowedExtensions = /(\.pdf|\.cs)$/i;

								if (!allowedExtensions.exec(filePath)) {
									alert('Invalid file type');
									fileInput.value = '';
									return false;
								}
							}

							function myFunction() {
								var x = document.getElementById("myTopnav");
								if (x.className === "topnav") {
									x.className += " responsive";
								} else {
									x.className = "topnav";
								}
							}
						</script>
						<br>
						<%@ include file="pages/footer.jsp" %>