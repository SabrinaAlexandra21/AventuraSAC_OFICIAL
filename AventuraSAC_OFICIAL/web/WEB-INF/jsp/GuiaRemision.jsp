<!DOCTYPE HTML>
<html>
    <head>
        <title>Guía de Remisión</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="assets/css/main.css" rel="stylesheet"/>
        <link href="assets/css/estilosguia.css" rel="stylesheet"/>


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
                                        <H3><strong>Guía Remisión</strong></H3>
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
                        <div id="main3" class="content">

                            <fieldset id="fieldset1" style="border: 1px solid gray">
                                <legend><strong>Ingresar datos</strong></legend>
                                <div class="row" id="fila1">
                                    <div class="col-sm-4">
                                        <label for="Fecha">ID Guia Remisión:</label>
                                        <input type="text" name="Fecha" placeholder="Ingresar Fecha">
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="Fecha">Fecha de Emisión:</label>
                                        <input type="text" name="Fecha" placeholder="Ingresar Fecha">
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="Partida">Punto Partida:</label>
                                        <input type="text" name="Partida" placeholder="Ingresar punto partida">
                                    </div>
                                </div>
                                <div class="row" id="fila2">
                                    <div class="col-sm-3">		
                                        <label for="Destinatario">Destinatario:</label>
                                        <input type="text" name="Destinatario" placeholder="Ingresar destinatario">
                                    </div>
                                    
                                </div>
                            </fieldset>

                            <hr style="border: 1px solid gray">

                            <fieldset id="fieldset2" style="border: 1px solid gray">
                                <legend><strong>Ingresar datos</strong></legend>
                                <div class="row" id="fila3">
                                    <div class="col-sm-3">
                                        <label for="rucTransporte" >RUC Transporte:</label>
                                        <input type="text" name="rucTransporte" placeholder="Ingresar RUC">
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="nomChofer">Nombre de Chofer:</label>
                                        <input type="text" name="nomChofer" placeholder="Ingresar nombre ">
                                    </div>
                                    <div class="col-sm-3">		
                                        <label for="Marca">Marca:</label>
                                        <input type="text" name="Marca" placeholder="Ingresar marca">
                                    </div>
                                    <div class="col-sm-3">      
                                        <label for="Placa">Placa:</label>
                                        <input type="text" name="Placa" placeholder="Ingresar placa">
                                    </div>
                                </div>
                            </fieldset>

                            <br>

                             <table id="tabla">
                                <tr id="col1">
                                    <th>ID Detalle Guía Remisión</th>
                                    <th>ID Guía Remisión</th>
                                    <th>ID Pedido</th>
                                    <th>Descripción</th>
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
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </body>
</html>