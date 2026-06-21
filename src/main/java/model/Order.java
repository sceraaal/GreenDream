package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Order implements Serializable 
{
    private static final long serialVersionUID = 1L;

    private int id;
    private int userId;
    private Timestamp orderDate;
    private double total;

    public Order() 
    {
    }

    public int getId() 
    {
        return this.id;
    }

    public void setId(int id) 
    {
        this.id = id;
    }

    public int getUserId() 
    {
        return this.userId;
    }

    public void setUserId(int userId) 
    {
        this.userId = userId;
    }

    public Timestamp getOrderDate() 
    {
        return this.orderDate;
    }

    public void setOrderDate(Timestamp orderDate) 
    {
        this.orderDate = orderDate;
    }

    public double getTotal() 
    {
        return this.total;
    }

    public void setTotal(double total) 
    {
        this.total = total;
    }
}
