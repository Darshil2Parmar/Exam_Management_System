<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.exam.helper.ConnectionProvider"%>
<%@ page import="com.exam.dao.*"%>
<%@ page import="com.exam.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="ks-logo.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>ExamPaper : Exam Management</title>
<%@ include file="pages/headers.jsp"%>


<style>
.bitchTime{
	background: #dedede;
    float: right;
    padding: 1% 1%;
    border: 2px solid silver;
    border-radius: 10px;
    display: -webkit-inline-box;
}
	.card-small {
					position: relative;
				    display: -webkit-box;
				    display: -ms-flexbox;
				    display: flex;
				    -webkit-box-orient: vertical;
				    -webkit-box-direction: normal;
				    -ms-flex-direction: column;
				    flex-direction: column;
				    min-width: 0;
				    width: 69%;
				    word-wrap: break-word;
				    background-color: #fff;
				    background-clip: border-box;
				    border: 1px solid rgba(0, 0, 0, 0.125);
				    border-radius: 1.25rem;
				    box-shadow: -1px 18px 20px 0px silver;
				    padding: 0.2% 2%;
				    margin: 1% auto;
				}

				.noCOunt {
				    background-color: #ffffff;
				    float: left;
				    padding: 1% 2%;
				    width: 100%;
				    text-align:center;
				    border-radius: 2vh;
				    margin: 0% 1%;
				    border: 3px solid white !important;
				    color: #000000 !important;
				    outline: solid;
				    outline-color: #ffffff;
				    font-weight: 600;
				    box-shadow: 0px 0px 12px 3px #ffc0f6 !important;
				    background: linear-gradient(to right, #ffcaff, #fff7ae);
			
				}
	
				.number {
				       	background-color: #ffffff;
					    float: right;
					    padding: 1% 2%;
					    border-radius: 2vh;
					    display: inline-flex;
					    margin: 0% 1%;
					    outline: none;
						border: 3px solid white !important;
				    	color: #000000 !important;
				    	outline: solid;
				    	outline-color: #ffffff;
				    	font-weight: 600;
				    	box-shadow: 0px 0px 12px 3px #ffc0f6 !important;
				    	background: linear-gradient(to right, #ffcaff, #fff7ae);
			
				}


				.number:hover,
				.number:focus {
					box-shadow: 0px 0px 6px 1px #aeaeae;
				}
								.question:hover,
				
				.question:focus,
				{
					box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
				}
				#option{
				    box-shadow: 0px 0px 12px -3px #979797;
				    padding: 1% 4%;
				    margin: 3% 1%;
				   background: white;
				    border-radius: 4vh;
				    font-size: 3vh;
				    outline: none;
				    border: 3px solid white;
				    color: black !important;
				    padding: 2% 5%;
				    width: 83%;
				    margin: 2% 0%;
				    border: 4px solid #ffcaf9;
				    border-radius: 3vh;
				    font-size: 2.5vh;
				    box-shadow: 0px 0px 11px 0px #d0d0d0;
				    outline: #fecbff;
				}
				.question:hover,.question:focus,.number:focus,.number:hover,#option:hover,#option:focus{
				    border: 3px solid white !important;
				    color: #000000 !important;
				    outline: solid;
				    outline-color: #ffffff;
				    font-weight: 600;
				    box-shadow: 0px 0px 12px 3px #ffc0f6 !important;
				    background: linear-gradient(to right, #ffcaff, #fff7ae);
				}
				.question {
					box-shadow: 0px 0px 12px -3px #353535;
				    padding: 0.5% 1%;
				    width: -webkit-fill-available;
				    margin: 3% 1%;
				    background: white;
				    border-radius: 3vh;
				    font-size: 3.0vh;
				    outline: none;
				    border: 5px solid #ffcbfc !important;
				    color: black !important;
				}
.mySubIsAdd {
	border-radius: 2vh;
    border: 2px solid white !important;
    background: linear-gradient(90deg, #abfffa 0%, #f8ffba 51%, #ffb8fa 100%);
    font-size: 12px;
    color: black;
    outline-color: white;
    font-weight: bold;
    background-size: 200% auto;
    padding: 2% 3%;
    letter-spacing: 1px;
    margin: auto;
    width: 33%;
    text-transform: uppercase;
    transition: all 2s;
    box-shadow: 0px 0px 16px 1px #95ffe9;
    transition-timing-function: cubic-bezier(0.68, -0.55, 0.27, 1.55);
}

.mySubIsAdd:hover {
	transform: scale(1.03);
    box-shadow: 0px 0px 7px 4px rgb(245 185 255);
    background-position: top right;
}
.drop-flow{
	box-shadow: 0px 0px 12px -3px #353535;
    padding: 1% 2%;
    width: auto;
    margin: 2% 0% 2%;
    background: white;
    border-radius: 2vh;
    font-size: 2.4vh;
    outline: none;
    border: 5px solid #ffcbfc !important;
    color: black !important;
}

.drop-flow:hover, .drop-flow:focus, .drop-flow:active{
	border: 5px solid #ffffff !important;
    color: #000000 !important;
    outline: solid;
    outline-color: #ffcaff;
    font-weight: 900;
    box-shadow: 0px 0px 15px 4px #ffc0f6 !important;
    background: linear-gradient(to right, #ffcaff 38%, #fff7ae);
}	
input[type="radio"]:hover{
    box-shadow: 0px 0px 16px 6px #ffc0f6 !important;
}
input[type='radio']:after {
        width: 15px;
        height: 15px;
        border-radius: 15px;
        top: -4px;
        left: -1px;
        position: relative;
        background-color: #d1d3d1;
        content: '';
        display: inline-block;
        visibility: visible;
        border: 2px solid white;
        box-shadow: 0px 0px 14px -3px;
}
    input[type='radio']:checked:after {
    width: 15px;
    height: 15px;
    border-radius: 15px;
    top: -5px;
    left: -1px;
    position: relative;
    background-color: #ffa4a4;
    content: '';
    display: inline-block;
    visibility: visible;
    border: 2px solid white;
    box-shadow: 0px 0px 8px 5px #ffaac8 !important;
    }
</style>
<body>
	<%
	int count = Integer.parseInt(request.getParameter("count"));
	String sname = request.getParameter("subnm");
	int examid = Integer.parseInt(request.getParameter("examid"));
	String fdate = request.getParameter("fdate");


	%>
	<%--<% String type2=request.getParameter("uname"); %>
        <% String type3=request.getParameter("password"); %>
          <% out.print(type+" "+type2+" "+type3); %> --%>

	<section>
			<div class="container">
				<div class="card-small scrollbar-near-moon" id="card-first" style="">
					<div class="card-body">
						<h4 class="section1-fog">
							<strong>Instruction For Paper</strong>
					</h4>
					<hr>
					<div id="anouncements-contain">
						<ul>
							<li>* All Input Must Not Empty.</li>
							<li>* About Four Option There Must be one Answer.</li>
							<li>* Value Of Answer Chosen by Radio Button.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>

	<form action="AnswerMcqServlet" method="post">
	
		<%
		QuestionMcqDao s = new QuestionMcqDao(ConnectionProvider.getConnection());
		ArrayList<QuestionsMcq> sub = s.getAllExamQueById(examid);
		ExamChoiceDataDao ed = new ExamChoiceDataDao(ConnectionProvider.getConnection());
		int time = ed.getTime(examid);
		//System.out.println("///////////*************//////"+time);


		int i = count;
		if(i==1){%>
			
		<% LocalDateTime myDateObj = LocalDateTime.now();%>
		
		<% DateTimeFormatter myFormatObj = DateTimeFormatter
				.ofPattern("MMM dd yyyy HH:" + (myDateObj.getMinute() + time) + ":ss");

		String formattedDate = myDateObj.format(myFormatObj);
		//System.out.println("After formatting: " + formattedDate);

		fdate = formattedDate;
		//System.out.println("///////////*****fdate********//////"+fdate);

		}
		/* for (QuestionsMcq q : sub) { 
			
			System.out.println("HERE : "+q);
		} */
		//System.out.println("HERE i - 1: "+sub.get(i-1));
		%>

		<div class=" container">
			<div class="card-small scrollbar-near-moon" id="card-first" style="">
				<div class="card-body">
					<div class="flex-parent-element">
						<div class="row flex-child-element noCOunt">
							<div class="col text-left">
 									Que :<%=i%>&nbsp;)
							</div>
							<div class="col">
								Marks:<%=sub.get(i-1).getMarks()%>
								<input type="hidden" value="<%=sub.get(i-1).getMarks()%>" name="markOfQ"/>
							</div>
							<div class="col text-right">
								<span class="" style="display:inline-flex;">Time:<div id="demo"></div></span>
							</div>
						</div>
					</div>	
					<%
						session.setAttribute("holeSet", sub.get(i-1));
					%>
					
					<textarea style="resize: none;" name="question" id="question" class="question" rows="3" disabled><%=sub.get(i - 1).getQuestion()%></textarea>
					<br>
					<div class="row">
						<div class="col">
							<input type="radio" value="<%=sub.get(i - 1).getA()%>"	name="QuesOption" id="">&nbsp;
							<input type="text" name="a"	id="option" placeholder="Option (A)" value="<%=sub.get(i - 1).getA()%>" disabled />
						</div>
						<div class="col">
							<input type="radio"	value="<%=sub.get(i - 1).getB()%>" name="QuesOption" id="">&nbsp;
							<input type="text" name="b" id="option" placeholder="Option (B)"	value="<%=sub.get(i - 1).getB()%>" disabled />
						</div>
					</div>
					<div class="row">
						<div class="col">	
							<input type="radio" value="<%=sub.get(i - 1).getC()%>" name="QuesOption" id="">&nbsp;
							<input type="text" name="c" id="option" placeholder="Option (C)" value="<%=sub.get(i - 1).getC()%>" disabled />
						</div>
						<div class="col">
							<input type="radio" value="<%=sub.get(i - 1).getD()%>" name="QuesOption" id="">&nbsp;
							<input type="text" name="d" id="option" placeholder="Option (D)" value="<%=sub.get(i - 1).getD()%>" disabled />
						</div>
					</div>
			<input type="hidden" name="organs" value="<%=sub.get(i - 1).getAnswer()%>">
			<input id="subid" type="hidden" name="subjectId" value="<%=sname%>">
			<input id="eid" type="hidden" name="examid" value="<%=examid%>">
			<input id="count1" type="hidden" name="qno" value="">
			<input id="fdate" type="hidden" name="fdate" value="<%=fdate%>">

			<%
			int ino = 0;
			for (QuestionsMcq qlist : sub) {
				ino++;
			%>
				
				<button type="submit" class="drop-flow" id="no<%=ino%>" value="<%=ino-1%>" onclick="funcT<%=ino%>()"><%=ino%></button>
				
				<script type="text/javascript">
					var x<%=ino%> = document.getElementById("no"+<%=ino%>);
					var c1 = document.getElementById("count1");
					function funcT<%=ino%>(){
							console.log(x<%=ino%>.value);
							c1.value = x<%=ino%>.value;
						}
				</script>
			<%}%>
		<br>
		<%if((i)==sub.size()){ %>
		
		<script type="text/javascript">
			var c11 = document.getElementById("count1");
			function funcL(){
					console.log(<%=sub.size()%>);
					c11.value = <%=sub.size()%>;
			}
		</script>
		 <center><input type="submit" class="mySubIsAdd" id="lastMe" onclick="funcL()" name="submit" value="SUBMIT" /></center>	 
		
		<% } %>
		
		</div>
		</div>
		</div>
		
	</form>

	<br>

	<script type="text/javascript">
	// Set the date we're counting down to
	var time = document.getElementById("fdate").value;
	var countDownDate;
// 	var f = document.getElementById("count1").value;
// 	if(f==1){
		countDownDate = new Date(time).getTime();
		console.log("countdown in f = 1....."+time)
// 	}
	// Update the count down every 1 second
	var x = setInterval(function() {

	  // Get today's date and time
	  var now = new Date().getTime();

	  // Find the distance between now and the count down date
	  var distance = countDownDate - now;

	  // Time calculations for days, hours, minutes and seconds

	  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

	  // Output the result in an element with id="demo"
	  document.getElementById("demo").innerHTML =  hours + "h "
	  + minutes + "m " + seconds + "s ";

	  // If the count down is over, write some text
	  if (distance < 0) {
	    clearInterval(x);
	    document.getElementById("demo").innerHTML = "EXPIRED";
	    //window.location.href = "index.jsp";
	    <%
	    	ExamChoiceDataDao e = new ExamChoiceDataDao(ConnectionProvider.getConnection());
	    	e.removeCon(examid);
	    %>
	    window.location.href = "index.jsp";
	  }
	}, 1000);

	</script>

	<script>
		function myFunction() {
			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
	</script>
	<br>
	<%@ include file="pages/footer.jsp"%>
</body>
</html>