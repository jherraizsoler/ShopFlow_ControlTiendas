<%--
    Document   : tiendas
    Created on : 3 jul 2025, 15:05:30
    Author     : herra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es" data-bs-theme="dark" class="h-100">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar Tiendas</title>
        <!--Bootstrap CSS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <!--Bootstrap Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <style>
            body {
                min-height: 100vh;
                font-family: 'Inter', sans-serif;
                background-color: #ffffff; /* Fondo blanco */
                color: #1d2233; /* Texto de todo el cuerpo en color blanco */
            }
            .card-body{
                background-color: #ffffff; /* Fondo blanco */
                color: #1d2233; /* Texto de todo el cuerpo en color blanco */
            }
            
            .form-control{
                background-color: #ffffff; /* Fondo blanco */
                color: #1d2233; 
            }
            
            .form-control:focus{
                background-color: #f5f6f8; /* Fondo blanco */
                color: #1d2233; 
            }
           
        </style>
    </head>
    <body class="d-flex flex-column h-100">
        <!--Cabecero-->
        <jsp:include page="/WEB-INF/paginas/comunes/cabecero.jsp" />

        <!-- Formulario de edición de una tienda -->
        <c:if test="${tienda != null}">
            <form action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&idTienda=${tienda.idTienda}"
                  method="POST" class="was-validated">

                <!--Botones de navegación de edición-->
                <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionEdicion.jsp" />
                <div class="container my-4 p-4">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4>Editar Tienda</h4>
                        </div>
                        <div class="card-body">

                            <div class="form-group mb-3">
                                <label for="nombreTienda">Nombre Tienda</label>
                                <input type="text" class="form-control" id="nombreTienda" name="nombreTienda"
                                       value="${tienda.nombre_tienda}" required />
                            </div>
                            <div class="form-group mb-3">
                                <label for="direccion">Direccion</label>
                                <input type="text" class="form-control" id="direccion" name="direccion"
                                       value="${tienda.direccion}" required />
                            </div>
                            <div class="form-group mb-3">
                                <label for="facturacion">Facturacion</label>
                                <input type="number" class="form-control" id="facturacion" name="facturacion" required
                                       value="${tienda.facturacion}" step="any" />
                            </div>
                            <div class="form-group mb-3">
                                <label for="numeroEmpleados">numeroEmpleados</label>
                                <input type="number" class="form-control" id="numeroEmpleados" name="numeroEmpleados"
                                       value="${tienda.numeroEmpleados}" required />
                            </div>
                            <div class="form-group mb-3">
                                <label for="gastosSalario">gastosSalario</label>
                                <input type="number" class="form-control" id="gastosSalario" name="gastosSalario"
                                       value="${tienda.gastosSalario}" step="any" required/>
                            </div>

                            <button type="submit" class="btn btn-success">Guardar cambios</button>
                        </div>
                    </div>
                </div>
            </form>
        </c:if>
        <c:if test="${tienda == null}">
            <div class="container my-4">
                <div class="alert alert-danger" role="alert">
                    No se pudo cargar la información de la tienda.
                </div>
            </div>
        </c:if>

        <!--Pie Pagina-->
        <jsp:include page="/WEB-INF/paginas/comunes/piePagina.jsp" />

        <!--Bootstrap Script JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>
