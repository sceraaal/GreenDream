package control;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import model.Cart;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {

        HttpSession session = request.getSession(false);

        if (session == null)
        {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) 
        {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) 
        {
            request.setAttribute("errorMessage", "Il tuo carrello è vuoto. Impossibile completare l'ordine.");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        try 
        {
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            ProductDAO productDAO = new ProductDAO();

            Order order = new Order();
            order.setUserId(user.getId());
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            order.setTotal(cart.getTotalPrice());

            int orderId = orderDAO.save(order);

            if (orderId > 0) 
            {

                for (CartItem item : cart.getItems()) 
                {
                    Product product = item.getProduct();

                    OrderDetail detail = new OrderDetail();
                    detail.setOrderId(orderId);
                    detail.setProductId(product.getId());
                    detail.setHistoricalPrice(product.getPrice());
                    detail.setHistoricalIva(product.getIva());
                    detail.setQuantity(item.getQuantity());

                    orderDetailDAO.save(detail);

                    Product dbProduct = productDAO.findById(product.getId());
                    if (dbProduct != null) 
                    {
                        int newQuantity = dbProduct.getQuantity() - item.getQuantity();
                        if (newQuantity < 0) 
                        {
                            newQuantity = 0; 
                        }
                        dbProduct.setQuantity(newQuantity);
                        productDAO.update(dbProduct);
                    }
                }

                cart.clear();

                session.setAttribute("successMessage", "Grazie! Il tuo ordine è stato ricevuto ed è in fase di elaborazione.");

                response.sendRedirect(request.getContextPath() + "/orderConfirmation.jsp");
            } 
            else 
            {
                request.setAttribute("errorMessage", "Errore nel salvataggio dell'ordine.");
                request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            }

        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}
