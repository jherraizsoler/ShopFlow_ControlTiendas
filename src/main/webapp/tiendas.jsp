<%-- 
    Document   : tiendas
    Created on : 3 jul 2025, 15:05:30
    Author     : herra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" data-bs-theme="light" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Control de Tiendas</title>
    <!--Bootstrap  CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <!--Bootstrap Iconos-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
     <style>
        /* Opcional: para debugging, puedes ver el efecto */
        body {
            min-height: 100vh; /* Asegura que el body tenga al menos la altura de la ventana */
            background-color:  #ffffff;
            color:  #1d2233;
        }
        
        
    </style>
  </head>
  <body class="d-flex flex-column h-100">
      <!--Cabecero-->
      <jsp:include page="/WEB-INF/paginas/comunes/cabecero.jsp" />
      
      <!--Botones de Navegación-->
      <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacion.jsp" />
      <main  class="flex-shrink-0">
          <div class="container">
            <!--Modal agregar un tienda-->
            <jsp:include page="/WEB-INF/paginas/tienda/agregarTienda.jsp" /> 
            
           <!--Listado de Tiendas-->
            <jsp:include page="/WEB-INF/paginas/tienda/listadoTiendas.jsp" />  
          </div>
      </main>

      <!--Pie Pagina-->
      <jsp:include page="/WEB-INF/paginas/comunes/piePagina.jsp" />
      
      <!--Bootstrap Script JS-->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
  </body>
</html>
