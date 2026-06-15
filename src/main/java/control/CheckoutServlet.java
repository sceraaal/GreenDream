package control;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Controllo di sicurezza: se non c'è la sessione, rimandiamo alla home
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        // Verifichiamo se il carrello esiste ed ha almeno un prodotto
        if (cart == null || cart.isEmpty()) {
            request.setAttribute("errorMessage", "Il tuo carrello è vuoto. Impossibile completare l'ordine.");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        try {
            /* * NOTA PER DOPO: Qui si collegherà la logica degli ordini di Nazar
             * OrderDAO orderDAO = new OrderDAO();
             * orderDAO.doSave(utente, cart);
             */

            // L'ordine è andato a buon fine: svuotiamo il carrello della sessione
            session.removeAttribute("cart");

            // Impostiamo un messaggio di successo per l'utente
            session.setAttribute("successMessage", "Grazie! Il tuo ordine è stato ricevuto ed è in fase di elaborazione.");
            
            // Reindirizziamo alla pagina di conferma dell'ordine
            response.sendRedirect(request.getContextPath() + "/orderConfirmation.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // Blocco di sicurezza: il checkout si fa solo inviando il form in POST
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}