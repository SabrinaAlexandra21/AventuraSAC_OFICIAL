<%-- 
    Document   : editarcliente
    Created on : 25/11/2019, 12:28:08 PM
    Author     : CHELLI BONITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container md-8">
            <div class="card">
                <div class="card-header">
                    <h3>Editar Cliente</h3>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="cliente">
                        <form:hidden path="idCliente" value="${cliente.idCliente}"/>
                        
                        <div class="form-group">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" cssClass="form-control" value="${cliente.razonSocial}" />
                        </div>
                        <div class="form-group">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc"  cssClass="form-control" value="${cliente.ruc}" />
                        </div>
                        <div class="form-group">
                            <label for="idDistrito">Distrito:</label>
                            <form:input path="idDistrito" cssClass="form-control" value="${cliente.idDistrito}" />
                        </div>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion"  cssClass="form-control" value="${cliente.direccion}" />
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono</label>
                            <form:input path="telefono" cssClass="form-control" value="${cliente.telefono}" />
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" cssClass="form-control" value="${cliente.correo}"/>
                        </div>
                        <div class="form-group">
                            <label for="broker">Broker:</label>
                            <form:input path="broker" cssClass="form-control"   value="${cliente.broker}"/>
                        </div>
                        <div class="form-group">
                            <label for="usuario">Usuario:</label>
                            <form:input path="usuario" cssClass="form-control" value="${cliente.usuario}"/>
                        </div>
                        <div class="form-group">
                            <label for="clave">Clave:</label>
                            <form:password path="clave" cssClass="form-control" value="${cliente.clave}" />
                        </div>
                        <input type="submit" class="btn btn-primary"  value="Registrar">
                        <a class="btn btn-secondary" href="clientes.htm" role="button">Guardar</a>
                        </form:form>
                    </div>
                </div>
            </div>
        </body>
    </html>

