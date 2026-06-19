package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

// Mappiamo la servlet per la ricerca dinamica
@WebServlet("/SearchSuggestions")
public class SearchSuggestionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String query = request.getParameter("q");
        
        // Impostiamo la risposta in formato JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder jsonResponse = new StringBuilder();
        jsonResponse.append("[");

        if (query != null && query.trim().length() >= 2) {
            try {
                ProductDAO productDAO = new ProductDAO();
                List<Product> products = productDAO.searchByName(query.trim());
                
                for (Product p : products) {
                    jsonResponse.append("{")
                                .append("\"id\":").append(p.getId()).append(",")
                                .append("\"name\":\"").append(p.getName().replace("\"", "\\\"")).append("\"")
                                .append("},");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Rimuoviamo l'ultima virgola di troppo se la stringa non è vuota
        if (jsonResponse.charAt(jsonResponse.length() - 1) == ',') {
            jsonResponse.deleteCharAt(jsonResponse.length() - 1);
        }
        
        jsonResponse.append("]");

        // Spediamo il JSON indietro al client JavaScript
        response.getWriter().write(jsonResponse.toString());
    }
}