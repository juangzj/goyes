<%@page import="modelo.Usuario"%>
<%@include file="libs/headerAdministrador.jsp" %>
<div class="container">

    <%@include file="libs/asideBarAdministrador.jsp" %>

    <!-- Main Content -->
    <div class="content">
        <%
            Usuario usuarioEnSesion = (Usuario) request.getSession().getAttribute("usuarioEnSesion");
        %>
        <h1>Bienvenido, <%= usuarioEnSesion.getNombre() %> </h1>
        <p>Este es el Dashboard del Administrador, Aqu� puedes gestionar los usuarios, productos y m�s.</p>
       
    </div>
</div>

<%@include file="libs/foother.jsp" %>
