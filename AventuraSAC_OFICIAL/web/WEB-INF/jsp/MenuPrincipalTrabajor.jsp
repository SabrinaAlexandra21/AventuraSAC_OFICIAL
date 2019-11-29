<%-- 
    Document   : MenuPrincipalTrabajor
    Created on : 28/11/2019, 10:41:17 AM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu Principal Trabajador</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="stylesheet" href="assets/css/main.css" />
    </head>
    <body class="is-preload">

        <!-- Header -->
        <header id="header">
            <a class="logo" href="MenuPrincipalTrabajador.html">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
            </nav>
        </header>

        <!-- Nav -->
        <nav id="menu">
            <ul class="links">
                <li><a href="index.html">Home</a></li>
                <li><a href="QuienesSomos.html">Quienes Somos</a></li>
                <li><a href="#">Mantenimientos</a>
                    <ul>
                        <li>
                            <a href="empleados.jsp">Empleados</a>
                        </li>
                        <li>
                            <a href="clientes.jsp">Cliente</a>
                        </li>
                        <li>
                            <a href="proveedores.jsp">Proveedor</a>
                        </li>
                    </ul>
                <li>
            </ul>
        </nav>

        <!-- Banner -->
        <section id="banner">
            <div class="inner">
                <h1>BIENVENIDO "Nombre"</h1>
                <p>Estas en Aventura S.A.C. una de las empresas lideres en confección<br />
                    a nivel nacional, con la garantia de materiales y acabados de calidad.</p>
            </div>
            <video autoplay loop muted playsinline src="images/banner.mp4"></video>
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
                                <a href="MenuAlmacen.html" class="icon fa-floppy-o"><span class="label">Icon</span></a>
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
                        <p>Ni idea de que ponerle 1.</p>
                    </blockquote>
                    <div class="author">
                        <div class="image">
                            <img src="images/pic01.jpg" alt="" />
                        </div>
                        <p class="credit">- <strong>Juanita</strong> <span>Jefa Logistica</span></p>
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
                            <img src="images/pic03.jpg" alt="" />
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
                            <img src="images/pic02.jpg" alt="" />
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
                <img id="yo" src="images/aventura2.png">
            </section>
            <section>
                <h4>Contáctanos:</h4>
                <ul class="plain">
                    <li><a href="#"><i class="icon fa-twitter">&nbsp;</i>Twitter</a></li>
                    <li><a href="#"><i class="icon fa-facebook">&nbsp;</i>Facebook</a></li>
                    <li><a href="#"><i class="icon fa-instagram">&nbsp;</i>Instagram</a></li>
                    <li><a href="#"><i class="icon fa-github">&nbsp;</i>Github</a></li>
                </ul>
            </section>
        </div>
        <div class="copyright">
            Crea tu pagina web - Contactanos 970312126
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>
