<!DOCTYPE HTML>
<html>
    <head>
        <title>Cotización</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="../css/main.css" rel="stylesheet"/>
        <link href="../css/EstilosCotizacion.css" rel="stylesheet"/>

    </head>
    <body>
        <header id="header">
            <a class="logo" href="index.html">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>
        <form>
            <div id="container">
                <section id="Contenedor1" class="wrapper" >
                    <div id="Contenedorlogo" class="inner" style="border:9px double">
                        <div id="Contenedorlogo2" class="content">
                            <div class="row">
                                <div class="col-sm-3" id="imagen">
                                    <h1><img src="images/aventura.png"></h1>
                                </div> 
                                <div class="col-sm-3" id="escritos">
                                    <center>
                                        <p>Cal. Mercaderes Nro. 164 Dpto. 203</p>
                                        <p>Urb. Las Gardenias (Alt. Cuadra 50 de la Avenida Benavides)</p>
                                    </center>
                                </div>
                                <div class="col-sm-3">
                                    <fieldset style="border:1px solid black" id="fieldset">
                                        <h3> R.U.C. N° 20111807958 </h3>
                                        <H3><strong>Cotizacíón</strong></H3>
                                        <div class="row" id="ngui">
                                            N° &nbsp;&nbsp;&nbsp;<input type="text" name="nroguia">&nbsp;-&nbsp;0000041
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="form-group row" id=fecha>
                                    <label class="col-sm-2 col-form-label">Fecha:</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control"  placeholder="Ingresar fecha">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="main" class="wrapper" >
                    <div id="main2" class="inner" style="border:9px double">
                        <div id="main3" class="content">
                            <fieldset id="fieldset1" style="border: 1px solid gray">
                                <legend>Ingresar datos</legend>
                                <div class="row" id="fila1">
                                    <div class="col-sm-4">
                                        <label for="Codigo">Código:</label>
                                        <input type="text" name="codigo" placeholder="Ingresar código">
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="razon">Razón Social:</label>
                                        <input type="text" name="razon"  placeholder="Ingresar razón social">
                                    </div>
                                    <div class="col-sm-4">		
                                        <label for="RUC">RUC:</label>
                                        <input type="text" name="RUC" placeholder="Ingresar RUC">
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

                            <hr style="border: 1px solid gray"><!--Aqui esta la linea-->

                            <div class="row" id="titulodescripcion">
                                <div class="col-2"></div>
                                <div class="col-3"></div>
                                <div class="col-4"><h3><STRONG>Descripción</STRONG></h3></div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3" id="col1">
                                    <fieldset id="fieldset2" style="border: 1px solid gray">
                                        <legend><strong>Ingresar Datos</strong></legend>
                                        <div class="row" id="fila3">
                                            <div class="col-sm-3">
                                                <label for="IdPedido" >Id Ficha:</label>
                                                <input type="text" name="IdPedido" id="idpedido" placeholder="Ingresar ID">	
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="modelo" >Modelo:</label>
                                                <input type="text" name="modelo" id="descripcion" placeholder="Ingresar modelo">
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="Cantidad">Cantidad:</label>
                                                <input type="text" name="Cantidad" id="cantidad" placeholder="Ingresar cantidad">
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="modelo" >Precio:</label>
                                                <input type="text" name="modelo" id="modelo" placeholder="Ingresar precio">  
                                            </div>
                                        </div>

                                        <div class="row" id="fila4">
                                            <div class="col-sm-3">
                                                <label for="descripcion" >Descripcion:</label>
                                                <p><textarea name="descripcion" placeholder="Ingresar descripción..."></textarea></p>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="col-sm-3" id="col2">
                                    <fieldset id="fieldset3" style="border: 1px solid gray">

                                        <legend><strong>Ingresar Datos</strong></legend>

                                        <div class="row" id="fila5">
                                            <div class="row" class="col-sm-3">
                                                <label for="igv" >IGV:</label>
                                                <input type="text" name="igv" id="igv" placeholder="IGV">
                                            </div>	
                                        </div>
                                        <div class="row" id="fila6">
                                            <div class="row" class="col-sm-3">
                                                <label for="subtotal" >Subtotal:</label>
                                                <input type="text" name="subtotal" id="Subotal" placeholder="Subtotal">
                                            </div>	
                                        </div>
                                        <div class="row" id="fila7">
                                            <div class="row" class="col-sm-3">
                                                <label for="total" >Total:</label>
                                                <input type="text" name="total" id="total" placeholder="Total">
                                            </div>	
                                        </div>
                                    </fieldset>

                                </div>

                                <fieldset id="fieldset4" style="border: 1px solid gray">
                                    <legend>¿Qué acción desea realizar?</legend>
                                    <div class="row" id="fila8">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">Enviar</button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">Cancelar</button>
                                    </div>
                                </fieldset>
                            </div>
                            <p><STRONG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Se tiene que pagar el 50% como adelanto inicial</STRONG></p><!--Letra negrita-->
                        </div>
                    </div>
                </section>
            </div>

        </form>
    </body>
</html>

