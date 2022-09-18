 <%@ page import="com.exam.entity.Admin"%>
 
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="adminHome.jsp">Exam Management</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">

              <!--   <li><a href="">Users Online: <?php //echo users_online(); ?></a></li> -->

                <!-- <li><a href="">Users Online: <span class="usersonline"></span></a></li> -->

                <li><a href="adminHome.jsp">Home Site</a></li>
               
               
               
    			<%
					Admin admin = (Admin) session.getAttribute("currentUser");
    				if(admin==null){ response.sendRedirect("adminLogin.jsp"); }else{
				%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Welcome <%=admin.getName()%>
                
              <%} %>
                                    
                    
                    
                    <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="profile.php"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="../AdminLogoutServlet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
            
            
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">

                	
                    <!--  <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#posts_dropdown"><i class="fa fa-fw fa-arrows-v"></i>Home Page Item <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="posts_dropdown" class="collapse">
                            <li>
                                <a href="home.php"><i class="fa fa-dot-circle-o"></i> 1st Card </a>
                            </li>
                            <li>
                                <a href="home1.php"><i class="fa fa-dot-circle-o"></i>  2nd Card </a>
                            </li>
                            <li>
                                <a href="home2.php"><i class="fa fa-dot-circle-o"></i>  3rd Card </a>
                            </li>
                            <li>
                                <a href="posts.php?source=add_post">Add Posts</a>
                            </li>
                        </ul>
                    </li> -->
                    <li>
                        <a href="student_data.jsp"><i class="fa fa-user"></i> Students</a>
                    </li> 
                    

                    <li>
                        <a href="faculty_data.jsp"><i class="fa fa-book"></i> Faculties</a>
                    </li>
					<li>
                        <a href="subject_data.jsp"><i class="fa fa-laptop"></i> Subject</a>
                    </li>
                    <!-- <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-dribbble"></i> Categories <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="plants.php"><i class="fa fa-tree"></i> Plants</a>
                            </li>
                            <li>
                                <a href="seeds.php"><i class="fa fa-leaf"></i> Seeds</a>
                            </li>
                            <li>
                                <a href="fertilizers.php"><i class="fa fa-circle-o-notch"></i> Fertilizerss</a>
                            </li>
                            <li>
                                <a href="accessories.php"><i class="fa fa-briefcase"></i> Accessories</a>
                            </li>
                         
                        </ul>
                    </li> -->
                    <li>
                                <a href="uploadMarkApr.jsp"><i class="fa fa-check-square"></i> Upload Marks Appr</a>
                    </li>
                 
                    <li>
                                <a href="isExam_admin.jsp"><i class="fa fa-check-circle-o"></i> Is Exam</a>
                    </li>

                    <li>
                                <a href="otherExamData.jsp"><i class="fa fa-database "></i> Other Exam Data</a>
                    </li>
                    <li>
                                <a href="wirttenPaper_data.jsp"><i class="fa fa-edit"></i> Written Paper</a>
                    </li>
					<li>
                                <a href="announce.jsp"><i class="fa fa-bullhorn"></i> Announcement</a>
                    </li>
                   	<li>
                                <a href="HomeMarksDiv.jsp"><i class="fa fa-fw fa-dashboard"></i> Marks Div</a>
                    </li>

                    <!-- <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Home Page Edit <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="home.php">1st Card</a>
                            </li>
                            <li>
                                <a href="seeds.php">2nd Card</a>
                            </li>
                            <li>
                                <a href="fertilizers.php">3rd Card</a>
                            </li>
                            <li>
                                <a href="accessories.php">Accessories</a>
                            </li>
                             
                        </ul>
                    </li>
                     -->
                    <li>
                    </li>
               
                    
                    
                </ul>
            </div>
            
            
            
          
        </nav>
        