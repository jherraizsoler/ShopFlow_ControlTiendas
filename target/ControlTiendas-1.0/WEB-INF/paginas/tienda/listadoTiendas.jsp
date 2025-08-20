<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Análisis de Tiendas</title>
    <!-- Incluye Bootstrap, si aún no lo has hecho -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <!-- Carga la librería Chart.js desde un CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Estilos para el nuevo tema oscuro y profesional */
        body {
            font-family: 'Inter', sans-serif;
            background-color: #ffffff; /* Fondo blanco */
            color: #ffffff; /* Texto de todo el cuerpo en color blanco */
        }
        .card {
            background-color: #22304a; /* Fondo de tarjeta un poco más claro que el del cuerpo */
            border-color: #4a5568; /* Borde más oscuro */
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.2), 0 2px 4px -1px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #2d3748; /* Fondo del encabezado de la tarjeta */
            border-bottom: 1px solid #4a5568; /* Línea separadora */
            color: #f8f9fa;
        }
        .card-header h4 {
            color: #ffffff; /* Título del encabezado en blanco puro */
        
        /* Estilos para los recuadros de totales, ajustados al tema oscuro */
        .card.bg-morado {
            background-color: #6000d2 !important; /* Rojo más oscuro */
            border-color: #401772 !important;
        }
        }
        .card.bg-orange {
            background-color: #cc6600 !important; /* Rojo más oscuro */
            border-color: #995523 !important;
        }
        .card.bg-success {
            background-color: #339900 !important; /* Verde más oscuro */
            border-color: #15703f !important;
        }
        
        /* Estilos para los recuadros de totales, ajustados al tema oscuro */
        .card.bg-amarillo {
            background-color: #999900 !important; /* Rojo más oscuro */
            border-color: #666600 !important;
        }
        
        /* Estilos de tabla ajustados para el tema oscuro */
        .table {
            color: #1d2233; /* Color del texto de la tabla */
            text-align:  center;
            align-items:  center;
            background-color:  #ffffff;
   
        }
        .table-striped > tbody > tr:nth-of-type(odd) > * {
            background-color: #f8f9fa ; /* Color de las filas impares */
            color: #1d2233;
        }
        .table th {
            background-color: #cae3f2;
            border-bottom-color: #4a5568; /* Borde del encabezado de la tabla */
            color: #1d2233; /* Texto del encabezado de la tabla en blanco puro */
            text-align:  center;
        }
        
        .chart-container {
            position: relative;
            height: 400px;
            padding: 1.5rem; 
        }
        
        .table th, .table td {
            padding: 1rem;
        }
        
        .table td {
            background-color: #ffffff;  
            border-bottom-color: #4a5568; /* Borde del encabezado de la tabla */
            color: #1d2233; /* Texto del encabezado de la tabla en blanco puro */
            text-align:  center;
        }

        /* Regla de estilo para los elementos de texto en los gráficos de Chart.js */
        /* Esta regla es necesaria para asegurar que los títulos del gráfico sean blancos en temas oscuros */
        h5.text-center {
            color: #ffffff;
        }
        .btn-width-igual {
            min-width: 120px; /* Puedes ajustar este valor si lo necesitas */
        }
        
        .col-empleados-sm {
            width: 10%; /* Ajusta este valor para hacer la columna más estrecha o ancha */
        }
        
        .col-gastoSalario-sm {
            width: auto; /* Ajusta este valor para hacer la columna más estrecha o ancha */
            padding-left: 0px;
            padding-right: 0px;        
        }
        
        .col-botones-sm {
            width: 10%; /* Ajusta este valor para hacer la columna más estrecha o ancha */
        }
    </style>
</head>
<body>

<!--Listado Tiendas-->
<section id="tiendas" class="mt-5">
    <div class="container mb-5">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header py-4">
                        <h4 class="text-center">Listado de Tiendas</h4>
                    </div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">Nombre tienda</th>
                                <th class="text-center">Direccion</th>
                                <th class="text-center">Facturacion</th>
                                <th class="text-center col-empleados-sm">Numero empleados</th>
                                <th class="text-center col-gastoSalario-sm">Gasto Salario</th>
                                <th class="text-center col-botones-sm">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="tienda" items="${tiendas}" varStatus="status">
                                <tr class="text-center">
                                    <td class="text-center">${status.count}</td>
                                    <td class="text-center">${tienda.nombre_tienda}</td>
                                    <td class="text-center">${tienda.direccion}</td>
                                    <fmt:setLocale value="es_ES"/>
                                    <td class="text-center">
                                        <fmt:formatNumber value="${tienda.facturacion}" 
                                                          type="currency" 
                                                          currencySymbol="€" 
                                                          pattern="#,##0.00 €"/>
                                    </td>
                                    <td class="text-center col-empleados-sm">${tienda.numeroEmpleados}</td>
                                    <td class="text-center col-gastoSalario-sm">
                                        <fmt:formatNumber value="${tienda.gastosSalario}" 
                                                          type="currency" 
                                                          currencySymbol="€" 
                                                          pattern="#,##0.00 €"/>
                                    </td>
                                    <td class="text-center col-botones-sm">
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idTienda=${tienda.idTienda}"
                                           class="btn btn-secondary btn-sm ms-2 mt-2 mb-2 btn-width-igual">
                                            <i class="bi bi-pencil"></i> Editar
                                        </a>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idTienda=${tienda.idTienda}"
                                           class="btn btn-danger btn-sm ms-2 mt-2 mb-2 btn-width-igual">
                                            <i class="bi bi-trash"></i> Eliminar
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--Totales-->
            <div class="col-md-3">
                <div class="card text-center bg-success text-white mb-3 mt-5">
                    <div class="card-body">
                        <h3>Facturación Total</h3>
                        <h4 class="display-6">
                            <fmt:setLocale value="es_ES"/>
                            <fmt:formatNumber value="${facturacionTotal}" 
                                              type="currency" 
                                              currencySymbol="€"/>
                        </h4>
                    </div>
                </div>
                <div class="card text-center bg-orange text-white mb-3">
                    <div class="card-body">
                        <h3>Gastos Total (Salarios)</h3>
                        <h4 class="display-6">
                            <fmt:setLocale value="es_ES"/>
                            <fmt:formatNumber value="${gastoSalarioTotal}" 
                                              type="currency" 
                                              currencySymbol="€"/>
                        </h4>
                    </div>
                </div>
                <div class="card text-center bg-morado text-white mb-3">
                    <div class="card-body">
                        <h3>Total Tiendas</h3>
                        <h4 class="display-6">
                            <i class="bi bi-people"></i> ${totalTiendas}
                        </h4>
                    </div>
                </div>
                        <div class="card text-center bg-amarillo text-white mb-3">
                    <div class="card-body">
                        <h3>Total Empleados</h3>
                        <h4 class="display-6">
                            <i class="bi bi-people"></i> 
                            <fmt:formatNumber value="${numeroEmpleadosTotal}" pattern="#"/>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Sección para los gráficos -->
<section id="graficos" class="mt-5 mb-5">
    <div class="container">
        <div class="row">
            <!-- Gráfico de Barras -->
            <div class="col-md-6 mb-4">
                <div class="card p-4">
                    <h5 class="text-center mb-4">Comparativa de Facturación vs. Gastos</h5>
                    <div class="chart-container">
                        <canvas id="graficoBarras"></canvas>
                    </div>
                </div>
            </div>
            <!-- Gráfico de Dona -->
            <div class="col-md-6 mb-4">
                <div class="card p-4">
                    <h5 class="text-center mb-4">Distribución de Facturación por Tienda</h5>
                    <div class="chart-container">
                        <canvas id="graficoDona"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    // Espera a que el DOM esté completamente cargado para ejecutar el script
    window.onload = function() {
        
        // La magia sucede aquí: usamos JSTL para generar dinámicamente
        // los arrays de JavaScript con los datos de las tiendas.
        const labels = [];
        const facturacionData = [];
        const gastosSalarioData = [];

        // Con un bucle c:forEach, recorremos la lista de tiendas
        // que viene del controlador y generamos los datos.
        <c:forEach var="tienda" items="${tiendas}">
            labels.push("${tienda.nombre_tienda}");
            facturacionData.push(${tienda.facturacion});
            gastosSalarioData.push(${tienda.gastosSalario});
        </c:forEach>

        // --- Configuración y Creación del Gráfico de Barras ---
        const ctxBarras = document.getElementById('graficoBarras').getContext('2d');
        new Chart(ctxBarras, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [
                    {
                        label: 'Facturación (€)',
                        data: facturacionData,
                        backgroundColor: 'rgba(54, 162, 235, 0.7)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        borderRadius: 8
                    },
                    {
                        label: 'Gastos de Salario (€)',
                        data: gastosSalarioData,
                        backgroundColor: 'rgba(255, 99, 132, 0.7)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1,
                        borderRadius: 8
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Cantidad (€)',
                            font: { size: 14, color: '#ffffff' } // Color blanco puro
                        },
                        ticks: { color: '#ffffff' }, // Ticks del eje Y en blanco puro
                        grid: { color: 'rgba(255, 255, 255, 0.2)' }
                    },
                    x: {
                        ticks: { color: '#ffffff' }, // Ticks del eje X en blanco puro
                        grid: { color: 'rgba(255, 255, 255, 0.2)' }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        labels: { color: '#ffffff' } // Etiquetas de la leyenda en blanco puro
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed.y !== null) {
                                    label += new Intl.NumberFormat('es-ES', { style: 'currency', currency: 'EUR' }).format(context.parsed.y);
                                }
                                return label;
                            }
                        }
                    }
                }
            }
        });

        // --- Configuración y Creación del Gráfico de Dona ---
        const ctxDona = document.getElementById('graficoDona').getContext('2d');
        const colores = [
            'rgba(54, 162, 235, 0.8)',  // Azul
            'rgba(255, 99, 132, 0.8)',  // Rojo
            'rgba(255, 206, 86, 0.8)',  // Amarillo
            'rgba(75, 192, 192, 0.8)',  // Verde
            'rgba(153, 102, 255, 0.8)',  // Morado
            'rgba(255, 159, 64, 0.8)',      // Naranja Brillante
            'rgba(255, 255, 0, 0.8)',       // Amarillo Vivo
            'rgba(0, 255, 255, 0.8)',       // Cian Eléctrico
            'rgba(255, 0, 255, 0.8)',       // Magenta
            'rgba(0, 255, 0, 0.8)',         // Verde Lima
            'rgba(128, 0, 128, 0.8)',       // Púrpura Intenso
            'rgba(255, 105, 180, 0.8)',     // Rosa
            'rgba(0, 206, 209, 0.8)',       // Turquesa
            'rgba(218, 112, 214, 0.8)',     // Orquídea
            'rgba(255, 69, 0, 0.8)'         // Rojo Anaranjado
        ];
        
        new Chart(ctxDona, {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Facturación (€)',
                    data: facturacionData,
                    backgroundColor: colores,
                    borderColor: '#2d3748',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'right',
                        labels: { 
                            font: { size: 14 },
                            color: '#ffffff' // Etiquetas de la leyenda en blanco puro
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const total = context.chart.data.datasets[0].data.reduce((acc, curr) => acc + curr, 0);
                                const value = context.parsed;
                                const percentage = ((value / total) * 100).toFixed(2);
                                let label = context.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                label += new Intl.NumberFormat('es-ES', { style: 'currency', currency: 'EUR' }).format(value);
                                label += ` (${percentage}%)`;
                                return label;
                            }
                        }
                    }
                }
            }
        });
    };
</script>
</body>
</html>
