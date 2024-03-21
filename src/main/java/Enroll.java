

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Enroll
 */
@WebServlet("/Enroll")
public class Enroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Enroll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession();

        // Correcting the extraction and parsing of ID values from session attributes
        int teacherId = 0, courseId = 0, studentId = 0;

        // For teacherId
        Object teacherIdObj = session.getAttribute("teacher_id_for_enroll");
        if (teacherIdObj instanceof Integer) {
            teacherId = (Integer) teacherIdObj;
        } else if (teacherIdObj instanceof String) {
            try {
                teacherId = Integer.parseInt((String) teacherIdObj);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Log and handle error appropriately
            }
        }

        // For courseId
        Object courseIdObj = session.getAttribute("course_id_for_enroll");
        if (courseIdObj instanceof Integer) {
            courseId = (Integer) courseIdObj;
        } else if (courseIdObj instanceof String) {
            try {
                courseId = Integer.parseInt((String) courseIdObj);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Log and handle error appropriately
            }
        }

        // For studentId
        Object studentIdObj = session.getAttribute("user_id"); // Assuming "user_id" is stored
        if (studentIdObj instanceof Integer) {
            studentId = (Integer) studentIdObj;
        } else if (studentIdObj instanceof String) {
            try {
                studentId = Integer.parseInt((String) studentIdObj);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Log and handle error appropriately
            }
        }

		// Ensuring none of the required session attributes are null before proceeding
		if (teacherId == 0 || courseId == 0 || studentId == 0) {
		    // Handle missing attributes (e.g., redirect to an error page or set an error message)
		    response.sendRedirect("index.jsp"); // Placeholder redirect
		    return; // Stop further execution
		}

		String courseName = "", teacherName = "", courseCode = "", studentName = "";

		String url = "jdbc:mysql://localhost:3306/coursecraft";
		String dbUsername = "root";
		String dbPassword = "";

		try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
		    
		    // Query to get course details
		    String sqlCourses = "SELECT title, course_code FROM all_courses WHERE id = ?";
		    try (PreparedStatement psCourses = conn.prepareStatement(sqlCourses)) {
		        psCourses.setInt(1, courseId);
		        try (ResultSet rsCourses = psCourses.executeQuery()) {
		            if (rsCourses.next()) {
		                courseName = rsCourses.getString("title");
		                courseCode = rsCourses.getString("course_code");
		            }
		        }
		    }
		    
		    // Query to get teacher's name
		    String sqlTeacher = "SELECT name FROM registration WHERE id = ?";
		    try (PreparedStatement psTeacher = conn.prepareStatement(sqlTeacher)) {
		        psTeacher.setInt(1, teacherId);
		        try (ResultSet rsTeacher = psTeacher.executeQuery()) {
		            if (rsTeacher.next()) {
		                teacherName = rsTeacher.getString("name");
		            }
		        }
		    }
		    
		    // Query to get student's name
		    String sqlStudent = "SELECT name FROM registration WHERE id = ?";
		    try (PreparedStatement psStudent = conn.prepareStatement(sqlStudent)) {
		        psStudent.setInt(1, studentId);
		        try (ResultSet rsStudent = psStudent.executeQuery()) {
		            if (rsStudent.next()) {
		                studentName = rsStudent.getString("name");
		            }
		        }
		    }
		    
		    // Insert into enrolled_student table
		    String sqlInsert = "INSERT INTO enrolled_student (course_id, course_name, course_code, teacher_id, teacher_name, student_id, student_name) VALUES (?, ?, ?, ?, ?, ?, ?)";
		    try (PreparedStatement psInsert = conn.prepareStatement(sqlInsert)) {
		        psInsert.setInt(1, courseId);
		        psInsert.setString(2, courseName);
		        psInsert.setString(3, courseCode);
		        psInsert.setInt(4, teacherId);
		        psInsert.setString(5, teacherName);
		        psInsert.setInt(6, studentId);
		        psInsert.setString(7, studentName);

		        psInsert.executeUpdate();
		    }
		    response.sendRedirect("courses.jsp"); // Redirect to a success page
		} catch (Exception e) {
		    e.printStackTrace();
		    response.sendRedirect("error.jsp"); // Redirect to an error page with error handling
		}


	}

}
