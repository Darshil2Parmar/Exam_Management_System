<%@page import="com.exam.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.exam.dao.ExamChoiceDataDao"%>
<%@ page import="com.exam.entity.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<link rel="icon" type="image/x-icon" href="ks-logo.ico">
		<script type="text/javascript" src="js/new.js"></script>
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>Written : Exam Management</title>
		<%@ include file="pages/headers.jsp" %>
	</head>
	<style>
	.let-me-div-do h3{
	
	}
	</style>	
	<body>
		<%-- <% String type=request.getParameter("utype"); %>
			<% String type2=request.getParameter("uname"); %>
				<% String type3=request.getParameter("password"); %>
					<% out.print(type+" "+type2+" "+type3); %> --%>

			<form action=" #" method="post">

						<div class=" container" id="get-the-hell">
							<div class="card scrollbar-near-moon" id="card-first" style="">
								<div class="card-body">
									<h1>Information Collect</h1>

									<div id="anouncements-contain">
										<ul>
											<li>* All Input Must Not Empty.</li>
											<li>* Make sure Marks of input not Zero.</li>
											<li>* Total Marks Must be equal to Paper Type Marks.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class=" container">
							<div class="card scrollbar-near-moon" id="card-first" style="">
								<div class="card-body" id="shilong">
						<%
							String snm = request.getParameter("sub");
							System.out.println("SUBJECT IS : "+snm);
							ExamChoiceDataDao ed = new ExamChoiceDataDao(ConnectionProvider.getConnection());
							Examdata examdata = ed.getWrittenData(snm);
							String yer="" ;
							if (examdata.getYear()==1) { yer="FIRST YEAR" ; } else if
								(examdata.getYear()==2) { yer="SECOND YEAR" ; } else if
								(examdata.getYear()==3) { yer="THIRD YEAR" ; } else if
								(examdata.getYear()==4) { yer="FOURTH YEAR" ; } else if
								(examdata.getYear()==5) { yer="FIFTH YEAR" ; }
							
							System.out.println("Year is : "+yer);
							
						%>
							<div class="card-body">
							<input type="hidden" value="<%=snm%>" id="subname" />
							<div class="let-me-div-do text-center">
									<h3>GUJRAT UNIVERSITY</h3>
									<h3>K.S.SCHOOL OF BUSINESS MANAGEMENT</h3>
									<h5>[FIVE YEARS FULL-TIME M.Sc INTEGRATED DEGREE COURSE]</h5>
									<h4><%=examdata.getPtype()%> EXAM OF <%=yer%> M.Sc(CA&IT)</h4>									
									<h3>SUBJECT : <%=examdata.getSubnm()%></h3>
									<h3 class="row"><span class="col" style="display:inline-border"> <input style="border:none;" type="date" /></span><span class="col">TIME: <%=examdata.getTime() %> MINUTES</span><span class="col">MARKS: <%=examdata.getTotmarks()%></span></h3>						
									
							</div>
							
							<hr>
							<textarea class="textArea" id="textArea"   placeholder="Your Questions"
								id="f1"  ></textarea>


							

						</div>
						<!--  <button type="button" id="addBtnSbm" class="addBtnSbm" type="submit">Submit</button>-->
							<input id="pdf-button" type="button" class="addBtnSbm" value="Download PDF"
								onclick="downloadPDF()" />
				</div>
			</div>
			</div>
						</form>
						<script type="text/javascript">
						var x = document.getElementById("subname");
						function downloadPDF(){
							const hide=document.getElementById('pdf-button');
							const hideNav = document.getElementById('ftco-section');
							const hideFooter=document.getElementById('copy-right');
							const inst=document.getElementById('get-the-hell');
							const inst1=document.getElementById('textArea');
							hide.style.display = 'none';
							hideNav.style.display = 'none';
							hideFooter.style.display = 'none';
							inst.style.display = 'none';
							
							window.print();
							//location.reload();
							document.location = ("writtenUpload.jsp?snm="+x.value);
						}
						
				        $('#textArea').on('input', function () {
				            this.style.height = 'auto';
				              
				            this.style.height = 
				                    (this.scrollHeight) + 'px';
				        });
						</script>

						<br>
						<%@ include file="pages/footer.jsp" %>