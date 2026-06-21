package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Mappiamo la servlet in modo che risponda all'URL /Registration
@WebServlet("/Registration")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validazione di sicurezza lato server sui campi vuoti
        if (nome == null || cognome == null || email == null || password == null ||
            nome.isEmpty() || cognome.isEmpty() || email.isEmpty() || password.isEmpty()) {
            
            request.setAttribute("errorMessage", "Tutti i campi sono obbligatori.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 1. Cifratura della password prima del salvataggio nel DB (Richiesto da checklist)
        String hashedPassword = PasswordUtils.hashPassword(password);

        try {
            dao.UserDAO userDAO = new dao.UserDAO();
            model.User nuovoUtente = new model.User();
            nuovoUtente.setFirstName(nome);
            nuovoUtente.setLastName(cognome);
            nuovoUtente.setEmail(email);
            nuovoUtente.setPassword(hashedPassword);
            nuovoUtente.setRole("user"); // Ruolo di default

            userDAO.save(nuovoUtente);

            // Se la registrazione va a buon fine, impostiamo un messaggio di conferma (Richiesto da checklist)
            request.setAttribute("successMessage", "Registrazione completata con successo! Adesso puoi effettuare il login.");
            
            // Reindirizziamo l'utente alla pagina di login per accedere
            request.getRequestDispatcher("/login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // In caso di problemi strutturali scatta la nostra pagina di errore 500
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Blocco di sicurezza: se provano ad accedere in GET, rimandiamo alla pagina del form
        response.sendRedirect(request.getContextPath() + "/register.jsp");
    }
}