package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Mappiamo la servlet in modo che risponda all'URL /Login
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Gestiamo la richiesta in POST (invio del form di login)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Controllo di sicurezza base sui campi vuoti
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "Email e password sono obbligatorie.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Cifriamo la password ricevuta dal form per il futuro confronto nel database
        String hashedPassword = PasswordUtils.hashPassword(password);

        try {
            dao.UserDAO userDAO = new dao.UserDAO();
            model.User user = userDAO.authenticate(email, hashedPassword);

            if (user != null) {
                // Login corretto: creiamo o recuperiamo la sessione
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user); // Salva l'oggetto utente intero

                boolean isAdmin = "admin".equalsIgnoreCase(user.getRole());
                session.setAttribute("isAdmin", isAdmin);

                // Reindirizzamento in base al ruolo
                if (isAdmin) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            } else {
                // Credenziali errate
                request.setAttribute("errorMessage", "Email o password errati.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        }

    // Se qualcuno prova ad accedere alla Servlet direttamente in GET, lo rimandiamo al form di login
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}