<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="webapp/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/main.css"/>" rel="stylesheet">
        <link href="../../webapp/resources/theme1/css/estilolistapedido.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
        <body id="body" style="background: #adb5bd;">

        <header id="header">
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>
            <nav>
                <a href="login.htm">Salir</a>
            </nav>
        </header>

        <div class="container md-8">
            <br>
            <div class="card" id="carta">
             
                    <div class="card-header" style="background: #C1FCEC ;"> 
                       
                            
                            <div class="p-4">
                                <h2><strong><center>Lista de Pedidos</strong></center></h2>
                            </div>
                            
                 
                    </div>
                <br>
                    <div class="card-body">

                        <table class="table-bordered" style="width: 100%; height: 70%;">

                            <thead>
                                <tr>
                                    <th style="text-align: center;"><h3><strong>IdPedido</strong></h3></th>
                                    <th style="text-align: center;"><h3><strong>IdCliente</strong></h3></th>
                                    <th style="text-align: center;"><h3><strong>Fecha Registro</strong></h3></th>
                                    <th style="text-align: center;"><h3><strong>Fecha Entrega</strong></h3></th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="item" items="${pedidos}">
                                    <tr> 
                                        <th scope="row" style="text-align: center;">${item.idPedido}</th>
                                        <td style="text-align: center;">${item.idCliente.idCliente}</td>
                                        <td style="text-align: center;">${item.fechaRegistro}</td>
                                        <td style="text-align: center;">${item.fechaEntrega}</td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <center>
                             <a class="btn btn-dark" href="Menu.htm" role="button">Regresar al Menú</a> 
                             
                        </center>

                    </div>
          
            </div>
        </div>
    </body>

</html>
