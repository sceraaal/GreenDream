package control;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Questo filtro intercetta le pagine sensibili dell'utente loggato
@WebFilter(urlPatterns = {"/checkout.jsp", "/orders.jsp", "/profile.jsp"})
public class UserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Verifichiamo se l'oggetto utente esiste nella sessione
        Object user = (session != null) ? session.getAttribute("user") : null;

        if (user != null) {
            // L'utente è loggato, la richiesta può proseguire
            chain.doFilter(request, response);
        } else {
            // L'utente non è loggato: lo reindirizziamo alla pagina di login
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}