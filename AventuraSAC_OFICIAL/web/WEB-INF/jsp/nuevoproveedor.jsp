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
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>
            
        </header>

        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Nuevo Proveedor</h3>
                </div>
                <div class="card-body">
                    
                    <form:form method="post" modelAttribute="proveedor">
                        
                        <div class="row" id="fila1">
                            <div class="col-sm-6" style="left:10%;">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" style="width:80%;" cssClass="form-control" type="text" minlength="3" maxlength="25" required="required"/>
                            </div>
                            <div class="col-sm-6" style="right: 2%;">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc" style="width:80%;" cssClass="form-control" required="required" type="number" min="10000000000" maxlength="99999999991"/>
                            </div>
                        </div>
                        <br>
                        <div class="row" id="fila2">
                            <div class="col-sm-4" style="left:10%;">                     
                            <label for="idDistrito">Distrito:</label>
                            <form:select path="idDistrito.idDistrito" style="width:80%;" id="idDistrito" >
                                <c:forEach items="${listarDistrito}" var="x" >
                                    <option value="${x.idDistrito}" required="required">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                            </div>
                            <div class="col-sm-4" style="left:2%;">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion" style="width:80%;" cssClass="form-control" required="required"/>
                            </div>
                            <div class="col-sm-4" style="right: 5%;">
                            <label for="contacto">Contacto:</label>
                            <form:input path="contacto" style="width:80%;" cssClass="form-control" required="required"/>
                            </div>
                        </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-6" style="left:11%;">
                                    <label for="telefono">Teléfono:</label>
                                    <form:input path="telefono" style="width:80%;" cssClass="form-control" required="required" type="number" min="0000000" maxlength="999999999"/>
                                </div>
                                <div class="col-sm-6" style="right:1%;">
                                    <label for="correo">Correo:</label>
                                    <form:input path="correo" style="width:76%;" cssClass="form-control"  required="required" type="email"/>
                                </div>
                            </div>
                        
                        <center>
                            <div id="botones">
                                <fieldset id="fiel">
                                    <legend>¿Qué acción desea realizar?</legend>
                                    <input type="submit" class="btn btn-primary"  value="Registrar">
                                    <a class="btn btn-secondary" href="proveedores.htm" role="button">Regresar</a>
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

