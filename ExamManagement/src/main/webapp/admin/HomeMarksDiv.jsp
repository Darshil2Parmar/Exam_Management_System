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
<title>Div Show Home</title>
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
		<% 
			 if(request.getParameter("yr")!=null){
				System.out.print("Hey u  in  year");
				int id = Integer.parseInt(request.getParameter("yr")); 
				ExamDivDao md = new ExamDivDao(ConnectionProvider.getConnection());
				md.setConf(id); 
			}
			%>
	
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
                                <i class="fa fa-user"></i> Home Div Mark
                            </li>
                            
						</ol>
						<div class="breadcrumb" style="background: #ffe599 !important; border-radius: 1.5vh; box-shadow: 0px 0px 12px -4px;">
								<spanp>Click No For Yes and vise versa</span>
						</div>

								<table class="table table-bordered table-hover" style="text-align: center !important;">


									<thead>
										<tr style="text-align: center !important;">
									
											<th>Year</th>
											<th>Approval</th>
											
										</tr>

									</thead>
									<tbody>
									<%

									ExamDivDao rd = new ExamDivDao(ConnectionProvider.getConnection());
									ArrayList<ExamDiv> ed = rd.getAllExamDiv();
									for (ExamDiv examdiv : ed) {
			
									%>
								
										<tr>

											<td><%=examdiv.getYear()%></td>
											<td class="td"><a href="HomeMarksDiv.jsp?yr=<%=examdiv.getYear()%>" class="a"><%=examdiv.getShowMe()%></a></td>
	
										</tr>
										
										<%
										}
										%>
									</tbody>
									
								</table>
								<script type="text/javascript">

								</script>

						</div>
					</div>
			</div>
		</div>
		</div>
</body>
</html>