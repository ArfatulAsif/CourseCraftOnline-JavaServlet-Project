

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
 * Servlet implementation class TeacherAssign
 */
@WebServlet("/TeacherAssign")
public class TeacherAssign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherAssign() {
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
		 String teacherIdStr = (String) session.getAttribute("teacher_id_from_new_teacher_page");
		 String courseIdStr = (String) session.getAttribute("course_id_from_courses_page");

		 // Parse strings to integers
		 int teacher_id = Integer.parseInt(teacherIdStr);
		 int course_id = Integer.parseInt(courseIdStr);
		 
		 

	        String url = "jdbc:mysql://localhost:3306/coursecraft";
	        String dbUsername = "root";
	        String dbPassword = "";

	        try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
	            
	        	
	            String getCourseNameQuery = "SELECT title FROM all_courses WHERE id = ?";
	            PreparedStatement courseNameStmt = conn.prepareStatement(getCourseNameQuery);
	            courseNameStmt.setInt(1, course_id);
	            
	            ResultSet courseNameResult = courseNameStmt.executeQuery();
	            
	            String courseName = "";
	            
	            if (courseNameResult.next()) {
	                courseName = courseNameResult.getString("title");
	            }

	            
	            String getTeacherNameQuery = "SELECT name FROM registration WHERE id = ?";
	            
	            PreparedStatement teacherNameStmt = conn.prepareStatement(getTeacherNameQuery);
	            
	            teacherNameStmt.setInt(1, teacher_id);
	            
	            ResultSet teacherNameResult = teacherNameStmt.executeQuery();
	            String teacherName = "";
	            if (teacherNameResult.next()) {
	                teacherName = teacherNameResult.getString("name");
	            }

	            String insertQuery = "INSERT INTO already_course_offering_teacher (course_id, teacher_id, teacher_name, course_name) VALUES (?, ?, ?, ?)";
	            
	            PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
	            insertStmt.setInt(1, course_id);
	            insertStmt.setInt(2, teacher_id);
	            insertStmt.setString(3, teacherName);
	            insertStmt.setString(4, courseName);
	            int rowsInserted = insertStmt.executeUpdate();
	            if (rowsInserted > 0) {
	                System.out.println("Course offering added successfully!");
	                response.sendRedirect("courses.jsp"); // Redirect to success page
	            } else {
	                System.out.println("Failed to add course offering.");
	                response.sendRedirect("index.jsp"); // Redirect to error page
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	            response.sendRedirect("index.jsp"); // Redirect to error page
	        }
		
		
		
		
		
		
		
		
		
	}

}
