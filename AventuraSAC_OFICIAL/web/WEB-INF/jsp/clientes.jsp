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
        <script type="text/javascript" src="<c:url value="webapp/resources/theme1/js/bootstrap.min.js"/>"></script>
    </head>
    <body id="bodys">
        <header id="header">
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>
        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Listado de Clientes</h3>
                </div>
                <div class="card-body">
                    <a class="btn btn-primary" href="nuevocliente.htm" role="button" id="nuevo">Nuevo</a>
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

                                    <td scope="col-2">

                                        <a href="editarcliente.htm?id=${item.idCliente}" class="btn btn-info" role="button"><i class="fas fa-edit"></i></a> 
                                        <button type="button" onclick="eliminar('${item.idCliente}')" class="btn btn-warning"><i class="fas fa-trash-alt"></i></button>
                                    </td>



                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal1">
                        <i>boton</i>
                    </button>

                    <div class="modal fade" id="modal1" >
                        <div class="modal-dialog" >
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
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

