<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <title>Online Course Management System</title>
    <link rel="stylesheet" href="CSS/index.css">
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
                    <a href="index.jsp" class="text-white h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
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
    
    
    
    
    
    
    
    
    
    
    
    
    

    <!-- Start of Banner -->
    <div class="hero min-h-[500px] bg-base-200">
        <div class="hero-content text-center w-full">
            <div class="w-full md:max-w-[60vw]">
                <h1 class="text-[48px] font-bold animate__animated animate__backInRight text-violet-600 text-bol">
                    Online Course Management System</h1>
                <p class="py-6 animate__animated animate__backInLeft">CourseCraftOnline is your comprehensive solution for seamlessly managing and accessing educational courses, empowering students, and
                 teachers with its intuitive interface and robust functionalities.</p>                         
            </div>
        </div>
    </div>
    
    
    <!-- End of Banner -->
    
    
    
    
    

    <div class="my-container">

        <!-- Start of Featured Sections -->
        <div class="my-container">
            <div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
                <div class="text-center">
                    <h2 class="text-xl font-bold text-teal-600 sm:text-3xl ">
                        Key features of CourseCraftOnline
                    </h2>

                    <p class="w-full mx-auto mt-4 text-gray-500" data-aos="zoom-in">
                        CourseCraftOnline offers user-friendly course management with secure authentication, personalized dashboards, and communication tools, fostering seamless connections 
                        between students and teachers while providing valuable insights
                         through analytics and reporting.
                    </p>
                </div>
            </div>
        </div>

        <div class='my-container fashion-cards-my-container grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-2'>
        
        
            <!-- Card-1 -->
            <a data-aos="flip-left"
                class="group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-people-roof text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">Student & Teachers</p>

                    <div class="mt-8">
                        <!-- <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100"> -->
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                               At CourseCraftOnline, we foster meaningful connections between students
                                and teachers, facilitating dynamic interactions and fostering collaborative learning experiences.
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <!-- Card-2 -->
            <a data-aos="flip-left" 
                class="delay-200 group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-book text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">Manage Courses</p>

                    <div class="mt-8">
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                               CourseCraftOnline simplifies course management with intuitive tools for creating, organizing courses effortlessly, empowering educators to tailor content, assignments, and
                                assessments to meet diverse learning needs, all within a 
                                centralized platform designed for efficiency and flexibility.
                            </p>
                        </div>
                    </div>
                </div>
            </a>

            <!-- Card-3 -->
            <a data-aos="flip-left" 
                class="delay-200 group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-users-between-lines text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">View Enrolled List</p>

                    <div class="mt-8">
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                               With CourseCraftOnline's enrolled list feature, administrators, teachers, and students gain easy access to comprehensive lists showcasing enrolled students for each course, streamlining administrative tasks, enhancing communication, and ensuring seamless tracking of student progress throughout the learning journey.
                            </p>
                        </div>
                    </div>
                </div>
            </a>

            <!-- Card-4 -->
            <a data-aos="flip-left"
                class="delay-200 group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-mobile-screen text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">Contact Us</p>

                    <div class="mt-8">
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                                Contact information and others documentation and acknowledgement can be found here.
                            </p>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <!-- End of Featured Sections -->
        
        
        
        
        
        

     
        

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