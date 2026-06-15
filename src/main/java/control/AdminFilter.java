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

// Intercetta automaticamente qualsiasi richiesta diretta alla cartella /admin/
@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Recuperiamo l'attributo del ruolo dalla sessione dell'utente
        Boolean isAdmin = (session != null) ? (Boolean) session.getAttribute("isAdmin") : null;

        if (isAdmin != null && isAdmin) {
            // Se l'utente è un amministratore, la richiesta può proseguire
            chain.doFilter(request, response);
        } else {
            // Se non è amministratore, risponde con l'errore 403
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
        }
    }
}