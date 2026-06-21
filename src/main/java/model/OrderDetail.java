package model;

import java.io.Serializable;

public class OrderDetail implements Serializable 
{
    private static final long serialVersionUID = 1L;

    private int id;
    private int orderId;
    private int productId;
    private double historicalPrice;
    private int historicalIva;
    private int quantity;

    public OrderDetail() 
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

    public int getOrderId() 
    {
        return this.orderId;
    }

    public void setOrderId(int orderId) 
    {
        this.orderId = orderId;
    }

    public int getProductId() 
    {
        return this.productId;
    }

    public void setProductId(int productId) 
    {
        this.productId = productId;
    }

    public double getHistoricalPrice() 
    {
        return this.historicalPrice;
    }

    public void setHistoricalPrice(double historicalPrice) 
    {
        this.historicalPrice = historicalPrice;
    }

    public int getHistoricalIva() 
    {
        return this.historicalIva;
    }

    public void setHistoricalIva(int historicalIva) 
    {
        this.historicalIva = historicalIva;
    }

    public int getQuantity() 
    {
        return this.quantity;
    }

    public void setQuantity(int quantity) 
    {
        this.quantity = quantity;
    }
}
