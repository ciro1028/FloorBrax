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
public class Subdivision {
    private int id;
    private String name;
    private String address;

    public Subdivision() {
        id = 0;
        name = "";
        address = "";
    }

    public Subdivision(int id, String name, String address) {
        this.id = id;
        this.name = name;
        this.address = address;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public void selectSubdivision(String column, String field){
        String sql = "select * from subdivision where " + column + " = '" + field + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setId(rs.getInt(1));
                setName(rs.getString(2));
                setAddress(rs.getString(3));
            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertSubdivision(String name, String address){
        
        String sql = "insert into subdivision (id, name, address) "
                + "values (null, ?, ?)";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, address);
            
            ps.execute();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void updateSubdivision(int id, String name, String address){
        String sql = "update subdivision set id = ?, name = ?, address = ? where id = '" + id + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, address);
            
            ps.executeUpdate();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public ArrayList getOrdersList(int id){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders where subdivision = '" + id + "'";
        
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
    
    public ArrayList<Subdivision> selectAllSubdivisions(){
        ArrayList listOfNames = new ArrayList();
        String sql = "select * from subdivision";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                Subdivision sub = new Subdivision();
                sub.selectSubdivision("id", rs.getString(1));
                listOfNames.add(sub);
                
            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        return listOfNames;
    }
    
    public void deleteSubdivision(String id){
        String sql = "delete from subdivision where id = '" + id + "'";
        
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
//        Subdivision subdivision = new Subdivision();
//        ArrayList<Order> list = new ArrayList<>();
//        
//        //subdivision.insertSubdivision("Magnolia", "459 Magnolia dr");
//        
//        //subdivision.selectSubdivision("name", "Lake Forest");
//        
//        //subdivision.updateSubdivision(1, "Lake Forest", "43 Lake Forest rd");
//        
//        list = subdivision.getOrdersList("2");
//        
//        for (Order order : list) {
//            System.out.println("Order: " + order.getOrderNum());
//        }
//        
//    }
}

