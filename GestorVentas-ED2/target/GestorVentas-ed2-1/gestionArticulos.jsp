<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>
<%@page import="controlador.ControladorArticulo"%>
<%@include file="libs/headerAdministrador.jsp" %>
<div class="container">
    <%@include file="libs/asideBarAdministrador.jsp" %>

    <!-- Main Content -->
    <div class="content">
        <h1 class="text-center">Administrar productos</h1>

        <!-- Botón para agregar un nuevo artículo -->
        <div class="mb-3 text-center">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalAgregarArticulo">Agregar Artículo</button>
        </div>

        <!-- Tabla de usuarios -->
        <div class="table-container">
            <table class="table table-striped" style="width: 80%; margin: auto;">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ControladorArticulo controladorArticulo = new ControladorArticulo();
                        List<Articulo> articulosExistentes = controladorArticulo.darArticulos();
                        
                        if(articulosExistentes != null ){
                            for(Articulo articulo: articulosExistentes){
                        
 
                    %>
                    <tr>
                         <td><%=articulo.getId()%></td>  
                            <td><%=articulo.getNombre()%></td>
                            <td><%=articulo.getDescripcion()%></td>
                            <td><%=articulo.getPrecio()%></td>
                            <td><%=articulo.getCantidad()%></td>
                            <td>
                                <!-- Botón para abrir el modal de editar -->
                                <button type="button" class="btn btn-warning editarArticulo-btn" 
                                        data-bs-toggle="modal" 
                                        data-bs-target="#exampleModalEditar" 
                                        data-id="<%=articulo.getId()%>"
                                        data-nombre="<%= articulo.getNombre()%>"
                                        data-descripcion="<%= articulo.getDescripcion()%>"
                                        data-precio="<%= articulo.getPrecio()%>"
                                        data-stock="<%= articulo.getCantidad()%>" >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                                    </svg>
                                </button>    
                                <!-- Botón para abrir el modal de ver -->
                                <button type="button" class="btn btn-success verArticulo-btn" 
                                        data-bs-toggle="modal" 
                                        data-bs-target="#exampleModalVer" 
                                        data-id="<%=articulo.getId()%>"
                                        data-nombre="<%= articulo.getNombre()%>"
                                        data-descripcion="<%= articulo.getDescripcion()%>"
                                        data-precio="<%= articulo.getPrecio()%>"
                                        data-stock="<%= articulo.getCantidad()%>" >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </button>  
                                <!-- Botón para eliminar un artículo -->
                                <button type="button" class="btn btn-danger eliminarArticulo-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%=articulo.getId()%>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                                    </svg>
                                </button>
                            </td>
                    </tr>
                    <%

                        }
                    } else {
                    %>
                    <tr> 
                        <td colspan="5" class="text-center">No hay datos que mostrar</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

 <!-- Modal para ver la información-->
<div class="modal fade" id="exampleModalVer" tabindex="-1" aria-labelledby="exampleModalVerLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalVerLabel">Articulo</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Mostrar información de un articulo -->
        <form>
           <label for="modalNombre">ID:</label>
          <input class="form-control" type="text" id="idVer" readonly><br>
          <label for="modalNombre">Nombre:</label>
          <input class="form-control" type="text" id="nombreVer" readonly><br>
          <label for="modalFecha">Descripcion:</label>
          <input class="form-control" type="text" id="descripcionVer" readonly><br>
          <label for="modalPuntuacion">Stock:</label>
          <input class="form-control" type="text" id="stockVer" readonly><br>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
    <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------> 
<!-- Modal para agregar artículo -->
<div class="modal fade" id="exampleModalAgregarArticulo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar Artículo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Formulario para agregar un artículo -->
                <form action="SvAniadirArticulo" method="POST"> 
                    <div class="mb-3">
                        <label for="nombreArticulo" class="form-label">Nombre</label>
                        <input type="text" class="form-control"  name="nombreArticuloAgregar" required>
                    </div>
                    <div class="mb-3">
                        <label for="descripcionArticulo" class="form-label">Descripción</label>
                        <textarea class="form-control"  name="descripcionArticuloAgregar" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="precioArticulo" class="form-label">Precio</label>
                        <input type="number" class="form-control"  name="precioArticuloAgregar" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label for="precioArticulo" class="form-label">Stock</label>
                        <input type="number" class="form-control"  name="stockArticuloAgregar" step="0.01" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Agregar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------> 

<!-- Modal Para Eliminar un artículo -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de que deseas ELIMINAR el artículo con ID: <span id="articuloIdEliminar"></span>?</p>
            </div>
            <form action="SvEliminarArticulo" method="POST">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" name="confirmacionEliminacion" value="confirmacionEliminar">Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->                   

                <!-- Modal Para Editar un articulo-->
                <div class="modal fade" id="exampleModalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="SvEditarArticulo" method="POST">
                                <div class="modal-body">
                                    <p>¿Estás seguro de que deseas EDITAR el articulo con ID: <span id="articuloIdEditar"></span>?</p>

                                    <form action="SvAgregarArticulo" method="POST">
                                        <div class="form-group">
                                            <label>nombre:</label>
                                            <input type="text" name="nombreEditar" id="nombreEditar" class="form-control" placeholder="ingrese el nombre" autofocus required >
                                        </div><br>
                                            <div class="form-group">
                                                <label>Descripcion:</label>
                                                <input type="text" name="descripcionEditar" id="descripcionEditar" class="form-control" placeholder="ingrese la descripcion" required >
                                            </div><br>
                                                <div class="form-group">
                                                <label>Precio:</label>
                                                <input type="number" name="precioEditar" id="precioEditar" class="form-control" placeholder="ingrese el precio" required >
                                            </div><br>
                                                <div class="form-group">
                                                <label>Stock:</label>
                                                <input type="number" name="stockEditar" id="stockEditar" class="form-control" placeholder="ingrese la cantidad" required >
                                            </div><br>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-primary">Editar</button>
                                                </div>
                                    </form>
<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------> 

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

<!-- Script para obtener el id del articulo que se va a elimnar y despues enviarla por ajaxx al servlet -->
<script>
    // Captur clic y mandar el id de el articlo que se va a eliminar 
    $('.eliminarArticulo-btn').on('click', function () {
        // Obtener el ID del articulo
        const idArticuloEliminar = $(this).data('id');
        // Mostrar el ID en el modal de eliminación
        $('#articuloIdEliminar').text(idArticuloEliminar);

        // Envío de ID al servlet a través de AJAX (método POST)
        $.ajax({
            url: 'SvEliminarArticulo', // Url donde se enviara los datos(en este caso el id)
            method: 'POST', // Método de solicitud por donde llegara la información al servlet
            data: {idArticuloEliminar: idArticuloEliminar}, // Datos a enviar (en este caso, el ID)
            success: function (response) {
                // Manejar la respuesta del servidor si es necesario
            },
            error: function (xhr, status, error) {
                console.error('Error al enviar la solicitud:', error);
            }
        });
    });
</script>
<!-- Scrip para obtener los datos de un articulo y mostrarlos en el modal -->
<script>
    
    $(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#exampleModalVer').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var id = button.data('id');
        var nombre = button.data('nombre');
        var descripcion = button.data('descripcion');
        var precio = button.data('precio');
        var stock = button.data('stock');
        
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#idVer').val(id);
        modal.find('#nombreVer').val(nombre);
        modal.find('#descripcionVer').val(descripcion);
        modal.find('#precioVer').val(precio);
        modal.find('#stockVer').val(stock);
    });
});

</script>
<!-- Script para obtener el id del articulo que se va a editar y despues enviarla por ajaxx al servlet -->
<script>
    // Captur clic y mandar el id del articulo que se va a editar 
    $('.editarArticulo-btn').on('click', function () {
        // Obtener el ID de la valoracion
        const idArticuloEditar = $(this).data('id');
        // Mostrar el ID en el modal de la edicion
        $('#articuloIdEditar').text(idArticuloEditar);

        // Envío de ID al servlet a través de AJAX (método POST)
        $.ajax({
            url: 'SvEditarArticulo', // Url donde se enviara los datos(en este caso el id)
            method: 'POST', // Método de solicitud por donde llegara la información al servlet
            data: {idArticuloEditar: idArticuloEditar}, // Datos a enviar (en este caso, el ID)
            success: function (response) {
                // Manejar la respuesta del servidor si es necesario
            },
            error: function (xhr, status, error) {
                console.error('Error al enviar la solicitud:', error);
            }
        });
    });
</script>
<!-- Scrip para mostrar la informacion en el modal de editar -->
 <script>
    
    $(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#exampleModalEditar').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var nombre = button.data('nombre');
        var descripcion = button.data('descripcion');
        var precio = button.data('precio');
        var stock = button.data('stock');
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#nombreEditar').val(nombre);
        modal.find('#descripcionEditar').val(descripcion);
        modal.find('#precioEditar').val(precio);
        modal.find('#stockEditar').val(stock);
    });
});

</script>



<%@include file="libs/foother.jsp" %>