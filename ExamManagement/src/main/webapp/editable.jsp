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
<link rel="icon" type="image/x-icon" href="ks-logo.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Faculty : Exam Management</title>
<%@ include file="pages/headers.jsp"%>
</head>
<style>
.success-top {
	background: linear-gradient(to right, #ffeb3b,#ffcab0, #87fcff 62%);
    padding: 1% 2%;
    border: 3px solid white;
    border-radius: 12px;
    font-weight: 900;
    color: black;
    box-shadow: 0px 0px 13px 3px #feb9ff !important;
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
	margin: auto;
}

.suc-me-up {
background: linear-gradient(to right, #ffeb3b,#ffcab0, #87fcff 62%);
    padding: 1% 2%;
    margin: auto !important;
    border: 3px solid white;
    border-radius: 12px;
    font-weight: 900;
    color: black;
    box-shadow: 0px 0px 13px 3px #feb9ff !important;
}
/* input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
} */
input[type="number"]{
	width: 100%;
}
.the-upload-btn1 {
    background: white;
    border: 2px solid;
    font: inherit;
    line-height: 1;
    margin: 0rem -2rem;
    padding: 0.6rem 1rem;
    border-radius: 2vh;
    transition: all 1.5s;
    border-color: #ffd8fc;
    color: black;
    text-transform: uppercase;
    outline: none;
}
.the-upload-btn1:hover {
    box-shadow: inset 0 0 0 2em #e599ff !important;
    color: white;
    font-weight: 600;
    text-transform: uppercase;
}
.the-upload-btn12 {
	background: white;
    border: 2px solid;
    font: inherit;
    line-height: 1;
    margin: 1vh 0vh;
    padding: 2vh 4vh;
    border-radius: 2vh;
    transition: all 1.5s;
    border-color: #22a3a1;
    color: black;
    text-transform: uppercase;
    width: 50%;
    outline: none;
    letter-spacing: 8px;
}
.the-upload-btn12:hover {
    box-shadow: inset 0 0 0 2em #6bd7e1 !important;
    color: white;
    font-weight: 600;
    text-transform: uppercase;
}
.table th, .table td {
    padding: 0.2rem 0.4rem !important;
	vertical-align: middle !important;
    border-top: 1px solid #dee2e6;
}
</style>

<body>

	
	
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
						<center><span class="<%=m.getCssClass()%>"> <%=m.getContent()%>
						</span></center>
					</div>
					<br>
					<%
					session.removeAttribute("msg");
					}
					%>
					<!--  enctype="multipart/form-data"-->

					
						<%
						
						String subject = null,type = null;
						int year = 0;
						if(request.getParameter("subnm")!=null){
							subject = request.getParameter("subnm");
							year = Integer.parseInt(request.getParameter("yr"));
							type = request.getParameter("type");
						}
						System.out.println("sub "+subject+" Yer "+year+" type "+type);
						ArrayList<FinalData> list = new ArrayList<>();
						if(type.equals("internal")){
						%>
						<table class="table table-bordered table-hover" style="text-align: center !important;font-size: 2vh;">
									<thead>
										<tr style="text-align: center !important;">
											<th>Index</th>
											<th>Roll No</th>
											<th>Student Name</th>
											<th>Internal</th>
											<th>Update</th>
										</tr>

									</thead>
									<tbody>
						
									<%
									int i=1;
									
									FinalDataDao rd = new FinalDataDao(ConnectionProvider.getConnection());
									ArrayList<FinalData> allUser = rd.getAllInternalData(subject,type);
									for (FinalData u : allUser) {
									%>
									<form action="SaveFinalDataServlet" method="post">
										<tr>
											<td style="display:none"><input type="hidden" name="ids" value="<%=u.getId()%>"/></td>
											<td style="display:none"><input type="hidden" name="type" value="<%=type%>"/></td>
											<td style="display:none"><input type="hidden" name="year" value="<%=year%>"/></td>
											<td style="display:none"><input type="hidden" name="subject" value="<%=subject%>"/></td>

											<td><%=i%></td>
											<td><%=u.getRollno()%></td>
											<td><%=u.getSname()%></td>
											<td><input id="i<%=i%>" type="number" name="internal" value="<%=u.getIntrtot()%>" min="0" max="30"/></td>
											<td><button id="upload" type="submit" name="upload" class="the-upload-btn1">Update</button></td>
										</tr>
									</form>
										<%
											i++;
										}
										%>
									</tbody>
									
								</table>
								
							<%}else if(type.equals("mid-sem")){ %>
							
								<table class="table table-bordered table-hover" style="text-align: center !important;font-size: 2vh;">
									<thead>
										<tr style="text-align: center !important;">
											<th>Index</th>										
											<th>Roll No</th>
											<th>Student Name</th>
											<th>Mid-Sem</th>
											<th>Update</th>
										</tr>

									</thead>
									<tbody>
									<%
									int i=1;
									
									FinalDataDao rd = new FinalDataDao(ConnectionProvider.getConnection());
									ArrayList<FinalData> allUser = rd.getAllMidData(subject,type);
									for (FinalData u : allUser) {
									%>
								
										<form action="SaveFinalDataServlet" method="post">
										<tr>
											<td style="display:none"><input type="hidden" name="ids" value="<%=u.getId()%>"/></td>
											<td style="display:none"><input type="hidden" name="type" value="<%=type%>"/></td>
											<td style="display:none"><input type="hidden" name="year" value="<%=year%>"/></td>
											<td style="display:none"><input type="hidden" name="subject" value="<%=subject%>"/></td>
										
											<td><%=i%></td>
											<td><%=u.getRollno()%></td>
											<td><%=u.getSname()%></td>
											<td><input type="number" name="mid-mar" value="<%=u.getMidsem()%>" min="0" max="50"/></td>
											<td><button id="upload" type="submit" name="upload" class="the-upload-btn1">Update</button></td>
										</tr>
										</form>
										<%
										i++;
										}
										%>
									</tbody>
										
								</table>
							
							<%}else if(type.equals("final-sem")){ %>
							
								<table class="table table-bordered table-hover" style="text-align: center !important;font-size: 2vh;">
									<thead>
										<tr style="text-align: center !important;">
											<th>Index</th>
											<th>Roll No</th>
											<th>Student Name</th>
											<th>Internal Marks</th>
											<th>Mid-Sem</th>
											<th>Final-Sem</th>
											<th style="width: 12%;">Total</th>
											<th style="width: 11%;">Update</th>
										</tr>

									</thead>
									<tbody>
									<%
									int i=1;
									
									FinalDataDao rd = new FinalDataDao(ConnectionProvider.getConnection());
									ArrayList<FinalData> allUser = rd.getAllFinalData(subject,type);
									for (FinalData u : allUser) {
									%>
										<form action="SaveFinalDataServlet" method="post">
										<tr>
											<td style="display:none"><input type="hidden" name="ids" value="<%=u.getId()%>"/></td>
											<td style="display:none"><input type="hidden" name="type" value="<%=type%>"/></td>
											<td style="display:none"><input type="hidden" name="year" value="<%=year%>"/></td>
											<td style="display:none"><input type="hidden" name="subject" value="<%=subject%>"/></td>
										
										
											<td><%=i%></td>
											<td><%=u.getRollno()%></td>
											<td><%=u.getSname()%></td>
											<td><input type="number" id="inet<%=i%>" name="internal" value="<%=u.getIntrtot()%>" min="0" max="30" disabled/></td>
											<td><input type="number" id="mid<%=i%>" name="mid-mar" value="<%=u.getMidsem()%>" min="0" max="50" disabled/></td>
											<td><input type="number" id="fin<%=i%>" name="final-mar" value="<%=u.getFinalsem()%>" min="0" max="70" onchange="functionC<%=i%>()"/></td>
											<td><input type="number" id="tot<%=i%>" name="grand-tot" value="<%=u.getGrandtot()%>" readonly="readonly"/></td>
											<td><button id="upload" type="submit" name="upload" class="the-upload-btn1">Update</button></td>
										</tr>
										<script type="text/javascript">
											var i<%=i%> = document.getElementById("inet<%=i%>");
											var m<%=i%> = document.getElementById("mid<%=i%>");
											var f<%=i%> = document.getElementById("fin<%=i%>");
											var t<%=i%> = document.getElementById("tot<%=i%>");
											function functionC<%=i%>(){
													//alert("Hello"+i<%=i%>.value+" "+m<%=i%>.value+" "+f<%=i%>.value+" "+t<%=i%>.value);								
													t<%=i%>.value = Math.trunc(((((i<%=i%>.value)*30)/100) + (((m<%=i%>.value)*20)/100) + (((f<%=i%>.value)*50)/100)));
													alert(t<%=i%>.value);
											}
										</script>
										</form>
										
										<%
										i++;
										}
										%>
									</tbody>
										
								</table>
									
							<%} %>
						<center><a href="blanck.jsp?yr=<%=year%>&&subnm=<%=subject%>&&type=<%=type%>"><button class="the-upload-btn12">SHOW</button></a></center>	
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

	

	<br>
	<%@ include file="pages/footer.jsp"%>