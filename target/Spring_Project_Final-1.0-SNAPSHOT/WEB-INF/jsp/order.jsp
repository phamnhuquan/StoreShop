<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <jsp:include page="include/css-page.jsp" />

    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <link href="<c:url value="/resources/css/orderCss.css"/>" rel="stylesheet" type="text/css"/>
        <!-- content -->
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="<c:url value="/home"/>">HOMe</a>
                            <span><i class="fa fa-caret-right"></i></span>
                            <span>Order</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row row-template">
                    <div class="col-25 col-25-template" style="margin-bottom: 20px">
                        <div class="container container-template">
                            <h2>Cart <span class="price price-template" style="color:black"><i class="fa fa-shopping-cart"></i> <b>${totalProduct}</b></span></h2>
                            <c:forEach var="item" items="${sessionCart}">
                                <c:set var="total"
                                       value="${total + (item.product.price - item.product.price*item.product.promotion.discount) * item.quantity }"></c:set>
                                    <div style=" margin: 10px; display: flex; justify-content: space-between">
                                        <div style="display: flex;">
                                            <div>
                                                <img src="<c:url value="/resources/img/product/sale/${item.product.image}"/>" alt="single-product-image" style="height: 70px; width: 70px; margin-right: 8px"/>                                                   
                                        </div>
                                        <div>
                                            <p style="font-weight: bold">${item.product.name} ( x ${item.quantity} )</p>
                                            <p>Size: ${item.product.productDetailInOrder.size.name} --- Color: ${item.product.productDetailInOrder.color.name}</p>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="price price-template" style="margin-top: 25px; color: orangered">$ <fmt:formatNumber type="number" value = "${(item.product.price - item.product.price*item.product.promotion.discount)* item.quantity}" pattern="###.##" /></span>
                                    </div>
                                </div>

                            </c:forEach>
                            <hr>
                            <p style="font-size: 1.2rem; font-weight: bold ">Total <span class="price price-template" style="color:orangered;font-size: 1.2rem;"><b>$<fmt:formatNumber type="number" value = "${total}" pattern="###.##" /></b></span></p>
                        </div>
                    </div>

                    <div class="col-75 col-75-template">
                        <div class="container container-template">
                            <mvc:form method="POST" modelAttribute="order"
                                      action="${pageContext.request.contextPath}/order-sucess">
                                <input type="hidden" value="${total}" name="totalPrice" />
                                <div class="row row-template">
                                    <div class="col-50 col-50-template">
                                        <h2 style="margin-bottom: 20px">Billing Address</h2>
                                        <div class="row row-template">
                                            <div class="col-50 col-50-template">
                                                <label for="firstName"><i class="fa fa-user"></i> First name</label>
                                                <input class="input-template" type="text" id="firstName" name="firstName" placeholder="Enter first name..." required value="${account.firstName}">
                                            </div>
                                            <div class="col-50 col-50-template">
                                                <label for="lastName"><i class="fa fa-user"></i> Last name</label>
                                                <input class="input-template" type="text" id="lastName" name="lastName" placeholder="Enter last name..." required value="${account.lastName}">
                                            </div>
                                        </div>

                                        <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                        <input class="input-template" type="email" id="email" name="email" placeholder="Enter email address..." required value="${account.email}">

                                        <label for="phoneNumber"><i class="fa fa-phone-square"></i> Phone number</label>
                                        <input class="input-template" type="tel" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number..." required value="${account.phoneNumber}">

                                        <label for="address"><i class="fa fa-address-card-o"></i> Address</label>
                                        <input class="input-template" type="text" id="address" name="address" placeholder="Enter the shipping address..." required value="${account.address}">
                                    </div>
                                </div>
                                <label>
                                    <input class="input-template" type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
                                </label>
                                <input type="submit" value="Order" class="btn btn-template input-template">
                            </mvc:form>
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