<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exam.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.exam.dao.*"%>
<%@page import="com.exam.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="ks-logo.ico">
<title>Subject(Admin) Data</title>
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
							<li class="active">
                                <i class="fa fa-user"></i> Subject Data
                            </li>
                            
						</ol>

								<table class="table table-bordered table-hover" style="text-align: center !important;">


									<thead >
										<tr>
											<th>No.</th>
											<th>Subject Id</th>
											<th>Subject Name</th>
											<th>Faculty Id</th>
											<th>Year</th>
											<th>Semester</th>
											<th>Credit</th>
										</tr>

									</thead>
									<tbody>
									<%
									int i=1;
									SubjectDao rd = new SubjectDao(ConnectionProvider.getConnection());
									ArrayList<Subject> allSubject = rd.getAllSubjectData();
									for (Subject subject : allSubject) {
									%>
								
										<tr>
											<td><%=i%></td>
											<td><%=subject.getSubId()%></td>
											<td><%=subject.getSubName()%></td>
											<td><%=subject.getFacultyid()%></td>
											<td><%=subject.getSubYear()%></td>
											<td><%=subject.getSubSem()%></td>
											<td><%=subject.getSubCreadit()%></td>
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