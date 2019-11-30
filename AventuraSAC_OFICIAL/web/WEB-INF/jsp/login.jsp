<!------ Include the above in your HEAD tag ---------->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>

        <title>Aventura S.A.C.</title>
        <link href="<c:url value="webapp/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/css/es.css" />" rel="stylesheet">
        <link href="<c:url value="webapp/resources/theme1/fonts/font.awesome.css" />" rel="stylesheet">
        <script src="<c:url value="webapp/resources/theme1/js/jquery.min.js" />"></script>
        
        
        
    </head>

    <!--Coded with love by Mutiullah Samim-->
    <body id="cuerpo">
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <div class="d-flex justify-content-center">
                        <div class="brand_logo_container">

                            <img src="webapp/resources/theme1/images/logo.PNG"  class="brand_logo" alt=""/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center form_container">
                        <form action="validar.htm" method="post">
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-beer"></i></span>
                                </div>
                                <input type="text" name="txtusuario" class="form-control input_user" value="" placeholder="username">
                            </div>
                            <div class="input-group mb-2">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" name="txtclave" class="form-control input_pass" value="" placeholder="password">
                            </div>
                            <div class="form-group">

                            </div>
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Login</button>
                            </div>
                        </form>
                    </div>

                    <div class="mt-4">
                        <div class="d-flex justify-content-center links">
                            ¿No tienes una cuenta? <a href="registrausuario.htm" class="ml-2">Regístrate</a>
                        </div>
                        <div class="d-flex justify-content-center links">
                            <a href="#">Olvidaste tu contraseña?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        <%
            if(request.getAttribute("mensaje") != null){
                String mensaje = request.getAttribute("mensaje").toString();
        %>
                alert("<%=mensaje%>");
        <%
            }            
        %> 
    </script>
</html>

