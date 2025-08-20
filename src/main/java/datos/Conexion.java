/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author herra
 */
public class Conexion {
    private static final String JDBC_URL = 
            "jdbc:mysql://localhost:3306/control_tiendas?"
            + "useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "alumno";
    private static BasicDataSource dataSource;
    
    public static DataSource getDataSource(){
        if(dataSource == null){
           dataSource = new BasicDataSource();
           dataSource.setUrl(JDBC_URL);
           dataSource.setUsername(JDBC_USER);
           dataSource.setPassword(JDBC_PASSWORD);
           dataSource.setInitialSize(10);
           dataSource.setMaxTotal(50);
        }
        return dataSource;
    }
    
    public static Connection getConnection() throws SQLException{
        return getDataSource().getConnection();
    }
}
