<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="<c:url value="resources/register/images/icons/favicon.ico"/>"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/register/vendor/bootstrap/css/bootstrap.min.css"/>">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/register/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/register/fonts/iconic/css/material-design-iconic-font.min.css"/>">

        <link rel="stylesheet" type="text/css" href="<c:url value="resources/register/css/util.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/register/css/main.css"/>">
    </head>
    <body style="background-color: #999999;">

        <div class="limiter">
            <div class="container-login100">
                <div class="login100-more" style="background-image: url('resources/register/images/photomain.jpg');"></div>

                <div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
                    <mvc:form method="POST" modelAttribute="account" action="${pageContext.request.contextPath}/registration-success">
                        <span class="login100-form-title p-b-59">
                            Sign Up
                        </span>

                        <div class="wrap-input100 validate-input" data-validate="First name is required">
                            <span class="label-input100">First name</span>
                            <input class="input100" type="text" name="firstName" placeholder="First name..." required value="${account.firstName}"> 
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Last name is required">
                            <span class="label-input100">Last name</span>
                            <input class="input100" type="text" name="lastName" placeholder="Last name..." required value="${account.lastName}">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <span class="label-input100">Email</span>
                            <input class="input100" type="email" name="email" placeholder="Email addess..." required >
                            <c:if test="${message ne null and message ne ''}">
                                <small style="color: red">${message}</small>
                            </c:if>
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Password is required" >
                            <span class="label-input100">Password</span>
                            <input class="input100" type="password" name="password" placeholder="*************" required id="txtPassword" value="${account.password}">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Repeat password is required">
                            <span class="label-input100">Repeat Password</span>
                            <input class="input100" type="password" name="re-password" placeholder="*************" required id="txtConfirmPassword" value="${account.password}">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="flex-m w-full p-b-33">
                            <div class="contact100-form-checkbox">
                                <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                                <label class="label-checkbox100" for="ckb1">
                                    <span class="txt1">
                                        I agree to the
                                        <a href="#" class="txt2 hov1">
                                            Terms of User
                                        </a>
                                    </span>
                                </label>
                            </div>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" type="submit" onclick="return Validate()">
                                    Sign Up
                                </button>
                            </div>

                            <a href="<c:url value="/login"/>" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
                                Sign in
                                <i class="fa fa-long-arrow-right m-l-5"></i>
                            </a>
                        </div>
                    </mvc:form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function Validate() {
                var password = document.getElementById("txtPassword").value;
                var confirmPassword = document.getElementById("txtConfirmPassword").value;
                if (password != confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                return true;
            }
        </script>


        <script src="<c:url value="resources/register/vendor/animsition/js/animsition.min.js"/>"></script>
        <!--===============================================================================================-->
        <script src="<c:url value="resources/register/vendor/bootstrap/js/popper.js"/>"></script>
        <script src="<c:url value="resources/register/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
        <!--===============================================================================================-->
        <script src="<c:url value="resources/register/vendor/select2/select2.min.js"/>"></script>
        <!--===============================================================================================-->
        <script src="<c:url value="resources/register/vendor/daterangepicker/moment.min.js"/>"></script>
        <script src="<c:url value="resources/register/vendor/daterangepicker/daterangepicker.js"/>"></script>
        <!--===============================================================================================-->
        <script src="<c:url value="resources/register/vendor/countdowntime/countdowntime.js"/>"></script>
        <script src="<c:url value="../../resources/register/vendor/jquery/jquery-3.2.1.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/register/js/main.js"/>"></script>
    </body>
</html>
