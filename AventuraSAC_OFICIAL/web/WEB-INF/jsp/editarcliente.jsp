<%-- 
    Document   : editarcliente
    Created on : 25/11/2019, 12:28:08 PM
    Author     : CHELLI BONITA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>

        </header>
        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Editar Cliente</h3>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="cliente">

                        <form:hidden path="idCliente" value="${cliente.idCliente}" />

                        <div class="form-group">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" cssClass="form-control" value="${cliente.razonSocial}" type="text" minlength="3" maxlength="25" required="required" />
                        </div>
                        
                        <div class="form-group">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc"  cssClass="form-control" value="${cliente.ruc}" type="number" min="10000000000" man="99999999999" required="required"/>
                        </div>
                        
                        <div>
                            <label for="idDistrito">Distrito:</label>
                            <form:select path="idDistrito.idDistrito" id="idDistrito">
                                <c:forEach items="${listaDistrito}" var="x">
                                    <c:if test="${x.idDistrito == cliente.idDistrito.idDistrito}">
                                        <option value="${x.idDistrito}" selected="selected" required="required">${x.detalle}</option>
                                    </c:if>
                                    <c:if test="${x.idDistrito != cliente.idDistrito.idDistrito}">
                                        <option value="${x.idDistrito}">${x.detalle}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select > 
                        </div>
                        
                        <br>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion"  cssClass="form-control" value="${cliente.direccion}" maxlength="30" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono</label>
                            <form:input path="telefono" cssClass="form-control" value="${cliente.telefono}" type="number" min="0000000" maxlength="999999999" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" cssClass="form-control" value="${cliente.correo}" maxlength="30" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="broker">Broker:</label>
                            <form:input path="broker" cssClass="form-control"   value="${cliente.broker}" maxlength="30" required="required"/>
                        </div>
                        <form:hidden path="usuario" value="${cliente.usuario}" />
                        <form:hidden path="clave" value="${cliente.clave}" />

                        <input type="submit" class="btn btn-primary"  value="Guardar">
                        <a class="btn btn-secondary" href="clientes.htm" role="button">Regresar</a>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

