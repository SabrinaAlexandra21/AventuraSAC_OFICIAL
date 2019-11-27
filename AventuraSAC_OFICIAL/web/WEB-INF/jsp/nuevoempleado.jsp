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
                    <h2>Nuevo Empleado</h2>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="empleado">
                        <div class="form-group">
                            <label for="dni">DNI:</label>
                            <form:input path="dni" cssClass="form-control" placeholder="Ingresar DNI"/>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <form:input path="nombre" cssClass="form-control" placeholder="Ingresar nombre"/>
                        </div>
                        <div class="form-group">
                            <label for="apellidoPaterno">Apellido Paterno:</label>
                            <form:input path="apellidoPaterno" cssClass="form-control"  placeholder="Ingresar apellido paterno"/>
                        </div>
                        <div class="form-group">
                            <label for="apellidoMaterno">Apellido Materno:</label>
                            <form:input path="apellidoMaterno" cssClass="form-control"  placeholder="Ingresar apellido materno"/>
                        </div>
                        <div>
                            <label for="idArea">Área</label><br>
                            <form:select path="idArea.idArea" id="idArea">
                                <c:forEach items="${lista}" var="x">
                                    <option value="${x.idArea}">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <br>
                        <div>
                            <label for="idCargo">Cargo:</label><br>
                            <form:select path="idCargo.idCargo" id="idCargo">
                                <c:forEach items="${listaCargo}" var="x">
                                    <option value="${x.idCargo}">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control" placeholder="Ingresar número de teléfono"/>
                        </div>
                        <div class="form-group">
                            <label for="usuario">Usuario:</label>
                            <form:input path="usuario" cssClass="form-control" placeholder="Ingresar nombre de usuario"/>
                        </div>
                        <div class="form-group">
                            <label for="clave">Clave:</label>
                            <form:password path="clave" cssClass="form-control" placeholder="*********" />
                        </div>
                        <input type="submit" class="btn btn-primary"  value="Registrar">
                        <a class="btn btn-secondary" href="empleados.htm" role="button">Regresar</a>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

