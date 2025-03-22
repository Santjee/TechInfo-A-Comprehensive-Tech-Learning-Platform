package comm.tech.info.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import comm.tech.info.dao.UserDao;
import comm.tech.info.entities.User;
import comm.tech.info.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
        
        response.setContentType("text/plain;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            // Fetch form data
            String check = request.getParameter("check");
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("gender");

            // Validate fields
            if (check == null || name == null || email == null || password == null || gender == null ||
                name.isEmpty() || email.isEmpty() || password.isEmpty()) {
                out.print("All fields are required.");
                return;
            }

            // Create user object
            User user = new User(name, email, password, gender);
            
            // Get database connection
            Connection con = ConnectionProvider.getConnection();
            if (con == null) {
                out.print("Database connection failed.");
                return;
            }

            // Save user to database
            UserDao dao = new UserDao(con);
            boolean success = dao.saveUser(user);

            if (success) {
                out.print("done");
            } else {
                out.print("Error in saving user.");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
        doPost(request, response);
    }
}
