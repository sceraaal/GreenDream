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

                String categoria = request.getParameter("categoria");

                if (categoria != null && !categoria.trim().isEmpty() && !categoria.equals("tutti")) {
                    request.setAttribute("products", productDAO.findByCategory(categoria));
                } else {
                    request.setAttribute("products", productDAO.findAll());
                }

                request.setAttribute("categoria", categoria);
                request.setAttribute("titoloCatalogo", titoloPerCategoria(categoria));

                request.getRequestDispatcher("/products.jsp").forward(request, response);

            } else if (action.equals("detail")) {

                String idStr = request.getParameter("id");
                if (idStr != null) {
                    int id = Integer.parseInt(idStr);
                    request.setAttribute("product", productDAO.findById(id));
                }
                request.getRequestDispatcher("/productDetails.jsp").forward(request, response);

            } else if (action.equals("insert")) {

                Product product = new Product();
                product.setName(request.getParameter("name"));
                product.setDescription(request.getParameter("description"));
                product.setPrice(Double.parseDouble(request.getParameter("price")));
                product.setIva(Integer.parseInt(request.getParameter("iva")));
                product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                product.setImage(request.getParameter("image"));
                String cat = request.getParameter("category");
                product.setCategory((cat == null || cat.trim().isEmpty()) ? "cane" : cat);

                productDAO.save(product);
                request.getSession().setAttribute("successMessage", "Prodotto inserito con successo!");
                response.sendRedirect(request.getContextPath() + "/admin/Dashboard");

            } else if (action.equals("update")) {

                Product product = new Product();
                product.setId(Integer.parseInt(request.getParameter("id")));
                product.setName(request.getParameter("name"));
                product.setDescription(request.getParameter("description"));
                product.setPrice(Double.parseDouble(request.getParameter("price")));
                product.setIva(Integer.parseInt(request.getParameter("iva")));
                product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                product.setImage(request.getParameter("image"));
                String cat = request.getParameter("category");
                product.setCategory((cat == null || cat.trim().isEmpty()) ? "cane" : cat);

                productDAO.update(product);
                request.getSession().setAttribute("successMessage", "Prodotto modificato con successo!");
                response.sendRedirect(request.getContextPath() + "/admin/Dashboard");

            } else if (action.equals("delete")) {

                String idStr = request.getParameter("id");
                if (idStr != null) {
                    productDAO.delete(Integer.parseInt(idStr));
                }
                request.getSession().setAttribute("successMessage", "Prodotto eliminato correttamente.");
                response.sendRedirect(request.getContextPath() + "/admin/Dashboard");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private String titoloPerCategoria(String categoria) {
        if (categoria == null || categoria.trim().isEmpty() || categoria.equals("tutti")) {
            return "Tutti i nostri prodotti";
        }
        switch (categoria) {
            case "cane":             return "Prodotti per il Cane";
            case "gatto":            return "Prodotti per il Gatto";
            case "piccoli-animali":  return "Prodotti per Piccoli Animali";
            default:                 return "Tutti i nostri prodotti";
        }
    }
}
