<%@page import="com.exam.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.exam.dao.*"%>
<%@ page import="com.exam.entity.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Faculty : Exam Management</title>
<%@ include file="pages/headers.jsp"%>
</head>
<style>
.success-top {
	color: white;
	background: linear-gradient(145deg, #b0bcff, #84ffb4 62%);
	padding: 1% 1%;
	margin: auto !important;
	border: 3px solid white;
	border-radius: 12px;
	font-weight: 900;
	box-shadow: 0px 0px 5px 4px #cdffb9 !important;
}

.unsuccess-top {
	color: white;
	background: linear-gradient(to right, #ff97f0, #ffff4e);
	padding: 1% 1%;
	margin: auto !important;
	font-weight: 900;
	border: 3px solid white;
	border-radius: 12px;
	box-shadow: 0px 0px 5px 4px #fff27c !important;
}

.suc {
	padding: 4% 2%;
	border-radius: 16px;
	color: white;
	background: linear-gradient(to right, #00ff41b0, #f5ff46b0);
	font-size: 14px;
	margin: 1% 0% 1% 0%;
	width: 100%;
	font-weight: 500;
	border: none;
	box-shadow: 0px 0px 15px 0px rgb(99, 255, 0);
}

.card-body-span {
	margin: 1% 1%;
	padding: 1% 1%;
}

.suc-me-up {
	padding: 1% 2%;
	border-radius: 16px;
	color: black;
	background: linear-gradient(to right, #56ff81b0, #f4ff2fb0);
	font-size: 14px;
	margin: 1% 0% 1% 0%;
	width: 100%;
	font-weight: 500;
	border: none;
	box-shadow: 0px 0px 20px -5px rgb(99, 255, 0);
}
</style>

<body>

	<div class=" container">
		<div class="card scrollbar-near-moon">
			<div class="card-body">
				<h4 id="section1">
					<strong>Recent Uploaded</strong>
				</h4>
				<hr>
				<%
				System.out.println("In FACULTY MAIL ID : " + user.getEmail());
				ArrayList<UploadMark> allUser = null;
				if (user.getEmail() != null) {
					MarksUploadDao rd = new MarksUploadDao(ConnectionProvider.getConnection());
					allUser = rd.getFacUploadation(user.getEmail());
				}

				if (allUser.isEmpty()) {
					System.out.println("There Was No Recent Data");
				%>
				<div class="paperNm-fold">No Recent Uploads</div>

				<%
				} else {
				for (UploadMark Uploadmark : allUser) {
					String ap = String.valueOf(Uploadmark.getConf());
					if (ap.equals("1")) {
						ap = "Approved";
					} else {
						ap = "Pending";
					}
				%>
				<div class="paperNm-fold"><%=Uploadmark.getId()%>&nbsp;<%=Uploadmark.getPaperNm()%>(<%=Uploadmark.getPaperTy()%>)&nbsp;<a
						style="color: tomato; padding: 0.5% 2%; border-radius: 3vh; background: white; box-shadow: 0px 0px 12px -4px;"
						target="_blank" href="uploads/<%=Uploadmark.getMarksFile()%>"><%=Uploadmark.getMarksFile()%></a>&nbsp;&nbsp;<%=ap%></div>
				<%
				}
				}
				%>
			</div>
		</div>
	</div>
	
	<section>
		<div class=" container">
			<div class="card scrollbar-near-moon">
				<div class="card-body">
					<h4 id="section1">
						<strong>Uploads Marks</strong>
					</h4>
					<hr>
					<%
					Messages m = (Messages) session.getAttribute("msg");
					if (m != null) {
					%>
					<div class="card-body-span">
						<span class="<%=m.getCssClass()%>"> <%=m.getContent()%>
						</span>
					</div>
					<br>
					<%
					session.removeAttribute("msg");
					}
					%>
					<!--  enctype="multipart/form-data"-->

					<form action="UploadMarkServlet" method="post"
						enctype="multipart/form-data">
						<div class="row top-my">
							<div class="dropSub col">

								<div class="drop-sub-span">Subject Name</div>
								<hr>
								<div class="drop-select-sub">
									<select name="paperNm" id="subNm" class="paperNm"
										onchange="#getData" required>
										<option value="" disabled selected>Select Subject</option>
										<%
										SubjectDao s = new SubjectDao(ConnectionProvider.getConnection());
										List<Subject> sub = s.getAllSubjectByUId(user.getId());
										for (Subject s1 : sub) {
										%>


										<option value="<%=s1.getSubName()%>">
											<%=s1.getSubId()%>
											<%=s1.getSubName()%>
										</option>

										<%
										}
										%>
									</select>
								</div>
							</div>
							<input type="hidden" name="facmail" value="<%=user.getEmail()%>">
							<div class="col dropSub">

								<div class="drop-sub-span">Paper Marks</div>
								<hr>
								<div class="drop-select-sub">
									<input placeholder="Mark Of Paper" type="number" name="marksUp"
										class="markUp" min="1" max="100" required/>
								</div>
							</div>
							<div class="dropSub col">

								<div class="drop-sub-span">Paper Type</div>
								<hr>
								<div class="drop-select-sub">
									<select name="paperTy" class="paperTy" required>
										<option value="" disabled selected>Select Type</option>
										<option value="mid-sem">Mid-sem</option>
										<option value="final-Sen">Final Sem</option>
									</select>
								</div>
							</div>
						</div>
						<br>
						<div id="anouncements" class="me-with-upload">

							<div class="me-file">
								Choose File<input type="file" name="fileName" id="marks"
									class="marks" style="padding: 13px;"
									onchange="return fileValidation()" required="required">

							</div>
							<button id="upload" type="submit" name="upload"
								class="the-upload-btn">Upload</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<br>
	<section>
		<div class=" container">
			<div class="card scrollbar-near-moon">
				<div class="card-body">
					<h4 id="section1">
						<strong>Uploads Final Data</strong>
					</h4>
					<hr>
					<%
					Messages mt = (Messages) session.getAttribute("msg");
					if (mt != null) {
					%>
					<div class="card-body-span">
						<span class="<%=mt.getCssClass()%>"> <%=mt.getContent()%>
						</span>
					</div>
					<br>
					<%
					session.removeAttribute("msg");
					}
					%>
					<!--  enctype="multipart/form-data"-->

					<form action="FinalDataServlet" method="post">
						<div class="row top-my">
							<div class="dropSub col">

								<div class="drop-sub-span">Subject Name</div>
								<hr>
								<div class="drop-select-sub">
									<select name="paperNme" id="subNm" class="paperNm" onchange="fucn(this)"
										 required>
										<option value="" disabled selected>Select Subject</option>
										<%
										SubjectDao ses = new SubjectDao(ConnectionProvider.getConnection());
										List<Subject> subd = ses.getAllSubjectByUId(user.getId());
										for (Subject s1 : subd) {
										%>							
										<option id="<%=s1.getSubYear()%>" value="<%=s1.getSubName()%>" >
											<%=s1.getSubId()%>
											<%=s1.getSubName()%>	
										</option>
										
										<script type="text/javascript">

										function funno(){
											var e = document.getElementById("subNm");
											console.log("HERE IS : "+e);
											var value = e.value;
											var text = e.options[e.selectedIndex].id;
											alert("Year is : "+e+" "+value+" "+text);
										}
										function fucn(ads){
											//alert("kem 6 mjamaa");
											var year = ads.options[ads.selectedIndex].id;
											document.getElementById("studyr").value = year;
											//alert(year);
											var y= document.getElementById("studyr");
											//alert(y.value);
										}
										</script>
										
										<%
											}
										%>	
									</select>
									<input type="hidden" value="2" name="stdyr" id="studyr" />
									
								</div>
							</div>
							<input type="hidden" name="facmail" value="<%=user.getEmail()%>">
							<div class="dropSub col">

								<div class="drop-sub-span">Paper Type</div>
								<hr>
								<div class="drop-select-sub">
									<select name="paperTy" class="paperTy" required>
										<option value="" disabled selected>Select Type</option>
										<option value="internal">Internal</option>
										<option value="mid-sem">Mid-sem</option>
										<option value="final-sem">Final-Sem</option>
									</select>
								</div>
							</div>
						</div>
						<br>

							<button id="upload" type="submit" name="upload"
								class="the-upload-btn">Proceed</button>
							
					</form>
				</div>
			</div>
		</div>
	</section>
<br>
	<script>
							
							function funno(){
								var e = document.getElementById("subNm");
								console.log("HERE IS : "+e);
								var value = e.value;
								var text = e.options[e.selectedIndex].id;
								alert("Year is : "+e+" "+value+" "+text);
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
						</script>

	<form action="choiceServlet" method="post">
		<div class=" container">
			<div class="card scrollbar-near-moon">
				<div class="card-body" style="margin-bottom: -4%;">
					<p class="legend">Choose the type of Paper:</p>
					<hr>
					<div class="grid-container-me">

						<div class="item1">
							<img src="omr-type.png" class="all-hover-img" alt="mcq">
						</div>
						<div class="item2">
							<img src="question-type.png" class="all-hover-img" alt="question">
						</div>

						<div class="item4">
							<input name="typ" type="radio" id="mcq" value="MCQ" checked><label
								for="mcq" class="labelT">MCQ</label>
						</div>
						<div class="item4">
							<input name="typ" type="radio" id="Written" value="Written"><label
								for="Written" class="labelT">Written</label>
						</div>

					</div>
					<div class="papaer_for">
						<div class="row top-my">
							<div class="dropSub-in2-f col">
								<div class="drop-sub-in2-span">Subject Paper Type</div>
								<hr>
								<select name="examtype" id="PaperType" class="dropSub-in2"
									onchange="#getData" required>
									<option value="" disabled selected>Select Paper Type</option>
									<option value="Mid-sem">Mid-Sem</option>
									<option value="Final-sem">Final-Sem</option>
								</select>
							</div>
							<div class="dropSub-in2-f col">
								<div class="drop-sub-in2-span">Total Marks</div>
								<hr>
								<div class="">
									<input placeholder="Exam Total Marks" type="number"
										name="tmarkMCQ" class="marksMCQ markUp-2" max="100" min="1" required/>
								</div>
							</div>
						</div>
						<div class="row top-my">
							<div class="dropSub-in2-f col">
								<div class="drop-sub-in2-span">Subject Name</div>
								<hr>
								<select name="subnm" id="subNm" class="dropSub-in2"
									onchange="#getData" required>
									<option value="" disabled selected>Select Subject</option>
									<%
									for (Subject s1 : sub) {
									%>
									<option value="<%=s1.getSubName()%>">
										<%=s1.getSubName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="dropSub-in2-f col">
								<div class="drop-sub-in2-span">Exam Time(in Minute)</div>
								<hr>
								<div class="">
									<input placeholder="Exam Time" type="number" name="etime"
										class="etime markUp-2" min="1" required/>
								</div>
							</div>
						</div>
					</div>
		

				</div>
				<button type="submit" class="btn-for-paper">Submit</button>
			</div>
		</div>
	</form>

	<script>
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
	<%@ include file="pages/footer.jsp"%>