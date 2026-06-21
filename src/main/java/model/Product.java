package model;

import java.io.Serializable;

public class Product implements Serializable 
{
    private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String description;
    private double price;
    private int iva;
    private int quantity;
    private String image;
    private String category;

    public Product()
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

    public String getName() 
    {
        return this.name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getDescription() 
    {
        return this.description;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public double getPrice() 
    {
        return this.price;
    }

    public void setPrice(double price) 
    {
        this.price = price;
    }

    public int getIva() 
    {
        return this.iva;
    }

    public void setIva(int iva) 
    {
        this.iva = iva;
    }

    public int getQuantity() 
    {
        return this.quantity;
    }

    public void setQuantity(int quantity) 
    {
        this.quantity = quantity;
    }

    public String getImage() 
    {
        return this.image;
    }

    public void setImage(String image)
    {
        this.image = image;
    }

    public String getCategory()
    {
        return this.category;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }
}
