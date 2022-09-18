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
<title>Upload Confirmation(Result PDF)</title>
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
			 if(request.getParameter("id")!=null){
				System.out.print("Hey u  in  para");
				int id = Integer.parseInt(request.getParameter("id")); 
				ExamChoiceDataDao md = new ExamChoiceDataDao(ConnectionProvider.getConnection());
				md.setExam(id); 
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
                                <i class="fa fa-user"></i> Set Exam (online)
                            </li>
                            
						</ol>
						<div class="breadcrumb" style="background: #ffe599 !important; border-radius: 1.5vh; box-shadow: 0px 0px 12px -4px;">
								Recent Updated Data view at Last of Table
								<br><br><spanp>Click Pending For Approve Request and vise versa</span>
						</div>

								<table class="table table-bordered table-hover" style="text-align: center !important;">


									<thead>
										<tr style="text-align: center !important;">
											<th>No.</th>
											<th>Exam Type</th>
											<th>Paper Type</th>
											<th>Subject Name</th>
											<th>Total Marks</th>
											<th>Subject</th>
											<th>Exam Time</th>
											<th class="examIsApp">Is Exam</th>
<!-- 											<th>Yes</th> -->
										</tr>

									</thead>
									<tbody>
									<%
									int i=1;
									ExamChoiceDataDao rd = new ExamChoiceDataDao(ConnectionProvider.getConnection());
									ArrayList<Examdata> ed = rd.getAllExamData();
									for (Examdata examdata : ed) {
									String ape = "";
									if(examdata.getIsexam()==1){
										ape = "Approved";
									} else {
										ape = "Pending";
									}
									System.out.println("Apr is : "+ape);
									%>
								
										<tr>
											<td><%=i%></td>
											<td><%=examdata.getEtype()%></td>
											<td><%=examdata.getPtype()%></td>
											<td><%=examdata.getSubnm()%></td>
											<td><%=examdata.getTotmarks()%></td>
											<td><%=examdata.getSubnm()%></td>
											<td><%=examdata.getTime()%></td>
<%-- 											<td><%=examdata.getIsexam()%></td> --%>
											<td class="td" value="<%=ape%>"><a href="isExam_admin.jsp?id=<%=examdata.getEdtid()%>" class="a" function="myColoChange();"><%=ape%></a></td>
	
										</tr>
										
										<%
										i++;
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