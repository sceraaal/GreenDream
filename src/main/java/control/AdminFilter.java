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

//Automatically intercept any requests directed to the /admin/ folder
@WebFilter("/admin/*")
public class AdminFilter implements Filter 
{
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException 
    {      
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        //We retrieve the role attribute from the user's session
        Boolean isAdmin = (session != null) ? (Boolean)
        		session.getAttribute("isAdmin") : null;

        if (isAdmin != null && isAdmin)
        {
        	//If the user is an administrator, the request can proceed
            chain.doFilter(request, response);
        }      
        else       	
        {
        	//If not an administrator, it responds with error 403
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
        }
    }
}