package backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBHelper {
    private static Connection connection;

    public static void openConnection() {
        if (connection == null) {
            try {
                String url = "jdbc:mysql://localhost:3306/chatbot_1";
                String user = "root";
                String password = "";
                
                // Use the modern driver class
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                connection = DriverManager.getConnection(url, user, password);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                System.out.println("Connection Error!");
            }
        }
    }

    public static int insertQueryGetId(String query) {
        openConnection();
        int result = -1;
        try (Statement stmt = connection.createStatement()) {
            int num = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            result = -1;
        }
        return result;
    }

    public static boolean executeQuery(String query) {
        openConnection();
        boolean result = false;
        try (Statement stmt = connection.createStatement()) {
            stmt.executeUpdate(query);
            result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static ResultSet selectQuery(String query) {
        openConnection();
        ResultSet rs = null;
        try (Statement stmt = connection.createStatement()) {
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
