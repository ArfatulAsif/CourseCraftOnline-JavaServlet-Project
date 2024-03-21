<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@ page import="java.sql.*, java.util.ArrayList" %>
  
  
  
  
  
  
  
  
	<%
	   
	
	   
	
		 String UserType = (String) session.getAttribute("user_type");
	          
	      int userId = 0;
	      
	      if(session.getAttribute("user_id")!= null)
	      {
	    	  userId = (int) session.getAttribute("user_id");
	      }
	  
	        
	       System.out.println("Course page :"+UserType);
	        
	        
			if (UserType == null) {
				 String currentURL = request.getRequestURI();
				 session.setAttribute("redirectURL", currentURL);
				 response.sendRedirect("login.jsp");
				 return;
			}
	
	%>
	
	
	<%
	
	
	
	
	
	
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = "";

    // Session check for user_id and user_type
  
       
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection setup
            String url = "jdbc:mysql://localhost:3306/coursecraft";
            String dbUsername = "root";
            String dbPassword = "";

            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // SQL query to fetch user details
            String sql = "SELECT name FROM registration WHERE id = ? AND usertype = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setString(2, UserType);

            rs = pstmt.executeQuery();

            // Check if user details are fetched
            if (rs.next()) {
                name = rs.getString("name");
            } else {
                // Handle case where no user is found
                out.println("No user found with the provided details.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions (e.g., ClassNotFound, SQLException)
        } finally {
            // Clean-up environment
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
     


	
	%>
	
	
    
<!DOCTYPE html>
<html>

<head>
    <title>Online Course Management System</title>
    <link rel="stylesheet" href="CSS/profile.css">
    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- DaisyUI CDN -->
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- Animate.css CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- AOS CDN -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/f13afb77f1.js" crossorigin="anonymous"></script>
</head>

<body>
    
    
    <!-- Start of Navbar -->
    
    
    <div class="border-b-[1px] bg-violet-600">
        <div class="my-container">
        
        
        
            <!-- For Large Device -->
            <div class="hidden lg:flex items-center justify-between">
                <!-- Logo -->
                
                
                <a href='index.jsp'>
                    <h1 class="font-extrabold text-5xl text-white">CourseCraftOnline<span class="text-red-500">.</span></h1>
                </a>

                
                <!-- Nav links for medium and large devices -->
                <div class="flex flex-row items-center justify-between gap-3 md:gap-0">
                    <!-- active link style -->
                    <a href="index.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Home</a>
                    
                    
                    <!-- inactive link styles -->
                    <a href="courses.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Courses</a>
                    
                    
                    <a href="contact.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Contact Us</a>
                           
                    
                </div>

                <!-- user icon  -->
                
                <div class="flex justify-center items-center text-[18px]">
                    <div class="tooltip tooltip-left" data-tip="Profile">
                        <a href="profile.jsp" class="hover:text-white transition duration-300">
                            <i class="fa-regular fa-circle-user"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- For Medium and small devices -->
            
            
            <div class="navbar bg-base-100 lg:hidden bg-violet-600 min-h-[100px]">
                <div class="navbar-start">
                    <div class="dropdown">
                        <label tabindex="0" class="btn btn-ghost btn-circle">
                            <i class="fa-solid fa-bars text-[40px]"></i>
                        </label>

                        <ul tabindex="0"
                            class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-[400px] flex flex-col gap-5 p-5">
                            <li><a href="index.jsp"
                                    class="text-[40px] text-[#F17829] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Homepage</a>
                            </li>
                            <li><a href="courses.jsp"
                                    class="text-[40px] text-[#293341] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Courses</a></li>
                            <li><a href="contact.jsp"
                                    class="text-[40px] text-[#293341] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Contact Us</a>
                            </li>
              
                        </ul>
                    </div>
                </div>
                <div class="navbar-center">
                    
                        <a href='index.jsp'>
                            <h1 class="font-extrabold text-[50px] text-white">CourseCraftOnline<span class="text-red-500">.</span>
                            </h1>
                        </a>
                    
                </div>
                <div class="navbar-end">
                    <a href="profile.jsp" class="hover:text-[#F17829] transition duration-300">
                        <i class="fa-regular fa-circle-user text-[40px]"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Navbar -->
    
    
    
    
		<!-- -----------------------------------------------For Teachers -------------------------------- -->	    
			    
		<% if("Teacher".equals(UserType)) { %>	   
		
		
		
		
		<%        
		
		
		
	    PreparedStatement pstmt1 = null;
	    ResultSet rss = null;
	    String name1 = "";

	    // Initialize ArrayLists to store the details
	    ArrayList<Integer> courseIdList = new ArrayList<>();
	    ArrayList<Integer> teacherIdList = new ArrayList<>();
	    ArrayList<String> teacherNameList = new ArrayList<>();
	    ArrayList<String> courseNameList = new ArrayList<>();

	  
	    

	    try {
	        // Load the JDBC driver
	        

	        // SQL query to fetch course details for a teacher
	        String sql = "SELECT course_id, teacher_id, teacher_name, course_name FROM already_course_offering_teacher WHERE teacher_id = ?";
	        pstmt1 = conn.prepareStatement(sql);
	        pstmt1.setInt(1, userId);

	        rss = pstmt1.executeQuery();

	        // Process the result set
	        while (rss.next()) {
	            courseIdList.add(rss.getInt("course_id"));
	            teacherIdList.add(rss.getInt("teacher_id"));
	            teacherNameList.add(rss.getString("teacher_name"));
	            courseNameList.add(rss.getString("course_name"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Clean-up environment
	        try {
	            if (rss != null) rss.close();
	            if (pstmt1 != null) pstmt1.close();
	            
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    
	    
 %>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
							    
							     <div class="hero min-h-[500px]">
							        <div class="hero-content text-center w-full">
							            <div class="w-full md:max-w-[60vw]">
							                <h1 class="text-[68px] font-bold animate__animated animate__heartBeat text-violet-600 text-bol">
							                   Teachers Profile Page</h1>
							                    
							                  <h1 class="text-[48px] font-bold animate__animated animate__zoomInRight text-fuchsia-600 text-bol">
							                    <%=name %></h1>
							                                      
							            </div>
							        </div>
							    </div>
							    
							    
			    
			    
			    
			    
			    
			    
			    
			      <!-- --------------------------------- Select Teacher Page. ---------------->
			    
						   	 <div class="my-container">
						            <div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
						                <div class="text-center">
						                    <h2 class="text-xl font-bold text-violet-600 sm:text-3xl">
						                       Courses Taught by Myself:
						                    </h2>
						                
						                </div>
						
						               
						            </div>
						        </div>
			    
			    
			    
			    
			    <!-- -----Table with teachers -->
			    
			    <div class="overflow-x-auto">
					  <table class="table" id="data_table">
					  
					  
					 
							    <tr class="dat_tab">
							        <th class="dat1"></th>
							        <th class="dat2">Course Name</th>
							        <th class="dat3">Course Id</th>
							        <th class="dat4">Action</th>
							    </tr>  
							
							    <!-- Example rows -->

					
		<% for(int i=0;i<courseIdList.size();i++){ %>			
					
							    
							    <tr class="dat_tab hover:bg-slate-200" data-aos="fade-right">
							        <td class="dat1">
							          <i class="fa-solid fa-chalkboard-user max-h-[30px] max-w[30px]]"></i>
							           
							        </td>
							        <td class="dat2">
							            <a class="hover:text-red-500"><%=courseNameList.get(i) %></a>
							        </td>
							         <td class="dat3 hover:text-green-500"><%=courseIdList.get(i) %></td>
							        <td class="dat3 hover:text-blue-500"> <a href="enrolled_list.jsp?course_id_from_profile=<%= courseIdList.get(i) %>" > See Enrolled List </a></td>
							    </tr>
							    
							    
			<% } %>				   
							    
			
			    <!-- More example rows go here if needed -->
					  
					    
					  </table>
					  
					  
				</div>
			    
			    
			      
			      
			      
			      
			      
			
			
			<% } %>      
			      
			      
			      
			      
			      
			      
			      
			      
			      
			      
			      
		    
		<!-- ------------------------------For Admins --------------- -->	    
			    
		<% if("admin".equals(UserType)) { %>	   
		
		
		 
							    
							     <div class="hero min-h-[500px]">
							        <div class="hero-content text-center w-full">
							            <div class="w-full md:max-w-[60vw]">
							                <h1 class="text-[100px] font-bold animate__animated animate__heartBeat text-orange-700 text-bol">
							                   You are The Admin</h1>
							                    
							                  <h1 class="text-[48px] font-bold animate__animated animate__zoomInRight text-fuchsia-600 text-bol">
							                    <%=name %></h1>
							                                      
							            </div>
							        </div>
							    </div>
							    
							    
			    
			    	      
			      
   <% } %>
			      
			      
		
		
		
		
		
		
		
		
		
		
		
		
			      
			      
			      
			      
			      
			<!-- -----------------------------------------------For Students -------------------------------- -->	    
			    
		<% if("Student".equals(UserType)) { %>	   
		
		
		
 <%
		
		
	PreparedStatement pstmt2 = null;
    ResultSet rs2 = null;

    
    ArrayList<Integer> courseIdList = new ArrayList<>();
    ArrayList<String> courseNameList = new ArrayList<>();
    ArrayList<String> courseCodeList = new ArrayList<>();
    ArrayList<Integer> teacherIdList = new ArrayList<>();
    ArrayList<String> teacherNameList = new ArrayList<>();
    ArrayList<Integer> studentIdList = new ArrayList<>();
    ArrayList<String> studentNameList = new ArrayList<>();

   
   

    try {
       

        // SQL query to fetch enrolled courses for a student
        String sql = "SELECT course_id, course_name, course_code, teacher_id, teacher_name, student_id, student_name FROM enrolled_student WHERE student_id = ?";
        pstmt2 = conn.prepareStatement(sql);
        pstmt2.setInt(1, userId);

        rs2 = pstmt2.executeQuery();

        // Process the result set
        while (rs2.next()) {
            courseIdList.add(rs2.getInt("course_id"));
            courseNameList.add(rs2.getString("course_name"));
            courseCodeList.add(rs2.getString("course_code"));
            teacherIdList.add(rs2.getInt("teacher_id"));
            teacherNameList.add(rs2.getString("teacher_name"));
            studentIdList.add(rs2.getInt("student_id"));
            studentNameList.add(rs2.getString("student_name"));
        }

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Clean-up environment
        try {
            if (rs2 != null) rs2.close();
            if (pstmt2 != null) pstmt2.close();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
		
		
		
		
		
		%>
		
		
		
	
		
		 
							    
							     <div class="hero min-h-[500px]">
							        <div class="hero-content text-center w-full">
							            <div class="w-full md:max-w-[60vw]">
							                <h1 class="text-[68px] font-bold animate__animated animate__heartBeat text-violet-600 text-bol">
							                   Student Profile Page</h1>
							                    
							                  <h1 class="text-[48px] font-bold animate__animated animate__zoomInRight text-fuchsia-600 text-bol">
							                    <%=name %></h1>
							                                      
							            </div>
							        </div>
							    </div>
							    
							    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			      <!-- --------------------------------- . ---------------->
			    
						   	 <div class="my-container">
						            <div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
						                <div class="text-center">
						                    <h2 class="text-xl font-bold text-violet-600 sm:text-3xl">
						                       Courses Enrolled in by Myself:
						                    </h2>
						                
						                </div>
						
						               
						            </div>
						        </div>
			    
			    
			    
			    
			    <!-- -----Table with teachers -->
			    
			    <div class="overflow-x-auto">
					  <table class="table" id="data_table">
					  
					  
					 
							    <tr class="dat_tab">
							        <th class="dat1"></th>
							        <th class="dat2">Course Name</th>
							        <th class="dat3">Course Code</th>
							        <th class="dat4">Teacher Name</th>
							    </tr>  
							
							    <!-- Example rows -->
		
		
		
		

		
		
		
		<%for(int i=0;i<courseIdList.size();i++){ %>
							    
							    
							    <tr class="dat_tab hover:bg-slate-200" data-aos="fade-right">
							        <td class="dat1">
							          <i class="fa-solid fa-chalkboard-user max-h-[30px] max-w[30px]]"></i>
							           
							        </td>
							        <td class="dat2">
							            <a class="hover:text-red-500"><%=courseNameList.get(i) %></a>
							        </td>
							         <td class="dat3 hover:text-green-500"><%=courseCodeList.get(i) %></td>
							        <td class="dat3 hover:text-blue-500"><%=teacherNameList.get(i) %></td>
							    </tr>
							    
							    
			<%} %>				   
							    
			
			    <!-- More example rows go here if needed -->
					  
					    
					  </table>
					  
					  
				</div>
			    
			    
			      
			      
			      
			      
			      
			
			
			<% } %>      
			            
			      
			      
			      
			        
        
        
        
        
        <!-- -------------------------Logout page  -->
        
        
       <form action="Logout" method="post" enctype="application/x-www-form-urlencoded">
   			 <button class="button-74" type="submit">Log Out</button>
		</form>

      
        
        
        
        
       
        
        
        <% if (conn != null) conn.close(); %>
        
        

 		<!-- Start of Footer -->

    <div class="footer_padding">
		  <footer class="footer">
		    <div class="waves">
		      <div class="wave" id="wave1"></div>
		      <div class="wave" id="wave2"></div>
		      <div class="wave" id="wave3"></div>
		      <div class="wave" id="wave4"></div>
		    </div>
		    <ul class="social-icon">
		      <li class="social-icon__item"><a class="social-icon__link" href="#">
		          <ion-icon name="logo-github"></ion-icon>
		        </a></li>
		      <li class="social-icon__item"><a class="social-icon__link" href="#">
		          <ion-icon name="logo-twitter"></ion-icon>
		        </a></li>
		      <li class="social-icon__item"><a class="social-icon__link" href="#">
		          <ion-icon name="logo-linkedin"></ion-icon>
		        </a></li>
		      <li class="social-icon__item"><a class="social-icon__link" href="#">
		          <ion-icon name="logo-facebook"></ion-icon>
		        </a></li>
		    </ul>
		    <ul class="menu">
		      <li class="menu__item"><a class="menu__link" href="index.jsp">Home</a></li>
		      <li class="menu__item"><a class="menu__link" href="courses.jsp">Courses</a></li>
		      <li class="menu__item"><a class="menu__link" href="profile.jsp">Profile</a></li>		     
		      <li class="menu__item"><a class="menu__link" href="contact.jsp">Contact US</a></li>
		
		    </ul>
		    <p>&copy;2024 AIA INC. | All Rights Reserved</p>
		  </footer>
    </div>  
		   <!-- End of Footer -->
		  
  
  
  
 	 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
 	 <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
            AOS.init();
        </script>
</body>

</html>