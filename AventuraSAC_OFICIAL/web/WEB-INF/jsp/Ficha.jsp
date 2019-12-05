<%-- 
    Document   : Ficha
    Created on : 05/12/2019, 09:04:45 AM
    Author     : Administrador
--%>

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

            <div class="card" style="width: 900px; ">
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

            </div>
        </div>

