<%-- 
    Document   : MenuCliente
    Created on : 29/11/2019, 11:30:49 AM
    Author     : Administrador
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu Principal Cliente</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="<c:url value="webapp/resources/theme1/css/main.css" />" rel="stylesheet">
    </head>
    <body class="is-preload">

        <!-- Header -->
        <header id="header">
            <a class="logo" href="menucliente.html">Aventura S.A.C.</a>
            <nav>
                <a href="#menu">Menu</a>
                
            </nav>
        </header>

        <!-- Nav -->
        <nav id="menu">
            <ul class="links">
                <li><a href="menucliente.htm">Home</a></li>
                <li><a href="quienessomos.htm">Quienes Somos</a></li>
                <li><a href="login.htm">Salir</a>
            </ul>
        </nav>

        <!-- Banner -->
        <section id="banner">
            <div class="inner">
                <h1>BIENVENIDO ${usuario.razonSocial}</h1>
                <p>Estas en Aventura S.A.C. una de las empresas lideres en confección<br />
                    a nivel nacional, con la garantia de materiales y acabados de calidad.</p>
            </div>
            <video autoplay loop muted playsinline src="webapp/resources/theme1/images/banner.mp4"></video>
        </section>

        <!-- Highlights -->
        <section class="wrapper">
            <div class="inner">
                <header class="special">
                    <h2>Servicios</h2>
                    <p>Escoja uno de nuestros servicios para poder brindarle la atencion que requiera.</p>
                </header>
                <div class="highlights">
                    <section>
                        <div class="content">
                            <header>
                                <a href="#" class="icon fa-tasks"><span class="label">Icon</span></a>
                                <h2>INGRESAR PEDIDO</h2>
                            </header>
                            <p>En este campo podrá ingresar detalles sobre su pedido con el cual podremos enviarle una cotización con el tiempo estimado.</p>								
                        </div>
                    </section>

                    <section>
                        <div class="content">
                            <header>
                                <a href="#" class="icon fa-list-alt"><span class="label">Icon</span></a>
                                <h2>MIS PEDIDOS</h2>
                            </header>
                            <p>En este campo podra ver el estado de sus pedidos, la cotizacion respectiva y podra acceder a pagar por el pedido.</p>
                        </div>
                    </section>
                    <section>
                        <div class="content">
                            <header>
                                <a href="#" class="icon fa-money"><span class="label">Icon</span></a>
                                <h2>CONCRETAR PEDIDO</h2>
                            </header>
                            <p>Indique los datos de su pago como el numero de operacion , para completar su proceso de pedido.</p>
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
                <img id="yo" src="webapp/resources/theme1/images/logo.png">
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

<script src="<c:url value="webapp/resources/theme1/js/browser.min.js"/>"></script>
<script src="<c:url value="webapp/resources/theme1/js/jquery.min.js" />"></script>
<script src="<c:url value="webapp/resources/theme1/js/breakpoints.min.js" />"></script>
<script src="<c:url value="webapp/resources/theme1/js/util.js" />"></script>
<script src="<c:url value="webapp/resources/theme1/js/main.js" />"></script>
</body>
</html>
