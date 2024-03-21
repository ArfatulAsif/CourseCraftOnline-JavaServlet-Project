<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@ page import="java.sql.*, java.util.ArrayList" %>
  
  
  
  
<%
    // Establish database connection
    String url = "jdbc:mysql://localhost:3306/coursecraft";
    String dbUsername = "root";
    String dbPassword = "";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    ArrayList<String> idList = new ArrayList<>();
    ArrayList<String> titleList = new ArrayList<>();
    ArrayList<String> dateList = new ArrayList<>();
    ArrayList<String> descriptionList = new ArrayList<>();
    ArrayList<String> codeList = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);
        stmt = conn.createStatement();
        String sql = "SELECT id, title, date, brief_description, course_code FROM all_courses";
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            idList.add(rs.getString("id"));
            titleList.add(rs.getString("title"));
            dateList.add(rs.getString("date"));
            descriptionList.add(rs.getString("brief_description"));
            codeList.add(rs.getString("course_code"));
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



%>
  
  
  
  
  
  
  
	<%
		 String UserType = (String) session.getAttribute("user_type");
	        
	       System.out.println("Course page :"+UserType);
	        
	        
			if (UserType == null) {
				 String currentURL = request.getRequestURI();
				 session.setAttribute("redirectURL", currentURL);
				 response.sendRedirect("login.jsp");
				 return;
			}
	
	%>
	
	
	
	
    
<!DOCTYPE html>
<html>

<head>
    <title>Online Course Management System</title>
    <link rel="stylesheet" href="CSS/courses.css">
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
                    <a href="courses.jsp" class="text-white h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
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
    
    
    
    
    
    
    <!-- --------------------------------- Add Course Button For Admin ---------------->
    
    
			  <% if ("admin".equals(UserType)) { %>
			    <a href="add_course.jsp" class="button-74" role="button">Add New Course</a>
			<% } %>
			    
   
    
    
    
 
    
    
    
    <!-- ------------------------All Subjects------------------ -->

    
 <section class="cards-wrapper grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-2">
 
 
 <% for (int i = 0 ; i< idList.size() ; i++) { %>
					
					<% if(i%4 == 0) { %>							
												<!-- ----------Blue ------------- -->
												  <div class="card-grid-space">
												    <div class="num"> <%=i+1%> </div>
												    <a class="card bg-indigo-700" href="teachers.jsp?course_id_from_courses_page=<%=idList.get(i)%>" >
												      <div>
												        <h1><%=titleList.get(i)%></h1>
												        <p><%=descriptionList.get(i) %></p>
												        <div class="date"><%=dateList.get(i) %></div>
												        <div class="tags">
												          <div class="tag"><%=codeList.get(i) %></div>
												        </div>
												      </div>
												    </a>
												  </div>
							<%} %>
				 <% if(i % 4 == 1) { %>							
							    <!-- --------------Purple--------- -->
							    <div class="card-grid-space">
							        <div class="num"><%= i+1 %></div>
							        <a class="card bg-purple-700" href="teachers.jsp?course_id_from_courses_page=<%=idList.get(i)%>" >
							            <div>
							                <h1><%= titleList.get(i) %></h1>
							                <p><%= descriptionList.get(i) %></p>
							                <div class="date"><%= dateList.get(i) %></div>
							                <div class="tags">
							                    <div class="tag"><%= codeList.get(i) %></div>
							                </div>
							            </div>
							        </a>
							    </div>
					<% } %>

												  
												  
						<% if(i % 4 == 2) { %>
										    <!-- ------------------Grey----------- -->
										    <div class="card-grid-space">
										        <div class="num"><%=i+1%></div>
										        <a class="card bg-slate-600" href="teachers.jsp?course_id_from_courses_page=<%=idList.get(i)%>" >
										            <div>
										                <h1><%= titleList.get(i) %></h1>
										                <p><%= descriptionList.get(i) %></p>
										                <div class="date"><%= dateList.get(i) %></div>
										                <div class="tags">
										                    <div class="tag"><%= codeList.get(i) %></div>
										                </div>
										            </div>
										        </a>
										    </div>
							<% } %>

												  
						<% if(i % 4 == 3) { %>
							    <!-- ------reddish---------- -->
							    <div class="card-grid-space">
							        <div class="num"><%= i+1 %></div>
							        <a class="card bg-fuchsia-700" href="teachers.jsp?course_id_from_courses_page=<%=idList.get(i)%>" >
							            <div>
							                <h1><%= titleList.get(i) %></h1>
							                <p><%= descriptionList.get(i) %></p>
							                <div class="date"><%= dateList.get(i) %></div>
							                <div class="tags">
							                    <div class="tag"><%= codeList.get(i) %></div>
							                </div>
							            </div>
							        </a>
							    </div>
					<% } %>

												  
												  
       <% } %>
  


  
</section>
    

    
    
        
        
        


       
        
        
        
        
      
        
        
        
        
       
        
        
        
        
        

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