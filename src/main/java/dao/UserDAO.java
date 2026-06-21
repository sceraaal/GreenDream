package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import connection.DriverManagerConnectionPool;
import model.User;

public class UserDAO 
{
    public UserDAO() 
    {
    }

    public void save(User user) throws SQLException 
    {
        String query = "INSERT INTO users (email, password, first_name, last_name, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirstName());
            statement.setString(4, user.getLastName());
            statement.setString(5, user.getRole());

            statement.executeUpdate();
        }
    }

    public boolean checkEmailExists(String email) throws SQLException 
    {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) 
            {
                if (resultSet.next()) 
                {
                    return resultSet.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public User authenticate(String email, String password) throws SQLException 
    {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet resultSet = statement.executeQuery()) 
            {
                if (resultSet.next()) 
                {
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setFirstName(resultSet.getString("first_name"));
                    user.setLastName(resultSet.getString("last_name"));
                    user.setRole(resultSet.getString("role"));
                    return user;
                }
            }
        }
        return null;
    }
}
