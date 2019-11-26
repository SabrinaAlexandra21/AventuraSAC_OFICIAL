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
                    <h2>Editar Empleado</h2>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="empleado">
                        
                        <form:hidden path="idEmpleado" value="${empleado.idEmpleado}"/>
                        
                        <div class="form-group">
                            <label for="dni">DNI:</label>
                            <form:input path="dni" cssClass="form-control" value="${empleado.dni}"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <form:input path="nombre" cssClass="form-control" value="${empleado.nombre}"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="apellidoPaterno">Apellido Paterno:</label>
                            <form:input path="apellidoPaterno" cssClass="form-control"  value="${empleado.apellidoPaterno}"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="apellidoMaterno">Apellido Materno:</label>
                            <form:input path="apellidoMaterno" cssClass="form-control" value="${empleado.apellidoMaterno}" />
                        </div>
                        
                        <div>
                            <label for="idArea">Cargo:</label><br>
                            <select path="idArea" id="idArea">
                                <c:forEach items="${lista}" var="x">
                                    <option value="${x.idArea}">${x.detalle}</option>
                                </c:forEach>
                            </select > 
                        </div>
                        
                        <br>
                        <div>
                            <label for="idCargo">Cargo:</label><br>
                            <select path="idCargo" id="idCargo">
                                <c:forEach items="${listaCargo}" var="x">
                                    <option value="${x.idCargo}">${x.detalle}</option>
                                </c:forEach>
                            </select > 
                        </div>
                        
                        <br>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control"  value="${empleado.telefono}"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="usuario">Usuario:</label>
                            <form:input path="usuario" cssClass="form-control"  value="${empleado.usuario}"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="clave">Clave:</label>
                            <form:password path="clave" cssClass="form-control" value="${empleado.clave}" />
                        </div>
                        
                        <input type="submit" class="btn btn-primary"  value="Registrar">
                        <a class="btn btn-secondary" href="empleados.htm" role="button">Regresar</a>
                        
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

