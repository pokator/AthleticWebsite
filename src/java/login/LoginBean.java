/*
 * Sourav Banerjee 2/25/2018
This program accesses a SQL database to check the validity of a login for administrators..
 */
package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sourav
 */
public class LoginBean {
    private Connection conn = null;

    private String username, password;
    private boolean validation = false;
    private String query;
    private final String DBNAME = "athleticwebsite";

    //Setting username/password from form entry.
    public void setUsername(String user) {
        this.username = user.toLowerCase();
    }

    public void setPassword(String pass) {
        this.password = pass;
    }
    
    //Returns validation.
    public boolean getValidation(boolean flag) {
        if(flag){
            query = "SELECT username, password FROM persons WHERE Username=? and Password=?";
            validation = validationCheck(query, username, password);
            return validation;
        }
        else{
            System.err.println("RETURNING " + validation);
            return validation;
        }
    }
    
    
    public void setValidation(boolean valid) {
        validation = valid;
        System.err.println(valid + "IS THE ENTERED VALUE");
        System.err.println(validation + " IS THE RECEIVED VALUE");
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
    
    //Validation checker.
    
    public boolean validationCheck(String dbQuery, String value1, String value2){
        try {
            connectDB(DBNAME);

            PreparedStatement statement = conn.prepareStatement(dbQuery);            
            statement.setString(1, value1);
            statement.setString(2, value2);
            ResultSet rs = statement.executeQuery();
            validation = rs.next();
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.err.println(validation);
        return validation;
    }
    
    
}
