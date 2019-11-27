<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous" />
    </head>
    <body>
        <div class="container md-8">
            <div class="card">
                <div class="card-header">
                    <h2>Nuevo Proveedor</h2>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="proveedor">
                        <div class="form-group">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" cssClass="form-control" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc" cssClass="form-control" required="required"/>
                        </div>
                        <div>
                            <label for="idDistrito">Distrito:</label><br>
                            <form:select path="idDistrito.idDistrito" id="idDistrito" >
                                <c:forEach items="${listarDistrito}" var="x">
                                    <option value="${x.idDistrito}">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion" cssClass="form-control" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="contacto">Contacto:</label>
                            <form:input path="contacto" cssClass="form-control" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control" required="required"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" cssClass="form-control"  required="required"/>
                        </div>
                        
                        <input type="submit" class="btn btn-primary"  value="Registrar">
                        <a class="btn btn-secondary" href="proveedores.htm" role="button">Regresar</a>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

