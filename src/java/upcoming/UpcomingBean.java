/**
 *
 * @author Sourav Banerjee 5/4/2018
 * This program updates the upcoming calendar entries.
 */
package upcoming;

import home.HomepageBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;



public class UpcomingBean {
    private Connection conn = null;
    private final String DBNAME = "athleticwebsite";
    private final String COUNT = "SELECT MAX(id) AS count FROM schedule";
    private final String ADDER = "INSERT INTO schedule VALUES (?, ?, ?, ?);";
    private String team; 
    private String sport; 
    private String date;
    private int output = 0;
    
    private boolean success;

    public UpcomingBean(){
        team = "";
        sport= "";
        date = "";
    }
    
    public UpcomingBean(String newTeam, String newSport, String newDate){
        team = newTeam;
        sport = newSport;
        date = newDate;
    }  
    
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

    //Counts db rows
    public int counter(){
        try {
            connectDB(DBNAME);

            PreparedStatement statement = conn.prepareStatement(COUNT);
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
    
    //Adds the article.
    public boolean articleAdd(String dbQuery, String title, String article, String date){
        try {
            connectDB(DBNAME);
            
            int total = counter();
            int indexer = total + 1;
            
            PreparedStatement statement = conn.prepareStatement(dbQuery);
            statement.setInt(1, indexer);
            statement.setString(2, title);
            statement.setString(3, article);
            
            System.err.println(date);
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date javaDate = format.parse(date);
            System.err.println(javaDate);
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
            System.err.println(sqlDate);
            statement.setDate(4, sqlDate);
            
            statement.executeUpdate();
            
            success = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(UpcomingBean.class.getName()).log(Level.SEVERE, null, ex);
            success = false;
        } catch (ParseException ex) {
            Logger.getLogger(UpcomingBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }
    
    
    public boolean isSuccess() throws ParseException {
        articleAdd(ADDER, team, sport, date);
        return success;
    }
    
    
    
}
