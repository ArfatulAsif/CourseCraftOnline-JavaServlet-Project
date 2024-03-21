

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
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCourse
 */
@WebServlet("/AddCourse")
public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourse() {
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
		
		String courseTitle = request.getParameter("course_title");
        String startDate = request.getParameter("start_date");
        String briefDescription = request.getParameter("brief_description");
        String courseCode = request.getParameter("course_code");

        String url = "jdbc:mysql://localhost:3306/coursecraft";
        String dbUsername = "root";
        String dbPassword = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            String sql = "INSERT INTO all_courses (title, date, brief_description, course_code) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, courseTitle);
            statement.setString(2, startDate);
            statement.setString(3, briefDescription);
            statement.setString(4, courseCode);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                String message = "Course added successfully";
                request.setAttribute("message", message);
                request.getRequestDispatcher("courses.jsp").forward(request, response);
            } else {
                String message = "Failed to add course";
                request.setAttribute("message", message);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            conn.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            response.sendRedirect("index.jsp");
        }
	}

}
