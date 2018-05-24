package Business;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

/**
 *
 * @author Ciro
 */
public class Order {
    private String orderNum;
    private int installerId;
    private String description;
    private String date;
    private String status;
    private String subdivision;
    private String telNumber;
    private String pic;
    private int total;
    private int toPay;
    private String[] services;
    private int squareFootage;
    private String user;
    private int extraPrice;
    private int sqfDitra;
    private int sqfHardwood;
    private String dateAdded;
    
    public Order(){
        orderNum = "";
        installerId = 0;
        description = "";
        date = "";
        status = "";
        subdivision = "";
        telNumber = "";
        pic = "";
        total = 0;
        toPay = 0;
        services = new String[] {};
        squareFootage = 0;
        user = "";
        extraPrice = 0;
        sqfDitra = 0;
        sqfHardwood = 0;
        dateAdded = "";
    }

    public Order(String orderNum, int installerId, String description, String date, String status, String subdivision, String telNumber, String pic, int total, int toPay, String[] services, int squareFootage, String user, int extraPrice, int sqfDitra, int sqfHardwood, String dateAdded) {
        this.orderNum = orderNum;
        this.installerId = installerId;
        this.description = description;
        this.date = date;
        this.status = status;
        this.subdivision = subdivision;
        this.telNumber = telNumber;
        this.pic = pic;
        this.total = total;
        this.toPay = toPay;
        this.services = services;
        this.squareFootage = squareFootage;
        this.user = user;
        this.extraPrice = extraPrice;
        this.sqfDitra = sqfDitra;
        this.sqfHardwood = sqfHardwood;
        this.dateAdded = dateAdded;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public int getInstallerId() {
        return installerId;
    }

    public void setInstallerId(int installerId) {
        this.installerId = installerId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSubdivision() {
        return subdivision;
    }

    public void setSubdivision(String subdivision) {
        this.subdivision = subdivision;
    }

    public String getTelNumber() {
        return telNumber;
    }

    public void setTelNumber(String telNumber) {
        this.telNumber = telNumber;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getToPay() {
        return toPay;
    }

    public void setToPay(int toPay) {
        this.toPay = toPay;
    }

    public String[] getServices() {
        return services;
    }

    public void setServices(String[] services) {
        this.services = services;
    }

    public int getSquareFootage() {
        return squareFootage;
    }

    public void setSquareFootage(int squareFootage) {
        this.squareFootage = squareFootage;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getExtraPrice() {
        return extraPrice;
    }

    public void setExtraPrice(int extraPrice) {
        this.extraPrice = extraPrice;
    }

    public int getSqfDitra() {
        return sqfDitra;
    }

    public void setSqfDitra(int sqfDitra) {
        this.sqfDitra = sqfDitra;
    }

    public int getSqfHardwood() {
        return sqfHardwood;
    }

    public void setSqfHardwood(int sqfHardwood) {
        this.sqfHardwood = sqfHardwood;
    }

    public String getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(String dateAdded) {
        this.dateAdded = dateAdded;
    }
        
    public void selectOrder(String column, String field){
        String sql = "select * from orders where " + column + " = '" + field + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setOrderNum(rs.getString(1));
                setInstallerId(rs.getInt(2));
                setDescription(rs.getString(3));
                Date fetchtedDate = rs.getDate(4);
                SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH);
                String dateToStr = format.format(fetchtedDate);
                setDate(dateToStr);
                
                setStatus(rs.getString(6));
                setSubdivision(rs.getString(7));
                setTelNumber(rs.getString(8));
                setPic(rs.getString(9));
                setTotal(rs.getInt(10));
                setToPay(rs.getInt(11));
                String[] services = (rs.getString(12)).split(" ");
                Service service = new Service();
                String[] servicesArray = new String[services.length];
                for (int i = 0; i < services.length; i++) {
                    service.selectService("id", String.valueOf(services[i]));
                    servicesArray[i] = service.getTitle();
                }

                setServices(servicesArray);
                setSquareFootage(rs.getInt(13));
                setUser(rs.getString(14));
                setExtraPrice(rs.getInt(15));
                setSqfDitra(rs.getInt(16));
                setSqfHardwood(rs.getInt(17));
                Date fetchtedDate2 = rs.getDate(18);
                SimpleDateFormat format2 = new SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH);
                String dateToStr2 = format2.format(fetchtedDate2);
                setDateAdded(dateToStr2);
                setDateAdded(rs.getString(18));

            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void selectRawOrderData(String column, String field){
        String sql = "select * from orders where " + column + " = '" + field + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setOrderNum(rs.getString(1));
                setInstallerId(rs.getInt(2));
                setDescription(rs.getString(3));
                setDate(rs.getString(4));
                
                setStatus(rs.getString(6));
                setSubdivision(rs.getString(7));
                setTelNumber(rs.getString(8));
                setPic(rs.getString(9));
                setTotal(rs.getInt(10));
                setToPay(rs.getInt(11));
                String[] services = (rs.getString(12)).split(" ");
                Service service = new Service();
                String[] servicesArray = new String[services.length];
                for (int i = 0; i < services.length; i++) {
                    service.selectService("id", String.valueOf(services[i]));
                    servicesArray[i] = service.getTitle();
                }

                setServices(servicesArray);
                setSquareFootage(rs.getInt(13));
                setUser(rs.getString(14));
                setExtraPrice(rs.getInt(15));
                setSqfDitra(rs.getInt(16));
                setSqfHardwood(rs.getInt(17));
                setDateAdded(rs.getString(18));
                setDateAdded(rs.getString(18));

            }
            conn.close();
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertOrder(String orderNum, int installerId, String description, String date, String status, 
            String subdivision, String pic, int total, int toPay, String services, int squareFootage,
            String user, int extraprice, int sqfDitra, int sqfHardwood){
        
        String sql = "insert into orders (order_num, installer_id, description, date, extras, "
                + "status, subdivision, tel_num, pic, total, to_pay, service_id, square_footage, user, extra_price, sqf_ditra, sqf_hardwood, date_added) "
                + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, curdate())";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, orderNum);
            ps.setInt(2, installerId);
            ps.setString(3, description);
            ps.setString(4, date);
            ps.setString(5, "");
            ps.setString(6, status);
            ps.setString(7, subdivision);
            ps.setString(8, "");
            ps.setString(9, pic);
            ps.setInt(10, total);
            ps.setInt(11, toPay);
            ps.setString(12, services);
            ps.setInt(13, squareFootage);
            ps.setString(14, user);
            ps.setInt(15, extraprice);
            ps.setInt(16, sqfDitra);
            ps.setInt(17, sqfHardwood);
            
            ps.execute();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        
    }
    
    public void updateOrder(String orderNum, int installerId, String description, String date, String status, String subdivision,
            String pic, int total, int toPay, String services, int squareFootage, String user, 
            int extraPrice, int sqfDitra, int sqfHardwood){
            
            String sql = "update orders set order_num = ?, installer_id = ?, description = ?, date = ?, extras = ?, status = ?,"
                + "subdivision = ?, tel_num = ?, pic = ?, total = ?, to_pay = ?, service_id = ?, "
                    + "square_footage = ?, user = ?, extra_price = ?, sqf_ditra = ?, sqf_hardwood = ?, date_added = curdate() where order_num = '" + orderNum + "'";
        
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/floorbrax", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, orderNum);
            ps.setInt(2, installerId);
            ps.setString(3, description);
            ps.setString(4, date);
            ps.setString(5, "");
            ps.setString(6, status);
            ps.setString(7, subdivision);
            ps.setString(8, "");
            ps.setString(9, pic);
            ps.setInt(10, total);
            ps.setInt(11, toPay);
            ps.setString(12, services);
            ps.setInt(13, squareFootage);
            ps.setString(14, user);
            ps.setInt(15, extraPrice);
            ps.setInt(16, sqfDitra);
            ps.setInt(17, sqfHardwood);
            
            ps.executeUpdate();
            conn.close();
            
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public ArrayList<Order> getOrdersByDate(String start, String end){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders where date between '" + start + "' and '" + end + 
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
    
    public void deleteOrder(String id){
        String sql = "delete from orders where order_num = '" + id + "'";
        
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
    
    public ArrayList getTodayOrders(){
        ArrayList<Order> ordersList = new ArrayList();
        
        String sql = "select * from orders where date = curdate()";
        
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
    
    public static void main(String[] args) {
        Order order = new Order();
        
        order.selectOrder("order_num", "H22725");
        
        for (String service : order.getServices()) {
            System.out.println("Service: " + service);
        }
        
        //order.updateOrder("r44", 1, "test order2", "05/14/2018", "extras test3", "pending", "Dairy", "000000", "fsdkjdflfds", 500, 350);
        //order.insertOrder("H28097", 2, "Install Wood", "07/26/2018", "", "pending", "Dairy", "null", "sfsehtwj", 1150, 700, "");
        
    }
}

