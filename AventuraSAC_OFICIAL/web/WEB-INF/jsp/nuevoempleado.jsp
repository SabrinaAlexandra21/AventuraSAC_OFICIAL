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
        <link href="../../webapp/resources/theme1/css/estilosnuevoempleado.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="bodys">
        
        <header id="header">
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>
            
        </header>

        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Nuevo Empleado</h3>
                </div>
                <div class="card-body">
                    
                    <form:form method="post" modelAttribute="empleado">
                        
                        <div class="row">
                            <div class="col-sm-4">
                            <label for="dni">DNI:</label>
                            <form:input path="dni" style="height:56%;" cssClass="form-control" placeholder="Ingresar DNI" type="number" min="00000000" maxlength="99999999"/>
                        </div>
                        <div class="col-sm-4">
                            <label for="nombre">Nombre:</label>
                            <form:input path="nombre" cssClass="form-control" placeholder="Ingresar nombre" maxlength="30" required="required"/>
                        </div>
                        <div class="col-sm-4">
                            <label for="apellidoPaterno">Apellido Paterno:</label>
                            <form:input path="apellidoPaterno" cssClass="form-control"  placeholder="Ingresar apellido paterno" maxlength="30" required="required"/>
                        </div>
                        </div>
                        
                        <br>
                        
                        <div class="row">
                        <div class="col-sm-4">
                            <label for="apellidoMaterno">Apellido Materno:</label>
                            <form:input path="apellidoMaterno" cssClass="form-control"  placeholder="Ingresar apellido materno" maxlength="30" required="required"/>
                        </div>
                        <div class="col-sm-4">
                            <label for="idArea">Área</label><br>
                            <form:select path="idArea.idArea" id="idArea" >
                                <c:forEach items="${lista}" var="x">
                                    <option value="${x.idArea}" required="required">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="col-sm-4">
                            <label for="idCargo">Cargo:</label><br>
                            <form:select path="idCargo.idCargo" id="idCargo" >
                                <c:forEach items="${listaCargo}" var="x">
                                    <option value="${x.idCargo}" required="required">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        </div>
                        
                        <br>
                        
                        <div class="row">
                        <div class="col-sm-4">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control" placeholder="Ingresar número de teléfono" type="number" min="0000000" maxlength="999999999"/>
                        </div>
                        <div class="col-sm-4">
                            <label for="usuario">Usuario:</label>
                            <form:input path="usuario" cssClass="form-control" placeholder="Ingresar nombre de usuario"  maxlength="20" required="required"/>
                        </div>
                        <div class="col-sm-4">
                            <label for="clave">Clave:</label>
                            <form:password path="clave" cssClass="form-control" placeholder="*********" maxlength="10" required="required"/>
                        </div>
                        
                            <br>
                            <br>
                            <div id="botones">
                                <fieldset id="fiel" style="width:150%;" id="botones">
                                    <legend>¿Qué acción desea realizar?</legend>
                                    <input type="submit" class="btn btn-primary"  value="Registrar">
                                    <a class="btn btn-secondary" href="empleados.htm" role="button">Regresar</a>
                                </fieldset>
                        </center>
                    </form:form>
                </div>
            </div>
            <br>
        </div>
    </body>
</html>

