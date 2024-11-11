<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>
<%@page import="controlador.ControladorArticulo"%>
<%@include file="libs/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="libs/navbarInicioSesion.jsp" %>

<div class="container-fluid p-0">
    <img src="imgs/gamer.png" class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="Imagen de ancho completo">
</div>


<div class="container py-5">
    <h1 class="text-center mb-5">Catálogo de Productos</h1>

    <%
        ControladorArticulo controladorArticulo = new ControladorArticulo();
        List<Articulo> listaArticulos = controladorArticulo.darArticulos();

        if (listaArticulos != null && !listaArticulos.isEmpty()) {
    %>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
            for (Articulo articulo : listaArticulos) {
                // Convertimos los bytes en base64
                String imagenBase64 = Base64.getEncoder().encodeToString(articulo.getImagen()).trim();
                // Obtenemos la extensión de la imagen
                String extensionImagen = articulo.getNombreImagen().substring(articulo.getNombreImagen().lastIndexOf(".") + 1);
        %>
        <div class="col">
            <div class="card h-100">
                <img src="data:image/<%= extensionImagen%>;base64,<%= imagenBase64%>" class="card-img-top" alt="<%= articulo.getNombre()%>" style="max-height: 200px; object-fit: cover;">

                <div class="card-body">
                    <h5 class="card-title"><%= articulo.getNombre()%></h5>
                    <p class="card-text text-muted"><strong>ID:</strong> <%= articulo.getId()%></p>
                    <p class="card-text"><%= articulo.getDescripcion()%></p>
                    <p class="card-text ">Existentes: <%= articulo.getCantidad()%></p>
                    <p class="card-text text-success"><strong>Precio:</strong> $<%= articulo.getPrecio()%></p>
                </div>

                <div class="card-footer text-center">
                    <a href="index.jsp" class="btn btn-success">Ingresar Comprar</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <%
    } else {
    %>
    <div class="alert alert-warning text-center" role="alert">
        No hay artículos por mostrar.
    </div>
    <%
        }
    %>
    <%@include file="libs/foother.jsp" %>
