/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ciro
 */
public class User {
    private int id;
    private String name;
    private String username;
    private String password;

    public User() {
        id = 0;
        name = "";
        username = "";
        password = "";
    }

    public User(int id, String name, String username, String password) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void selectUser(String column, String field){
        String sql = "select * from users where " + column + " = '" + field + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setId(rs.getInt(1));
                setName(rs.getString(2));
                setUsername(rs.getString(3));
                setPassword(rs.getString(4));
            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertUser(String name, String username, String password){
        
        String sql = "insert into users (id, name, username, password) "
                + "values (null, ?, ?, ?)";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, password);
            
            ps.execute();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void updateUser(int id, String name, String username, String password){
        String sql = "update users set id = ?, name = ?, username = ?, password = ? where id = '" + id + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, username);
            ps.setString(4, password);
            
            ps.executeUpdate();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public ArrayList getOrdersList(String id){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders where user = '" + id + "'";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while(rs.next()){
                String orderNum = "";
                Order order = new Order();
                orderNum = rs.getString(1);
                order.selectOrder("order_num", orderNum);
                ordersList.add(order);
            }
            
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return ordersList;
    }
    
//    public static void main(String[] args) {
//        User user = new User();
//        ArrayList<Order> list = new ArrayList<>();
//        list = user.getOrdersList("1");
//        //user.insertUser("Ciro Amaral", "ciro", "ciro");
//        
//        user.selectUser("id", "3");
//        
//        //user.updateUser(2, "Jose Erico Batista", "jose", "jose");
//        
//        System.out.println("User: " + user.getName());
////        for (Order order : list) {
////            System.out.println("User: " + order.getOrderNum());
////        }
//    }
    
}


