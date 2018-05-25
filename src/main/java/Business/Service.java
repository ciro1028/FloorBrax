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
public class Service {
    private int id;
    private String title;
    private String description;
    private int price;
    private int toPay;
    private double pricePerSquareFoot;
    private double pricePerSquareFootPaid;
    private double priceperSquareFootDitra;
    private double priceperSquareFootDitraToPay;

    public Service() {
        id = 0;
        title = "";
        description = "";
        price = 0;
        toPay = 0;
        pricePerSquareFoot = 0;
        pricePerSquareFootPaid = 0;
        priceperSquareFootDitra = 0;
        priceperSquareFootDitraToPay = 0;
    }

    public Service(int id, String title, String description, int price, int toPay, double pricePerSquareFoot, double pricePerSquareFootPaid, double priceperSquareFootDitra, double priceperSquareFootDitraToPay) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.toPay = toPay;
        this.pricePerSquareFoot = pricePerSquareFoot;
        this.pricePerSquareFootPaid = pricePerSquareFootPaid;
        this.priceperSquareFootDitra = priceperSquareFootDitra;
        this.priceperSquareFootDitraToPay = priceperSquareFootDitraToPay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getToPay() {
        return toPay;
    }

    public void setToPay(int toPay) {
        this.toPay = toPay;
    }

    public double getPricePerSquareFoot() {
        return pricePerSquareFoot;
    }

    public void setPricePerSquareFoot(double pricePerSquareFoot) {
        this.pricePerSquareFoot = pricePerSquareFoot;
    }

    public double getPricePerSquareFootPaid() {
        return pricePerSquareFootPaid;
    }

    public void setPricePerSquareFootPaid(double pricePerSquareFootPaid) {
        this.pricePerSquareFootPaid = pricePerSquareFootPaid;
    }

    public double getPriceperSquareFootDitra() {
        return priceperSquareFootDitra;
    }

    public void setPriceperSquareFootDitra(double priceperSquareFootDitra) {
        this.priceperSquareFootDitra = priceperSquareFootDitra;
    }

    public double getPriceperSquareFootDitraToPay() {
        return priceperSquareFootDitraToPay;
    }

    public void setPriceperSquareFootDitraToPay(double priceperSquareFootDitraToPay) {
        this.priceperSquareFootDitraToPay = priceperSquareFootDitraToPay;
    }
    
    public void selectService(String column, String field){
        String sql = "select * from services where " + column + " = '" + field + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(""
                    + "jdbc:mysql://floorbraxdb.cafbpmnvc5qd.us-east-1.rds.amazonaws.com:3306/FloorBraxDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setId(rs.getInt(1));
                setTitle(rs.getString(2));
                setDescription(rs.getString(3));
                setPrice(rs.getInt(4));
                setToPay(rs.getInt(5));
                setPricePerSquareFoot(rs.getDouble(6));
                setPricePerSquareFootPaid(rs.getDouble(7));
                setPriceperSquareFootDitra(rs.getDouble(8));
                setPriceperSquareFootDitraToPay(rs.getDouble(9));
            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertService(String title, String description, int price, int toPay, double pricePerSquareFoot, 
            double pricePerSquareFootPaid, double priceperSquareFootDitra, double priceperSquareFootDitraToPay){
        
        String sql = "insert into services (id, title, description, price, to_pay, price_per_sqf, price_per_sqf_paid, sqf_ditra, sql_ditra_toPay) "
                + "values (null, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(""
                    + "jdbc:mysql://floorbraxdb.cafbpmnvc5qd.us-east-1.rds.amazonaws.com:3306/FloorBraxDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, description);
            ps.setInt(3, price);
            ps.setInt(4, toPay);
            ps.setDouble(5, pricePerSquareFoot);
            ps.setDouble(6, pricePerSquareFootPaid);
            ps.setDouble(7, priceperSquareFootDitra);
            ps.setDouble(8, priceperSquareFootDitraToPay);
            
            ps.execute();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void updateService(int id, String title, String description, int price, int toPay, double pricePerSquareFoot, 
            double pricePerSquareFootPaid, double priceperSquareFootDitra, double priceperSquareFootDitraToPay){
        String sql = "update installers set id = ?, title = ?, description = ?, price = ?, to_pay = ?, price_per_sqf = ?,"
                + " price_per_sqf_paid = ?, sqf_ditra = ?, sql_ditra_toPay where id = '" + id + "'";
        
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(""
                    + "jdbc:mysql://floorbraxdb.cafbpmnvc5qd.us-east-1.rds.amazonaws.com:3306/FloorBraxDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setInt(4, price);
            ps.setInt(5, toPay);
            ps.setDouble(6, pricePerSquareFoot);
            ps.setDouble(7, pricePerSquareFootPaid);
            ps.setDouble(8, priceperSquareFootDitra);
            ps.setDouble(9, priceperSquareFootDitraToPay);
            
            ps.executeUpdate();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public ArrayList getOrdersList(String id){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(""
                    + "jdbc:mysql://floorbraxdb.cafbpmnvc5qd.us-east-1.rds.amazonaws.com:3306/FloorBraxDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while(rs.next()){
                Order order = new Order();
                String orderNum = rs.getString(1);
                String servicesArray[] = rs.getString(12).split(" ");
                
                for (String current : servicesArray) {
                    if(id.equals(current)){
                        order.selectOrder("order_num", orderNum);
                        ordersList.add(order);
                    }
                }
            }
            
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return ordersList;
    }
    
    public ArrayList<Service> selectAllServices(){
        ArrayList<Service> listOfNames = new ArrayList();
        String sql = "select * from services";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(""
                    + "jdbc:mysql://floorbraxdb.cafbpmnvc5qd.us-east-1.rds.amazonaws.com:3306/FloorBraxDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                Service service = new Service();
                service.selectService("id", rs.getString(1));
                listOfNames.add(service);
                
            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        return listOfNames;
    }
    
    public void deleteService(String id){
        String sql = "delete from services where id = '" + id + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(""
                    + "jdbc:mysql://floorbraxdb.cafbpmnvc5qd.us-east-1.rds.amazonaws.com:3306/FloorBraxDB", "root", "Cc102807");
            
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.executeUpdate();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    
//    public static void main(String[] args) {
//        Service service = new Service();
//        ArrayList<Order> list = new ArrayList<>();
//        list = service.getOrdersList("2");
//        
//        //service.insertService("Hardwood Floor", "Install hardwood on floors", 0, 0, 3, 1.5);
//        service.selectService("title", "Backsplash");
//        
//        //System.out.println("Title: " + service.getTitle() + ", Id: " + service.getId());
//        
//        for (Order current: list) {
//            System.out.println("Num: " + current.getOrderNum());
//            System.out.println("Services: " + current.getServices());
//        }
//    }
    
}

