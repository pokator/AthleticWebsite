/*
 * Sourav Banerjee 2/25/2018
This program accesses a SQL database with recent news stories to send the title date, and story to the webpage to display.
 */
package home;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Sourav
 */
public class HomepageBean {
    private Connection conn = null;
    final private String DBNAME = "athleticwebsite";
    private final String count = "SELECT MAX(published) AS count FROM news";
    private final String dataAccessor = "SELECT * FROM news WHERE id = ?;";
    private int output = 0;
    private int subtraction;
    private String newsSection;
    private String dataOutput;

    public HomepageBean() {
        this.dataOutput = "";
        this.subtraction = 0;
    }
    
    //Sets block location and how far from top block is.
    public void setNewsSection(String newsSection) {
        this.newsSection = newsSection;
    }
    
    public void setSubtraction(String subtraction) {
        this.subtraction = Integer.parseInt(subtraction);
    }
    
    //Returns output.
//    public String getDataOutput() {
//        dataOutput = data(dataAccessor, subtraction, newsSection);
//        return dataOutput;
//    }
    
    public void connectDB(String DBName){
        String connectionURL = "jdbc:mysql://localhost:3306/" + DBName;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectionURL, "root", "mysql1");
            System.out.println("Connected");
        }
        
        catch(Exception e){
            System.err.println("Error");
            e.printStackTrace(System.err);
            System.exit(0);
        }
        
    }
    
    
    //Counts number of rows.
    public int counter(){
        try {
            connectDB(DBNAME);

            PreparedStatement statement = conn.prepareStatement(count);
            ResultSet rs = statement.executeQuery();
            rs.next();
            output = rs.getInt("count");
            System.err.println(output);
        }
        catch (SQLException ex) {
            Logger.getLogger(HomepageBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return output;
    }
    
    
//    //Gets data.
//    public String data(String dbQuery, int count, String type){
//        try {
//            connectDB(DBNAME);
//            
//            System.err.println(newsSection + subtraction);
//            
//            int total = counter();
//            int row = total - count;
//            System.err.println("Subtraction sucessful " + row);
//            
//            PreparedStatement statement = conn.prepareStatement(dbQuery);            
//            statement.setInt(1, row);
//            ResultSet rs = statement.executeQuery();
//            rs.next();
//            if("Title".equals(type)){
//                dataOutput = rs.getString(2);
//                System.err.println("TITLE");
//            }
//            else if("Body".equals(type)){
//                dataOutput =  rs.getString(3);
//                System.err.println("BODY");
//            }
//            else{
//                
//                
//                String x = rs.getObject("published").toString();
//                Date date = rs.getDate("published");
//                SimpleDateFormat format = new SimpleDateFormat("MMM dd, yyyy");
//                dataOutput = format.format(date);
//                System.err.println(dataOutput);
//                System.err.println("x = " + x);
//            }
//            
//            conn.close();
//            
//        }
//        catch (SQLException ex) {
//            Logger.getLogger(HomepageBean.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return dataOutput;
//    }
        
}

