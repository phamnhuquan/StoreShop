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
                        <div class="bstore-breadcrumb" style="margin-left: 10px">
                            <a href="<c:url value="/user/order-history"/>" style="font-size: 1.1rem"><span><i class="fa fa-caret-left"></i></span>Back</a>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="modal-body">
                            <table class="table table-bordered" id="cart-summary">
                                <!-- TABLE HEADER START -->
                                <thead>
                                    <tr>
                                        <th class="cart-product">Product</th>
                                        <th class="cart-description">Description</th>
                                        <th class="cart-unit text-right">Unit price</th>
                                        <th class="cart_quantity text-center">Quantity</th>
                                        <th class="cart-total text-right">Total</th>
                                    </tr>
                                </thead>
                                <!-- TABLE HEADER END -->
                                <!-- TABLE BODY START -->
                                <tbody>	
                                    <!-- SINGLE CART_ITEM START -->
                                    <c:forEach var="orderDetail" items="${orderDetails}">
                                        <c:set var="total"
                                               value="${total + orderDetail.price * orderDetail.quantity }"></c:set>
                                        <tr>
                                            <td class="cart-product">
                                                <a href="<c:url value="/view-detail/${item.product.id}"/>"><img style="max-height: 100px; max-width: 100px;" alt="Blouse" src="<c:url value="/resources/img/product/sale/${orderDetail.product.image}"/>"></a>
                                            </td>
                                            <td class="cart-description">
                                                <p class="product-name"><a href="<c:url value="/view-detail/${orderDetail.product.id}"/>">${orderDetail.product.name}</a></p>
                                                <small>Intended for : ${orderDetail.product.object.name}</small>
                                                <small>Size : ${orderDetail.sizeName} </small>
                                                <small>Color : ${orderDetail.colorName}</small>
                                            </td>
                                            <td class="cart-unit">$${orderDetail.price}</td>
                                            <td class="cart_quantity text-center">${orderDetail.quantity}</td>
                                            <td class="cart-total">
                                                <span class="price">$<fmt:formatNumber type="number" value = "${orderDetail.price * orderDetail.quantity}" pattern="###.##" /></span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- SINGLE CART_ITEM END -->
                                </tbody>
                                <!-- TABLE BODY END -->
                                <!-- TABLE FOOTER START -->
                                <tfoot>										
                                    <tr>
                                        <td class="total-price-container text-right" colspan="4">
                                            <span>Total</span>
                                        </td>
                                        <td id="total-price-container" class="price" colspan="1">
                                            <span id="total-price">$<fmt:formatNumber type="number" value = "${total}" pattern="###.##" /></span>
                                        </td>
                                    </tr>
                                </tfoot>		
                                <!-- TABLE FOOTER END -->									
                            </table>
                        </div>
                    </div>
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