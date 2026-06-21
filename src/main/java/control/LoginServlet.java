package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "Email e password sono obbligatorie.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtils.hashPassword(password);

        try {
            dao.UserDAO userDAO = new dao.UserDAO();
            model.User user = userDAO.authenticate(email, hashedPassword);

            if (user != null) {

                HttpSession session = request.getSession(true);
                session.setAttribute("user", user); 

                boolean isAdmin = "admin".equalsIgnoreCase(user.getRole());
                session.setAttribute("isAdmin", isAdmin);

                session.setAttribute("successMessage", "Bentornato, " + user.getFirstName() + "! Buon shopping su PetHouse.");

                if (isAdmin) {
                    response.sendRedirect(request.getContextPath() + "/admin/Dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } else {

                request.setAttribute("errorMessage", "Email o password errati.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
