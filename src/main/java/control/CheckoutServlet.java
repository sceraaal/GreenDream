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
        
        // Controllo di sicurezza: se non c'è la sessione, rimandiamo alla home
        if (session == null) 
        {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) 
        {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");

        // Verifichiamo se il carrello esiste ed ha almeno un prodotto
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

            // Creazione dell'ordine principale
            Order order = new Order();
            order.setUserId(user.getId());
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            order.setTotal(cart.getTotalPrice());

            int orderId = orderDAO.save(order);

            if (orderId > 0) 
            {
                // Salvataggio dei dettagli dell'ordine e aggiornamento magazzino
                for (CartItem item : cart.getItems()) 
                {
                    Product product = item.getProduct();
                    
                    // Salviamo il dettaglio dell'ordine
                    OrderDetail detail = new OrderDetail();
                    detail.setOrderId(orderId);
                    detail.setProductId(product.getId());
                    detail.setHistoricalPrice(product.getPrice());
                    detail.setHistoricalIva(product.getIva());
                    detail.setQuantity(item.getQuantity());
                    
                    orderDetailDAO.save(detail);

                    // Aggiorniamo la quantità nel DB
                    Product dbProduct = productDAO.findById(product.getId());
                    if (dbProduct != null) 
                    {
                        int newQuantity = dbProduct.getQuantity() - item.getQuantity();
                        if (newQuantity < 0) 
                        {
                            newQuantity = 0; // Evitiamo quantità negative a magazzino
                        }
                        dbProduct.setQuantity(newQuantity);
                        productDAO.update(dbProduct);
                    }
                }

                // Svuotiamo il carrello
                cart.clear();

                // Impostiamo un messaggio di successo per l'utente
                session.setAttribute("successMessage", "Grazie! Il tuo ordine è stato ricevuto ed è in fase di elaborazione.");
                
                // Reindirizziamo alla pagina di conferma dell'ordine
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

    // Blocco di sicurezza: il checkout si fa solo inviando il form in POST
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}