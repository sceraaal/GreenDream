package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dao.ProductDAO;

@WebServlet("/admin/Dashboard")
public class AdminServlet extends HttpServlet {
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

        try {
            ProductDAO productDAO = new ProductDAO();
            OrderDAO orderDAO = new OrderDAO();

            request.setAttribute("products", productDAO.findAll());

            String cliente = request.getParameter("cliente");
            String dataInizio = request.getParameter("dataInizio");
            String dataFine = request.getParameter("dataFine");

            boolean hasFilter =
                    (cliente != null && !cliente.trim().isEmpty()) ||
                    (dataInizio != null && !dataInizio.trim().isEmpty()) ||
                    (dataFine != null && !dataFine.trim().isEmpty());

            if (hasFilter) {
                request.setAttribute("orders", orderDAO.findByFilters(cliente, dataInizio, dataFine));
            } else {
                request.setAttribute("orders", orderDAO.findAll());
            }

            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
