<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="webapp/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/crud.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/fonts/font.awesome.css" />" rel="stylesheet">
    </head>
    <body id="bodys">
        <header id="header">
            <a class="logo" href="MenuPrincipalTrabajador.html">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>
        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Clientes</h3>
                </div>
                <div class="card-body">
                    <a class="btn btn-primary" href="nuevocliente.htm" role="button">Nuevo</a>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Razón Social</th>
                                <th scope="col">RUC</th>
                                <th scope="col">Distrito</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Broker</th>

                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${clientes}">
                                <tr>
                                    <th scope="row">${item.idCliente}</th>
                                    <td>${item.razonSocial}</td>
                                    <td>${item.ruc}</td>
                                    <td>${item.idDistrito.detalle}</td>
                                    <td>${item.direccion}</td>
                                    <td>${item.telefono}</td>
                                    <td>${item.correo}</td>
                                    <td>${item.broker}</td>

                                    <td><a href="editarcliente.htm?id=${item.idCliente}" class="btn btn-info" role="button"><i class="fas fa-edit"></i></a> 
                                        <input type="button" onclick="eliminar('${item.idCliente}')" class="btn btn-warning" value="Eliminar"/>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
        <script type="text/javascript">
            function eliminar(id) {
                if (confirm("¿Desea eliminar el cliente?")) {
                    window.location.href = "eliminarcliente.htm?id=" + id;
                    return true;
                }
                return false;
            }
        </script>
    </body>
</html>

