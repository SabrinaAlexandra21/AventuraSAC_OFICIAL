<!DOCTYPE HTML>
<html>
    <head>
        <title>Orden de Compra</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="stylesheet" href="/css/main.css" />
        <link rel="stylesheet" href="/css/EstilosOrdenCompra2.css">

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
                                        <H3><strong>Orden de Compra</strong></H3>
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
                                <legend><h5><STRONG>Ingresar datos</STRONG></h5></legend>
                                <div class="form-group row">
                                    <label for="departamento" id="input1">Departamento que solicita:</label>
                                    <div class="col-sm-10" id="inputdepar">
                                        <input type="text" placeholder="Ingrese el departamento">
                                    </div>
                                </div>

                                <br>

                                <div class="form-group row">
                                    <label for="fechapedido">Fecha del Pedido:</label>
                                    <div class="col" id="inputfechapedido">
                                        <input type="text" size="30" class="form-control" placeholder="Ingresar fecha">
                                    </div>
                                    <label for="fechaentrega">Fecha de Entrega:</label>
                                    <div class="col" id="inputfechaentrega">
                                        <input type="text" size="30" class="form-control" placeholder="Ingresar entrega">
                                    </div>
                                </div>
                            </fieldset>

                            <hr style="border: 1px solid gray"><!--Aqui esta la linea-->

                            <div class="form-group row">
                                <div class="col" id="col1">
                                    <fieldset id="fieldset2" style="border: 1px solid gray">
                                        <legend><h5><STRONG>Ingresar datos</STRONG></h5></legend>
                                        <div class="row" id="fila3">
                                            <div class="col-sm-2" >
                                                <label for="cantidad">Cantidad:</label>
                                                <input type="text" name="cantidad" placeholder=" Ingresar cantidad">
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="descripcion">Descripción:</label>
                                                <input type="text" name="descripcion" id="descripcion" placeholder="Ingresar descripcion">
                                            </div>
                                            <div class="col-sm-2" id="Agregar">		
                                                <button type="button">AGREGAR</button> 
                                            </div>
                                        </div>
                                    </fieldset>	
                                </div>


                                <div class="col" id="col2">
                                    <fieldset id="fieldset3" style="border: 1px solid gray">	
                                        <legend><h5><STRONG>Ingresar Datos</STRONG></h5></legend>
                                        <div class="row" id="fila4" align="center">
                                            <div class="col-sm-4" >
                                                <label for="elaborado">Elaborado por:</label>
                                                <input type="text" name="elaborado" placeholder="Elaborado por">
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="autorizado">Autorizado por:</label>
                                                <input type="text" name="autorizado" placeholder="Autorizado por">
                                            </div>
                                            <div class="col-sm-4">		
                                                <label for="recibido">Recibido por:</label>
                                                <input type="text" name="recibido"  placeholder="Recibido por">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
        </form>
    </body>
</html>

