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
                    <h2>Editar Proveedor</h2>
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
                            <label for="idDistrito">Distrito:</label><br>
                            <form:select path="idDistrito" id="idDistrito">
                                <c:forEach items="${listaDistrito}" var="x">
                                    <option value="${x.idDistrito}">${x.detalle}</option>
                                </c:forEach>
                            </form:select > 
                        </div>
                        
                        <div class="form-group">
                            <label for="apellidoMaterno">Apellido Materno:</label>
                            <form:input path="apellidoMaterno" cssClass="form-control" value="${empleado.apellidoMaterno}" />
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
                        <a class="btn btn-secondary" href="proveedores.htm" role="button">Regresar</a>
                        
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

