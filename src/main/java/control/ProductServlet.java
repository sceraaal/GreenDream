package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Gestiamo sia GET che POST reindirizzando a un unico metodo interno per comodità
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        try {
            dao.ProductDAO productDAO = new dao.ProductDAO();

            if (action == null || action.equals("list")) {
                // 1. VISUALIZZAZIONE CATALOGO COMPLETO
                request.setAttribute("products", productDAO.findAll());
                request.getRequestDispatcher("/catalog.jsp").forward(request, response);
                
            } else if (action.equals("detail")) {
                // 2. VISUALIZZAZIONE DETTAGLIO PRODOTTO
                String idStr = request.getParameter("id");
                if (idStr != null) {
                    int id = Integer.parseInt(idStr);
                    request.setAttribute("product", productDAO.findById(id));
                }
                request.getRequestDispatcher("/productDetail.jsp").forward(request, response);
                
            } else if (action.equals("insert")) {
                // 3. INSERIMENTO NUOVO PRODOTTO (Solo Admin)
                Product product = new Product();
                product.setName(request.getParameter("name"));
                product.setDescription(request.getParameter("description"));
                product.setPrice(Double.parseDouble(request.getParameter("price")));
                product.setIva(Integer.parseInt(request.getParameter("iva")));
                product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                product.setImage(request.getParameter("image"));
                
                productDAO.save(product);
                request.getSession().setAttribute("successMessage", "Prodotto inserito con successo!");
                response.sendRedirect(request.getContextPath() + "/admin/manageProducts.jsp");
                
            } else if (action.equals("update")) {
                // 4. MODIFICA PRODOTTO ESISTENTE (Solo Admin)
                Product product = new Product();
                product.setId(Integer.parseInt(request.getParameter("id")));
                product.setName(request.getParameter("name"));
                product.setDescription(request.getParameter("description"));
                product.setPrice(Double.parseDouble(request.getParameter("price")));
                product.setIva(Integer.parseInt(request.getParameter("iva")));
                product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                product.setImage(request.getParameter("image"));
                
                productDAO.update(product);
                request.getSession().setAttribute("successMessage", "Prodotto modificato con successo!");
                response.sendRedirect(request.getContextPath() + "/admin/manageProducts.jsp");
                
            } else if (action.equals("delete")) {
                // 5. CANCELLAZIONE PRODOTTO (Solo Admin)
                String idStr = request.getParameter("id");
                if (idStr != null) {
                    productDAO.delete(Integer.parseInt(idStr));
                }
                request.getSession().setAttribute("successMessage", "Prodotto eliminato correttamente.");
                response.sendRedirect(request.getContextPath() + "/admin/manageProducts.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}