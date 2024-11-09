<%@include file="libs/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="libs/navbarInicioSesion.jsp" %>

<div class="container-fluid p-0">
    <img src="imgs/gamer.png" class="img-fluid w-100" style="height: 500px; object-fit: cover;" alt="Imagen de ancho completo">
</div>




<div class="container py-5">
    <h1 class="text-center mb-5">Lista de Productos</h1>

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
            <tr>
                <th scope="row">1</th>
                <td>Producto A</td>
                <td>Descripción breve del producto A, destacando sus principales características.</td>
                <td class="text-success">$20.00</td>
                <td>
                    <a href="index.jsp" class="btn btn-primary btn-sm">Ingresar y ver producto</a>
                </td>
            </tr>
           
        </tbody>
    </table>
</div>
<%@include file="libs/foother.jsp" %>
