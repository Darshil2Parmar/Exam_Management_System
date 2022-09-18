<%@page import="java.util.ArrayList" %>
	<%@page import="com.exam.helper.ConnectionProvider" %>
		<%@page import="java.sql.Connection" %>
			<%@page import="com.exam.dao.ResultDao" %>
				<%@page import="com.exam.entity.*" %>

					<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
						<!DOCTYPE html>
						<html>

						<head>
							<meta charset="ISO-8859-1">
							<link rel="icon" type="image/x-icon" href="ks-logo.ico">
							<title>Previous Exam Data : Exam Management</title>
							<%@ include file="pages/headers.jsp" %>
						</head>
						<style>
							table {
								margin: 2% 4%;
								border: 2px solid transparent;
								text-align: center;
								display: inline-table;
								box-shadow: 0px 0px 4px 3px #dbdbdb;
								border-radius: 14px;
								padding: 2% 2%;
							}

							th,
							td {
								border: 1px solid black;
								margin: 2% 2%;
							}
							.h3-mytab {
							    background: #c0ff8f;
							    border-radius: 1rem;
							    padding: 1% 3%;
							    margin: 1% 3%;
							    text-align: center;
							    font-size: 4vh;
							    color: #ffffff;
							}
							.link-me-up-h {
							    font-weight: 600;
							    background-color: transparent;
							    color: black;
							    font-size: 2.7vh;
							    border-radius: 3px;
							    /* background-clip: content-box, border-box; */
							    box-shadow: 0px 0px 4px 3px #dbdbdb;
							    padding: 0.5%;
							}
						</style>

						<body>
							<div class=" container">
		<div class="card scrollbar-near-moon" id="card-first" style="">
			<div class="card-body">
								<strong>
									<h1 class="h1-marks">
										<%=user.getId()%>-<%=user.getName()%>
									</h1>
								</strong>
								<div class="card-paper-d">

									<h3 class="h3-mytab" id="h3-frymarks">Exam Marks History</h3>
									<table>
										<tr style="height: 58px;background: linear-gradient(21deg, #c3f3ff, #ebffa6d1);">
											<th class="link-me-up-h">Subject</th>
											<th class="link-me-up-h">Marks</th>
											<th class="link-me-up-h">Total-Marks</th>
											<th class="link-me-up-h">date</th>
										</tr>
										<% ResultDao rd=new ResultDao(ConnectionProvider.getConnection());
											ArrayList<Result> allUser = rd.getAllExamData(user.getId());
											for (Result result : allUser) {
											%>
											<tr>
												<td class="link-me-tb">
													<%=result.getSubNm()%>
												</td>
												<td class="link-me-tb">
													<%=result.getAns()%>
												</td>
												<td class="link-me-tb">
													<%=result.getTotque()%>
												</td>
												<td class="link-me-tb" style="font-size: 1.8vh;">
													<%=result.getDate()%>
												</td>

											</tr>
											<% } %>
									</table>
								</div>
							</div>
							</div>
							</div>
						
						</body>

						</html>
						<%@ include file="pages/footer.jsp" %>