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
        <!-- content -->
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="<c:url value="/home"/>">HOMe</a>
                            <span><i class="fa fa-caret-right"></i></span>
                            <span>Your shopping cart</span>
                            <c:if test="${message ne null and message ne ''}">
                                <span style="color: red ;margin-left: 40px">${message}</span>
                            </c:if>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- CART TABLE_BLOCK START -->
                        <div class="table-responsive">
                            <!-- TABLE START -->
                            <table class="table table-bordered" id="cart-summary">
                                <!-- TABLE HEADER START -->
                                <thead>
                                    <tr>
                                        <th class="cart-product">Product</th>
                                        <th class="cart-description">Description</th>
                                        <th class="cart-avail text-center">Availability</th>
                                        <th class="cart-unit text-right">Unit price</th>
                                        <th class="cart_quantity text-center">Quantity</th>
                                        <th class="cart-delete">&nbsp;</th>
                                        <th class="cart-total text-right">Total</th>
                                    </tr>
                                </thead>
                                <!-- TABLE HEADER END -->
                                <!-- TABLE BODY START -->
                                <tbody>	
                                    <!-- SINGLE CART_ITEM START -->
                                    <c:forEach var="item" items="${sessionCart}">
                                        <c:set var="total"
                                               value="${total + (item.product.price - item.product.price*item.product.promotion.discount) * item.quantity }"></c:set>
                                            <tr>
                                                <td class="cart-product">
                                                    <a href="<c:url value="/view-detail/${item.product.id}"/>"><img style="max-height: 100px; max-width: 100px;" alt="Blouse" src="<c:url value="/resources/img/product/sale/${item.product.image}"/>"></a>
                                            </td>
                                            <td class="cart-description">
                                                <p class="product-name"><a href="<c:url value="/view-detail/${item.product.id}"/>">${item.product.name}</a></p>
                                                <small>Intended for : ${item.product.object.name}</small>
                                                <small>Size : ${item.product.productDetailInOrder.size.name} </small>
                                                <small>Color : ${item.product.productDetailInOrder.color.name}</small>
                                            </td>
                                            <td class="cart-avail"><span class="label label-success">${item.product.quantity} In stock</span></td>
                                            <td class="cart-unit">
                                                <ul class="price text-right">
                                                    <li class="price special-price">$<fmt:formatNumber type="number" value = "${item.product.price - item.product.price*item.product.promotion.discount}" pattern="###.##" /></li>
                                                    <c:if test="${item.product.promotion.discount != 0 }">
                                                        <li class="price-percent-reduction small">&nbsp;-${item.product.promotion.description}&nbsp;</li>
                                                        <li class="old-price">$<fmt:formatNumber type="number" value = "${item.product.price}" pattern="###.##" /></li>
                                                    </c:if>
                                                </ul>
                                            </td>
                                            <td class="cart_quantity text-center">
                                                <form method="POST" action="${pageContext.request.contextPath}/update-quantity/${item.product.id}" class="form-inline">
                                                    <div class="form-group" style="display: flex;justify-content: space-between">
                                                        <input type="number" name="quantity" class="form-control" value="${item.quantity}" style="max-width: 80px; margin-right: 5px"/>
                                                        <input type="submit" value="Update" class="btn btn-info" />
                                                    </div>
                                                </form>
                                            </td>
                                            <td class="cart-delete text-center">
                                                <span>
                                                    <a
                                                        href="${pageContext.request.contextPath}/remove-product/${item.product.id}"
                                                        onclick="return confirm('Are you sure remove product?')"><i class="fa fa-trash-o"></i></a>
                                                </span>
                                            </td>
                                            <td class="cart-total">
                                                <span class="price">$<fmt:formatNumber type="number" value = "${(item.product.price - item.product.price*item.product.promotion.discount) * item.quantity}" pattern="###.##" /></span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- SINGLE CART_ITEM END -->
                                </tbody>
                                <!-- TABLE BODY END -->
                                <!-- TABLE FOOTER START -->
                                <tfoot>										
                                    <tr class="cart-total-price">
                                        <td class="cart_voucher" colspan="3" rowspan="4"></td>
                                        <td class="text-right" colspan="3">Total products (tax excl.)</td>
                                        <td id="total_product" class="price" colspan="1">$0.00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="3">Total shipping</td>
                                        <td id="total_shipping" class="price" colspan="1">$0.00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="3">Total vouchers (tax excl.)</td>
                                        <td class="price" colspan="1">$0.00</td>
                                    </tr>
                                    <tr>
                                        <td class="total-price-container text-right" colspan="3">
                                            <span>Total</span>
                                        </td>
                                        <td id="total-price-container" class="price" colspan="1">
                                            <span id="total-price">$<fmt:formatNumber type="number" value = "${total}" pattern="###.##" /></span>
                                        </td>
                                    </tr>
                                </tfoot>		
                                <!-- TABLE FOOTER END -->									
                            </table>
                            <!-- TABLE END -->
                        </div>
                        <!-- CART TABLE_BLOCK END -->
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- RETURNE-CONTINUE-SHOP START -->
                        <div class="returne-continue-shop">
                            <a href="<c:url value="/home"/>" class="continueshoping"><i class="fa fa-chevron-left"></i>Continue shopping</a>
                            <a href="<c:url value="/order"/>" class="procedtocheckout">Proceed to checkout<i class="fa fa-chevron-right"></i></a>
                        </div>	
                        <!-- RETURNE-CONTINUE-SHOP END -->						
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
