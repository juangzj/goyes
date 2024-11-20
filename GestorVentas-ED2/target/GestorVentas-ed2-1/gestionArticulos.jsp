<%@page import="modelo.Categoria"%>
<%@page import="controlador.ControladorCategoria"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>
<%@page import="controlador.ControladorArticulo"%>
<%@include file="libs/headerAdministrador.jsp" %>
<div class="container">
    <%@include file="libs/asideBarAdministrador.jsp" %>

    <!-- Main Content -->
    <div class="content">
        <h1 class="text-center">Administrar productos</h1>



        <!-- Tabla de articulos -->
        <div class="table-container" style="margin: 20px 0;">
            <div class="table-responsive" style="max-width: 100%; overflow-x: auto;">
                <table class="table table-striped" style="width: 100%; margin: auto;">
                    <thead>
                        <tr>
                            <th style="padding: 15px;">ID</th>
                            <th style="padding: 15px;">Nombre</th>
                            <th style="padding: 15px;">Descripción</th>
                            <th style="padding: 15px;">Precio</th>
                            <th style="padding: 15px;">Stock</th>
                            <th style="padding: 15px;">Categoria</th>
                            <th style="padding: 15px;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ControladorArticulo controladorArticulo = new ControladorArticulo();
                            List<Articulo> articulosExistentes = controladorArticulo.darArticulos();

                            ControladorCategoria controladorCategoria = new ControladorCategoria();

                            if (articulosExistentes != null) {
                                for (Articulo articulo : articulosExistentes) {

                                    // Convertimos los bytes en base64
                                    String imagenBase64 = Base64.getEncoder().encodeToString(articulo.getImagen()).trim();
                                    // Obtenemos la extensión de la imagen
                                    String extensionImagen = articulo.getNombreImagen().substring(articulo.getNombreImagen().lastIndexOf(".") + 1);
                        %>
                        <tr>
                            <td style="padding: 10px;"><%=articulo.getId()%></td>  
                            <td style="padding: 10px;"><%=articulo.getNombre()%></td>
                            <td style="padding: 10px;"><%=articulo.getDescripcion()%></td>
                            <td style="padding: 10px;"><%=articulo.getPrecio()%></td>
                            <td style="padding: 10px;"><%=articulo.getCantidad()%></td>
                            <%
                                int idCategoriaMostar = articulo.getIdCategoria();

                                Categoria categoriaMostrar = controladorCategoria.obtenerCategoriaId(idCategoriaMostar);
                                if (categoriaMostrar != null) {
                            %>
                            <td style="padding: 10px; text-align: center;"><%= categoriaMostrar.getCategoria()%></td>
                            <td style="padding: 10px; text-align: center;">
                                <!-- Botón para abrir el modal de editar -->
                                <button type="button" class="btn btn-warning editarArticulo-btn" 
                                        data-bs-toggle="modal" 
                                        data-bs-target="#exampleModalEditar" 
                                        data-id="<%=articulo.getId()%>"
                                        data-nombre="<%= articulo.getNombre()%>"
                                        data-descripcion="<%= articulo.getDescripcion()%>"
                                        data-precio="<%= articulo.getPrecio()%>"
                                        data-stock="<%= articulo.getCantidad()%>"
                                        data-imagenBinarios="<%=imagenBase64%>"
                                        data-extensionImagen="<%=extensionImagen%>">
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
                                        data-nombreImagen="<%= articulo.getNombreImagen()%>"
                                        data-precio="<%= articulo.getPrecio()%>"
                                        data-stock="<%= articulo.getCantidad()%>"
                                        data-imagenBinarios="<%=imagenBase64%>"
                                        data-extensionImagen="<%=extensionImagen%>"
                                        data-categoria="<%=categoriaMostrar != null ? categoriaMostrar.getCategoria() : "Sin categoría"%>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </button>


                                <!-- Botón para eliminar un artículo -->
                                <button type="button" class="btn btn-danger eliminarArticulo-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%=articulo.getId()%>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L10 5.03a.5.5 0 0 1 .47-.53z"/>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <%
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>


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



        <!-- Modal para ver la información -->
        <div class="modal fade" id="exampleModalVer" tabindex="-1" aria-labelledby="exampleModalVerLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalVerLabel">Información del Artículo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Mostrar información de un artículo -->
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <strong>ID:</strong>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" type="text" id="idVer" readonly>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <strong>Nombre de la Imagen:</strong>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" type="text" id="nombreImagenVer" readonly>
                            </div>
                        </div>

                        <div class="row mb-3 text-center">
                            <div class="col-12">
                                <img id="imagenVer" src="" class="img-fluid" style="max-width: 200px; max-height: 150px; object-fit: cover;">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <strong>Nombre:</strong>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" type="text" id="nombreVer" readonly>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <strong>Descripción:</strong>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" type="text" id="descripcionVer" readonly>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <strong>Categoría:</strong>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" type="text" id="categoriaVer" readonly>
                            </div>
                        </div>


                        <div class="row mb-3">
                            <div class="col-md-4">
                                <strong>Precio:</strong>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" type="text" id="precioVer" readonly>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <strong>Stock:</strong>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" type="text" id="stockVer" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- Modal Para Editar un articulo-->
        <div class="modal fade" id="exampleModalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="SvEditarArticulo" method="POST" enctype="multipart/form-data"  >
                        <div class="modal-body">


                            <form action="SvEditarArticulo" method="POST" enctype="multipart/form-data" >
                                <p>¿Estás seguro de que deseas EDITAR el articulo con ID: <span id="articuloIdEditar"></span>?</p>
                                <input type="number" name="idEditar" id="idEditar"  class="form-control" placeholder="Ingrese el nombre" autofocus required  style="display: none;">
                                    <div class="form-group">
                                        <label>nombre:</label>
                                        <input type="text" name="nombreEditar" id="nombreEditar" class="form-control" placeholder="ingrese el nombre" autofocus required >
                                    </div><br>
                                        <div class="mb-3">
                                            <label for="formFile" class="form-label">Selecciona una imagen</label>
                                            <input class="form-control" type="file" id="formFile" name="imagenEditar" required>
                                        </div>
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



                                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2b1BbG4D4pI4IsxKTxWz9fM5kKNVYN6g0sOKjxCBbCgAYy7eIvN1zzBrCTE" crossorigin="anonymous"></script>




                                                    <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------> 

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


                                                    <!-- Scrip para mostrar la informacion en el modal de editar -->
                                                    <script>
                                                        $(document).ready(function () {
                                                            $('#exampleModalVer').on('show.bs.modal', function (event) {
                                                                var button = $(event.relatedTarget); // Botón que abrió el modal

                                                                // Extraer datos del botón mediante data-*
                                                                var id = button.data('id');
                                                                var nombre = button.data('nombre');
                                                                var descripcion = button.data('descripcion');
                                                                var nombreImagen = button.data('nombreimagen');
                                                                var precio = button.data('precio');
                                                                var stock = button.data('stock');
                                                                var categoria = button.data('categoria'); // Nueva línea
                                                                var imagenBinarios = button.data('imagenbinarios');
                                                                var extensionImagen = button.data('extensionimagen');

                                                                // Actualizar el contenido del modal
                                                                var modal = $(this);
                                                                modal.find('#idVer').val(id);
                                                                modal.find('#nombreVer').val(nombre);
                                                                modal.find('#descripcionVer').val(descripcion);
                                                                modal.find('#nombreImagenVer').val(nombreImagen);
                                                                modal.find('#precioVer').val(precio);
                                                                modal.find('#stockVer').val(stock);
                                                                modal.find('#categoriaVer').val(categoria); // Nueva línea
                                                                modal.find('#imagenVer').attr('src', 'data:image/' + extensionImagen + ';base64,' + imagenBinarios);
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

                                                    <%@include file="libs/foother.jsp" %>
