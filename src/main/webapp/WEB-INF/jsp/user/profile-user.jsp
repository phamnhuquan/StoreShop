<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="<c:url value="/resources/css/custom.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/simple-sidebar.css"/>" rel="stylesheet">
        <jsp:include page="../include/css-page.jsp" />
        <style>
            .upload-btn-wrapper {
                position: relative;
                overflow: hidden;
                display: inline-block;
            }

            .btn {
                border: 1px solid gray;
                color: gray;
                background-color: white;
                padding: 8px 20px;
                border-radius: 8px;
                font-size: 15px;
                font-weight: bold;
            }

            .upload-btn-wrapper input[type=file] {
                font-size: 90px;
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
            }
            .fix-detail {
                width: 80%;
                height: auto;
                background-color: white;
                position: absolute;
                z-index: 1;
                top: 160px;
                right: 160px;
                box-shadow: 2px 2px 15px #888888;
                padding: 20px;
                display: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"/>
        <!-- content -->
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="<c:url value="/home"/>">HOME<span><i class="fa fa-caret-right"></i></span></a>
                            <span>Profile</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="bg-light border-right" id="sidebar-wrapper">
                            <div class="list-group list-group-flush">
                                <a href="<c:url value="/user/profile"/>" class="list-group-item list-group-item-action bg-light active">Information and contact</a>
                                <a href="<c:url value="/user/favourites"/>" class="list-group-item list-group-item-action bg-light">List product favorites</a>
                                <a href="<c:url value="/user/order-history"/>" class="list-group-item list-group-item-action bg-light">Orders history</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">      
                        <div class="row">
                            <c:if test="${getAccount.image ne null or getAccount.image ne ''}">
                                <img style="border-radius: 50%; max-height: 170px; max-width: 170px;" src="<c:url value="/resources/img/user/${getAccount.image}"/>" alt="">
                            </c:if>
                            <c:if test="${getAccount.image == null or getAccount.image == ''}">
                                <img style="border-radius: 50%; max-height: 170px; max-width: 170px;" src="<c:url value="/resources/img/user/user.png"/>" alt="">
                            </c:if>
                        </div>
                        <div class="row" style="padding-top: 30px">
                            <div class="col-sm-5">
                                <h2>Full name: </h2>
                            </div>
                            <div class="col-sm-7">
                                <p style="font-style: italic; font-size: 1.1rem">${getAccount.firstName} ${getAccount.lastName}</p>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 30px">
                            <div class="col-sm-5">
                                <h2>Date of birth: </h2>
                            </div>
                            <div class="col-sm-7">
                                <p style="font-style: italic; font-size: 1.1rem;"><fmt:formatDate value = "${getAccount.dateOfBirth}" pattern="dd/MM/yyyy" /></p>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 30px">
                            <div class="col-sm-5">
                                <h2>Phone number: </h2>
                            </div>
                            <div class="col-sm-7">
                                <p style="font-style: italic; font-size: 1.1rem">${getAccount.phoneNumber}</p>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 30px">
                            <div class="col-sm-5">
                                <h2>Email: </h2>
                            </div>
                            <div class="col-sm-7">
                                <p style="font-style: italic; font-size: 1.1rem">${getAccount.email}</p>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 30px">
                            <div class="col-sm-5">
                                <h2>Gender: </h2>
                            </div>
                            <div class="col-sm-7">
                                <p style="font-style: italic; font-size: 1.1rem">${getAccount.gender}</p>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 30px">
                            <div class="col-sm-5">
                                <h2>Address: </h2>
                            </div>
                            <div class="col-sm-7">
                                <p style="font-style: italic; font-size: 1.1rem">${getAccount.address}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="row" style="margin-top: 200px">
                            <i class="fa fa-edit" style="font-size:36px; cursor: pointer" onclick="clickHide()"></i>
                        </div>
                    </div>
                </div>
                <div class="row fix-detail active">
                    <mvc:form method="POST" modelAttribute="account" class="needs-validation"
                              action="${pageContext.request.contextPath}/user/update-account/">
                        <input name="id" value="${getAccount.id}" hidden/>
                        <div class="row justify-content-center">
                            <div class="col-3" style="text-align: center;">
                                <c:if test="${getAccount.image ne null and getAccount.image ne ''}">
                                    <img src="<c:url value="/resources/img/user/${getAccount.image}"/>" id="blah" alt="your image" style="width: 150px; height: 150px; border-radius: 50%;" /><br/>
                                </c:if>
                                <c:if test="${getAccount.image == null or getAccount.image == ''}">
                                    <img src="<c:url value="/resources/img/user/user.png"/>" id="blah" alt="your image" style="width: 150px; height: 150px; border-radius: 50%;" /><br/>
                                </c:if>
                                <label class="file-upload" style="margin-top: 7px">
                                    <div class="upload-btn-wrapper">
                                        <button class="btn">Upload a image personal</button>
                                        <input type="file" name="image" id="upload_file" value="${getAccount.image}"/>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class = "col-sm-6">
                            <div class="form-group">
                                <label for="firstName">First name</label>
                                <input type="text" name="firstName" id="firstName" class="form-control" placeholder="Enter first name..." value="${getAccount.firstName}" required/>
                            </div>
                        </div>
                        <div class = "col-sm-6">
                            <div class="form-group">
                                <label  for="lastName">Last name</label>
                                <input type="text" name="lastName" id="lastName" class="form-control" placeholder="Enter last name..." value="${getAccount.lastName}" required/>
                            </div>
                        </div>
                        <div class = "col-sm-12">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="form-control" placeholder="Enter email..." value="${getAccount.email}" required disabled/>
                            </div>
                        </div>
                        <div class = "col-sm-12">
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <div class="radio">
                                    <c:forEach items="${gender}" var="gender">
                                        <c:if test="${gender eq getAccount.gender}">
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="${gender}" checked/>${gender}
                                            </label>
                                        </c:if>
                                        <c:if test="${gender ne getAccount.gender}">
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="${gender}"/>${gender}
                                            </label>
                                        </c:if>
                                    </c:forEach>  
                                </div>
                            </div>
                        </div>
                        <div class = "col-sm-12">
                            <div class="form-group">
                                <label  for="dateOfBirth">Date of birth:</label>
                                <input type="date" name="dateOfBirth" id="dateOfBirth" class="form-control" value="${getAccount.dateOfBirth}" required/>
                            </div>
                        </div>
                        <div class = "col-sm-12">
                            <div class="form-group">
                                <label  for="phoneNumber">Phone number:</label>
                                <input type="text" name="phoneNumber" id="phoneNumber" class="form-control" value="${getAccount.phoneNumber}" placeholder="Enter phone number..."  required/>
                            </div>
                        </div>
                        <div class = "col-sm-12">
                            <div class="form-group">
                                <label  for="address">Address:</label>
                                <input type="text" name="address" id="address" class="form-control" placeholder="Enter address..." value="${getAccount.address}" required/>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="row justify-content-center">
                                <div class="col-3" style="text-align: center;">
                                    <button class="btn btn-primary" type="submit">Save</button>
                                    <button class="btn btn-danger" type="button" onclick="clickClose()" style="margin-left: 30px">Close</button>
                                </div>
                            </div>
                        </div>
                    </mvc:form>
                </div>
            </div>      
        </section>

        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js-page.jsp"/>

        <script>
            new WOW().init();
        </script>
        <!-- Google Map js -->
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script>
            function initialize() {
                var mapOptions = {
                    zoom: 8,
                    scrollwheel: false,
                    center: new google.maps.LatLng(35.149868, -90.046678)
                };
                var map = new google.maps.Map(document.getElementById('googleMap'),
                        mapOptions);
                var marker = new google.maps.Marker({
                    position: map.getCenter(),
                    map: map
                });

            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
            function clickClose() {
                var classFix = document.querySelector('.fix-detail');
                classFix.style.display = 'none';
            }
            function clickHide() {
                var classFix = document.querySelector('.fix-detail');
                classFix.style.display = 'block';
            }

        </script>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]); // convert to base64 string
                }
            }

            $("#upload_file").change(function () {
                readURL(this)
            });
        </script>
    </body>
</html>