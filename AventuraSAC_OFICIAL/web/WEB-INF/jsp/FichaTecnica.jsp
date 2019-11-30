<!------ Include the above in your HEAD tag ---------->
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


        <!-- Heading -->
        <form id="fondo">
            <div id="container">
                <section id="Contenedor1" class="wrapper" >
                    <div id="Contenedorlogo" class="inner" style="border:9px double">
                        <div id="Contenedorlogo2" class="content">
                            <div class="row">
                                <div class="col" id="imagen">
                                    <h1><img src="images/LogoAventura.png"></h1>
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
                                        <H3><strong>Ficha Técnica</strong></H3>
                                        <div class="row" id="ngui">
                                            N° &nbsp;&nbsp;&nbsp;<input type="text" name="nroguia">&nbsp;-&nbsp;0000041
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <!-- Main -->
                <section id="main" class="wrapper" >
                    <div id="main2" class="inner" style="border:9px double">
                        <div id="main3" class="content">
                            <fieldset id="fieldset1" style="border:2px solid gray">
                                <legend><h5><STRONG>Ingresar datos de la Prenda</STRONG></h5></legend>
                                <div class="row" id="fila1">
                                    <div class="col-sm-6">
                                        <label for="descripcion">Descripción:</label>
                                        <input type="text" name="descripcion" placeholder="Ingresar descripción">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="modelo">Modelo:</label>
                                        <input type="text" name="modelo" placeholder="Ingresar modelo">
                                    </div>
                                </div>
                                <div class="row" id="fila2">
                                    <div class="col-sm-4">		
                                        <label for="tela">Tela:</label>
                                        <input type="text" name="tela" placeholder="Ingresar tela">
                                    </div>
                                    <div class="col-sm-4">		
                                        <label for="hilo">Hilo:</label>
                                        <input type="text" name="tela" placeholder="Ingresar hilo">
                                    </div>
                                    <div class="col-sm-4">		
                                        <label for="lavado">Lavado:</label>
                                        <input type="text" name="lavado" placeholder="Ingresar lavado">
                                    </div>
                                </div>
                            </fieldset>


                            <hr style="border: 1px solid gray"><!--LINEA-->
                            <!--MUESTRA ADJUNTAR IMAGEN PNG-->
                            <div class="form-group row">
                                <label for="Muestra" class="col-sm-2 col-form-label">Muestra:</label>
                                <div class="col-sm-3">
                                    <input type="submit" value="ADJUNTAR IMAGEN PNG">
                                </div>	
                            </div>

                            <hr style="border: 1px solid gray"><!--LINEA-->


                            <fieldset id="fieldset2" style="border: 2px solid gray">

                                <legend><h5><strong>Seleccionar</strong></h5></legend>

                                <div class="row" id="fila3">
                                    <div class="row" class="col-sm-3">
                                        <label for="igv" >Talla:</label>
                                        <select name="talla">
                                            <option>Seleccione talla</option>
                                            <option>S</option>
                                            <option>M</option>
                                            <option>L</option>
                                            <option>XL</option>
                                        </select>
                                    </div>	
                                </div>
                                <div class="row" id="fila4">
                                    <div class="row" class="col-sm-3">
                                        <label for="subtotal" >Tipo de Prenda:</label>
                                        <select name="">
                                            <option>Seleccione tipo</option>
                                            <option>Polo</option>
                                            <option>Pantalón</option>
                                            <option>Camisa</option>
                                            <option>Chaquetas</option>
                                            <option>Shorts</option>
                                        </select>
                                    </div>	
                                </div>
                            </fieldset>
                            <hr style="border: 1px solid gray"><!--LINEA-->

                            <!--COMBINACION COLORES-->
                            <h3>Combinacion de Colores:</h3>
                            <div class="row">
                                <fieldset id="fieldset3" style="border: 2px solid gray">
                                    <legend><h5><STRONG>Ingrese los colores que usará</STRONG></h5></legend>

                                    <div class="row" id="fila5">
                                        <div  class="row" class="col-sm-3">
                                            <label for="color1" >Color 1:</label>
                                            <input type="text" name="color1" id="color1" placeholder="Ingresar color 1">

                                        </div>
                                        <div class="row" class="col-sm-3">
                                            <label for="color2" >Color 2:</label>
                                            <input type="text" name="color2" id="color2" placeholder="Ingresar color 2">
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button">Enviar</button>
                                        </div>
                                </fieldset>

                            </div>
                            <!--RESULTADOS DE COMBINACIONES-->
                            <br>
                            <br>
                            <div class="table-wrapper" >
                                <table class="alt">
                                    <tbody>
                                        <tr>
                                            <td>Combinación 1</td>
                                            <td><input type="text" name="cob1"></td>
                                        </tr>
                                        <tr>
                                            <td>Combinación 2</td>
                                            <td><input type="text" name="cob2"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row" id="ultimafila">
                                <div class="col" id="filaEtiqueta">
                                    <label for="etiqueta">Etiqueta:</label>
                                    <input type="text" name="etiqueta" placeholder="Ingresar etiqueta">
                                </div>
                                <div class="col" id="filaEmpaque">
                                    <label for="empaque">Empaque:</label>
                                    <input type="text" name="empaque" placeholder="Ingresar empaque">
                                </div>
                            </div>

                            <br>
                            <table id="tabla">
                                <tr id="col1">
                                    <th>ID Tipo</th>
                                    <th>Nombre</th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>

                            <fieldset id="fieldset4" style="border: 1px solid gray">
                                <legend>¿Qué acción desea realizar?</legend>
                                <div class="row" id="fila8">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">Enviar</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">Cancelar</button>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </body>
</html>

