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
                    <h3>Editar Proveedor</h3>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="proveedor">

                        <form:hidden path="idProveedor" value="${proveedor.idProveedor}" />
                        <div class="row">
                        <div class="col-sm-6" style="left:10%">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" style="width:80%;" cssClass="form-control" value="${proveedor.razonSocial}" type="text" minlength="3" maxlength="25" required="required"/>
                        </div>

                        <div class="col-sm-6" style="right:2%">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc" style="width:80%;" cssClass="form-control" value="${proveedor.ruc}" min="10000000000" maxlength="99999999999" required="required"/>
                        </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-4" style="left:10%">
                            <label for="idDistrito">Distrito:</label>
                            <form:select path="idDistrito.idDistrito" style="width:80%;" id="idDistrito">
                                <c:forEach items="${listaDistrito}" var="x">
                                    <c:if test="${x.idDistrito == proveedor.idDistrito.idDistrito}">
                                        <option value="${x.idDistrito}" selected="selected" required="required">${x.detalle}</option>
                                    </c:if>
                                    <c:if test="${x.idDistrito != proveedor.idDistrito.idDistrito}">
                                        <option value="${x.idDistrito}" required="required">${x.detalle}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select > 
                        </div>
                        <div class="col-sm-4" style="left:2%">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion" style="width:80%;" cssClass="form-control" value="${proveedor.direccion}" maxlength="30" required="required"/>
                        </div>
                        <div class="col-sm-4" style="right:5%">
                            <label for="contacto">Contacto:</label>
                            <form:input path="contacto" style="width:79%;" cssClass="form-control"  value="${proveedor.contacto}" maxlength="30" required="required"/>
                        </div>
                        </div>
                        <br>
                        <div class="row">
                        <div class="col-sm-6" style="left:10%">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" style="width:80%;" cssClass="form-control"  value="${proveedor.telefono}" type="number" min="0000000" maxlength="999999999" required="required"/>
                        </div>

                        <div class="col-sm-6" style="right:2%">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" style="width:80%;" cssClass="form-control"  value="${proveedor.correo}" maxlength="30" required="required" type="email"/>
                        </div>
                        </div>
                        
                        <center>
                            <div id="botones">
                                <fieldset id="fiel">
                                    <legend>¿Qué acción desea realizar?</legend>
                                    <input type="submit" class="btn btn-primary"  value="Guardar">
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

