<!DOCTYPE HTML>
<html>
    <head>
        <title>Guía de Remisión</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="../css/main.css" rel="stylesheet"/>
        <link href="../css/estilosguia.css" rel="stylesheet"/>
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
                                        <H3><strong>Guía de Remisión</strong></H3>
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
                                <legend><strong>Ingresar datos</strong></legend>
                                <div class="row" id="fila1">
                                    <div class="col-sm-4">
                                        <label for="Fecha">Fecha de inicio del traslado:</label>
                                        <input type="text" name="Fecha" placeholder="Ingresar Fecha">
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="Partida">Punto Partida:</label>
                                        <input type="text" name="Partida" placeholder="Ingresar punto partida">
                                    </div>
                                    <div class="col-sm-4">		
                                        <label for="Destinatario">Destinatario:</label>
                                        <input type="text" name="Destinatario" placeholder="Ingresar destinatario">
                                    </div>
                                </div>

                                <div class="row" id="fila2">
                                    <div class="col-sm-4">
                                        <label for="Llegada">Punto Llegada:</label>
                                        <input type="text" name="Llegada" placeholder="Ingresar punto llegada">
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="RUC">RUC:</label>
                                        <input type="text"  name="RUC" placeholder="Ingresar RUC">
                                    </div>
                                </div>
                            </fieldset>

                            <hr style="border: 1px solid gray">

                            <fieldset id="fieldset2" style="border: 1px solid gray">
                                <legend><strong>Ingresar datos</strong></legend>
                                <div class="row" id="fila3">
                                    <div class="col-sm-4">
                                        <label for="Modelo" >RUC:</label>
                                        <input type="text" name="Modelo" placeholder="Ingresar modelo">
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="Chofer">Chofer:</label>
                                        <input type="text" name="Chofer" placeholder="Ingresar chofer">
                                    </div>
                                    <div class="col-sm-4">		
                                        <label for="Marca">Marca:</label>
                                        <input type="text" name="Marca" placeholder="Ingresar marca">
                                    </div>
                                </div>

                                <div class="row" id="fila4">
                                    <div class="col-sm-4">
                                        <label for="Placa">Placa:</label>
                                        <input type="text" name="Placa" placeholder="Ingresar placa">
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="licencia" >Licencia de conducir:</label>
                                        <input type="text" name="licencia" placeholder="Ingresar el N° licencia">
                                    </div>
                                </div>
                            </fieldset>

                            <hr style="border: 1px solid gray">

                            <fieldset id="fieldset3" style="border: 1px solid gray">
                                <legend><strong>Ingresar Datos</strong></legend>
                                <div class="row" id="fila5">
                                    <div class="col-sm-3">
                                        <label for="IdPedido" >Id Ficha:</label>
                                        <input type="text" name="IdPedido" id="idpedido" placeholder="Ingresar ID">	
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="descripcion" >Descripción:</label>
                                        <input type="text" name="descripcion" id="descripcion" placeholder="Ingresar descripción">
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="Cantidad">Cantidad:</label>
                                        <input type="text" name="Cantidad" id="cantidad" placeholder="Ingresar cantidad">
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="modelo" >Modelo:</label>
                                        <input type="text" name="modelo" id="modelo" placeholder="Ingresar modelo">
                                    </div>
                                </div>

                                <div class="row" id="fila6">
                                    <div class="col-sm-3">
                                        <label for="Placa">Placa:</label>
                                        <input type="text" name="Placa" placeholder="Ingresar placa">
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="licencia" >Licencia:</label>
                                        <input type="text" name="licencia" placeholder="Ingresar el N° licencia">
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="modelo" >Modelo:</label>
                                        <input type="text" name="modelo" id="modelo" placeholder="Ingresar modelo">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </body>
</html>