<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ page import="com.exam.entity.User" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="ISO-8859-1">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" type="text/css" href="css/head-style541.css">
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
				integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
				crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
				integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
				crossorigin="anonymous"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
				integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
				crossorigin="anonymous"></script>

			<title></title>
			<style>
				
			
				@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
				@font-face {
					font-family: myFirstFont;
					src: url('css/MonoLisa-Regular.ttf');
				}
				* {
					box-sizing: border-box;
					font-family: myFirstFont;
					color: black;
				}

				body {
					margin: 0; //
					font-family: myFirstFont;
				}

				.topnav {
					overflow: visible;
					z-index: 3;
					position: fixed;
					background-color: #333;
					box-shadow: 0px 0px 6px 1px #909090;
					width: -webkit-fill-available;
				}

				@-webkit-keyframes hue {
					from {
						-webkit-filter: hue-rotate(0deg);
					}

					to {
						-webkit-filter: hue-rotate(-360deg);
					}

				}
				body::-webkit-scrollbar {
					width: 0.7em;
				}
				
				body::-webkit-scrollbar-track {
					box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
					background-color: white;
					border-radius:12px;
				}
				
				body::-webkit-scrollbar-thumb {
					/* background-color: yellowgreen; */
				    background: linear-gradient(88deg, #ffa7f8,#ffff6c, #bafaff);
					outline: 1px solid slategrey;
					border-radius:12px;
				}
				.topnav a {
					float: left;
					display: block;
					color: #f2f2f2;
					text-align: center;
					padding: 17px 16px;
					text-decoration: none;
					font-size: 13px;
					-webkit-animation: hue 7s infinite linear;
				}

				.active {
					background-color: #04AA6D;
					color: white;
				}

				.topnav .icon {
					display: none;
				}

				/*
.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 13px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
	-webkit-animation: hue 7s infinite linear;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}
 */
				.topnav a:hover,
				.dropdown:hover .dropbtn {
					background-color: #ffa8a8;
					color: white;
				}

				.dropdown-content a:hover {
					background-color: #ddd;
					color: black;
				}

				.dropdown:hover .dropdown-content {
					display: block;
				}

				@media screen and (max-width: 600px) {

					.topnav a:not(:first-child),
					.dropdown .dropbtn {
						display: none;
					}

					.topnav a.icon {
						float: right;
						display: block;
					}
				}

				@media screen and (max-width: 600px) {
					.topnav.responsive {
						position: relative;
					}

					.topnav.responsive .icon {
						position: absolute;
						right: 0;
						top: 0;
					}

					.topnav.responsive a {
						float: none;
						display: block;
						text-align: left;
					}

					.topnav.responsive .dropdown {
						float: none;
					}

					.topnav.responsive .dropdown-content {
						position: relative;
					}

					.topnav.responsive .dropdown .dropbtn {
						display: block;
						width: 100%;
						text-align: left;
					}
				}

				.annou {
					padding-left: 1rem;
					background: linear-gradient(45deg, #dedede, transparent);
					display: inline-block;
					margin: 1%;
					align-items: center;
					border: 6px solid pink;
					border-radius: 1.02rem;
					width: -webkit-fill-available;
				}

/* 				#anouncements {
					padding: 0% 1%;
					text-align: center;
					background: #dadada;
					margin: auto;
					width: fit-content;
					border-radius: 9px;
				} */

				blink3 {
					color: #f35626;
					font-size: 1.3rem;
					font-weight: bold;
					background-image: -webkit-linear-gradient(28deg, #f35626 39%, #feab3a);
					-webkit-background-clip: text;
					-webkit-text-fill-color: transparent;
					-webkit-animation: hue 7s infinite linear;
				}

				b,
				strong {
					font-weight: bolder;
				}

				#container {
					padding: 10px 0px;
				}

				/* .card {
					position: relative;
					display: -webkit-box;
					display: -ms-flexbox;
					display: flex;
					-webkit-box-orient: vertical;
					-webkit-box-direction: normal;
					-ms-flex-direction: column;
					flex-direction: column;
					min-width: 0;
					/* background: linear-gradient(207deg, #d6d6d6, transparent); */
					word-wrap:break-word;
					background-clip:border-box;
					border:1px solid rgba (0,0,0,.125);
					border-radius:0 .25rem;
					width:-webkit-fill-available;
					margin:	1 % 4 %;
					/* border: 5px solid #c0c0c0; */
					border-radius:10px;
					/* -webkit-animation: hue 7s infinite linear; */
					box-shadow:0px 0px 11px 7px #aeaeae;
					-webkit-box-flex:1;
					-ms-flex:1 1 auto;
					flex:1 1 auto;
					padding:1 % 1 %;
					text-align:center;
				} */

				.card1 {
					position: relative;
					display: -webkit-box;
					display: -ms-flexbox;
					display: flex;
					-webkit-box-orient: vertical;
					-webkit-box-direction: normal;
					-ms-flex-direction: column;
					flex-direction: column;
					min-width: 0;
					/* background: linear-gradient(207deg, #d6d6d6, transparent); */
					word-wrap: break-word;
					background-clip: border-box;
					/* border: 1px solid rgba(0, 0, 0, .125); */
					border-radius: 0.25rem;
					margin: auto;
					box-shadow: 0px 1px 29px 2px #ffbbbb;
					width: fit-content;
					-webkit-box-flex: 1;
					-ms-flex: 1 1 auto;
					flex: 1 1 auto;
					padding: 1% 1%;
				}

				.container-fluid {
					width: 100%;
					padding-right: 15px;
					padding-left: 15px;
					margin-right: auto;
					margin-left: auto;
				}

				div {
					display: block;
				}

				.h1,
				.h2,
				.h3,
				.h4,
				.h5,
				.h6,
				h1,
				h2,
				h3,
				h4,
				h5,
				h6 {
					margin-bottom: 0.5rem;
					font-family: inherit;
					font-weight: 500;
					line-height: 1.2;
					color: inherit;
				}

				/* a {
	color: #007bff;
	text-decoration: none;
	background-color: transparent;
	-webkit-text-decoration-skip: objects;
} */

				#section1 strong {
					font-size: 24px;
				}

				.footer1 {
					background-color: #ff9c9c;
					padding: 10px;
					margin: 6px 0px;
					font-size: 1rem;
					align-items: center;
					color: white;
					text-align: center;
					margin-bottom: 0px;
				}

				.footer-p {
					margin: 1px;
				}

				.info-paper {
					background-color: #dfd8d8;
					padding: 2% 5%;
					border-radius: 10px;
					font-weight: 500;
					text-align: center;
					width: fit-content;
					color: #ff2525;
				}

				.papers {
					background-color: #f2f2f2;
					border-radius: 10px;
				}

				img {
					padding: 2%;
					width: 50%;
					height: 96%;
				}

				.btn-strrt {
				    margin: 1% 1%;
				    border: none;
				    padding: 1% 1%;
				    font-size: 2.5vh;
				    position: relative;
				    width: 17%;
				    border-radius: 16px;
				    transition: transform .5s;
				}

				.btn-strrt:hover,
				.btn-strrt:focus {
					background: pink;
					box-shadow: 0px 0px 11px 7px #ffcbef;
				}

				.fieldset {
					border: 8px solid gray;
					padding: 1% 9%;
					width: -webkit-fill-available;
					margin: 1% 2%;
					border-radius: 23px;
					text-align: -webkit-match-parent;
					/*-webkit-animation: hue 7s infinite linear;*/
					box-shadow: 4px 9px 44px 3px #bdb7b7;
				}

				.legend {
					font-weight: bold;
					font-size: 2rem;
				}

				.grid-container {
					display: grid;
					grid-template-columns: auto auto;
					gap: 20px;
					background-color: #ececec;
					padding: 10px;
					border-radius: 20px;
				}

				.grid-container>div {
					background-color: white;
					text-align: center;
					padding: 1% 1%;
					font-size: 30px;
					border-radius: 14px;
				}

				.item2 {
					grid-column-start: 2;
					grid-column-end: 3;
				}

				.labelT {
					font-size: 3vh;
					font-weight: 600;
				}

				.papaer_for {
					padding: 1% 1%;
					margin: 1% 1%;
				}
				
				.grid-question-box {
					display: grid;
					grid-template-columns: auto auto;
					gap: 8px;
					background-color: #c8c8c8;
					padding: 1%;
					margin: 1% 2%;
					border-radius: 14px;
				}

				.grid-question-box>div {
					background-color: rgba(255, 255, 255, 0.8);
					text-align: center;
					padding: 20px 0;
					font-size: 30px;
				}

				.itemQues {
					grid-column-start: 1;
					grid-column-end: 3;
				}

				#anouncements-contain {
					padding: 0% 1%;
					text-align: -webkit-match-parent;
					background: #ffffff00;
					margin: auto;
					width: -webkit-fill-available;
					border-radius: 9px;
				}

				#anouncements-contain ul li {
					margin: 1%;
					font-size: 1.2rem;
					width: fit-content;
					color: red;
				}

				.typoQue {
					padding: 1% 1%;
					border: 5px solid gray;
					border-radius: 10px;
					margin: 1% 0%;
				}

				.questNo {
					padding: 1% 1%;
					border: 3px solid #dedede;
					margin: 1% 1%;
					border-radius: 10px;
					background-color: lightgray;
					color: black;
					font-weight: bold;
					font-size: 1rem;
					box-shadow: 1px -1px 15px 0px rgb(0 0 0/ 17%);
					width: 23%;
				}

				.markNo {
					padding: 1% 1%;
					border: 3px solid #dedede;
					margin: 1% 1%;
					border-radius: 10px;
					background-color: lightgray;
					color: black;
					font-weight: bold;
					font-size: 1rem;
					box-shadow: 1px -1px 15px 0px rgb(0 0 0/ 17%);
					width: 23%;
				}

				.tot {
					padding: 1% 1%;
					border: 3px solid #dedede;
					margin: 1% 1%;
					border-radius: 10px;
					background-color: lightgray;
					color: black;
					font-weight: bold;
					font-size: 1rem;
					box-shadow: 1px -1px 15px 0px rgb(0 0 0/ 17%);
					width: 24%;
				}

				@media screen and (max-width: 900px) {

					.questNo,
					.tot,
					.markNo {
						width: 19%;
					}

					.questNoArg,
					.totArg,
					.markNoArg {
						width: 25%;
					}
				}

				.questNoArg,
				.totArg,
				.markNoArg {
					padding: 1% 1%;
					border: 3px solid #dedede;
					margin: 1% 1%;
					border-radius: 10px;
					background-color: lightgray;
					color: black;
					font-weight: bold;
					font-size: 1rem;
					box-shadow: 1px -1px 15px 0px rgb(0 0 0/ 17%);
					width: 26%;
					text-align: center;
				}

				.addBtn {
					padding: 1% 1%;
					background-color: pink;
					width: -webkit-fill-available;
					border: 5px solid #ececec;
					border-radius: 11px;
					margin: 0.5% 1%;
					font-size: 1rem;
				}

				.spanMid {
					padding: 1% 1%;
					background-color: #80808026;
					border: 5px solid lightgray;
					border-radius: 10px;
					margin: 1% 1%;
					display: inline;
				}

				#del:hover {
					background-color: tomato;
				}

				.ansTotNo {
					padding: 1% 1%;
					border: 5px solid gray;
					border-radius: 10px;
					margin: 1% 0%;
					display: flex;
				}

				.simpleTextAnn {
					padding: 1% 1%;
					border: 3px solid #dedede;
					margin: 1% 1%;
					border-radius: 10px;
					background-color: lightgray;
					color: black;
					font-weight: bold;
					font-size: 1rem;
					box-shadow: 1px -1px 15px 0px rgb(0 0 0/ 17%);
					width: 65%;
					display: inline-block;
					letter-spacing: 2rem;
				}

				.simpleTextTot {
					padding: 1% 1%;
					border: 3px solid #dedede;
					margin: 1% 1%;
					border-radius: 10px;
					background-color: lightgray;
					color: black;
					font-weight: bold;
					font-size: 1rem;
					box-shadow: 1px -1px 15px 0px rgb(0 0 0/ 17%);
					display: inline-block;
					width: 26%;
					);
				}

				.addBtnSbm {
					padding: 1% 4%;
					border-radius: 11px;
					margin: 0.5% 1%;
					font-size: 1rem;
					border: none;
					box-shadow: 0px 0px 9px 0px rgb(133, 127, 127);
				}

				.addBtnSbm:hover,
				.addBtn:focus {
					font-weight: bold;
					background: linear-gradient(to right, #85ffba 19%, #ffbdbdf7);
					box-shadow: 0px 0px 9px 1px rgb(158, 158, 158);
				}

				.textArea {
					width: -webkit-fill-available;
					border-radius: 15px;
					padding: 2% 3%;
/* 					box-shadow: 0px 0px 6px 1px #aeaeae; */
					border: none;
					margin: 2% 0%;
					font-size: 1.5rem;
				}

				.textArea:focus,
				.textArea:hover {
					border: none;
					box-shadow: 0px 0px 6px 1px #515151;
				}




				.top-my {
					display: -webkit-box;
				}

				.drop-my-subject,
				.drop-select-sub {
					padding: 1% 1%;
				}


				.card-paper {
					position: relative;
					display: -webkit-box;
					display: -ms-flexbox;
					display: flex;
					-webkit-box-orient: vertical;
					-webkit-box-direction: normal;
					-ms-flex-direction: column;
					flex-direction: column;
					min-width: 0;
					/* background: linear-gradient(207deg, #d6d6d6, transparent); */
					word-wrap: break-word;
					background-clip: border-box;
					border: 1px solid rgba(0, 0, 0, .125);
					border-radius: 0.25rem;
					width: -webkit-fill-available;
					margin: 1% 2%;
					/* border: 5px solid #c0c0c0; */
					border-radius: 10px;
					/* -webkit-animation: hue 7s infinite linear; */
					box-shadow: 0px 0px 6px 1px #aeaeae;
					-webkit-box-flex: 1;
					-ms-flex: 1 1 auto;
					flex: 1 1 auto;
					text-align: center;
				}

				
				.column-d {
					float: left;
					width: 46%;
				}

				/* Clear floats after the columns */
				.row-d:after {
					content: "";
					display: table;
					clear: both;
				}



				.quesno {
					background: #dedede;
					float: left;
					padding: 1% 1%;
					border: 2px solid silver;
					border-radius: 10px;
				}


				/*prevExam*/
				.h3-mytab {
					background: #c0ff8f;
					border-radius: 16px;
					padding: 2% 4%;
					margin: 1% 2%;
					text-align: center;
					font-size: xx-large;
					color: #ffffff;
				}

				.card-pull {
					position: relative;
					display: -webkit-box;
					display: -ms-flexbox;
					display: table;
					-webkit-box-orient: vertical;
					-webkit-box-direction: normal;
					-ms-flex-direction: column;
					flex-direction: column;
					min-width: 0;
					/* background: linear-gradient(207deg, #d6d6d6, transparent); */
					word-wrap: break-word;
					background-clip: border-box;
					border: 0px solid rgba(0, 0, 0, .125);
					width: -webkit-fill-available;
					margin: 3% 3% 1% 3%;
					/* border: 5px solid #c0c0c0; */
					border-radius: 20px;
					/* -webkit-animation: hue 7s infinite linear; */
					box-shadow: 0px 0px 17px 3px #aeaeae;
					-webkit-box-flex: 1;
					-ms-flex: 1 1 auto;
					flex: 1 1 auto;
					padding: 4% 1%;
					text-align: center;
				}

				.card-paper-d {
					position: relative;
					display: -webkit-box;
					display: -ms-flexbox;
					display: flex;
					-webkit-box-orient: vertical;
					-webkit-box-direction: normal;
					-ms-flex-direction: column;
					flex-direction: column;
					min-width: 0;
					/* background: linear-gradient(207deg, #d6d6d6, transparent); */
					word-wrap: break-word;
					background-clip: border-box;
					border: 1px solid rgba(0, 0, 0, .125);
					border-radius: 0.25rem;
					width: -webkit-fill-available;
					margin: 1% 2%;
					/* border: 5px solid #c0c0c0; */
					border-radius: 10px;
					/* -webkit-animation: hue 7s infinite linear; */
					box-shadow: 0px 0px 6px 1px #aeaeae;
					-webkit-box-flex: 1;
					-ms-flex: 1 1 auto;
					flex: 1 1 auto;
					text-align: center;
				}

				.link-me-tb {
					font-weight: 600;
					background-color: transparent;
					color: black;
					margin: 1% 3%;
					font-size: 2.7vh;
					border-radius: 3px;
					/* background-clip: content-box, border-box; */
					box-shadow: 0px 0px 4px 3px #dbdbdb;
					padding: 0.5%;
					width: 26%;
				}

				.link-me-tb:hver {
					box-shadow: 0px 0px 5px 3px #ff5722;
				}
			</style>
		</head>

		<body>
			<% 
			    User user=(User)session.getAttribute("currentUser");
				
				 %>
				<%-- <div class="topnav" id="myTopnav">
					<% if ((user.getType()).equals("student")) { %>
						<a href="index.jsp" class="active"><i class="fa fa-fw fa-home"></i>
							Home</a> <a href="prevResult.jsp"><i class="fa fa-table"></i> Marks</a>
						<% } else { %>
							<a href="faculty.jsp" class="active"><i class="fa fa-fw fa-home"></i>
								Home</a>

							<% } %>
								<!-- 		<a href="#news"><i class="fa fa-link"></i> Update</a> -->
								<a href="contact.jsp"><i class="fa fa-address-card"></i> Contact</a> <a
									href="about.jsp"><i class="fa fa-info-circle"></i> About</a>
								<div class="dropdown">
									<button class="dropbtn">
										<i class="fa fa-fw fa-file-archive-o"></i> Paper<i class="fa fa-caret-down"></i>
									</button>
									<div class="dropdown-content">
										<a href="oldPapers.jsp#h3-fymarks">First Years</a> <a
											href="oldPapers.jsp#h3-symarks"">Second Years</a> <a
					href=" oldPapers.jsp#h3-tymarks"">Third Years</a> <a href="oldPapers.jsp#h3-frymarks"">Four Years</a> <a
					href=" oldPapers.jsp#h3-ffymarks"">Fifth Years</a>
									</div>
								</div>


								<% if (user==null) { %>

									<a href="login.jsp" style="float: right;"><i class="fa fa-fw fa-user"></i> Log
										In</a>


									<% } else { %>


										<a href="LogoutServlet" style="float: right; color: white;"><i
												class="fa fa-sign-out"></i> Log Out </a> <a href="#about"
											style="float: right;"><i class="fa fa-fw fa-user"></i>
											<%=user.getName()%>
										</a>

										<% } %>

											</div> --%>
											<section class="ftco-section" id="ftco-section">
												<div class="wrap">
													<div class="container">
														<div class="row justify-content-between">
															<div class="col">
																<p class="mb-0 phone"> <a
																		href="#" style="font-size: 2.5vh;text-decoration:none">K.S. School Of Business
																		Management</a></p>
															</div>
															<div class="col justify-content-end">

																<div class="social-media">
																	<p class="mb-0">
																		<% if (user==null) { %>
																			<a class="social-media-p-a" href="#">

																				<i style="" class="fa fa-user"
																					aria-hidden="true"> Unknown</i>
																			</a>
																			<% } else { %>
																				<a class="social-media-p-a" href="#">

																					<i style="" class="fa fa-user"
																						aria-hidden="true">
																						<%=user.getName()%>
																					</i>
																				</a>
																				<% } %>
																	</p>

																</div>
															</div>
														</div>
													</div>

												</div>


												<nav class="navbar navbar-expand-lg  navbar-dark ftco_navbar  ftco-navbar-light"
													id="ftco-navbar">
													<div class="container">
														<img src="ks-logo.png" alt="kslogo" style="width: 15%"><a
															class="navbar-brand" href="#"
															style="text-decoration:none;">K.S.School <span>of business
																management</span></a>






														<button class="navbar-toggler" type="button"
															data-toggle="collapse" data-target="#ftco-nav"
															aria-controls="ftco-nav" aria-expanded="false"
															aria-label="Toggle navigation">
															<span class="fa fa-bars"></span> Menu
														</button>
														<div class="collapse navbar-collapse" id="ftco-nav">
															<ul class="navbar-nav m-auto">
																<% if (user==null){ %>
																	<li class="nav-item "><a href="index.jsp"
																			class="nav-link">
																			<span class="fa fa-home"></span>Home</a>
																	</li>
																	<% } else if((user.getType()).equals("student")){ %>
																		<li class="nav-item "><a href="index.jsp"
																				class="nav-link">
																				<span class="fa fa-home"></span>Home</a>
																		</li>
																		<% } else { if
																			((user.getType()).equals("faculty")) {%>

																			<li class="nav-item "><a href="faculty.jsp"
																					class="nav-link">
																					<span
																						class="fa fa-home"></span>Home</a>
																			</li>
																			<% }} %>
																				<li class="nav-item dropdown"><a
																						class="nav-link dropdown-toggle"
																						href="#" id="dropdown04"
																						data-toggle="dropdown"
																						aria-haspopup="true"
																						aria-expanded="false"><span
																							class="fa fa-caret-square-o-down"></span>Papers</a>
																					<div class="dropdown-menu"
																						aria-labelledby="dropdown04">
																						<a class="dropdown-item"
																							href="oldPapers.jsp#h3-fymarks">First
																							Year</a> <a
																							class="dropdown-item"
																							href="oldPapers.jsp#h3-symarks">Second
																							Year</a> <a
																							class="dropdown-item"
																							href="oldPapers.jsp#h3-tymarks">Third
																							Year</a> <a
																							class="dropdown-item"
																							href="oldPapers.jsp#h3-frymarks">Forth
																							Year</a> <a
																							class="dropdown-item"
																							href="oldPapers.jsp#h3-ffymarks">Fifth
																							Year</a>
																					</div>
																				</li>

																				<li class="nav-item"><a
																						href="contact.jsp"
																						class="nav-link"><span
																							class="fa fa-phone-square"></span>Contact</a>
																				</li>
																				<% if (user !=null &&
																					(user.getType()).equals("student"))
																					{ %>
																					<li class="nav-item"><a
																							href="prevResult.jsp"
																							class="nav-link"><span
																								class="fa fa-tasks"></span>
																							Marks</a></li>
																					<% } %>

																						<li class="nav-item"><a
																								href="about.jsp"
																								class="nav-link">
																								<span
																									class="fa fa-info-circle"></span>
																								About us</a></li>
															</ul>
														</div>

														<div class=" order-sm-start order-lg-last">
															<div class="det form-group d-flex">
																<% if (user !=null) { %>
																	<a href="LogoutServlet"
																		class="d-flex align-items-center justify-content-center">
																		<span class="fa fa-sign-out"></span>
																		<div class="order-o">
																			Logout
																		</div>
																	</a>
																	<% } else { %>
																		<a href="login.jsp"
																			class="d-flex align-items-center justify-content-center">
																			<span class="fa fa-sign-in"></span>
																			<div class="order-o">
																				Login
																			</div>
																		</a>
																		<%}%>
															</div>

														</div>
													</div>
												</nav>
											</section>
											<br>
											<br>