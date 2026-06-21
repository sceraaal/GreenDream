package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import connection.DriverManagerConnectionPool;
import model.Order;

public class OrderDAO
{
    public OrderDAO()
    {
    }

    private Order mapRow(ResultSet resultSet) throws SQLException
    {
        Order order = new Order();
        order.setId(resultSet.getInt("id"));
        order.setUserId(resultSet.getInt("user_id"));
        order.setOrderDate(resultSet.getTimestamp("order_date"));
        order.setTotal(resultSet.getDouble("total"));
        return order;
    }

    public List<Order> findByUserId(int userId) throws SQLException
    {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query))
        {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery())
            {
                while (resultSet.next())
                {
                    orders.add(mapRow(resultSet));
                }
            }
        }
        return orders;
    }

    public List<Order> findAll() throws SQLException
    {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders ORDER BY order_date DESC";

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery())
        {
            while (resultSet.next())
            {
                orders.add(mapRow(resultSet));
            }
        }
        return orders;
    }

    public List<Order> findByFilters(String email, String dateStart, String dateEnd) throws SQLException
    {
        List<Order> orders = new ArrayList<>();
        StringBuilder query = new StringBuilder(
            "SELECT o.* FROM orders o JOIN users u ON o.user_id = u.id WHERE 1 = 1");
        List<Object> params = new ArrayList<>();

        if (email != null && !email.trim().isEmpty())
        {
            query.append(" AND LOWER(u.email) LIKE ?");
            params.add("%" + email.trim().toLowerCase() + "%");
        }
        if (dateStart != null && !dateStart.trim().isEmpty())
        {
            query.append(" AND o.order_date >= ?");
            params.add(dateStart.trim() + " 00:00:00");
        }
        if (dateEnd != null && !dateEnd.trim().isEmpty())
        {
            query.append(" AND o.order_date <= ?");
            params.add(dateEnd.trim() + " 23:59:59");
        }
        query.append(" ORDER BY o.order_date DESC");

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query.toString()))
        {
            for (int i = 0; i < params.size(); i++)
            {
                statement.setObject(i + 1, params.get(i));
            }
            try (ResultSet resultSet = statement.executeQuery())
            {
                while (resultSet.next())
                {
                    orders.add(mapRow(resultSet));
                }
            }
        }
        return orders;
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
