<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.exam.dao.*"%>
<%@ page import="com.exam.entity.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="ks-logo.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Upload Written Data : Exam Management</title>
<%@ include file="pages/headers.jsp"%>
</head>
<style>
.inlinePF{
	box-shadow: 0px 0px 10px -1px red;
    border: 3px solid #ff00007d;
    padding: 0.5% 3%;
    border-radius: 3vh;
    width: fit-content;
    background: #ff002b70;
    color: white;
    font-weight: bold;
    margin: auto;
}
</style>
<body>
	<%
	String subNm = null;
	if ((request.getParameter("snm")) != null) {
		subNm = request.getParameter("snm");
		System.out.println("SUB NAME = " + subNm);
	}
	%>
	<div class=" container">
		<div class="card scrollbar-near-moon">
			<div class="card-body">
				<h4 id="section1">
					<strong>Uploads Written Paper</strong>
				</h4>
				<hr>
				<p>!PLEASE DO NOT EXIT THIS PAGE WITHOUT UPLOAD PAPER</p>
				
				<form action="WrittenUploadServlet" method="post" enctype="multipart/form-data">
					<div id="anouncements" class="me-with-upload">
						<p class="inlinePF"><%=subNm%></p>
						<input type="hidden" id="sub" value="<%=subNm%>" name="sname" />
						<div class="me-file">
							Choose File<input type="file" name="fileName" id="marks"
								class="marks" style="padding: 13px;"
								onchange="return fileValidation()"\>
	
						</div>
						<button id="upload" type="submit" name="upload"
							class="the-upload-btn">Upload</button>
					</div>
				</form>
			</div>
		</div>
	</div>
							<script>
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
	<%@ include file="pages/footer.jsp"%>
</body>
</html>