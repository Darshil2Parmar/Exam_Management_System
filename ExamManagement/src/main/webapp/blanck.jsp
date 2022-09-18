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
				<link rel="stylesheet" type="text/css" href="css/head-style541.css">
	
<title>Faculty : Exam Management</title>
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
.table th, .table td {
	padding: 0.7rem!important;
    vertical-align: middle !important;
    font-size: 1.2rem;
    border-top: 1px solid #dee2e6;
}
.card-split{
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, 0.125);
    border-radius: 1.25rem;
    box-shadow: -1px 18px 20px 0px silver;
    padding: 0.2% 2%;
    margin: 8% 8%;
}
</style>

<body>

	
	
	<section>
		<div class=" container">
			<div class="card-split scrollbar-near-moon">
				<div class="card-body">
				<%
					
				String subject = null,type = null;
				int year = 0;
				String s = "";
				if(request.getParameter("subnm")!=null){
					subject = request.getParameter("subnm");
					year = Integer.parseInt(request.getParameter("yr"));
					type = request.getParameter("type");
					
					if(year==1){
						s = "FIRST YEAR";
					}else if(year==2){
						s = "SECOND YEAR";
					}else if(year==3){
						s = "THIRD YEAR";
					}else if(year==4){
						s = "FOURTH YEAR";
					}else if(year==5){
						s = "FIFTH YEAR";
					}
				}
				
				%>
					<h4 id="section1">
						<center><b><%=s%>&nbsp;&nbsp;<%=subject%>&nbsp;&nbsp;<%=type%></b></center>
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
											<td><%=i%></td>
											<td><%=u.getRollno()%></td>
											<td><%=u.getSname()%></td>
											<td><%=u.getIntrtot()%></td>
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
											<td><%=i%></td>
											<td><%=u.getRollno()%></td>
											<td><%=u.getSname()%></td>
											<td><%=u.getMidsem()%></td>
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
										<td><%=i%></td>
											<td><%=u.getRollno()%></td>
											<td><%=u.getSname()%></td>
											<td><%=u.getIntrtot()%></td>
											<td><%=u.getMidsem()%></td>
											<td><%=u.getFinalsem()%></td>
											<td><%=u.getGrandtot()%></td>
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
										
										<%
										i++;
										}
										%>
									</tbody>
										
								</table>
									
							<%} %>
						
						<center><button class="the-upload-btn" id="btnc" onclick="printtr()">PRINT</button></center>	
				</div>
			</div>
		</div>
	</section>
	<br>
	
						<script>
							const b = document.getElementById("btnc");
							function printtr(){
								//alert("ko");
								b.style.display = 'none';
								window.print();
								location.reload();
							}
							function funno(){
								var e = document.getElementById("subNm");
								console.log("HERE IS : "+e);
								var value = e.value;
								var text = e.options[e.selectedIndex].id;
								alert("Year is : "+e+" "+value+" "+text);
							}
	
						</script>

	

</body>
</html>