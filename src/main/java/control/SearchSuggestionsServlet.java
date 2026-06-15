package control;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet("/SearchSuggestions")
public class SearchSuggestionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String query = request.getParameter("q");
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (query == null || query.trim().isEmpty()) {
            response.getWriter().write("[]");
            return;
        }

        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> allProducts = productDAO.findAll();
            
            // Filtriamo i prodotti che contengono la query nel nome (case-insensitive)
            List<String> suggestions = allProducts.stream()
                .map(Product::getName)
                .filter(name -> name.toLowerCase().contains(query.toLowerCase()))
                .limit(5)
                .collect(Collectors.toList());

            // Costruiamo manualmente un piccolo array JSON per semplicità
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < suggestions.size(); i++) {
                json.append("\"").append(suggestions.get(i)).append("\"");
                if (i < suggestions.size() - 1) json.append(",");
            }
            json.append("]");
            
            response.getWriter().write(json.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("[]");
        }
    }
}
