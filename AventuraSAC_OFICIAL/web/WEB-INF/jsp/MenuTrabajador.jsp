
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu Principal Trabajador</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/js/bootstrap.min.js" />" rel="stylesheet">
    </head>
    <body class="is-preload">

        <!-- Header -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="menu.htm" >Aventura S.A.C.</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>



            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"/>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>

        </nav>
        <!-- Nav -->


        <!-- Banner -->
        <section id="banner">
            <div class="inner">
                <h1>BIENVENIDO ${usuario.apellidoPaterno}</h1>
                <p>Estas en Aventura S.A.C. una de las empresas lideres en confección<br />
                    a nivel nacional, con la garantia de materiales y acabados de calidad.</p>
            </div>
            <video autoplay loop muted playsinline src="webapp/resources/theme1/images/banner.mp4"></video>
        </section>

        <!-- Highlights -->
        <section class="wrapper">
            <div class="inner">
                <header class="special">
                    <h2>Herramientas de Trabajo</h2>
                    <p>A continuacion elije tu area de trabajo para poder acceder a las herramientas de éste.</p>
                </header>
                <div class="highlights">
                    <section>
                        <div class="content">
                            <header>
                                <a href="MenuVentas.html" class="icon fa-vcard-o"><span class="label">Icon</span></a>
                                <h2>VENTAS</h2>
                            </header>
                            <p>Gestion de ventas.</p>								
                        </div>
                    </section>

                    <section>
                        <div class="content">
                            <header>
                                <a href="MenuAlmacen.htm" class="icon fa-floppy-o"><span class="label">Icon</span></a>
                                <h2>ALMACEN</h2>
                            </header>
                            <p>Control del almacén.</p>
                        </div>
                    </section>
                    <section>
                        <div class="content">
                            <header>
                                <a href="MenuLogistica.html" class="icon fa-line-chart"><span class="label">Icon</span></a>
                                <h2>LOGISTICA</h2>
                            </header>
                            <p>Gestion de Adquisición.</p>
                        </div>
                    </section>

                </div>
            </div>
        </section>

        <!-- CTA -->

        <div class="testimonials">
            <section>
                <div class="content">
                    <blockquote>
                        <p>"La creatividad solo es la inteligencia divirtiendose".</p>
                    </blockquote>
                    <div class="author">
                        <div class="image">
                            <img src="webapp/resources/theme1/images/pic01.jpg" alt="" />
                        </div>
                        <p class="credit">- <strong>Ricardo Espinoza</strong> <span>CEO Aventura</span></p>
                    </div>
                </div>
            </section>
            <section>
                <div class="content">
                    <blockquote>
                        <p>Ni idea de que ponerle 2.</p>
                    </blockquote>
                    <div class="author">
                        <div class="image">
                            <img src="webapp/resources/theme1/images/pic03.jpg" alt="" />
                        </div>
                        <p class="credit">- <strong>Pepito</strong> <span>CEO - Aventura S.A.C.</span></p>
                    </div>
                </div>
            </section>
            <section>
                <div class="content">
                    <blockquote>
                        <p>Ni idea de que ponerle 3.</p>
                    </blockquote>
                    <div class="author">
                        <div class="image">
                            <img src="webapp/resources/theme1/images/pic02.jpg" alt="" />
                        </div>
                        <p class="credit">- <strong>Juanito</strong> <span>Jefe de Producción.</span></p>
                    </div>
                </div>
            </section>
        </div>
    </div>
</section>

<!-- Footer -->
<footer id="footer">
    <div class="inner">
        <div class="content">
            <section>
                <h3>¿Que hacemos?</h3>
                <p>Confeccion de prendas.</p><br>
                <p>Todo tipo de telas.</p><br>
                <p>Materiales de calidad.</p><br>
                <p>Puntualidad en las entregas.</p><br>

            </section>

            <section>
                <style>
                    #yo { 
                        margin-left: -120px;
                    }
                </style>
                <img id="yo" src="webapp/resources/theme1/images/logo.png" alt=""/>

            </section>
            <section>
                <h4>Contáctanos:</h4>
                <ul class="plain">
                    <li><a href="#"><i class="icon fa-twitter">&nbsp;</i>Twitter</a></li>
                    <li><a href="#"><i class="icon fa-facebook">&nbsp;</i>Facebook</a></li>
                    <li><a href="#"><i class="icon fa-instagram">&nbsp;</i>Instagram</a></li>

                </ul>
            </section>
        </div>
        <div class="copyright">
            Crea tu pagina web - Contactanos 970312126
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="<c:url value="webapp/resources/theme1/js/jquery.min.js" />"></script>
<script src="<c:url value="webapp/resources/theme1/js/breakpoints.min.js" />"></script>
<script src="<c:url value="webapp/resources/theme1/js/util.js" />"></script>
<script src="<c:url value="webapp/resources/theme1/js/main.js" />"></script>


</body>
</html>
