package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import connection.DriverManagerConnectionPool;
import model.Order;

public class OrderDAO 
{
    public OrderDAO() 
    {
    }

    public int save(Order order) throws SQLException 
    {
        String query = "INSERT INTO orders (user_id, order_date, total) VALUES (?, ?, ?)";
        
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) 
        {
            statement.setInt(1, order.getUserId());
            statement.setTimestamp(2, order.getOrderDate());
            statement.setDouble(3, order.getTotal());
            
            statement.executeUpdate();
            
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) 
            {
                if (generatedKeys.next()) 
                {
                    return generatedKeys.getInt(1);
                }
            }
        }
        return 0;
    }
}