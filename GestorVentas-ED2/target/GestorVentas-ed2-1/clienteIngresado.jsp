<%@include file="libs/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="libs/navbarClienteIngresado.jsp" %>

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
            <tr>
                <th scope="row">1</th>
                <td>Producto A</td>
                <td>Descripción breve del producto A, destacando sus principales características.</td>
                <td class="text-success">$20.00</td>
                <td>
                    <button class="btn btn-primary btn-sm">Agregar al Carrito</button>
                </td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Producto B</td>
                <td>Descripción breve del producto B, destacando sus principales características.</td>
                <td class="text-success">$35.00</td>
                <td>
                    <button class="btn btn-primary btn-sm">Agregar al Carrito</button>
                </td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Producto C</td>
                <td>Descripción breve del producto C, destacando sus principales características.</td>
                <td class="text-success">$15.00</td>
                <td>
                    <button class="btn btn-primary btn-sm">Agregar al Carrito</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<%@include file="libs/foother.jsp" %>
