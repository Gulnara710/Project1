package ru.itis.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("PostgreSQL JDBC Driver not found", e);
        }

        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/project1",
                "postgres", "Uekz2005");

//        conn.setAutoCommit(true);

        return conn;
    }
}
