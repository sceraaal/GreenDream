package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import connection.DriverManagerConnectionPool;
import model.Product;

public class ProductDAO 
{
    public ProductDAO() 
    {
    }

    public void save(Product product) throws SQLException 
    {
        String query = "INSERT INTO products (name, description, price, iva, quantity, image) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getIva());
            statement.setInt(5, product.getQuantity());
            statement.setString(6, product.getImage());
            
            statement.executeUpdate();
        }
    }

    public void update(Product product) throws SQLException 
    {
        String query = "UPDATE products SET name = ?, description = ?, price = ?, iva = ?, quantity = ?, image = ? WHERE id = ?";
        
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getIva());
            statement.setInt(5, product.getQuantity());
            statement.setString(6, product.getImage());
            statement.setInt(7, product.getId());
            
            statement.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException 
    {
        String query = "DELETE FROM products WHERE id = ?";
        
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    public List<Product> findAll() throws SQLException 
    {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";
        
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) 
        {
            while (resultSet.next()) 
            {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getDouble("price"));
                product.setIva(resultSet.getInt("iva"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setImage(resultSet.getString("image"));
                
                products.add(product);
            }
        }
        return products;
    }

    public Product findById(int id) throws SQLException 
    {
        String query = "SELECT * FROM products WHERE id = ?";
        
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) 
        {
            statement.setInt(1, id);
            
            try (ResultSet resultSet = statement.executeQuery()) 
            {
                if (resultSet.next()) 
                {
                    Product product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setIva(resultSet.getInt("iva"));
                    product.setQuantity(resultSet.getInt("quantity"));
                    product.setImage(resultSet.getString("image"));
                    return product;
                }
            }
        }
        return null;
    }
}