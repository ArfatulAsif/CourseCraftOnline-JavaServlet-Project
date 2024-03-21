<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@ page import="java.sql.*, java.util.ArrayList" %>
  
  
  
  
  
  
  
  
	<%
		 String UserType = (String) session.getAttribute("user_type");
	
	      int userId = (int) session.getAttribute("user_id");
	        
	       System.out.println("Course page :"+UserType);
	        
	        
			if (UserType == null) {
				 String currentURL = request.getRequestURI();
				 session.setAttribute("redirectURL", currentURL);
				 response.sendRedirect("login.jsp");
				 return;
			}
			
			 String courseIdParam = request.getParameter("course_id_from_profile");
			    int course_id = 0;
			    if(courseIdParam != null) {
			        try {
			            course_id = Integer.parseInt(courseIdParam);
			        } catch(NumberFormatException e) {
			            // Handle the case where courseIdParam is not a valid integer
			        }
			    }
	
	%>
	
	
	
	
	
	
	<%
	
	
	
	
	
	
	
	
	


	int teacher_id = userId;

	// Database connection setup
	String url = "jdbc:mysql://localhost:3306/coursecraft";
	String dbUsername = "root";
	String dbPassword = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	ArrayList<Integer> idList = new ArrayList<>();
	ArrayList<Integer> courseIdList = new ArrayList<>();
	ArrayList<Integer> teacherIdList = new ArrayList<>();
	ArrayList<String> teacherNameList = new ArrayList<>();
	ArrayList<Integer> studentIdList = new ArrayList<>();
	ArrayList<String> studentNameList = new ArrayList<>();
	ArrayList<String> courseNameList = new ArrayList<>();
	
	
	try {
	    // Load the JDBC driver
	    Class.forName("com.mysql.cj.jdbc.Driver");

	    // Establish the database connection
	    conn = DriverManager.getConnection(url, dbUsername, dbPassword);

	    // SQL query to select enrolled courses based on course_id and teacher_id (user_id)
	    String sql = "SELECT id, course_id, teacher_id, teacher_name, course_code, student_id, student_name FROM enrolled_student WHERE course_id = ? AND teacher_id = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, course_id);
	    pstmt.setInt(2, teacher_id);
	    
	    // Execute the query
	    rs = pstmt.executeQuery();

	    // Iterate through the result set and populate the ArrayLists
	    while (rs.next()) {
	    	idList.add(rs.getInt("id"));
	        courseIdList.add(rs.getInt("course_id"));
	        teacherIdList.add(rs.getInt("teacher_id"));
	        teacherNameList.add(rs.getString("teacher_name"));
	        courseNameList.add(rs.getString("course_code"));
	        studentIdList.add(rs.getInt("student_id"));
	        studentNameList.add(rs.getString("student_name"));
	    }
	} catch (SQLException | ClassNotFoundException e) {
	    e.printStackTrace();
	} finally {
	    // Close JDBC objects in the reverse order of their creation to avoid resource leaks
	    try {
	        if (rs != null) rs.close();
	        if (pstmt != null) pstmt.close();
	        if (conn != null) conn.close();
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
    
    
    
    
			    
			    
			    
			      <!-- --------------------------------- Select Teacher Page. ---------------->
			    
						   	 <div class="my-container">
						            <div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
						                <div class="text-center">
						                    <h2 class="text-xl font-bold text-violet-600 sm:text-3xl">
						                       Enrolled Student List:
						                    </h2>
						                
						                </div>
						
						               
						            </div>
						        </div>
			    
			    
			    
			    
			    <!-- -----Table with teachers -->
			    
			    <div class="overflow-x-auto">
					  <table class="table" id="data_table">
					  
					  
					 
							    <tr class="dat_tab">
							        <th class="dat1"></th>
							        <th class="dat2">Student Name</th>
							        <th class="dat3">Student Id</th>
							        <th class="dat4">Course Code</th>
							    </tr>  
							
							    <!-- Example rows -->
	
					
	

					
		<%   for(int i=0;i<idList.size();i++){ %>	
					
							    
							    <tr class="dat_tab hover:bg-slate-200" data-aos="fade-right">
							        <td class="dat1">
							          <i class="fa-solid fa-chalkboard-user max-h-[30px] max-w[30px]]"></i>
							           
							        </td>
							        <td class="dat2">
							            <a class="hover:text-red-500"><%=studentNameList.get(i) %></a>
							        </td>
							         <td class="dat3 hover:text-green-500"><%=studentIdList.get(i) %></td>
							        <td class="dat3 hover:text-blue-500"><%=courseNameList.get(i) %></td>
							    </tr>
							    
						
			<%} %>			
							    	   
							    
			
			    <!-- More example rows go here if needed -->
					  
					    
					  </table>
					  
					  
				</div>
			    
			    
	
			      
			      

		
		
        
        
        

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