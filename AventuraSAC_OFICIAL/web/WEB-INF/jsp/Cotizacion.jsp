<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Cotización</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="<c:url value="webapp/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/EstilosCotizacion.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet" />

    </head>
    <body id="bodys">

        <header id="header">
            <a class="logo" href="index.html">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>

        <div class="container md-8">
            <div class="card">
                <form:form method="post" modelAttribute="cotizacion">
                    <div class="card-header">

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
                                    <h3><strong>Cotización</strong></h3>
                                    <div class="row" id="ngui">
                                        N° &nbsp;&nbsp;&nbsp;<form:input path="idCotizacion"/>&nbsp;-&nbsp;0000041
                                    </div>

                                </fieldset>
                            </div>
                        </div>

                    </div>

                    <br />
                    <br />

                    <div class="card-body">
                        <center>
                            <div class="card-title"><h2> Ingresar datos de la Cotización</h2></div>
                        </center>

                        <fieldset id="fieldset1" style="border: 1px solid gray">
                            <div class="row" id="fila1">
                                <div class="col-sm-4">
                                    <label for="">Razón Social:</label>
                                    <form:input path="" placeholder="Ingresar razón social"/>
                                </div>
                                <div class="col-sm-4">      
                                    <label for="">RUC:</label>
                                    <form:input path=""  placeholder="Ingresar RUC"/>
                                </div>
                                <div class="col-sm-4">      
                                    <label for="fechaEmision">Fecha de Emision:</label>
                                    <form:input path="fechaEmision" placeholder="Ingresar fecha"/>
                                </div>
                            </div>

                            <div class="row" id="fila2">
                                <div class="col-sm-4">
                                    <label for="direccion">Dirección:</label>
                                    <form:input path=""  placeholder="Ingresar dirección"/>
                                </div>
                                <div class="col-sm-4">
                                    <label for="">Teléfono:</label>
                                    <form:input path=""  placeholder="Ingresar teléfono"/>
                                </div>
                                <div class="col-sm-4">      
                                    <label for="">Correo:</label>
                                    <form:input path=""  placeholder="name@example.com"/>
                                </div>
                            </div>

                        </fieldset>
                        <br>

                        <center><h3><strong>Descripción</strong></h3></center>

                        <center>
                            <table id="tabla">
                                <tr>
                                    <th>ID</th>
                                    <th>Descripción</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>

                            </table>
                        </center>

                        <div class="row">

                            <div class="col-sm-3" id="col2">
                                <fieldset id="fieldset3" style="border: 1px solid gray">

                                    <div class="row" id="fila6">
                                        <div class="row" class="col-sm-3">
                                            <label for="importe" >Importe:</label>
                                            <form:input path="importe" placeholder="Importe"/>
                                        </div>
                                    </div>
                                    <div class="row" id="fila7">
                                        <div class="row" class="col-sm-3">
                                            <label for="igv" >IGV:</label>
                                            <form:input path="igv" placeholder="IGV"/>
                                        </div>	
                                    </div>
                                    <div class="row" id="fila8">
                                        <div class="row" class="col-sm-3">
                                            <label for="total" >Total:</label>
                                            <form:input path="total" placeholder="Total"/>
                                        </div>	
                                    </div>
                                </fieldset>

                            </div>
                        </div>

                        <fieldset id="fieldset4" style="border: 1px solid gray">
                            <legend><p>¿Qué acción desea realizar?</p></legend>
                            <div class="row" id="fila8">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">Enviar</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">Cancelar</button>
                            </div>

                        </fieldset>
                        <br>
                        <div class="col" id="ultimoparrafo">
                            <p id="ultimoparrafo"><STRONG>Se tiene que pagar el 50% como adelanto inicial</STRONG></p><!--Letra negrita-->
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>