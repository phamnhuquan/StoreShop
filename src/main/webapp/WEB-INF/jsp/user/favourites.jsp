<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Favourites</title>
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
                            <span>Favourites</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="bg-light border-right" id="sidebar-wrapper">
                            <div class="list-group list-group-flush">
                                <a href="<c:url value="/user/profile"/>" class="list-group-item list-group-item-action bg-light">Information and contact</a>
                                <a href="<c:url value="/user/favourites"/>" class="list-group-item list-group-item-action bg-light active">List product favorites</a>
                                <a href="<c:url value="/user/order-history"/>" class="list-group-item list-group-item-action bg-light">Orders history</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <div class="right-all-product">
                                <!-- PRODUCT-CATEGORY-HEADER START -->
                                <div class="product-category-header">
                                    <div class="category-header-image">
                                        <img src="<c:url value="/resources/img/category-header.jpg"/>" alt="category-header" />
                                        <div class="category-header-text">
                                            <h2>Favourites</h2>
                                            <strong>You will find here all favourites fashion collections.</strong>
                                            <p>This category includes all the basics of your wardrobe and much more:</p> <p>shoes, accessories, printed t-shirts, feminine dresses, women's jeans!</p>
                                        </div>									
                                    </div>
                                </div>
                            </div>
                            <!-- ALL GATEGORY-PRODUCT START -->
                            <div class="all-gategory-product">
                                <div class="row">
                                    <ul class="gategory-product">
                                        <!-- SINGLE ITEM START -->
                                        <c:forEach var="item" items="${favouritesProduct}">
                                            <li class="cat-product-list">
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                    <div class="single-product-item">
                                                        <div class="product-image">
                                                            <a href="${pageContext.request.contextPath}/view-detail/${item.product.id}"><img src="<c:url value="/resources/img/product/sale/${item.product.image}"/>" alt="product-image" /></a>
                                                                <c:if test="${item.product.promotion.discount != 0 }">
                                                                <a href="${pageContext.request.contextPath}/view-detail/${item.product.id}" class="new-mark-box">- ${item.product.promotion.description}</a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                    <div class="list-view-content">
                                                        <div class="single-product-item">
                                                            <div class="product-info">
                                                                <div class="customar-comments-box">
                                                                    <a href="${pageContext.request.contextPath}/view-detail/${item.product.id}">${item.product.name}</a>
                                                                    <div class="rating-box">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-half-empty"></i>
                                                                    </div>
                                                                    <div class="review-box">
                                                                    </div>
                                                                </div>
                                                                <div class="product-datails">
                                                                    <p>${item.product.description}</p>
                                                                </div>
                                                                <div class="price-box">
                                                                    <span class="price">$<fmt:formatNumber type="number" value = "${item.product.price - item.product.price*item.product.promotion.discount}" pattern="###.##" /></span>
                                                                    <c:if test="${item.product.promotion.discount != 0 }">
                                                                        <span class="old-price">$<fmt:formatNumber type="number" value = "${item.product.price}" pattern="###.##" /></span>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                            <div class="overlay-content-list">
                                                                <ul>
                                                                    <li><a href="${pageContext.request.contextPath}/view-detail/${item.product.id}" title="View detail"><i class="fa fa-search"></i></a></li>
                                                                    <li><a href="${pageContext.request.contextPath}/user/remove-favourites-user/${item.product.id}" title="Remove"><i class="fa fa-remove"></i></a></li>
                                                                </ul>
                                                            </div>												
                                                        </div>														
                                                    </div>
                                                </div>
                                            </li>	
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
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