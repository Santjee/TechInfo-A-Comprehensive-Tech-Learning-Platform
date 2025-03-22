package comm.tech.info.servlet;

import comm.tech.info.dao.UserDao;
import comm.tech.info.entities.User;
import comm.tech.info.entities.Message;
import comm.tech.info.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        // Fetching user email and password
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");

        // Getting user from database
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User u = dao.getUserByEmailAndPassword(userEmail, userPassword);

        HttpSession session = request.getSession();

        if (u == null) {
            // Invalid login, send error message to login page
        	Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
            HttpSession s = request.getSession();
            s.setAttribute("msg", msg);
        	
           // session.setAttribute("msg", "Invalid details! Try again.");
            response.sendRedirect("login_page.jsp");
            
        } else {
            // Successful login, store user in session
            session.setAttribute("currentUser", u);
            response.sendRedirect("profile.jsp");
        }
    }
}
