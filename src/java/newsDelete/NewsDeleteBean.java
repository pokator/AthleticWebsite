/*
This class deletes entries from the schedule.
Sourav Banerjee 5/4/2018
 */
package newsDelete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;

/**
 *
 * @author Sourav
 */
@Stateless
public class NewsDeleteBean {

    private Connection conn = null;
    private final String DBNAME = "athleticwebsite";
    private final String DELETE = "DELETE FROM news WHERE published=? AND title=?";
    private String date;
    private String title;
    
    public NewsDeleteBean(){
        title = "";
        date = "";
    }
    
    public NewsDeleteBean(String newTeam, String newDate){
        title = newTeam;
        date = newDate;
    }
    
    
    //Connect to Database.
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
    
    //Deletes the entry.
    public boolean deleter(){
        boolean success;
        try {
            connectDB(DBNAME);
            
            PreparedStatement statement = conn.prepareStatement(DELETE);
            statement.setString(2, title);
            
            System.err.println(date);
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date javaDate = format.parse(date);
            System.err.println(javaDate);
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
            System.err.println(sqlDate);
            statement.setDate(1, sqlDate);
            
            int successCount = statement.executeUpdate();
            
            success = (successCount > 0);
                        
        } catch (SQLException | ParseException ex) {
            Logger.getLogger(NewsDeleteBean.class.getName()).log(Level.SEVERE, null, ex);
            success = false;
        }
        return success;
    }
}