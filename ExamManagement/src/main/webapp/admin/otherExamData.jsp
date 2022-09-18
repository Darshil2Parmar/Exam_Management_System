<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exam.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@page import="com.exam.dao.*"%>
<%@page import="com.exam.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="ks-logo.ico">
<title>Other Exam Data</title>
</head>
<style>
/* tr:nth-child(even) {
  background-color: rgb(255 251 206 / 40%);
} */
th:nth-child(odd), td:nth-child(odd) {
	background-color: rgb(255, 250, 191);
}

th:nth-child(even), td:nth-child(even) {
	background-color: rgb(255 251 184/ 40%);
	transition: transform .1s;
}

th:nth-child(odd):hover, td:nth-child(odd):hover {
	background-color: #fee3a6 !important;
	transform: scale(1.01);
}

th:nth-child(even):hover, td:nth-child(even):hover {
	background-color: #fee3a6 !important;
	transform: scale(1.01);
}

tr:hover {
	background-color: #fee3a6 !important;
	transform: scale(1.01) !important;
}

td a:hover {
	color: #ffffff;
	text-decoration: none;
	background: linear-gradient(82deg, #ffe81a, #ff896a, #6a77ff);
	padding: 1% 7% !important;
	border-radius: 6px;
}

.makemepiss {
	position: relative;
	background: white;
	margin: 1% 1%;
	z-index: 1;
	margin-bottom: 4%;
	padding: 2% 3%;
	border: 5px solid white;
}

/* 
* Provided by the Generator. 
* This is what creates the shadow.
*/
.makemepiss:before {
	content: "";
	z-index: -1;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	/* background: linear-gradient(to top left, #ff3d00 0%, #0400ff 100% ); */
	background: linear-gradient(to bottom right, #ff13ec 0%, #ffff1c 50%, #3cfdd4 100%);
	transform: translate3d(16px, 14px, 0) scale(1);
	filter: blur(31px);
	opacity: 5;
	transition: opacity 0.3s;
	border-radius: 30px;
}

/* 
* Provided by the Generator.
* Prevents issues when the parent creates a 
* stacking context. (For example, using the transform
* property )
*/
.makemepiss::after {
	content: "";
	z-index: -1;
	border-radius: 34px;
	position: absolute;
	top: 0;
	right: 0;
	border: 2px solid #f1f1f1;
	bottom: 0;
	left: 0;
	background: inherit;
}

.henil {
	display: block;
	border-radius: 15px;
	background: white;
	border: 3px solid white;
	padding: 2% 4%;
	margin: 0% 0% 2% 0%;
	width: 100%;
	box-shadow: 0px 0px 15px 2px #5a5a5a61;
}

.h3-inme {
	background: linear-gradient(to right, #FF13EC -20%, #ffff1c 67%, #3cfdd4 84%);
	padding: 1% 1%;
	color: white;
	font-weight: 600;
	border-radius: 14px;
	text-align: center;
	border: none;
	box-shadow: 0px 0px 8px 3px #d9d9d9;
}

.myFIleDd {
	display: block;
	border-radius: 13px;
	background: white;
	border: 3px solid white;
	padding: 1% 1%;
	margin: 1% 0%;
	outline: none;
	width: auto;
	box-shadow: 0px 0px 15px 2px #bbbbbb80;
	transition: transform .2s;
}

.myFIleDd:hover {
	outline: none;
	box-shadow: 0px 0px 10px 5px pink;
	transform: scale(1.09);
}

.btn-hovme {
	margin: 1% 1%;
	border: none;
	padding: 1% 1%;
	font-size: 2.5vh;
	position: relative;
	width: 17%;
	border-radius: 16px;
	transition: transform .5s;
}

.btn-hovme::before {
	transition: all 0.95s cubic-bezier(1, -0.51, 0.27, 1.55);
	content: "";
	width: 30%;
	height: 100%;
	background: linear-gradient(to right, #ff97f0, #ffff4e);
	position: absolute;
	top: 0;
	left: 0;
	border: 4px solid #f4f4f4;
	border-radius: 14px;
	box-shadow: 0px 0px 15px 2px #fce1e6;
}

.btn-hovme:hover::before {
	background: linear-gradient(to right, #ff97f0, #ffff4e);
	width: 100%;
	box-shadow: 0px 0px 15px 2px pink;
	transform: scale(1.19);
}

.btn-hovme .btn-hovme-text {
	color: white;
	mix-blend-mode: difference;
}

.card-body-span {
	margin: 0% 1% 1% 0%;
}

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
</style>
<body>
	<%@ include file="pages/adminHeader.jsp"%>
	<div id="wrapper">

		<%@ include file="pages/adminNavigation.jsp"%>
		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">


						<h1 class="page-header">
							Welcome To Admin Page <small>Exam Management</small>
						</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="adminHome.jsp">Admin</a>
							</li>
							<li class="active"><i class="fa fa-user"></i> Other Exam
								Data</li>

						</ol>
						<form action="../OtherExamDataServlet" method="post"
							enctype="multipart/form-data">
							<div class="makemepiss">
								<h3 class="h3-inme">
									<i class="fa fa-dashboard"></i>UPLOAD NEW DATA
								</h3>

								<div class="henil">
									<%
									Messages m = (Messages) session.getAttribute("msg");
									if (m != null) {
									%>
									<div class="card-body-span">
										<span class="<%=m.getCssClass()%>"> <%=m.getContent()%></span>
									</div>

									<%
									session.removeAttribute("msg");
									}
									%>
									<h3>Select File</h3>
									<input type="file" name="file" class="myFIleDd" required/> <br>
									<button type="submit" class="btn-hovme">
										<span class="btn-hovme-text">Upload</span>
									</button>
								</div>

							</div>
						</form>
						<table class="table table-bordered table-hover"
							style="text-align: center !important;">


							<thead>
								<tr style="text-align: center !important;">
									<th>No.</th>
									<th>id</th>
									<th>Exam Data</th>
									<th>Date</th>
								</tr>

							</thead>
							<tbody>
								<%
								int i = 1;
								OtherExamDataDao rd = new OtherExamDataDao(ConnectionProvider.getConnection());
								ArrayList<OtherExamData> ed = rd.getAllOtherExamData();
								for (OtherExamData otherExamData : ed) {
								%>
								<tr>
									<td><%=i%></td>
									<td><%=otherExamData.getId()%></td>
									<td><a href="uploads/<%=otherExamData.getFile()%>"
										target="_blank"><%=otherExamData.getFile()%></a></td>
									<td><%=otherExamData.getDate()%></td>
								</tr>
								<%
								i++;
								}
								%>
							</tbody>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>