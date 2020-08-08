<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View detail</title>
        <jsp:include page="include/css-page.jsp" />
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <!-- content -->
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="<c:url value="/home"/>">HOME<span><i class="fa fa-caret-right"></i></span></a>
                            <span>${product.name}</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>				
                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <!-- SINGLE-PRODUCT-DESCRIPTION START -->
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
                                <div class="single-product-view">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <c:forEach var="image" items="${images}" varStatus="loop">
                                            <c:set var="idName" value="thumbnail_${loop.index}"/>
                                            <c:if test="${loop.index == 0}" >
                                                <div class="tab-pane active" id="${idName}">
                                                    <div class="single-product-image">
                                                        <img src="<c:url value="/resources/img/product/sale/${product.image}"/>" alt="single-product-image" />
                                                        <a class="fancybox" href="<c:url value="/resources/img/product/sale/${product.image}"/>" data-fancybox-group="gallery"><span class="btn large-btn">View larger <i class="fa fa-search-plus"></i></span></a>
                                                    </div>	
                                                </div>
                                            </c:if>
                                            <c:if test="${loop.index != 0}" >
                                                <div class="tab-pane" id="${idName}">
                                                    <div class="single-product-image">
                                                        <img src="<c:url value="/resources/img/product/sale/${image.name}"/>" alt="single-product-image" />
                                                        <a class="fancybox" href="<c:url value="/resources/img/product/sale/${image.name}"/>" data-fancybox-group="gallery"><span class="btn large-btn">View larger <i class="fa fa-search-plus"></i></span></a>
                                                    </div>	
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>										
                                </div>
                                <div class="select-product">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs select-product-tab bxslider">
                                        <c:set var="index" value="1" />
                                        <c:forEach var="image" items="${images}" varStatus="loop">
                                            <li >
                                                <a href="#thumbnail_${loop.index}" data-toggle="tab"><img src="<c:url value="/resources/img/product/sidebar_product/${image.name}"/>" alt="pro-thumbnail" /></a>
                                            </li>
                                        </c:forEach>
                                    </ul>										
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-8 col-xs-12">
                                <div class="single-product-descirption">
                                    <h2>${product.name}</h2>
                                    <div class="single-product-social-share">
                                        <ul>
                                            <li><a href="#" class="twi-link"><i class="fa fa-twitter"></i>Tweet</a></li>
                                            <li><a href="#" class="fb-link"><i class="fa fa-facebook"></i>Share</a></li>
                                            <li><a href="#" class="g-plus-link"><i class="fa fa-google-plus"></i>Google+</a></li>
                                        </ul>
                                    </div>
                                    <div class="single-product-review-box">
                                        <div class="rating-box">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-empty"></i>
                                        </div>
                                        <div class="read-reviews">
                                            <a href="#">Reviews (${reviewTotal})</a>
                                        </div>
                                        <div class="write-review">
                                            <a href="#">Write a review</a>
                                        </div>		
                                    </div>
                                    <div class="single-product-condition">
                                        <p>Intended for: <span>${product.object.name}</span></p>
                                        <p>Discount: <span style="color: orangered">${product.promotion.description}</span></p>
                                    </div>
                                    <div class="single-product-price">
                                        <h2>$<fmt:formatNumber type="number" value = "${product.price - product.price*product.promotion.discount}" pattern="###.##" /></h2>
                                    </div>
                                    <div class="single-product-desc">
                                        <p>${product.description}</p>
                                        <div class="product-in-stock">
                                            <p>${product.quantity} Items<span>In stock</span></p>
                                        </div>
                                    </div>                        
                                    <sec:authorize access="isAuthenticated()">
                                        <c:if test="${status eq 'liked'}">
                                            <div class="single-product-info" style="boder-radius:2px"> <!-- -->
                                                <a href="${pageContext.request.contextPath}/user/remove-favourites/${product.id}" style="background-color: orangered"><i class="fa fa-heart"></i></a>
                                            </div>
                                        </c:if>
                                        <c:if test="${status eq 'notyetlike'}">
                                            <div class="single-product-info" style="boder-radius:2px"> <!-- -->
                                                <a href="${pageContext.request.contextPath}/user/add-favourites/${product.id}" ><i class="fa fa-heart"></i></a>
                                            </div>
                                        </c:if>
                                    </sec:authorize>
                                    <mvc:form method="POST" action="${pageContext.request.contextPath}/cart/${product.id}">
                                        <div class="single-product-size">
                                            <label for="product-size" class="small-title">Size </label><br/>
                                            <select name="sizeId" id="product-size" style="border: solid 1px; border-radius: 2px;">
                                                <c:forEach items="${sizes}" var="c">
                                                    <option value="${c.size.id}" selected>${c.size.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="single-product-size" style="margin-bottom: 20px ">
                                            <label for="product-size" class="small-title">Color </label><br/>
                                            <select name="colorId" id="product-size" style="border: solid 1px; border-radius: 2px;">
                                                <c:forEach items="${colors}" var="c">
                                                    <option value="${c.color.id}" selected>${c.color.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="single-product-add-cart">
                                            <button type="submit" class="add-cart-text">Add to cart</button>
                                        </div>
                                    </mvc:form>
                                </div>
                            </div>

                        </div>
                        <!-- SINGLE-PRODUCT-DESCRIPTION END -->
                        <!-- SINGLE-PRODUCT INFO TAB START -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="product-more-info-tab">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs more-info-tab">
                                        <li class="active"><a href="#review" data-toggle="tab">Reviews</a></li>
                                        <li><a href="#moreinfo" data-toggle="tab">Write review</a></li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="review">
                                            <c:forEach var="vote" items="${votes}">
                                                <div class="row tab-review-row">
                                                    <div class="col-xs-5 col-sm-4 col-md-4 col-lg-3 padding-5">
                                                        <div class="tab-rating-box" style="width: 210px">
                                                            <span><c:if test="${vote.account.image ne null and vote.account.image ne ''}">
                                                                    <img src="<c:url value="/resources/img/user/${vote.account.image}"/>" style="border-radius: 50%;max-height: 40px; max-width: 40px ; margin-right: 8px" />
                                                                </c:if>
                                                                <c:if test="${vote.account.image eq null or vote.account.image eq ''}">
                                                                    <img src="<c:url value="/resources/img/user/user.png"/>" style="border-radius: 50%;max-height: 40px; max-width: 40px ; margin-right: 8px" />
                                                                </c:if>
                                                                <span>${vote.account.firstName} ${vote.account.lastName}</span></span>
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>	
                                                            <div class="review-author-info">
                                                                <strong>write A REVIEW</strong>
                                                                <span><fmt:formatDate value = "${vote.voteDate}" pattern="dd/MM/yyyy" /></span>
                                                            </div>															
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-7 col-sm-8 col-md-8 col-lg-9 padding-5">
                                                        <div class="write-your-review">
                                                            <p style="margin-top: 30px">${vote.comment}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="tab-pane" id="moreinfo">
                                            <div class="row tab-review-row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 padding-5">
                                                    <sec:authorize access="isAuthenticated()">
                                                        <span style="display: flex;">
                                                            <div><c:if test="${account.image ne null and account.image ne ''}">
                                                                    <img src="<c:url value="/resources/img/user/${account.image}"/>" style="border-radius: 50%;max-height: 70px; max-width: 70px ; margin: 15px"/>
                                                                </c:if>
                                                                <c:if test="${account.image eq null or account.image eq ''}">
                                                                    <img src="<c:url value="/resources/img/user/user.png"/>" style="border-radius: 50%;max-height: 70px; max-width: 70px ; margin: 15px"/>
                                                                </c:if>
                                                                <p style="font-weight: bold;">${account.firstName} ${account.lastName}</p>
                                                            </div>
                                                            <mvc:form method="POST" modelAttribute="vote" action="${pageContext.request.contextPath}/review/${product.id}" >
                                                                <textarea name="comment" style="width: 450px;padding: 12px 20px;margin: 8px 0; border: 1px solid #ccc;border-radius: 4px;box-sizing: border-box; height: 125px; margin-left: 20px" type="text" placeholder="Enter review here..."></textarea>
                                                                <button type="submit" class="add-cart-text" style="margin-left: 30px;margin-top: 45px;">Review</button>
                                                            </mvc:form>
                                                        </span>
                                                    </sec:authorize>
                                                    <sec:authorize access="!isAuthenticated()">
                                                        <p style="margin-top: 30px">Please login to be write reviewed !!!</p>
                                                    </sec:authorize>
                                                </div>
                                            </div>
                                        </div>
                                    </div>									
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-PRODUCT INFO TAB END -->
                        <!-- RELATED-PRODUCTS-AREA START -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="left-title-area">
                                    <h2 class="left-title">Hot products</h2>
                                </div>	
                            </div>
                            <div class="related-product-area featured-products-area">
                                <div class="col-sm-12">
                                    <div class=" row">
                                        <!-- RELATED-CAROUSEL START -->
                                        <div class="related-product">
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <c:forEach var="product" items="${products}">
                                                <div class="item">
                                                    <div class="single-product-item">
                                                        <div class="product-image">
                                                            <a href="<c:url value="/view-detail/${product.id}"/>"><img style="max-height: 190px; max-width: 190px;" src="<c:url value="/resources/img/product/sale/${product.image}"/>" alt="product-image" /></a>
                                                                <c:if test="${product.promotion.discount != 0 }">
                                                                <a href="${pageContext.request.contextPath}/view-detail/${product.id}" class="new-mark-box">- ${product.promotion.description}</a>
                                                            </c:if>
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
                                                            <a href="<c:url value="/view-detail/${product.id}"/>">${product.name}</a>
                                                            <div class="price-box">
                                                                <span class="price">$<fmt:formatNumber type="number" value = "${product.price - product.price*product.promotion.discount}" pattern="###.##" /></span>
                                                                <c:if test="${product.promotion.discount != 0 }">
                                                                    <span class="old-price">$${product.price}</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>							
                                                </div>
                                            </c:forEach>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->								
                                        </div>
                                        <!-- RELATED-CAROUSEL END -->
                                    </div>	
                                </div>
                            </div>	
                        </div>
                        <!-- RELATED-PRODUCTS-AREA END -->
                    </div>
                    <!-- RIGHT SIDE BAR START -->
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <!-- SINGLE SIDE BAR START -->					
                        <div class="single-product-right-sidebar"> 
                            <div class="slider-right zoom-img">
                                <a href="<c:url value="/home"/>"><img class="img-responsive" src="<c:url value="/resources/img/product/cms11.jpg"/>" alt="sidebar left" /></a>
                            </div>							
                        </div>
                    </div>
                    <!-- SINGLE SIDE BAR END -->				
                </div>
            </div>
        </section>
        <!-- end content -->
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