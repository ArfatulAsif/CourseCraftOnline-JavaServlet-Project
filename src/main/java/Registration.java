

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
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		doGet(request, response);
		
		
	    	 String username = request.getParameter("log_username");
	        String name = request.getParameter("log_name");
	        String userType = request.getParameter("TypeSelect");
	        String password = request.getParameter("log_password");
	        
	        
	        System.out.println(username+" "+name+" "+" "+userType+" "+password);

	        
	        
	        String url = "jdbc:mysql://localhost:3306/coursecraft";
	        String dbUsername = "root";
	        String dbPassword = "";

	        try {
	          
	            Class.forName("com.mysql.cj.jdbc.Driver");

	        
	            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

	       
	            String sql = "INSERT INTO registration (username, name, usertype, password) VALUES (?, ?, ?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, username);
	            statement.setString(2, name);
	            statement.setString(3, userType);
	            statement.setString(4, password);

	           
	            int rowsInserted = statement.executeUpdate();
	            if (rowsInserted > 0) {
	                System.out.println("A new user was registered successfully!");
	                response.sendRedirect("login.jsp"); // Redirect to a success page
	            } else {
	                System.out.println("Failed to register the user.");
	                response.sendRedirect("index.jsp"); // Redirect to an error page
	            }

	         
	            conn.close();
	            
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            response.sendRedirect("index.jsp"); // Redirect to an error page
	        }
	}

}
