<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="webapp/resources/theme1/css/main.css"/>" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/fonts/font.awesome.css" />" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body id="body">

        <header id="header">
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>
            <nav>
                <a href="login.htm">Salir</a>
            </nav>
        </header>

        <div class="container md-8">
            <br>
            <div class="card" id="carta">

                <div class="card-header">


                    <div class="p-4">
                        <h3>Lista de Pedidos</h3>
                    </div>


                </div>
                <br>
                <div class="card-body">


                    <table class="table">

                        <thead>
                            <tr>
                                <th scope="col">IdPedido</th>
                                <th scope="col">IdCliente</th>
                                <th scope="col">Fecha Registro</th>
                                <th scope="col">Fecha Entrega</th>
                                <th scope="col">Acciones</th>

                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="item" items="${pedidos}">
                                <tr> 
                                    <th scope="row" >${item.idPedido}</th>
                                    <td >${item.idCliente.idCliente}</td>
                                    <td >${item.fechaRegistro}</td>
                                    <td >${item.fechaEntrega}</td>
                                    <td>
                                        <a class="btn btn-info" role="button" href="Cotizacion.htm?idPedido=${item.idPedido}" ><i class="fas fa-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>

                    <button><a href="menucliente.htm" id="regre">Regresar al Menú</a></button>


                </div>

            </div>
        </div>
    </body>

</html>
