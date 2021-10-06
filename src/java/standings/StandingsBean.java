/**
 *
 * @author Sourav Banerjee 5/4/2018 This program updates the standings.
 */
package standings;

import home.HomepageBean;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;

@Stateless
public class StandingsBean implements Serializable{

    private Connection conn = null;
    private final String DBNAME = "athleticwebsite";
    private String count = "SELECT MAX(date) AS count FROM ?";
    private String adder = "INSERT INTO ? VALUES (?, ?, ?, ?, ?);";
    private String standingsUpdate = "UPDATE ? SET ? = ? + 1 WHERE team=?";
    
    private String standingsDB = "";
    private String away;
    private String home;
    private String sport;
    private int homeScore;
    private int opponentScore;
    private String date;
    private int difference;
    private int output = 0;

    public void setAway(String away) {
        this.away = away;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    public void setHomeScore(int homeScore) {
        this.homeScore = homeScore;
    }

    public void setOpponentScore(int opponentScore) {
        this.opponentScore = opponentScore;
    }

    public void setDate(String date) {
        this.date = date;
    }

    
    
    
    public StandingsBean() {
        away = "";
        opponentScore = 0;
        sport = "";
        homeScore = 0;
        date = "";
    }

    public StandingsBean(String sport, String date, String home, String away, int homeScore, int awayScore) {
        this.sport = sport;
        this.date = date;  
        this.home = home;
        this.away = away;
        this.homeScore = homeScore;
        this.opponentScore = awayScore;
        
    }
    
    public int counter(String table){
        try {
            connectDB(DBNAME);
            
            count = "SELECT MAX(date) AS count FROM " + table;
            
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
    
    public void scoreCalculator(){
        
        connectDB(DBNAME);

        difference = homeScore - opponentScore;

        String gameTable = sport + "games";
        int gameCount = counter(gameTable);
            
        adder = "INSERT INTO " + gameTable + " VALUES (?, ?, ?, ?, ?);";
        
        try {    
            PreparedStatement statement = conn.prepareStatement(adder);
            statement.setString(1, home);
            statement.setString(2, away);
            statement.setInt(3, homeScore);
            statement.setInt(4, opponentScore);
            
            System.err.println(date);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date javaDate = format.parse(date);
            System.err.println(javaDate);
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
            System.err.println(sqlDate);
            statement.setDate(5, sqlDate);
            
            statement.executeUpdate();
        } catch (SQLException | ParseException ex) {
            Logger.getLogger(StandingsBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(difference > 0){
            win(home);
            loss(away);
        }
        else if(difference == 0){
            draw(home);
            draw(away);
        }
        else if(difference < 0){
            loss(home);
            win(away);
        }
        
    }
    
    public void win(String winningTeam){
        try {
            standingsDB = sport + "standings";

            standingsUpdate = "UPDATE " + standingsDB +" SET win = win + 1 WHERE team=?";
            PreparedStatement statement = conn.prepareStatement(standingsUpdate);
            statement.setString(1, winningTeam);
            
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StandingsBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void draw(String drawingTeam){
        try {
           standingsDB = sport + "standings";

            standingsUpdate = "UPDATE " + standingsDB +" SET draw = draw + 1 WHERE team=?";
            PreparedStatement statement = conn.prepareStatement(standingsUpdate);
            statement.setString(1, drawingTeam);
            
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StandingsBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void loss(String losingTeam){
        try {
            standingsDB = sport + "standings";

            standingsUpdate = "UPDATE " + standingsDB +" SET loss = (loss + 1) WHERE team=?";
            PreparedStatement statement = conn.prepareStatement(standingsUpdate);
            statement.setString(1, losingTeam);
            
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StandingsBean.class.getName()).log(Level.SEVERE, null, ex);
        }
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
}
