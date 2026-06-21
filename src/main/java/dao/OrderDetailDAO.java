package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import connection.DriverManagerConnectionPool;
import model.OrderDetail;

public class OrderDetailDAO 
{
    public OrderDetailDAO() 
    {
    }

    public void save(OrderDetail orderDetail) throws SQLException 
    {
        String query = "INSERT INTO order_details (order_id, product_id, historical_price, historical_iva, quantity) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setInt(1, orderDetail.getOrderId());
            statement.setInt(2, orderDetail.getProductId());
            statement.setDouble(3, orderDetail.getHistoricalPrice());
            statement.setInt(4, orderDetail.getHistoricalIva());
            statement.setInt(5, orderDetail.getQuantity());

            statement.executeUpdate();
        }
    }
}
