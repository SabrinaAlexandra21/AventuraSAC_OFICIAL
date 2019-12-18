
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
        
    </head>
    
    <body id="bodys">

        <header id="header">
            <a class="logo" href="menu.htm">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>
        
        <nav id="menu">
            <ul class="links">
                <li><a href="menu.htm">Home</a></li>
                <li><a href="quienessomos.htm">Quienes Somos</a></li>
                <li><a href="#">Mantenimientos</a>
                    <ul>
                        <li>
                            <a href="empleados.htm">Empleados</a>
                        </li>
                        <li>
                            <a href="clientes.htm">Cliente</a>
                        </li>
                        <li>
                            <a href="proveedores.htm">Proveedor</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Nuevo Cliente</h3>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="cliente">
                        <div class="form-group">
                            <label for="razonSocial">Razón Social:</label>
                            <form:input path="razonSocial" cssClass="form-control" type="text" minlength="3" maxlength="25" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="ruc">RUC:</label>
                            <form:input path="ruc" type="number" cssClass="form-control" min="10000000000" maxlength="99999999999" required="required"/>
                        </div>
                        <div>
                            <label for="idDistrito">Distrito:</label>
                            <form:select path="idDistrito.idDistrito" id="idDistrito" >
                                <c:forEach items="${listaDistrito}" var="x">
                                    <option value="${x.idDistrito}" required="required">${x.detalle}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <form:input path="direccion" cssClass="form-control"  maxlength="30" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <form:input path="telefono" cssClass="form-control"  type="number" min="0000000" maxlength="999999999" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="broker">Broker:</label>
                            <form:input path="broker" cssClass="form-control" maxlength="30" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <form:input path="correo" cssClass="form-control" maxlength="30" required="required" type="email"/>
                        </div>
                        <div class="form-group">
                            <label for="usuario">Usuario:</label>
                            <form:input path="usuario"  cssClass="form-control" maxlength="20" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="clave">Clave:</label>
                            <form:password path="clave" cssClass="form-control" maxlength="15" required="required" placeholder="*********" />
                        </div>
                        <input type="submit" class="btn btn-primary"  value="Registrar">
                        <a class="btn btn-secondary" href="clientes.htm" role="button">Regresar</a>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
