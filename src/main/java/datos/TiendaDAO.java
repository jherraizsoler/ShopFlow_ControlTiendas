/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Tienda;

/**
 *
 * @author herra
 */
public class TiendaDAO {
    // CRUD -  Create  - Read - Update  - Delete
    
    private static final String SQL_SELECT = 
            "SELECT id_tienda, nombreTienda, direccion, facturacion, numeroEmpleados, gastoSalarios FROM tiendas";
    
    private static final String SQL_INSERT = 
            "INSERT INTO tiendas(nombreTienda, direccion, facturacion, numeroEmpleados, gastoSalarios) VALUES(?,?,?,?,?)";
    
    
    private static final String SQL_SELECT_BY_ID = 
            "SELECT id_tienda, nombreTienda, direccion, facturacion, numeroEmpleados, gastoSalarios FROM tiendas WHERE id_tienda = ?";
    
    
    private static final String SQL_DELETE_BY_ID = 
            "DELETE FROM tiendas WHERE id_tienda = ?";
    
    
    private static final String SQL_UPDATE_BY_ID = 
            "UPDATE tiendas SET nombreTienda = ?, direccion = ?, facturacion = ?, numeroEmpleados = ?, gastoSalarios = ? WHERE id_tienda = ?";
            
    public List<Tienda> listar(){
        List<Tienda> tiendas = new ArrayList<>();
        try(Connection conn = Conexion.getConnection();
           PreparedStatement stmt = conn.prepareStatement(SQL_SELECT);
                ResultSet rs = stmt.executeQuery()){
            
            //Iteramos los tiendas de bd
            while (rs.next()) {                
                Tienda tienda = new Tienda(
                        rs.getInt("id_tienda"),
                        rs.getString("nombreTienda"),
                        rs.getString("direccion"),
                        rs.getDouble("facturacion"),
                        rs.getInt("numeroEmpleados"),
                        rs.getDouble("gastoSalarios")
                );
                tiendas.add(tienda);
            }
        }catch(SQLException ex){
            ex.printStackTrace(System.out);
        }
        return tiendas;
    }
    
    
    public int insertar(Tienda tienda){
        int rows = 0;
        try(Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(SQL_INSERT)) {
            stmt.setString(1, tienda.getNombre_tienda());
            stmt.setString(2, tienda.getDireccion());
            stmt.setDouble(3, tienda.getFacturacion());
            stmt.setInt(4, tienda.getNumeroEmpleados());
            stmt.setDouble(5, tienda.getGastosSalario());
            
            rows = stmt.executeUpdate();
            
        } catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            return rows;
        } 
    }

        
    public Tienda encontrarTienda(Tienda tienda){
        try(Connection conn = Conexion.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_ID)) {
            stmt.setInt(1, tienda.getIdTienda());
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    tienda.setNombre_tienda(rs.getString("nombreTienda"));
                    tienda.setDireccion(rs.getString("direccion"));
                    tienda.setFacturacion(rs.getDouble("facturacion"));
                    tienda.setNumeroEmpleados(rs.getInt("numeroEmpleados"));
                    tienda.setGastosSalario(rs.getDouble("gastoSalarios"));
                }
            } 
        } catch(SQLException ex){
            ex.printStackTrace(System.out);
        }
        return tienda;
    }

    
    public int actualizar(Tienda tienda){
        int rows = 0;
        try(Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE_BY_ID)) {
           
            stmt.setString(1, tienda.getNombre_tienda());
            stmt.setString(2, tienda.getDireccion());
            stmt.setDouble(3, tienda.getFacturacion());
            stmt.setInt(4, tienda.getNumeroEmpleados());
            stmt.setDouble(5, tienda.getGastosSalario());
            stmt.setInt(6, tienda.getIdTienda());
            
            
            rows = stmt.executeUpdate();
            
        } catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            return rows;
        } 
    }
    
    
    public void eliminarTienda(Tienda tienda){
        if(encontrarTienda(tienda) != null){
          try(Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(SQL_DELETE_BY_ID)) {
            stmt.setInt(1, tienda.getIdTienda());
             stmt.executeUpdate();
 
            } catch(SQLException ex){
                ex.printStackTrace();
            }  
        }

    }
}
