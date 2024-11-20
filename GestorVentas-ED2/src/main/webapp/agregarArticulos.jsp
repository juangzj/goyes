<%@page import="modelo.Categoria"%>
<%@page import="controlador.ControladorCategoria"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="controlador.ControladorUsuario"%>
<%@include file="libs/headerAdministrador.jsp" %>

<div class="container">
    <%@include file="libs/asideBarAdministrador.jsp" %>

    <!-- Main Content -->
    <div class="content mt-4">
        <h1 class="text-center">Administrar Usuarios</h1>
        <hr class="mb-4">

        <!-- Formulario para agregar un art�culo -->
        <form action="SvAniadirArticulo" method="POST" enctype="multipart/form-data" class="p-4 border rounded shadow-sm" style="background-color: #f8f9fa;">
            <div class="mb-3">
                <label for="nombreArticulo" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="nombreArticuloAgregar" placeholder="Nombre del art�culo" required>
            </div>

            <div class="mb-3">
                <label for="descripcionArticulo" class="form-label">Descripci�n</label>
                <textarea class="form-control" name="descripcionArticuloAgregar" rows="4" placeholder="Descripci�n del art�culo" required></textarea>
            </div>

            <div class="mb-3">
                <label for="categoria" class="form-label">Categor�a</label>
                <select class="form-select" name="categoriaArticuloAgregar" id="categoriaArticuloAgregar" required>
                    <option value="" disabled selected>Seleccione una categor�a</option>
                    <%
                        ControladorCategoria controladorCategoria = new ControladorCategoria();
                        
                        List<Categoria> listaCategorias = controladorCategoria.obtenerCategorias();
                        if (listaCategorias != null && !listaCategorias.isEmpty()) {
                            for (Categoria categoria : listaCategorias) {
                    %>
                    <option value="<%= categoria.getId() %>"><%= categoria.getCategoria() %></option>
                    <%
                            }
                        } else {
                    %>
                    <option value="" disabled>No hay categor�as disponibles</option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="mb-3">
                <label for="formFile" class="form-label">Selecciona una imagen</label>
                <input class="form-control" type="file" id="formFile" name="imagenProducto" required>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="precioArticulo" class="form-label">Precio</label>
                    <input type="number" class="form-control" name="precioArticuloAgregar" step="0.01" placeholder="Precio del art�culo" required>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="stockArticulo" class="form-label">Stock</label>
                    <input type="number" class="form-control" name="stockArticuloAgregar" step="0.01" placeholder="Cantidad en stock" required>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary px-4">Agregar</button>
            </div>
        </form>
    </div>
</div>

<%@include file="libs/foother.jsp" %>
