
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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		 String username = request.getParameter("log_username");
	        String password = request.getParameter("log_password");
	        String userType = null;

	        String url = "jdbc:mysql://localhost:3306/coursecraft";
	        String dbUsername = "root";
	        String dbPassword = "";

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            
	            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

	            String sql = "SELECT id, usertype FROM registration WHERE username = ? AND password = ?";
	            
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, username);
	            statement.setString(2, password);

	            ResultSet result = statement.executeQuery();

	            if (result.next()) {
	                // Login successful
	            	
	                int userId = result.getInt("id");
	                userType = result.getString("usertype");

	                HttpSession session = request.getSession();
	                
	                session.setAttribute("user_id", userId);
	                
	                session.setAttribute("user_type", userType);

	                response.sendRedirect("profile.jsp"); // Redirect to dashboard or any other page
	                
	                
	            } else {
	                // Login failed
	                String message = "Invalid username or password";
	                request.setAttribute("message", message);
	                request.getRequestDispatcher("login.jsp").forward(request, response);
	            }

	            conn.close();
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            response.sendRedirect("index.jsp"); // Redirect to an error page
	        }
	}

}
