<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="../include/css-page.jsp" />
    </head>
    <body>
        <jsp:include page="../include/header.jsp"/>
        <!-- content -->
        <section class="main-content-section">

            <div class="container">
                <div class="row">
                    <!-- MAIN-SLIDER-AREA START -->
                    <div class="main-slider-area">
                        <!-- SLIDER-AREA START -->
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <div class="slider-area">
                                <div id="wrapper">
                                    <div class="slider-wrapper">
                                        <div id="mainSlider" class="nivoSlider">
                                            <img src="<c:url value="/resources/img/slider/2.jpg/"/>" alt="main slider" title="#htmlcaption" />
                                            <img src="<c:url value="/resources/img/slider/1.jpg/"/>" alt="main slider" title="#htmlcaption2" />
                                        </div>
                                        <div id="htmlcaption" class="nivo-html-caption slider-caption">
                                            <div class="slider-progress"></div>
                                            <div class="slider-cap-text slider-text1">
                                                <div class="d-table-cell">
                                                    <h2 class="animated bounceInDown">BEST THEMES</h2>
                                                    <p class="animated bounceInUp">Lorem ipsum dolor sit amet, consectetuer
                                                        adipiscing elit, sed diam nonummy nibh euismod ut laoreet dolore
                                                        magna aliquam erat volutpat.</p>
                                                    <a class="wow zoomInDown" data-wow-duration="1s" data-wow-delay="1s"
                                                       href="https://www.facebook.com/phamnhuquan99">Read More <i class="fa fa-caret-right"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="htmlcaption2" class="nivo-html-caption slider-caption">
                                            <div class="slider-progress"></div>
                                            <div class="slider-cap-text slider-text2">
                                                <div class="d-table-cell">
                                                    <h2 class="animated bounceInDown">BEST THEMES</h2>
                                                    <p class="animated bounceInUp">Lorem ipsum dolor sit amet, consectetuer
                                                        adipiscing elit, sed diam nonummy nibh euismod ut laoreet dolore
                                                        magna aliquam erat volutpat.</p>
                                                    <a class="wow zoomInDown" data-wow-duration="1s" data-wow-delay="1s"
                                                       href="https://www.facebook.com/phamnhuquan99">Read More <i class="fa fa-caret-right"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- SLIDER-AREA END -->
                        <!-- SLIDER-RIGHT START -->
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-right zoom-img m-top">
                                <a href="<c:url value="/home"/>"><img class="img-responsive" src="<c:url value="/resources/img/product/cms11.jpg"/>"
                                                                      alt="sidebar left" /></a>
                            </div>
                        </div>
                        <!-- SLIDER-RIGHT END -->
                    </div>
                    <!-- MAIN-SLIDER-AREA END -->
                </div>
                <div class="row tow-column-product">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- NEW-PRODUCT-AREA START -->
                        <div class="new-product-area">
                            <div class="left-title-area">
                                <h2 class="left-title">New Products</h2>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <!-- NEW-PRO-CAROUSEL START -->
                                        <div class="new-pro-carousel">
                                            <!-- NEW-PRODUCT-SINGLE-ITEM START -->
                                            <c:forEach var="product" items="${newProducts}">
                                                <div class="item">
                                                    <div class="new-product">
                                                        <div class="single-product-item">
                                                            <div class="product-image">
                                                                <a href="${pageContext.request.contextPath}/view-detail/${product.id}"><img style="max-height: 263px;" src="<c:url value="/resources/img/product/sale/${product.image}"/>"
                                                                                                                                            alt="product-image" /></a>
                                                                <a href="${pageContext.request.contextPath}/view-detail/${product.id}" class="new-mark-box">new</a>
                                                                <div class="overlay-content">
                                                                    <ul>
                                                                        <li><a href="${pageContext.request.contextPath}/view-detail/${product.id}" title="View detail"><i
                                                                                    class="fa fa-search"></i></a></li>
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
                                                                    <span class="price">$<fmt:formatNumber type="number" value = "${product.price}" pattern="###.##" /></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <!-- NEW-PRODUCT-SINGLE-ITEM END -->
                                        </div>
                                        <!-- NEW-PRO-CAROUSEL END -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- NEW-PRODUCT-AREA END -->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- SALE-PRODUCTS START -->
                        <div class="Sale-Products">
                            <div class="left-title-area">
                                <h2 class="left-title">Sale Products</h2>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <!-- SALE-CAROUSEL START -->
                                        <div class="sale-carousel">
                                            <!-- SALE-PRODUCTS-SINGLE-ITEM START -->
                                            <c:forEach var="product" items="${saleProducts}">
                                                <div class="item">
                                                    <div class="new-product">
                                                        <div class="single-product-item">
                                                            <div class="product-image">
                                                                <a href="${pageContext.request.contextPath}/view-detail/${product.id}"><img style="max-height: 263px;" src="<c:url value="/resources/img/product/sale/${product.image}"/>"
                                                                                                                                            alt="product-image" /></a>
                                                                <a href="${pageContext.request.contextPath}/view-detail/${product.id}" class="new-mark-box">- ${product.promotion.description}</a>
                                                                <div class="overlay-content">
                                                                    <ul>
                                                                        <li><a href="${pageContext.request.contextPath}/view-detail/${product.id}" title="View detail"><i
                                                                                    class="fa fa-search"></i></a></li>
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
                                                                    <span class="old-price">$<fmt:formatNumber type="number" value = "${product.price}" pattern="###.##" /></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>    
                                            </c:forEach>

                                            <!-- SALE-PRODUCTS-SINGLE-ITEM END -->
                                        </div>
                                        <!-- SALE-CAROUSEL END -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- SALE-PRODUCTS END -->
                    </div>
                </div>
                <div class="row">
                    <!-- ADD-TWO-BY-ONE-COLUMN START -->
                    <div class="add-two-by-one-column">
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <div class="tow-column-add zoom-img">
                                <a href="<c:url value="/men"/>"><img src="<c:url value="/resources/img/product/shope-add1.jpg"/>" alt="shope-add" /></a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <div class="one-column-add zoom-img">
                                <a href="#"><img src="<c:url value="/resources/img/product/shope-add2.jpg"/>" alt="shope-add" /></a>
                            </div>
                        </div>
                    </div>
                    <!-- ADD-TWO-BY-ONE-COLUMN END -->
                </div>
                <div class="row">
                    <!-- FEATURED-PRODUCTS-AREA START -->
                    <div class="featured-products-area">
                        <div class="center-title-area">
                            <h2 class="center-title">Featured Products</h2>
                        </div>
                        <div class="col-xs-12">
                            <div class="row">
                                <!-- FEARTURED-CAROUSEL START -->
                                <div class="feartured-carousel">
                                    <!-- SINGLE-PRODUCT-ITEM START -->
                                    <c:forEach var="product" items="${products}">
                                        <div class="item">
                                            <div class="single-product-item">
                                                <div class="product-image">
                                                    <a href="${pageContext.request.contextPath}/view-detail/${product.id}"><img style="max-height: 204px; max-width: 204px" src="<c:url value="/resources/img/product/sale/${product.image}"/>" alt="product-image" /></a>
                                                    <c:if test="${product.promotion.discount != 0 }">
                                                        <a href="${pageContext.request.contextPath}/view-detail/${product.id}" class="new-mark-box">- ${product.promotion.description}</a>
                                                    </c:if>
                                                    <div class="overlay-content">
                                                        <ul>
                                                            <li><a href="${pageContext.request.contextPath}/view-detail/${product.id}" title="View detail"><i class="fa fa-search"></i></a>
                                                            </li>
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
                                                            <span class="old-price">$<fmt:formatNumber type="number" value = "${product.price}" pattern="###.##" /></span>
                                                        </c:if>  
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- SINGLE-PRODUCT-ITEM END -->
                                </div>
                                <!-- FEARTURED-CAROUSEL END -->
                            </div>
                        </div>
                    </div>
                    <!-- FEATURED-PRODUCTS-AREA END -->
                </div>
            </div>
        </section>
        <!-- footer -->
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
        <c:if test="${message ne null and message ne ''}">
            <script>
                alert('${message}');
            </script>
        </c:if>
    </body>
</html>
