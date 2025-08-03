package com.academix.util;

import java.io.InputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Utility class for database connection management
 */
public class DBConnection {
    // Note: Removed the leading slash so that the file is correctly resolved from the classpath.
    private static final String PROPERTIES_FILE = "config/db.properties";
    private static Properties properties = new Properties();

    static {
        try {
            // Load the properties file from the classpath
            InputStream input = DBConnection.class.getClassLoader().getResourceAsStream(PROPERTIES_FILE);
            if (input == null) {
                throw new FileNotFoundException("Property file '" + PROPERTIES_FILE + "' not found in the classpath");
            }
            properties.load(input);
            input.close();

            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * Get a connection to the database
     * @return Connection object
     * @throws SQLException if a database access error occurs
     */
    public static Connection getConnection() throws SQLException {
        String url = properties.getProperty("db.url");
        String username = properties.getProperty("db.username");
        String password = properties.getProperty("db.password");

        return DriverManager.getConnection(url, username, password);
    }

    /**
     * Close the database connection
     * @param connection Connection to close
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}