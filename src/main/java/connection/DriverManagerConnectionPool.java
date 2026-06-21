package connection;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DriverManagerConnectionPool 
{
    private static DataSource dataSource;

    static 
    {
        try 
        {
            InitialContext context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/TSW_DB");
        } 
        catch (NamingException e) 
        {
            System.out.println("JNDI pool initialization error: " + e.getMessage());
        }
    }

    public static Connection getConnection() throws SQLException 
    {
        if (dataSource == null) 
        {
            throw new SQLException("DataSource not initialized.");
        }
        return dataSource.getConnection();
    }
}
