<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@page import="com.exam.helper.ConnectionProvider" %>
        <%@ page import="com.exam.dao.*" %>
            <%@ page import="com.exam.entity.*" %>
                <%@ page import="java.util.*" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                    <link rel="icon" type="image/x-icon" href="ks-logo.ico">
                        <meta charset="ISO-8859-1">
                        <title>student : MCQ TEST </title>
                    </head>

                    <body>
                        <%@ include file="pages/header.jsp" %>

                            <div class="papaer_for">
                                <select name="examtype" id="PaperType" class="PaperType" onchange="getData" required>
                                    <option value="" disabled selected>Select Paper Type</option>
                                    <option value="midsem">Mid-Sem</option>
                                    <option value="finalsem">Final-Sem</option>
                                </select>
                                <div class="PaperType">
                                    <label>Total Marks : </label><input type="number" name="qusnMCQ" class="marksMCQ" />
                                </div>
                                <select name="subnm" id="subNm" class="PaperType" onchange="#getData" required>
                                    <option value="" disabled selected>Select Subject</option>
                                    <% SubjectDao s=new SubjectDao(ConnectionProvider.getConnection()); List<Subject>
                                        sub = s.getAllSubjectByUId(user.getId());
                                        for (Subject s1 : sub) {
                                        %>


                                        <option value="<%=s1.getSubId()%>">
                                            <%=s1.getSubName()%>
                                        </option>

                                        <% } %>
                                </select>
                                <div class="PaperType">
                                    <label>Exam Time : </label><input type="number" name="qusnMCQ" class="marksMCQ" />
                                    Minute
                                </div>
                                <div id="container">
                                    <input type="button" id="add" class="addBtn" value="add" />
                                </div>
                                <input type="text" id="mesum" class="mesum" readonly />
                            </div>

                            <script>
                                var myarr = [];
                                var myarr2 = [];



                                $(document).ready(function () {
                                    alert("HEllo");
                                    $("#add").click(function () {
                                        $('#container').append('<br><input type="number" id="txt1" class="num" /><span>*</span><input type="number" class="num" id="txt2"  /><span>=</span><input type="text" id="txt3" class="tot"    disabled/> &nbsp;<input type="button" class="okGet" id="okGet" value="ok" onclick="changeclass()"/><br>');

                                    });
                                });
                                let res = 0;
                                let sum = 1;
                                let j = 0, i = 0;
                                function changeclass() {
                                    let inputs = document.getElementsByClassName("num");
                                    let total = document.getElementsByClassName("tot");
                                    let a, b;

                                    for (i; i < inputs.length; i = i + 2) {
                                        sum = 1;
                                        if (inputs[i].type == "number") {
                                            a = inputs[i].value;
                                            b = inputs[i + 1].value;
                                            myarr.push(document.getElementsByClassName("num").value);
                                            myarr.push(document.getElementsByClassName("tot	").value);

                                            sum = a * b;
                                            //document.getElementById("txt3").value = sum;

                                            let els = document.getElementsByClassName("tot")[j];
                                            els.value = sum;
                                        }
                                        j++;
                                        console.log("i " + i + " Inner a " + a + " b " + b + " sum " + sum + "Res " + res + "  " + inputs[i].type + " " + inputs[i].value + " " + inputs.length);

                                    }
                                    alert(myarr);
                                    console.log("i " + i + "Outer a " + a + " b " + b + " sum " + sum + "Res " + res + "  " + inputs[0].type + " " + inputs[0].value + " " + inputs.length);

                                    sum = 0;
                                    let c = 0;
                                    for (let i = 0; i < total.length; i++) {
                                        if (total[i].type == "text") {
                                            c = parseInt(total[i].value);
                                            sum = c + sum;
                                            //document.getElementById("txt3").value = sum;
                                        }
                                        document.getElementById("mesum").value = sum;

                                        console.log("c  " + c + " Res " + res + "  Type " + total[i].type + "  Value" + total[i].value + "  Length " + total.length + " Sum" + sum);
                                    }

                                }
                            </script>

                    </body>

                    </html>
                    <%@ include file="pages/footer.jsp" %>