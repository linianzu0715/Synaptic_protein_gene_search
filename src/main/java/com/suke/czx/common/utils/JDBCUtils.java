package com.suke.czx.common.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtils {

    public static Connection getConn(String sqliteUrl){
        try {
            Class.forName("org.sqlite.JDBC");
            return DriverManager.getConnection("jdbc:sqlite:" + sqliteUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 释放资源
     * @param resultSet
     * @param connection
     */
    public static void release(ResultSet resultSet, Connection connection){
        if (resultSet!=null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
