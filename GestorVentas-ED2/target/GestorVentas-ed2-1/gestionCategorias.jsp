<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="controlador.ControladorCategoria"%>
<%@include file="libs/headerAdministrador.jsp" %>
<div class="container">
    <%@include file="libs/asideBarAdministrador.jsp" %>

    <!-- Main Content -->
    <div class="content text-center">
        <h1>Administrar Categorías</h1>

        <!-- Botón para agregar una categoría -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalAgregar">
            Agregar Categoría
        </button>

        <!-- Tabla de categorías -->
        <div class="table-container">
            <table class="table table-striped" style="width: 80%; margin: 20px auto;">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Categoria</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ControladorCategoria controladorCategoria = new ControladorCategoria();
                        List<Categoria> listaCategorias = controladorCategoria.obtenerCategorias();
                        
                        if(listaCategorias != null ){
                        
                        for(Categoria categoria: listaCategorias ){
                        
                    %>
                    <tr>
                        <td><%=categoria.getId() %></td>
                        <td><%=categoria.getCategoria() %> </td>
                        <td>

                            <!-- Botón para abrir el modal de editar -->
                            <button type="button" class="btn btn-warning editarCategoria-btn" 
                                    data-bs-toggle="modal" 
                                    data-bs-target="#exampleModalEditar" 
                                    data-id="<%=categoria.getId() %>"
                                    data-categoria="<%=categoria.getCategoria() %>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                    <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                                </svg>
                            </button>  
                            <!-- Botón para eliminar una Categoría -->
                            <button type="button" class="btn btn-danger eliminarCategoria-btn" data-bs-toggle="modal" data-bs-target="#exampleModalEliminar" data-id="<%=categoria.getId() %>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                                </svg>
                            </button>
                        </td>
                    </tr>
                
<%
    }}else{
%>
                    <!-- Si no hay categorías -->
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
                    <!-- Modal para editar categoría -->
<div class="modal fade" id="exampleModalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Categoría</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Formulario para editar la categoría -->
            <form action="SvEditarCategoria" method="POST">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="idCategoriaEditar" class="form-label">Se editará la categoría con ID</label>
                        <input type="text" class="form-control" name="idCategoriaEditar" id="idCategoriaEditar" placeholder="ID de la categoría" required readonly>
                    </div>
                    <div class="mb-3">
                        <label for="categoriaEditar" class="form-label">Nombre de la categoría</label>
                        <input type="text" class="form-control" name="categoriaEditar" id="categoriaEditar" placeholder="Ingrese el nuevo nombre de la categoría" required>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" id="guardarCategoriaBtn">Editar</button>
                </div>
            </form>
        </div>
    </div>
</div>

                    <!-- Modal para agregar categoría -->
                    <div class="modal fade" id="exampleModalAgregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Agregar Categoría</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="SvAniadirCategoria" method="POST" >
                                    <div class="modal-body">

                                        <div class="mb-3">
                                            <label for="nombreCategoria" class="form-label">Nombre de la categoría</label>
                                            <input type="text" class="form-control" name="nombreCategoria" placeholder="Ingrese el nombre">
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-primary">Agregar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Modal para eliminar categoría -->
                    <div class="modal fade" id="exampleModalEliminar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="SvEliminarCategoria" method="POST">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Eliminar Categoría</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Estás seguro de que deseas eliminar la categoria con id: <span id="categoriaIdEliminar"></span>? Esta acción no se puede deshacer.
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-danger" name="confirmarEliminar" value="confirmarEliminacion" >Eliminar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>





                 <!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
                    
                    
<!-- Script para obtener el id del articulo que se va a elimnar y despues enviarla por ajaxx al servlet -->
<script>
    // Captur clic y mandar el id de el articlo que se va a eliminar 
    $('.eliminarCategoria-btn').on('click', function () {
        // Obtener el ID del articulo
        const idCategoriaEliminar = $(this).data('id');
        // Mostrar el ID en el modal de eliminación
        $('#categoriaIdEliminar').text(idCategoriaEliminar);

        // Envío de ID al servlet a través de AJAX (método POST)
        $.ajax({
            url: 'SvEliminarCategoria', // Url donde se enviara los datos(en este caso el id)
            method: 'POST', // Método de solicitud por donde llegara la información al servlet
            data: {idCategoriaEliminar: idCategoriaEliminar}, // Datos a enviar (en este caso, el ID)
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
        var id = button.data('id');
        var nombre = button.data('nombre');
        var descripcion = button.data('descripcion');
        var precio = button.data('precio');
        var stock = button.data('stock');
        var imagenBinarios = button.data('imagenbinarios'); // La cadena base64 de la imagen
        var extensionImagen = button.data('extensionimagen'); // La extensión de la imagen (jpg o png)
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#nombreEditar').val(nombre);
        modal.find('#descripcionEditar').val(descripcion);
        modal.find('#precioEditar').val(precio);
        modal.find('#stockEditar').val(stock);
        modal.find('#idEditar').val(id);
        
         // Asignar la imagen en base64 al atributo src de la etiqueta <img>
        modal.find('#imagenEditar').attr('src', 'data:image/' + extensionImagen + ';base64,' + imagenBinarios);
    });
});

</script>
<!-- Script para mostrar la información en el modal de editar -->
<script>
    $(document).ready(function(){
        // Manejar el evento cuando se hace clic en el enlace de la modal
        $('#exampleModalEditar').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Botón que abrió el modal
            var idCategoria = button.data('id'); // ID de la categoría
            var nombreCategoria = button.data('categoria'); // Nombre de la categoría
            
            // Actualizar el contenido de la modal
            var modal = $(this);
            modal.find('#idCategoriaEditar').val(idCategoria); // Asignar el ID de la categoría al campo correspondiente
            modal.find('#categoriaEditar').val(nombreCategoria); // Asignar el nombre de la categoría al campo correspondiente
        });
    });
</script>




<%@include file="libs/foother.jsp" %>
