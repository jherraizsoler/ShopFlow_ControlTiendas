# ShopFlow - Sistema de Control de Tiendas

---

## Descripción del Proyecto FullStack

Este es un sistema de gestión para tiendas, diseñado para facilitar el control 
y la administración de datos clave de negocio. El proyecto es una demostración 
de la implementación de funcionalidades **CRUD** (Crear, Leer, Actualizar, Borrar) 
en un entorno de aplicación web, centrado en la visualización de métricas y reportes.

## Características Principales

* **Registro de Tiendas**: Permite añadir, editar, eliminar y listar tiendas. 
     Cada tienda almacena su nombre, dirección, facturación, número de empleados y gastos de salarios.
* **Métricas Clave**: Visualiza en tiempo real datos agregados como 
     la **facturación total**, el **número total de tiendas**, el **número total de empleados** y los **gastos totales**.
* **Reportes y Gráficos**: Presenta datos de manera gráfica para un análisis 
     rápido. Esto incluye gráficos de barras para comparar facturación vs. gastos 
     y gráficos de tipo dona (donut chart) para la distribución de la facturación por tienda.

---

## Tecnologías Utilizadas

* **Java**: Lenguaje principal de backend.
* **Maven**: Para la gestión de dependencias y la construcción del proyecto.
* **Jakarta EE**: Plataforma utilizada para el desarrollo web.
* **MySQL**: Sistema de gestión de bases de datos.
* **commons-dbcp2**: Librería para la gestión de pools de conexiones a la base de datos.
* **JUnit Jupiter**: Framework para la creación de pruebas unitarias.
* **GlassFish Server 8.0.0**: Servidor para poder ejercer de  Cliente / Servidor.

---

## Requisitos del Sistema

Para ejecutar el proyecto, necesitas:

* **JDK 21**
* **Maven**
* Un servidor de aplicaciones compatible con Jakarta EE (como **Glassfish Server 8.0.0**)
* Una base de datos **MySQL** llamada  **control_tiendas**
* _Importar_ SourcePackages/Documentation.importarBD_controlTiendas en MySQL tanto **estructura** y **datos** a la _base de datos_  **control_tiendas**   
* Recomiendo utilizar MySQL Workbench version 8.0.42  

---

## Estructura del Proyecto

La estructura del proyecto sigue el estándar de Maven y está organizada de la siguiente manera para separar la lógica de negocio de la presentación:

```
├── pom.xml
├── src
│   ├── main
│   │   ├── java
│   │   │   ├── datos
│   │   │   │   ├── Conexion.java
│   │   │   │   └── TiendaDAO.java
│   │   │   ├── modelo
│   │   │   │   └── Tienda.java
│   │   │   └── web
│   │   │       ├── RootServlet.java
│   │   │       └── ServletControlador.java
│   │   └── webapp
│   │       ├── WEB-INF
│   │       │   ├── paginas
│   │       │   │   ├── comunes
│   │       │   │   │   ├── botonesNavegacion.jsp
│   │       │   │   │   ├── botonesNavegacionEdicion.jsp
│   │       │   │   │   ├── cabecero.jsp
│   │       │   │   │   └── piePagina.jsp
│   │       │   │   └── tienda
│   │       │   │       ├── agregarTienda.jsp
│   │       │   │       ├── editarTienda.jsp
│   │       │   │       └── listadoTiendas.jsp
│   │       │   ├── beans.xml
│   │       │   ├── glassfish-web.xml
│   │       │   └── web.xml
│   │       └── tiendas.jsp
│   └── test
│       └── ...
└── ...
```

* **`pom.xml`**: Archivo de configuración de Maven.
* **`src/main/java/datos`**: Contiene las clases **DAO (Data Access Object)** para interactuar con la base de datos.
* **`src/main/java/modelo`**: Contiene las clases de modelo, en este caso la clase `Tienda`.
* **`src/main/java/web`**: Contiene los **servlets** que manejan las peticiones HTTP y la lógica de control.
* **`src/main/webapp`**: Contiene los archivos **JSP** para la interfaz de usuario, organizados en subdirectorios para reutilización.
* **`src/main/webapp/WEB-INF`**: Directorio de configuración y protección de archivos web.

---
## Ejecutar el proyecto 

1. Necesitamos seleccionar el proyecto y le damos en la opción run y se nos levantará el proyecto.
2. Ahora en el navegador vamos a la siguiente ruta   http://localhost:8080/ControlTiendas/ServletControlador

---

## Detalles Técnicos Adicionales

### Arquitectura
El sistema sigue una arquitectura de tres capas:
* **Capa de Presentación**: Implementada con **HTML**, **CSS** y **JSP** para el frontend y visualización de datos. El uso de tablas y gráficos (comparativas y de distribución) sugiere un **dashboard** o un módulo de reporting.
* **Capa de Lógica de Negocio**: Gestiona las operaciones **CRUD** y las reglas del negocio a través de los servlets.
* **Capa de Acceso a Datos (DAO)**: Interactúa con la base de datos **MySQL** para la persistencia de los datos, utilizando `commons-dbcp2` para optimizar la gestión de conexiones.

### Funcionalidades Específicas
* **Visualización de Datos**: Se muestran métricas clave como la facturación total, los gastos de salarios y el número total de tiendas y empleados.
* **Gráficos y Reportes**: La aplicación incluye gráficos de barras para comparar facturación vs. gastos, y gráficos de tipo dona (donut chart) para la distribución de la facturación por tienda.
* **Interfaz de Usuario**: La UI es limpia y presenta la información de manera clara, con botones de acción ("Editar" y "Eliminar") para la gestión de cada tienda.

---

## Contribución

Las contribuciones son bienvenidas. Si encuentras un error o tienes una idea de mejora, no dudes en abrir un *issue* o enviar un *pull request*.

---

## Licencia

Este proyecto le pertenece a @jherraizsoler autor de este repositorio, tiene todos los permisos y derechos de autor. 
Este repositorio no se puede copiar o modificar sin autorización del autor expresamente.
