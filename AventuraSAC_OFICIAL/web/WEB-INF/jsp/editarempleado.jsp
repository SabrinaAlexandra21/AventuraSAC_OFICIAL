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
            <a class="logo" href="menu.html">Aventura S.A.C.</a>
            
        </header>
        
        <div class="container md-8">
            
            <div class="card" id="carta">
                
                <div class="card-header">
                    <h3>Editar Empleado</h3>
                </div>
                
                <div class="card-body">
                    <form:form method="post" modelAttribute="empleado">
                        <form:hidden path="idEmpleado" value="${empleado.idEmpleado}" required="required"/>
                        <div class="row">
                            <div class="col-sm-6" style="left:10%;">
                            <label for="dni">DNI:</label>
                            <form:input path="dni" style="height:55%; width:80%;" cssClass="form-control" value="${empleado.dni}" type="number" min="00000000" max="99999999" required="required"/>
                        </div>
                        <div class="col-sm-6" style="right:2%;">
                            <label for="nombre">Nombre:</label>
                            <form:input path="nombre" style="width:80%;" cssClass="form-control" value="${empleado.nombre}" type="text"  maxlength="25" required="required" />
                        </div>
                        <br>
                        </div>
                        <div class="row">
                        <div class="col-sm-4" style="left:10%;">
                            <label for="apellidoPaterno">Apellido Paterno:</label>
                            <form:input path="apellidoPaterno" style="width:80%;" cssClass="form-control"  value="${empleado.apellidoPaterno}"  maxlength="30" required="required"/>
                        </div>
                        <div class="col-sm-4" style="left:2%;">
                            <label for="apellidoMaterno">Apellido Materno:</label>
                            <form:input path="apellidoMaterno" style="width:80%;" cssClass="form-control" value="${empleado.apellidoMaterno}"  maxlength="30" required="required"/>
                        </div>
                        <div class="col-sm-4" style="right:5%;">
                            <label for="idArea">Área:</label>
                            <form:select path="idArea.idArea" style="width:79%;" id="idArea">
                                <c:forEach items="${lista}" var="x">
                                    <c:if test="${x.idArea == empleado.idArea.idArea}">
                                        <option value="${x.idArea}" selected="selected" required="required">${x.detalle}</option>
                                    </c:if>
                                    <c:if test="${x.idArea != empleado.idArea.idArea}">
                                        <option value="${x.idArea}">${x.detalle}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select > 
                        </div>
                        </div>
                        <br>
                        <div class="row">
                        <div class="col-sm-6" style="left:10%;">
                            <label for="idCargo">Cargo:</label>
                            <form:select path="idCargo.idCargo" style="width:80%;" id="idCargo">
                                <c:forEach items="${listaCargo}" var="x">
                                    <c:if test="${x.idCargo == empleado.idCargo.idCargo}">
                                        <option value="${x.idCargo}" selected="selected" required="required">${x.detalle}</option>
                                    </c:if>
                                    <c:if test="${x.idCargo != empleado.idCargo.idCargo}">
                                        <option value="${x.idCargo}">${x.detalle}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select > 
                        </div>
                        <div class="col-sm-6" style="right:2%;">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" style="width:80%;" cssClass="form-control"  value="${empleado.telefono}" type="number" min="0000000" maxlength="999999999" required="required"/>
                        </div>
                        </div>
                        
                        <form:hidden path="usuario" value="${empleado.usuario}" />
                        <form:hidden path="clave" value="${empleado.clave}" />
                        
                        <center>
                            <div id="botones">
                                <fieldset id="fiel">
                                    <legend>¿Qué acción desea realizar?</legend>
                                    <input type="submit" class="btn btn-primary"  value="Guardar">
                                    <a class="btn btn-secondary" href="empleados.htm" role="button">Regresar</a>
                                </fieldset>
                            </div>

                        </center>
                        
                    </form:form>
                </div>
            </div>
            <br>
        </div>
    </body>
</html>

