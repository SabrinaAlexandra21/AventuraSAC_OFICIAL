

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>Registrar Pedido</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="<c:url value="webapp/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/EstilosFicha.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet" />

    </head>
    <body>
        <header id="header">
            <a class="logo" href="index.html">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>

        <div class="container md-8">

            <div class="card">

                <div class="d-flex flex-row">

                    <div  class="p-4" id="img">

                        <img src="webapp/resources/theme1/images/logo.PNG" alt="Card image cap">

                    </div>

                    <div class="p-4"  id="escritos">

                        <p>Cal. Mercaderes Nro. 164 Dpto. 203 </p>
                        <p>Urb. Las Gardenias (Alt. Cuadra 50 de la Avenida Benavides)</p>

                    </div>

                    <div class="p-4" id="fieldset">

                        <fieldset style="border:1px solid black" >

                            <h3> R.U.C. N° 20111807958 </h3>
                            <h3><strong>Ficha Técnica</strong></h3>
                            <div class="row" id="ngui">
                                N° &nbsp;&nbsp;&nbsp;<input type="text" name="nroguia">&nbsp;-&nbsp;0000041
                            </div>

                        </fieldset>
                    </div>


                </div>

                <br />
                <br />

                <form:form method="post" modelAttribute="fichatecnica">

                    <div class="card">

                        <div class="card-body">

                            <div class="card-title"> Ingresar datos de la Prenda</div>

                            <div class="d-flex flex-row" id="fila1">

                                <div class="p-4">
                                    <label for="descripcion">Descripción:</label>
                                    <form:input path="descripcion"  cssClass="form-control" placeholder="Ingresar descripcion" />

                                </div>
                                <div class="p-4">
                                    <label for="modelo">Modelo:</label>
                                    <form:input path="modelo" cssClass="form-control" placeholder="Ingresar modelo" />
                                </div>

                            </div>

                            <div class="d-flex flex-row" id="fila2">

                                <div class="p-4">		
                                    <label for="idTipo">Tela:</label>
                                    <form:select path="idTipo.idTipo" id="idTipo">
                                        <c:forEach items="${tipotelas}" var="x">
                                            <option value="${x.idTipo}">${x.nombre}</option>
                                        </c:forEach>
                                    </form:select>

                                </div>

                                <div class="p-4">		
                                    <label for="etiqueta">Etiqueta:</label>
                                    <form:input path="etiqueta" cssClass="form-control" placeholder="Ingresar nombres de etiqueta"/>
                                </div>

                                <div class="p-4">		
                                    <label for="empaque">Empaque:</label>
                                    <form:input path="empaque" cssClass="form-control" placeholder="Ingresar empaque" />
                                </div>

                            </div>
                        </div>

                        <hr style="border: 1px solid gray">

                        <div class="d-flex flex-row">
                            <label for="Muestra" class="col-sm-2 col-form-label">Muestra:</label>
                            <div class="col-sm-3">
                                <input type="submit" value="ADJUNTAR IMAGEN PNG">
                            </div>	
                        </div>

                        <div class="d-flex flex-row" id="fila3">
                            <div class="p-5">
                                <label for="idTalla" >Talla:</label>
                                <form:select path="idTalla.idTalla" id="idTalla">
                                    <c:forEach items="${listatallas}" var="x">
                                        <option value="${x.idTalla}">${x.nombre}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>
                        <div class="d-flex flex-row">
                            <div class="p-5">
                                <label for="idTipoPrenda" >Tipo de Prenda:</label>
                                <form:select path="idTipoPrenda.idTipoPrenda" id="idTipoPrenda">
                                    <c:forEach items="${listaprendas}" var="x">
                                        <option value="${x.idTipoPrenda}">${x.nombre}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>

                        <hr style="border: 1px solid gray">

                        <div class="d-flex flex-row">
                            <div  class="p-6">
                                <div class="card" style="width: 22rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Combinación de colores:</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Seleccionar..</h6>

                                        <div class="d-flex flex-row">

                                            <div  class="p-6">

                                                <label for="colores" >Color 1:</label>
                                                <input type="color" name="colores" >

                                            </div>

                                            <div  class="p-6">

                                                <label for="colores" >Color 2:</label>
                                                <input type="color" name="colores" >

                                            </div>

                                            <div class="p-4">
                                                <button type="button">Enviar</button>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <input type="submit" class="btn btn-primary"  value="Registrar">
                    <a class="btn btn-secondary" href="clientes.htm" role="button">Regresar</a>
                </form:form>


            </div>
        </div>

