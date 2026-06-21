package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Registration")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (nome == null || cognome == null || email == null || password == null ||
            nome.isEmpty() || cognome.isEmpty() || email.isEmpty() || password.isEmpty()) {

            request.setAttribute("errorMessage", "Tutti i campi sono obbligatori.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtils.hashPassword(password);

        try {
            dao.UserDAO userDAO = new dao.UserDAO();
            model.User nuovoUtente = new model.User();
            nuovoUtente.setFirstName(nome);
            nuovoUtente.setLastName(cognome);
            nuovoUtente.setEmail(email);
            nuovoUtente.setPassword(hashedPassword);
            nuovoUtente.setRole("user"); 

            userDAO.save(nuovoUtente);

            request.setAttribute("successMessage", "Registrazione completata con successo! Adesso puoi effettuare il login.");

            request.getRequestDispatcher("/login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/register.jsp");
    }
}
