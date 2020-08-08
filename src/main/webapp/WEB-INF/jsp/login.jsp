<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="<c:url value="resources/login/images/icons/favicon.ico"/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/login/css/util.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/login/css/main.css"/>">
    </head>
    <body style="background-color: #666666;" >
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="<c:url value="j_spring_security_check"/>" method="post">
                        <c:if test="${message ne null and message ne ''}">
                            <span class="login100-form-title p-b-43" style="color: green; font-size: 1.1rem">${message}</span>
                        </c:if>
                        <c:if test="${errorEmailOrPass ne null or errorEmailOrPass ne ''}">
                                <p style="color: orangered">${errorEmailOrPass}</p>
                        </c:if>
                        <span class="login100-form-title p-b-43">
                            Login to Bstore
                        </span>


                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required">
                            <input class="input100" type="email" name="email">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Email</span>
                        </div>


                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <input class="input100" type="password" name="password">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Password</span>
                        </div>
                        <div>
                            <c:if test="${errorEmailOrPass != null or errorEmailOrPass != ''}">
                                <p style="color: orangered">${errorEmailOrPass}</p>
                            </c:if>
                        </div>

                        <div class="flex-sb-m w-full p-t-3 p-b-32">
                            <div class="contact100-form-checkbox">
                                <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                                <label class="label-checkbox100" for="ckb1">
                                    Remember me
                                </label>
                            </div>

                            <div>
                                <a href="#" class="txt1">
                                    Forgot Password?
                                </a>
                            </div>
                        </div>


                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit">
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-46 p-b-20">
                            <span class="txt2">
                                or <a href="<c:url value="/registration"/>">sign up using</a>
                            </span>
                        </div>
                        <div class="text-center p-t-46 p-b-20">
                            <span class="txt2">
                                or <a href="https://www.facebook.com/dialog/oauth?client_id=3285076994954555&redirect_uri=http://localhost:8080/Spring_Project_Final/login-facebook">Login with FaceBook</a>
                            </span>
                        </div>

                        <div class="login100-form-social flex-c-m">
                            <a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
                                <i class="fa fa-facebook-f" aria-hidden="true"></i>
                            </a>

                            <a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </a>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>

                    <div class="login100-more" style="background-image: url('resources/login/images/photomain.jpg');">
                    </div>
                </div>
            </div>
        </div>
        <script src="<c:url value="resources/login/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
        <script src="<c:url value="resources/login/js/main.js"/>"></script>

    </body>
</html>
