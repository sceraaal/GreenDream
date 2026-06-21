package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckEmail")
public class CheckEmailServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {

        String email = request.getParameter("email");
        boolean exists = false;

        if (email != null && !email.trim().isEmpty()) 
        {
            try 
            {
                dao.UserDAO userDAO = new dao.UserDAO();
                exists = userDAO.checkEmailExists(email);
            } 
            catch (Exception e) 
            {
                e.printStackTrace();
            }
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write("{\"exists\": " + exists + "}");
    }
}
