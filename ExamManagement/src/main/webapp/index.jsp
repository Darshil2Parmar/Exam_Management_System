<%@page import="com.exam.dao.AnnounceDao"%>
<%@page import="com.exam.dao.ExamChoiceDataDao"%>
<%@page import="com.exam.dao.OtherExamDataDao"%>
<%@page import="com.exam.dao.SubjectDao"%>
<%@page import="com.exam.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.exam.helper.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.exam.entity.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="com.exam.entity.User"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="ks-logo.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Student : Exam Management</title>
<%@ include file="pages/headers.jsp"%>
</head>
<style>
@media ( max-width : 991.98px) {
	.btn-start {
		margin: 4% 1% 0% 0%;
		border: none;
		padding: 1% 1%;
		font-size: 1.5vh;
		position: relative;
		width: 31%;
		background: white;
		letter-spacing: 3px;
		border-radius: 10px;
		transition: all .5s;
		box-shadow: 0px 0px 9px -1px black;
		outline-color: transparent;
		outline-style: solid;
		outline-width: thick;
	}
	.inline-h2p {
		background: #e4e4e4;
		width: fit-content;
		padding: 0% 4%;
		border-radius: 2vh;
		font-size: 3.0vh;
		margin: 2% auto;
	}
	.strong-inlinep {
		background: #e4e4e4;
		width: fit-content;
		padding: 1% 4%;
		font-size: 1.5vh;
		border-radius: 1.2vh;
	}
	.h3-for-card-small {
		font-size: 2.5vh;
		border: 2px solid lightgrey;
		text-align: center;
		border-radius: 1rem;
		padding: 2% 1%;
	}
}
</style>
<body>
	<%
	if (request.getParameter("eid") != null) {
		int eid = Integer.parseInt(request.getParameter("eid"));

	}
	if (user == null) {
	%>
	<input id="abhi" type="hidden" value="<%=user%>">
	<%
	System.out.println("_______________________" + user);
	}
	%>

	<!--  <a href="LoginServlet">Click to call Servlet</a>-->
	<section>
		<div class="container">
			<div class="card scrollbar-near-moon">
				<div class="card-body">
					<h4 id="section1">
						<strong>General Announcement</strong>
					</h4>
					<hr>
					<br>
					<%
					AnnounceDao a = new AnnounceDao(ConnectionProvider.getConnection());
					ArrayList<Announc> list = a.getAllAnnounceData();
					for (Announc announc : list) {
					%>
					<div class="anouncements">
						<b> <blink3>New</blink3>
						</b> &nbsp; <font color="blue">Date : <%=announc.getDate()%></font> <font
							color="green"> <%=announc.getDesc()%></font> <a
							href="admin/announcement/<%=announc.getFile()%>" target="_blank">
							<font class="col-me-let" color="red"> Click here...</font>
						</a>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</section>
	<br>
	
	<%
		ExamDivDao ee = new ExamDivDao(ConnectionProvider.getConnection());
		if((ee.checkDiv(user.getYear()))==true){%>
		
		<section>
		<div class="container">
			<div class="card scrollbar-near-moon">
				<div class="card-body">
				
				
					<h4 id="section1">
						<strong>Exam Marks</strong>
					</h4>
					<hr>
					<div class="drop-select-sub">
								
									<!-- show data -->
									<table class="table table-bordered table-hover" style="text-align: center !important;font-size: 2vh;">
									<thead>
										<tr style="text-align: center !important;">
											<th>Index</th>
											<th>Subject Name</th>
											<th>Internal</th>
											<th>Mid-Sem</th>
											<th>Final-Sem</th>
										</tr>

									</thead>
									<tbody>
									<%
									int i=1;
									
									FinalDataDao rd = new FinalDataDao(ConnectionProvider.getConnection());
									ArrayList<FinalData> allUser = rd.getAllFinalDataSub(user.getId());
									for (FinalData u : allUser) {
									String intt = ""+u.getIntrtot();
									String mdl = ""+u.getMidsem();
									String fnl = ""+u.getFinalsem();
									if(intt.equals("0")){
										intt = "-";
									}
									if(mdl.equals("0")){
										mdl = "-";
									}
									if(fnl.equals("0")){
										fnl = "-";
									}
									%>
										
										<tr>
											<td><%=i%></td>
											<td><%=u.getSubnm()%></td>
											<td><%=intt%></td>
											<td><%=mdl%></td>
											<td><%=fnl%></td>
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
	</section>
		
			
	<% 	
		}
	%>
	

	<section>
		<div class="container">
			<div class="card scrollbar-near-moon">
				<div class="card-body">
					<h4 id="section1">
						<strong>Todays Exam</strong>
					</h4>
					<hr>
					<div class="#">
						<%
						ExamChoiceDataDao e = new ExamChoiceDataDao(ConnectionProvider.getConnection());
						Examdata examdata = e.getTodayExamDetail(user.getYear());
						if (examdata.getSubnm() != null) {
							System.out.print(examdata.getSubnm());
							String yer = "";
							if (user.getYear() == 1) {
								yer = "FIRST";
							} else if (user.getYear() == 2) {
								yer = "SECOND";
							} else if (user.getYear() == 3) {
								yer = "THIRD";
							} else if (user.getYear() == 4) {
								yer = "FOURTH";
							} else if (user.getYear() == 5) {
								yer = "FIFTH";
							}
						%>
						<%
						LocalDateTime myDateObj = LocalDateTime.now();
						System.out.println("Before formatting: " + myDateObj);
						DateTimeFormatter myFormatObj = DateTimeFormatter
								.ofPattern(" MMM dd yyyy HH:" + (myDateObj.getMinute() + examdata.getTime()) + ":ss");
						String formattedDate = myDateObj.format(myFormatObj);
						System.out.println("After formatting: " + formattedDate);
						%>
						<h1
							style="background: linear-gradient(45deg, #feafff, #ffec48); padding: 1% 1%; margin: 1% 0% auto; width: 100%; text-align: center; border-radius: 1rem; box-shadow: 0px 0px 9px 3px #e9e9e9; font-size: 4vh;">
							<i class="fa fa-graduation-cap"></i><%=yer%>&nbsp; YEAR -&nbsp;<%=examdata.getSubnm()%></h1>
						<div class="card-small-index">
							<h3 class="h3-for-card-small">
								Exam :
								<%=examdata.getEtype()%>
								&emsp;Paper :
								<%=examdata.getPtype()%></h3>
							<h2 class="inline-h2p">
								Total Marks :
								<%=examdata.getTotmarks()%></h2>
							<strong class="strong-inlinep"><i class="fa fa-clock-o"></i>
								Exam Time : <%=examdata.getTime()%>&nbsp;minutes </strong>
							<div>
								<a
									href=" examOmr.jsp?count=1&&subnm=<%=examdata.getSubnm()%>&&examid=<%=examdata.getEdtid()%>&&fdate=
																		<%=formattedDate%>"><button
										type="button" class="btn-start">
										<span class="btn-start-span">Start Exam</span>
									</button></a>
							</div>
							<%
							} else {
							%>
							<h3 style="text-align: start; margin: 0%; font-size: 3vh;">
								No Exam Today</h3>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="pages/footer.jsp"%>