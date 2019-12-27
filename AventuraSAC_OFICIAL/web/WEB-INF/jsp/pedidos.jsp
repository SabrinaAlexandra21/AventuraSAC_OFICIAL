<%-- 
    Document   : pedidos
    Created on : 22/12/2019, 07:24:24 AM
    Author     : CHELLI BONITA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="<c:url value="webapp/resources/theme1/css/crud.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/fonts/font.awesome.css" />" rel="stylesheet">
        <script src="<c:url value="webapp/resources/theme1/js/jquery.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="webapp/resources/theme1/js/jquery.modal.js"/>"></script>
        <link type="text/css" rel="stylesheet" href="<c:url value="webapp/resources/theme1/css/jquery.modal.css"/>" />

    </head>
    <body id="bodys">

        <header id="header">
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>
            <nav>
                <a href="login.htm">Salir</a>
            </nav>
        </header>

        <div class="container md-8">

            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Agregar Pedido</h3>
                </div>
                <div class="card-body">
                    <a class="btn btn-primary" href="FichaTecnica.htm" role="button" id="nuevo">Agregar Ficha Técnica</a>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">IdCliente</th>
                                <th scope="col">IdPedido</th>
                                <th scope="col">Fecha Emitida</th>
                                <th scope="col">Fecha Entrega</th>
                        

                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                                <c:forEach var="item" items="${fichatecnica}">
                                <tr>
                                    <th scope="row" >${usuario.idCliente}</th>
                                    <td >${item.descripcion}</td>
                                    <td >${item.idTipo.detalle}</td>
                                    <td >${item.etiqueta}</td>
                        

                                    <td scope="col-2">
                                     

                                        <a class="btn btn-info" role="button" href="editarcliente.htm?id=${item.idCliente}" ><i class="fas fa-edit"></i></a> 
                                        <!--  <button  class="btn btn-info" type="button" id="editar" onclick="editar('${item.idCliente}', '${item.idDistrito.idDistrito}')" ><i class="fas fa-edit"></i></button>  -->
                                        <button  class="btn btn-warning" type="button" onclick="eliminar('${item.idCliente}')" ><i class="fas fa-trash-alt"></i></button>
                                    </td>

                                    

                                </tr>
                            </c:forEach>
                                
                        </tbody>
                    </table>

                    <center>
                        <button><a href="menu.htm" id="regre">Regresar al Menú</a></button>
                    </center>

                </div>
            </div>
        </div>
    </body>
</html>
