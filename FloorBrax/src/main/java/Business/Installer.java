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
import Business.Order;

/**
 *
 * @author Ciro
 */
public class Installer {
    private int id;
    private String name;
    private String phone;

    public Installer() {
        id = 0;
        name = "";
        phone = "";
    }

    public Installer(int id, String name, String phone) {
        this.id = id;
        this.name = name;
        this.phone = phone;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public void selectInstaller(String column, String field){
        String sql = "select * from installers where " + column + " = '" + field + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setId(rs.getInt(1));
                setName(rs.getString(2));
                setPhone(rs.getString(3));
            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertInstaller(String name, String phone){
        
        String sql = "insert into installers (id, name, phone) values (null, ?, ?)";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, phone);
            
            
            ps.execute();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    public void updateInstaller(int id, String name, String phone){
        String sql = "update installers set id = ?, name = ?, phone = ? where id = '" + id + "'";
        
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, phone);
            
            ps.executeUpdate();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public ArrayList getOrdersList(int id){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders where installer_id = '" + id + "'";
        
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
    
    public ArrayList<Order> getTodayOrders(int id){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders where installer_id = '" + id + "' and date = curdate()";
        
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
    
    public ArrayList getOrdersByDate(int id, String start, String end){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders where installer_id = '" + id + "' and date between '" + start + "' and '" + end + 
                "' order by date desc";
        
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
    
    
    
    public ArrayList<Installer> selectAllInstallers(){
        ArrayList<Installer> listOfNames = new ArrayList();
        String sql = "select * from installers";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                Installer installer = new Installer();
                installer.selectInstaller("id", rs.getString(1));
                listOfNames.add(installer);
            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        return listOfNames;
    }
    
    public void deleteInstaller(String id){
        String sql = "delete from installers where id = '" + id + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.executeUpdate();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
//    public static void main(String[] args) {
//        Installer installer = new Installer();
//        
//        //installer.insertInstaller("Jorge", "256-555-2222");
//        //installer.selectInstaller("name", "Jose");
//        //installer.updateInstaller(1, "Santiago", "404-678-0967");
//        
//        ArrayList<Order> list = new ArrayList();
//        list = installer.getTodayOrders("1");
//        
//        for (Order current: list) {
//            System.out.println(current.getInstallerId());
//            System.out.println(current.getOrderNum());
//        }
//    }
}

