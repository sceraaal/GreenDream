package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Cart;
import model.Product;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
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
        
        HttpSession session = request.getSession(true);
        
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        try {
            ProductDAO productDAO = new ProductDAO();

            if (action == null || action.equals("view")) {
                request.getRequestDispatcher("/cart.jsp").forward(request, response);
                return;
            }

            if (idStr != null && !idStr.trim().isEmpty()) {
                int id = Integer.parseInt(idStr);
                Product product = productDAO.findById(id);

                if (product != null) {
                    if (action.equals("add")) {
                        cart.addProduct(product);
                        
                    } else if (action.equals("update")) {
                        int quantity = Integer.parseInt(request.getParameter("quantity"));
                        cart.updateProductQuantity(product, quantity);
                        
                    } else if (action.equals("remove")) {
                        cart.removeProduct(product);
                    }
                }
            }

            response.sendRedirect(request.getContextPath() + "/cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}