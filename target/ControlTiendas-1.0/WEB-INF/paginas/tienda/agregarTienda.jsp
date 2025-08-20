<div class="modal fade" id="agregarTiendaModal" tabindex="-1" aria-labelledby="agregarTiendaLabel"
        aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title" id="agregarTiendaLabel">Agregar Tienda</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" 
                        arial-label="Close"></button>
            </div>
            
            <!--Formulario para agregar un nuevo tienda-->
            <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar"
                  method="POST" class="was-validated">
                <div class="modal-body" style="color:  #1d2233;">
                    <div class="form-group mb-3">
                        <label for="nombreTienda">Nombre Tienda</label>
                        <input type="text" class="form-control" id="nombreTienda" name="nombreTienda" required />
                    </div>
                    <div class="form-group mb-3">
                        <label for="direccion">Direccion</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" required />
                    </div>
                    <div class="form-group mb-3">
                        <label for="facturacion">Facturacion</label>
                        <input type="number" class="form-control" id="facturacion" name="facturacion" required 
                                step="any" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="numeroEmpleados">numeroEmpleados</label>
                        <input type="number" class="form-control" id="numeroEmpleados" name="numeroEmpleados" required />
                    </div>
                    <div class="form-group mb-3">
                        <label for="gastosSalario">gastosSalario</label>
                        <input type="number" class="form-control" id="gastosSalario" name="gastosSalario" required
                               step="any"/>
                    </div>
                </div>
                <!--Pie pagina de la ventana modal-->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </form>
            
        </div>
    </div>
</div>