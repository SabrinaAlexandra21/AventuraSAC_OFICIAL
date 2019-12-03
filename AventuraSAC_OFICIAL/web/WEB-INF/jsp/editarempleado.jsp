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
                    <h3>Editar Empleado</h3>
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
                            <label for="idArea">Área:</label>
                            <form:select path="idArea.idArea" id="idArea">
                                <c:forEach items="${lista}" var="x">
                                    <c:if test="${x.idArea == empleado.idArea.idArea}">
                                        <option value="${x.idArea}" selected="selected">${x.detalle}</option>
                                    </c:if>
                                    <c:if test="${x.idArea != empleado.idArea.idArea}">
                                        <option value="${x.idArea}">${x.detalle}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select > 
                        </div>
                        
                        <br>
                        <div>
                            <label for="idCargo">Cargo:</label>
                            <form:select path="idCargo.idCargo" id="idCargo">
                                <c:forEach items="${listaCargo}" var="x">
                                    <c:if test="${x.idCargo == empleado.idCargo.idCargo}">
                                        <option value="${x.idCargo}" selected="selected">${x.detalle}</option>
                                    </c:if>
                                    <c:if test="${x.idCargo != empleado.idCargo.idCargo}">
                                        <option value="${x.idCargo}">${x.detalle}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select > 
                        </div>
                        
                        
                        <br>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control"  value="${empleado.telefono}"/>
                        </div>
                        
                        <form:hidden path="usuario" value="${empleado.usuario}" />
                        <form:hidden path="clave" value="${empleado.clave}" />
                        
                        <input type="submit" class="btn btn-primary"  value="Guardar">
                        <a class="btn btn-secondary" href="empleados.htm" role="button">Regresar</a>
                        
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

