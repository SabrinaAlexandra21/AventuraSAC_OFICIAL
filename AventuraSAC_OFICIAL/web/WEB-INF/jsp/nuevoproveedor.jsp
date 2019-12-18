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
                        
                        <div class="form-group">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" cssClass="form-control" type="text" minlength="3" maxlength="25" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc" cssClass="form-control" required="required" type="number" min="10000000000" maxlength="99999999991"/>
                        </div>
                        <div>
                            <label for="idDistrito">Distrito:</label>
                            <form:select path="idDistrito.idDistrito" id="idDistrito" >
                                <c:forEach items="${listarDistrito}" var="x" >
                                    <option value="${x.idDistrito}" required="required">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion" cssClass="form-control" maxlength="30" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="contacto">Contacto:</label>
                            <form:input path="contacto" cssClass="form-control" maxlength="30" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control" required="required" type="number" min="0000000" maxlength="999999999"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" cssClass="form-control"  maxlength="30" required="required" type="email"/>
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

