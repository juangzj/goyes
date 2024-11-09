<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>
<%@page import="controlador.ControladorArticulo"%>
<%@include file="libs/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="libs/navbarInicioSesion.jsp" %>

<div class="container-fluid p-0">
    <img src="imgs/gamer.png" class="img-fluid w-100" style="height: 500px; object-fit: cover;" alt="Imagen de ancho completo">
</div>




<div class="container py-5">
    <h1 class="text-center mb-5">Catálogo de Productos</h1>

    <table class="table table-striped table-hover align-middle">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre del Producto</th>
                <th scope="col">Descripción</th>
                <th scope="col">Precio</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                //Llamado al controlador de articulo
                ControladorArticulo controladorArticulo = new ControladorArticulo();

                List<Articulo> listaArticulos = controladorArticulo.darArticulos();

                if (listaArticulos != null) {

                    for (Articulo articulo : listaArticulos) {
            %>

            <tr>
                <th scope="row"><%=articulo.getId()%></th>
                <td><%=articulo.getNombre()%></td>
                <td><%=articulo.getDescripcion()%></td>
                <td class="text-success"><%=articulo.getDescripcion()%></td>
                <td>
                    <a href="index.jsp" class="btn btn-primary btn-sm">Ingresar y ver producto</a>
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


    </table>
</div>
<%@include file="libs/foother.jsp" %>
