/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import datos.TiendaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import modelo.Tienda;

/**
 *
 * @author herra
 */
@WebServlet(name = "ServletControlador", urlPatterns = {"/ServletControlador"})
public class ServletControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // Usa Optional para evitar NullPointerException si 'accion' no está en la URL
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listar");
        switch (accion) {
            case "listar" -> this.listarTiendas(request, response);
            case "editar" -> this.editarTienda(request, response);
            case "eliminar" -> this.eliminarTienda(request, response);
            default -> this.listarTiendas(request, response);
        }
    }

    public void listarTiendas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Tienda> tiendas = new TiendaDAO().listar();
        System.out.println("Tiendas: " + tiendas);

        HttpSession sesion = request.getSession();
        sesion.setAttribute("tiendas", tiendas);
        sesion.setAttribute("totalTiendas", tiendas.size());
        sesion.setAttribute("facturacionTotal", this.calcularFacturacionTotal(tiendas));
        sesion.setAttribute("gastoSalarioTotal", this.calcularGastosSalarioTotal(tiendas));
        sesion.setAttribute("numeroEmpleadosTotal", this.calcularNumeroEmpleadosTotal(tiendas));

        request.getRequestDispatcher("tiendas.jsp").forward(request, response);
    }

    public void editarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Usamos un try-catch para manejar NumberFormatException si el 'idTienda' no es un número
        try {
            int idTienda = Integer.parseInt(request.getParameter("idTienda"));
            Tienda tienda = new TiendaDAO().encontrarTienda(new Tienda(idTienda));

            // Verificamos si la tienda existe antes de continuar
            if (tienda != null) {
                request.setAttribute("tienda", tienda);
                String jspEditar = "/WEB-INF/paginas/tienda/editarTienda.jsp";
                request.getRequestDispatcher(jspEditar).forward(request, response);
            } else {
                // Si la tienda no se encuentra, redirigimos a la lista con un mensaje de error
                request.setAttribute("mensajeError", "No se encontró la tienda con ID: " + idTienda);
                this.listarTiendas(request, response);
            }
        } catch (NumberFormatException e) {
            // Manejamos el caso en que el parámetro 'idTienda' no es un número válido
            request.setAttribute("mensajeError", "El ID de la tienda no es válido.");
            this.listarTiendas(request, response);
        }
    }

    public void eliminarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idTienda = Integer.parseInt(request.getParameter("idTienda"));
            new TiendaDAO().eliminarTienda(new Tienda(idTienda));
        } catch (NumberFormatException e) {
            request.setAttribute("mensajeError", "El ID de la tienda no es válido.");
        }
        listarTiendas(request, response);
    }

    public double calcularFacturacionTotal(List<Tienda> tiendas) {
        return tiendas.stream().mapToDouble(Tienda::getFacturacion).sum();
    }

    public double calcularGastosSalarioTotal(List<Tienda> tiendas) {
        return tiendas.stream().mapToDouble(Tienda::getGastosSalario).sum();
    }
    public double calcularNumeroEmpleadosTotal(List<Tienda> tiendas) {
        return tiendas.stream().mapToDouble(Tienda::getNumeroEmpleados).sum();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listar");
        switch (accion) {
            case "insertar" -> this.insertarTienda(request, response);
            case "modificar" -> this.modificarTienda(request, response);
            default -> this.listarTiendas(request, response);
        }
    }

    private void modificarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idTienda = Integer.parseInt(request.getParameter("idTienda"));
            String nombreTienda = request.getParameter("nombreTienda");
            String direccion = request.getParameter("direccion");
            // Usamos verificaciones para evitar NullPointerException y NumberFormatException
            double facturacion = request.getParameter("facturacion") != null ? Double.parseDouble(request.getParameter("facturacion")) : 0.0;
            int numeroEmpleados = request.getParameter("numeroEmpleados") != null ? Integer.parseInt(request.getParameter("numeroEmpleados")) : 0;
            double gastosSalario = request.getParameter("gastosSalario") != null ? Double.parseDouble(request.getParameter("gastosSalario")) : 0.0;

            Tienda tienda = new Tienda(idTienda, nombreTienda, direccion, facturacion, numeroEmpleados, gastosSalario);
            new TiendaDAO().actualizar(tienda);
        } catch (NumberFormatException e) {
            // Manejamos el error si algún parámetro numérico no es válido
            request.setAttribute("mensajeError", "Error: Los valores numéricos no son válidos.");
        } catch (NullPointerException e) {
            // Manejamos el error si algún parámetro es nulo
            request.setAttribute("mensajeError", "Error: Faltan parámetros en el formulario.");
        }
        this.listarTiendas(request, response);
    }

    private void insertarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nombreTienda = request.getParameter("nombreTienda");
            String direccion = request.getParameter("direccion");
            // Usamos verificaciones para evitar NullPointerException y NumberFormatException
            double facturacion = request.getParameter("facturacion") != null ? Double.parseDouble(request.getParameter("facturacion")) : 0.0;
            int numeroEmpleados = request.getParameter("numeroEmpleados") != null ? Integer.parseInt(request.getParameter("numeroEmpleados")) : 0;
            double gastosSalarios = request.getParameter("gastosSalario") != null ? Double.parseDouble(request.getParameter("gastosSalario")) : 0.0;
            
            Tienda tienda = new Tienda(nombreTienda, direccion, facturacion, numeroEmpleados, gastosSalarios);
            new TiendaDAO().insertar(tienda);
        } catch (NumberFormatException e) {
            request.setAttribute("mensajeError", "Error: Los valores numéricos no son válidos.");
        } catch (NullPointerException e) {
            request.setAttribute("mensajeError", "Error: Faltan parámetros en el formulario.");
        }
        this.listarTiendas(request, response);
    }
}
