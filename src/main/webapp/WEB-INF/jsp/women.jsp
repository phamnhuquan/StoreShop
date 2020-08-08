<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Women</title>
        <jsp:include page="include/css-page.jsp" />
    </head>
    <body>  
        <jsp:include page="include/header.jsp"/>
        <script>
            document.getElementById("women").classList.add('active');
            document.getElementById("men").classList.remove('active');
            document.getElementById("home").classList.remove('active');
            document.getElementById("about").classList.remove('active');
        </script>
        <!-- content -->
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="<c:url value="/home"/>">HOMe</a>
                            <span><i class="fa fa-caret-right"></i></span>
                            <span>Women</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="right-all-product">
                            <!-- PRODUCT-CATEGORY-HEADER START -->
                            <div class="product-category-header">
                                <div class="category-header-image">
                                    <img style="width: 100%; height: 230px" src="<c:url value="/resources/img/category-header.jpg"/>" alt="category-header" />
                                    <div class="category-header-text">
                                        <h2>Women </h2>
                                        <strong>You will find here all woman fashion collections.</strong>
                                        <p>This category includes all the basics of your wardrobe and much more:<br /> shoes, accessories, printed t-shirts, feminine dresses, women's jeans!</p>
                                    </div>									
                                </div>
                            </div>
                            <!-- PRODUCT-CATEGORY-HEADER END -->
                            <div class="product-category-title">
                                <!-- PRODUCT-CATEGORY-TITLE START -->
                                <h1>
                                    <span class="cat-name">Women</span>
                                </h1>
                                <!-- PRODUCT-CATEGORY-TITLE END -->
                            </div>
                        </div>
                        <!-- ALL GATEGORY-PRODUCT START -->
                        <div class="all-gategory-product">
                            <div class="row">
                                <ul class="gategory-product">
                                    <!-- SINGLE ITEM START -->
                                    <c:forEach var="product" items="${products}">
                                        <li class="gategory-product-list col-lg-3 col-md-6 col-sm-7 col-xs-12">
                                            <div class="single-product-item" style="max-height: 320px">
                                                <div class="product-image">
                                                    <a href="${pageContext.request.contextPath}/view-detail/${product.id}"><img style="max-height: 220px" src="<c:url value="/resources/img/product/sale/${product.image}"/>" alt="product-image" /></a>
                                                    <c:if test="${product.promotion.discount != 0 }">
                                                        <a href="${pageContext.request.contextPath}/view-detail/${product.id}" class="new-mark-box">- ${product.promotion.description}</a>
                                                    </c:if>
                                                    <div class="overlay-content">
                                                        <ul>
                                                            <li><a href="${pageContext.request.contextPath}/view-detail/${product.id}" title="view detail"><i class="fa fa-search"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <div class="customar-comments-box">
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
                                                    <a href="${pageContext.request.contextPath}/view-detail/${product.id}">${product.name}</a>
                                                    <div class="price-box">
                                                        <span class="price">$<fmt:formatNumber type="number" value = "${product.price - product.price*product.promotion.discount}" pattern="###.##" /></span>
                                                        <c:if test="${product.promotion.discount != 0 }">
                                                            <span class="old-price">$${product.price}</span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>									
                                        </li>
                                    </c:forEach>
                                    <!-- SINGLE ITEM END -->															
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- footer -->
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>

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
    </body>
</html>
