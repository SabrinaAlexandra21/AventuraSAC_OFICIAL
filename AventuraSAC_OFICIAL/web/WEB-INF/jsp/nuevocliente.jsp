
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
            <nav>
                <a href="login.htm">Salir</a>
            </nav>
        </header>

        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h3>Nuevo Cliente</h3>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="cliente">
                        <div class="row" id="fila1">
                            <div class="col-sm-4">
                                <label for="razonSocial" class="fal fa-clipboard-list">Razón Social:</label>
                                <form:input path="razonSocial" cssClass="form-control" type="text" minlength="3" maxlength="25" required="required"/>
                            </div>
                            <div class="col-sm-4" id="ruc">
                                <label for="ruc">RUC:</label>
                                <form:input path="ruc" type="number" cssClass="form-control" min="10000000000" maxlength="99999999999" required="required"/>
                            </div>
                            <div class="col-sm-4">
                                <label for="idDistrito">Distrito:</label>
                                <form:select path="idDistrito.idDistrito" id="idDistrito" >
                                    <c:forEach items="${listaDistrito}" var="x">
                                        <option value="${x.idDistrito}" required="required">${x.detalle}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>
                        <br>
                        <div class="row" id="fila2">
                            <div class="col-sm-4">
                                <label for="direccion">Dirección:</label>
                                <form:input path="direccion" cssClass="form-control"  maxlength="30" required="required"/>
                            </div>
                            <div class="col-sm-4" id="telefono">
                                <label for="telefono">Teléfono:</label>
                                <form:input path="telefono" cssClass="form-control"  type="number" min="0000000" maxlength="999999999" required="required"/>
                            </div>
                            <div class="col-sm-4">
                                <label for="broker">Broker:</label>
                                <form:input path="broker" cssClass="form-control" maxlength="30" required="required" />
                            </div>
                        </div>
                        <div class="row" id="fila3">
                            <div class="col-sm-4">
                                <label for="correo">Correo:</label>
                                <form:input path="correo" cssClass="form-control" maxlength="30" required="required" type="email"/>
                            </div>
                            <div class="col-sm-4">
                                <label for="usuario">Usuario:</label>
                                <form:input path="usuario"  cssClass="form-control" maxlength="20" required="required" />
                            </div>
                            <div class="col-sm-4">
                                <label for="clave">Clave:</label>
                                <form:password path="clave" cssClass="form-control" maxlength="15" required="required" placeholder="*********" />
                            </div>
                        </div>

                        <center>
                            <div id="botones">
                                <fieldset id="fiel">
                                    <legend>¿Qué acción desea realizar?</legend>
                                    <input type="submit" class="btn btn-primary" value="Registrar" onclick="nif(${ruc})">
                                    <a class="btn btn-secondary" href="clientes.htm" role="button">Regresar</a>
                                </fieldset>
                            </div>

                        </center>

                    </form:form>
                </div>
            </div>
            <br>
        </div>

        <script>
            function nif(dni) {
                var numero
                var letr
                var letra
                var expresion_regular_dni

                expresion_regular_dni = /^\d{8}[a-zA-Z]$/;

                if (expresion_regular_dni.test(dni) == true) {
                    numero = dni.substr(0, dni.length - 1);
                    letr = dni.substr(dni.length - 1, 1);
                    numero = numero % 23;
                    letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
                    letra = letra.substring(numero, numero + 1);
                    if (letra != letr.toUpperCase()) {
                        alert('Dni erroneo, la letra del NIF no se corresponde');
                    } else {
                        alert('Dni correcto');
                    }
                } else {
                    alert('Dni erroneo, formato no válido');
                }
            }
        </script>
    </body>
</html>
