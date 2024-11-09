<%-- 
    Document   : header
    Created on : 28/10/2024, 8:50:40 p. m.
    Author     : Usuario 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .sidebar {
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 100;
                width: 250px; /* Definir ancho fijo para el sidebar */
                background-color: #343a40;
            }
            .sidebar a {
                color: #ffffff;
            }
            .content {
                margin-left: 250px; /* Mantener margen para el contenido */
                padding: 20px;
                flex-grow: 1; /* Permitir que el contenido crezca */
            }
            .container {
                display: flex; /* Usar flexbox para colocar el sidebar y el contenido */
            }
            .table-container {
                display: flex; /* Usar flexbox para centrar la tabla */
                justify-content: center; /* Centrar horizontalmente */
                align-items: center; /* Centrar verticalmente */
                height: 100%; /* Asegura que ocupe el alto completo del contenedor */
            }
        </style>
    </head>
    <body>
