<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <center>
        <div class="container md-8">
            <div class="card" id="carta">
                <div class="card-header">
                    <h2>Nueva Cotización</h2>
                </div>
                <div class="card-body">
                    <form>
                        <section id="Contenedor1" class="wrapper" >
                            <div id="Contenedorlogo" class="inner" style="border:9px double">
                                <div id="Contenedorlogo2" class="content">
                                    <div class="row">
                                        <div class="col" id="imagen">
                                            <img src="images/LogoAventura.png">
                                        </div> 
                                        <div class="col" id="escritos">
                                            <center>
                                                <p>Cal. Mercaderes Nro. 164 Dpto. 203</p>
                                                <p>Urb. Las Gardenias (Alt. Cuadra 50 de la Avenida Benavides)</p>
                                            </center>
                                        </div>
                                        <div class="col">
                                            <fieldset style="border:1px solid black" id="fieldset">
                                                <h3> R.U.C. N° 20111807958 </h3>
                                                <h3><strong>Cotizacíón</strong></h3>
                                                <div class="row" id="ngui">
                                                    N° &nbsp;&nbsp;&nbsp;<input type="text" name="nroguia">&nbsp;-&nbsp;0000041
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <section id="main" class="wrapper" >
                            <div id="main2" class="inner" style="border:9px double">
                                <fieldset id="fieldset1" style="border: 1px solid gray">
                                    <legend><strong><h5>Ingresar datos</h5></strong></legend>
                                    <div class="row" id="fila1">
                                        <div class="col-sm-3">
                                            <label for="Codigo">Código:</label>
                                            <input type="text" name="codigo" placeholder="Ingresar código">
                                        </div>
                                        <div class="col-sm-3">
                                            <label for="razon">Razón Social:</label>
                                            <input type="text" name="razon"  placeholder="Ingresar razón social">
                                        </div>
                                        <div class="col-sm-3">      
                                            <label for="RUC">RUC:</label>
                                            <input type="text" name="RUC" placeholder="Ingresar RUC">
                                        </div>
                                        <div class="col-sm-3">      
                                            <label for="fecEmision">Fecha de Emision:</label>
                                            <input type="text" name="fecEmision" placeholder="Ingresar fecha">
                                        </div>
                                    </div>

                                    <div class="row" id="fila2">
                                        <div class="col-sm-4">
                                            <label for="direccion">Dirección:</label>
                                            <input type="text" name="direccion" size="38" placeholder="Ingresar dirección">
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="telefono">Teléfono:</label>
                                            <input type="text" name="telefono" size="38" placeholder="Ingresar teléfono">
                                        </div>
                                        <div class="col-sm-4">      
                                            <label for="correo">Correo:</label>
                                            <input type="email" name="correo" size="38" placeholder="name@example.com">
                                        </div>
                                    </div>
                                </fieldset>
                                <br>

                                <div class="row">
                                    <div class="col-2"></div>
                                    <div class="col-3"></div>
                                    <div class="col-2" id="titulodescripcion">
                                        <h3><STRONG>Descripción</STRONG></h3>
                                    </div>
                                </div>



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

                                <div class="row">

                                    <div class="col-sm-3" id="col2">
                                        <fieldset id="fieldset3" style="border: 1px solid gray">

                                            <legend><strong><p>Ingresar Datos</p></strong></legend>

                                            <div class="row" id="fila6">
                                                <div class="row" class="col-sm-3">
                                                    <label for="importe" >Importe:</label>
                                                    <input type="text" name="importe" id="Subotal" placeholder="Importe">
                                                </div>
                                            </div>
                                            <div class="row" id="fila7">
                                                <div class="row" class="col-sm-3">
                                                    <label for="igv" >IGV:</label>
                                                    <input type="text" name="igv" id="igv" placeholder="IGV">
                                                </div>	
                                            </div>
                                            <div class="row" id="fila8">
                                                <div class="row" class="col-sm-3">
                                                    <label for="total" >Total:</label>
                                                    <input type="text" name="total" id="total" placeholder="Total">
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
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </center>
</body>
</html>

