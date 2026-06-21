package model;

import java.io.Serializable;

public class User implements Serializable 
{
    private static final long serialVersionUID = 1L;

    private int id;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String role;

    public User() 
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

    public String getEmail() 
    {
        return this.email;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getPassword() 
    {
        return this.password;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getFirstName() 
    {
        return this.firstName;
    }

    public void setFirstName(String firstName) 
    {
        this.firstName = firstName;
    }

    public String getLastName() 
    {
        return this.lastName;
    }

    public void setLastName(String lastName) 
    {
        this.lastName = lastName;
    }

    public String getRole() 
    {
        return this.role;
    }

    public void setRole(String role) 
    {
        this.role = role;
    }
}
