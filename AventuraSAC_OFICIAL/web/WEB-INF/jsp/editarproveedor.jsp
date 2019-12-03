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
        <link href="<c:url value="webapp/resources/theme1/css/crud.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/fonts/font.awesome.css" />" rel="stylesheet">
    </head>
    <body id="bodys">
        <header id="header">
            <a class="logo" href="MenuPrincipalTrabajador.html">Aventura S.A.C.</a>

        </header>
        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Editar Proveedor</h3>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="proveedor">

                        <form:hidden path="idProveedor" value="${proveedor.idProveedor}"/>

                        <div class="form-group">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" cssClass="form-control" value="${proveedor.razonSocial}"/>
                        </div>

                        <div class="form-group">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc" cssClass="form-control" value="${proveedor.ruc}"/>
                        </div>

                        <div>
                            <label for="idDistrito">Distrito:</label>
                            <form:select path="idDistrito.idDistrito" id="idDistrito">
                                <c:forEach items="${listaDistrito}" var="x">
                                    <c:if test="${x.idDistrito == proveedor.idDistrito.idDistrito}">
                                        <option value="${x.idDistrito}" selected="selected">${x.detalle}</option>
                                    </c:if>
                                    <c:if test="${x.idDistrito != proveedor.idDistrito.idDistrito}">
                                        <option value="${x.idDistrito}">${x.detalle}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select > 
                        </div>

                        <br>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion" cssClass="form-control" value="${proveedor.direccion}" />
                        </div>

                        <br>
                        <div>
                            <label for="contacto">Contacto:</label><br>
                            <form:input path="contacto" cssClass="form-control"  value="${proveedor.contacto}"/>
                        </div>

                        <br>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control"  value="${proveedor.telefono}"/>
                        </div>

                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" cssClass="form-control"  value="${proveedor.correo}"/>
                        </div>

                        <input type="submit" class="btn btn-primary"  value="Guardar">
                        <a class="btn btn-secondary" href="proveedores.htm" role="button">Regresar</a>

                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

