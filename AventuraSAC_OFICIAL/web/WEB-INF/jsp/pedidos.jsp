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
                <form:form method="post" modelAttribute="pedido">
                    <div class="card-header">
                        <div class="d-flex flex-row">

                            <form:input path="idPedido" type="hidden" cssClass="form-control" />
                            
                            <div class="p-4">
                                <h3>Agregar Pedido</h3>
                            </div>
                            
                            <div class="p-4">
                                
                                <label for="fechaRegistro">Fecha Emisión: </label>
                                <form:input path="fechaRegistro" cssClass="form-control" />
                            </div>
                            <div class="p-4">
                                <label for="fechaRegistro">Fecha Entrega: </label>
                                <form:input path="fechaEntrega" cssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="card-body">

                        <a class="btn btn-primary" href="FichaTecnica.htm" role="button" id="nuevo">Agregar Ficha</a>
                        <table class="table">

                            <thead>
                                <tr>
                                    <th scope="col">IdCliente</th>
                                    <th scope="col">IdFicha</th>
                                    <th scope="col">Descripción</th>
                                    <th scope="col">Modelo</th>
                                    <th scope="col">Etiquetas</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="item" items="${ficha}">
                                    <tr> 
                                        <th scope="row" >${item.idCliente.razonSocial}</th>
                                        <td >${item.idFicha}</td>
                                        <td >${item.descripcion}</td>
                                        <td >${item.idTipoModelo.nombre}</td>
                                        <td >${item.etiqueta}</td>
                                        <td scope="col-2">


                                            <a class="btn btn-info" role="button" href="editarcliente.htm?id=${item.idFicha}" ><i class="fas fa-edit"></i></a> 

                                            <button  class="btn btn-warning" type="button" onclick="eliminar('${item.idFicha}')" ><i class="fas fa-trash-alt"></i></button>
                                        </td>



                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>

                        <center>
                            <input type="submit" class="btn btn-secondary" value="Enviar"/>
                            <button><a href="menucliente.htm" id="regre">Regresar al Menú</a></button>
                        </center>

                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>
