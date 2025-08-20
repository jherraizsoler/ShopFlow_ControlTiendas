/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.io.Serializable;

/**
 *
 * @author herra
 */
public class Tienda implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private int idTienda;
    private String  nombre_tienda;
    private String  direccion;
    private double  facturacion;
    private int  numeroEmpleados;
    private double gastosSalario;

    public Tienda() {
    }

    public Tienda(int idTienda) {
        this.idTienda = idTienda;
    }

    public Tienda(String nombre_tienda, String direccion, double facturacion, int numeroEmpleados, double gastosSalario) {
        this.nombre_tienda = nombre_tienda;
        this.direccion = direccion;
        this.facturacion = facturacion;
        this.numeroEmpleados = numeroEmpleados;
        this.gastosSalario = gastosSalario;
    }

    
    
    public Tienda(int idTienda, String nombre_tienda, String direccion, double facturacion, int numeroEmpleados, double gastosSalario) {
        this.idTienda = idTienda;
        this.nombre_tienda = nombre_tienda;
        this.direccion = direccion;
        this.facturacion = facturacion;
        this.numeroEmpleados = numeroEmpleados;
        this.gastosSalario = gastosSalario;
    }

    
    
    public int getIdTienda() {
        return idTienda;
    }

    public void setIdTienda(int idTienda) {
        this.idTienda = idTienda;
    }

    public String getNombre_tienda() {
        return nombre_tienda;
    }

    public void setNombre_tienda(String nombre_tienda) {
        this.nombre_tienda = nombre_tienda;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getFacturacion() {
        return facturacion;
    }

    public void setFacturacion(double facturacion) {
        this.facturacion = facturacion;
    }

    public int getNumeroEmpleados() {
        return numeroEmpleados;
    }

    public void setNumeroEmpleados(int numeroEmpleados) {
        this.numeroEmpleados = numeroEmpleados;
    }

    public double getGastosSalario() {
        return gastosSalario;
    }

    public void setGastosSalario(double gastosSalario) {
        this.gastosSalario = gastosSalario;
    }

    @Override
    public String toString() {
        return "Tienda{" + "idTienda=" + idTienda + ", nombre_tienda=" + nombre_tienda + ", direccion=" + direccion + ", facturacion=" + facturacion + ", numeroEmpleados=" + numeroEmpleados + ", gastosSalario=" + gastosSalario + '}';
    }

   
    
     
    
}
