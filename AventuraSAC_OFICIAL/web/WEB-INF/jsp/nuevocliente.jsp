
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="webapp/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet">
    </head>
    <body id="car">
        <header id="header">
            <a class="logo" href="MenuPrincipalTrabajador.html">Aventura S.A.C.</a>
            <nav>
                <a href="#menu.htm">Menu</a>
            </nav>
        </header>
        <div class="container md-8">
            <div class="card">
                <div class="card-header">
                    <h2>Nuevo Cliente</h2>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="cliente">
                        <div class="form-group">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" cssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc" cssClass="form-control" />
                        </div>
                        <div>
                            <label for="idDistrito">Distrito:</label><br>
                            <form:select path="idDistrito.idDistrito" id="idDistrito">
                                <c:forEach items="${listaDistrito}" var="x">
                                    <option value="${x.idDistrito}">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion" cssClass="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="broker">Broker:</label>
                            <form:input path="broker" cssClass="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" cssClass="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="usuario">Usuario:</label>
                            <form:input path="usuario" cssClass="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="clave">Clave:</label>
                            <form:password path="clave" cssClass="form-control" placeholder="*********" />
                        </div>
                        <input type="submit" class="btn btn-primary"  value="Registrar">
                        <a class="btn btn-secondary" href="clientes.htm" role="button">Regresar</a>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
