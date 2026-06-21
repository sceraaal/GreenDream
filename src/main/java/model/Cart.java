package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable 
{
    private static final long serialVersionUID = 1L;

    private List<CartItem> items;

    public Cart() 
    {
        this.items = new ArrayList<>();
    }

    public List<CartItem> getItems() 
    {
        return this.items;
    }

    public void addProduct(Product product) 
    {
        for (CartItem item : this.items) 
        {
            if (item.getProduct().getId() == product.getId()) 
            {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        this.items.add(new CartItem(product, 1));
    }

    public void removeProduct(Product product) 
    {
        CartItem toRemove = null;

        for (CartItem item : this.items) 
        {
            if (item.getProduct().getId() == product.getId()) 
            {
                toRemove = item;
                break;
            }
        }

        if (toRemove != null) 
        {
            this.items.remove(toRemove);
        }
    }

    public double getTotalPrice() 
    {
        double total = 0.0;

        for (CartItem item : this.items) 
        {
            total = total + (item.getProduct().getPrice() * item.getQuantity());
        }

        return total;
    }

    public void updateProductQuantity(Product product, int quantity) 
    {
        for (CartItem item : this.items) 
        {
            if (item.getProduct().getId() == product.getId()) 
            {
                if (quantity > 0) 
                {
                    item.setQuantity(quantity);
                } 
                else 
                {
                    this.items.remove(item);
                }
                return;
            }
        }
        if (quantity > 0) 
        {
            this.items.add(new CartItem(product, quantity));
        }
    }

    public void clear() 
    {
        this.items.clear();
    }
}
