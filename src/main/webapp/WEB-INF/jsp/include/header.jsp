<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="header-top">
    <div class="container">
        <div class="row">
            <!-- HEADER-LEFT-MENU START -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="header-left-menu">
                    <div class="welcome-info">
                        <sec:authorize access="!isAuthenticated()">
                        Welcome <span>Bstore</span>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        Welcome <span>${account.firstName} ${account.lastName}</span>
                        </sec:authorize>
                    </div>
                    <div class="currenty-converter">
                        <form method="post" action="#" id="currency-set">
                            <div class="current-currency">
                                <span class="cur-label">Currency : </span><strong>USD</strong>
                            </div>
                        </form>
                    </div>
                    <div class="selected-language">
                        <div class="current-lang">
                            <span class="current-lang-label">Language : </span><strong>English</strong>
                        </div>
                    </div>
                </div>
            </div>
            <!-- HEADER-LEFT-MENU END -->
            <!-- HEADER-RIGHT-MENU START -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="header-right-menu">
                    <nav>
                        <ul class="list-inline">
                            <li><a href="<c:url value="/order"/>">Check Out</a></li>
                            <li><a href="<c:url value="/cart"/>">My Cart</a></li>                           
                                <sec:authorize access="isAuthenticated()">
                                <li><a href="<c:url value="/user/profile"/>">My Account</a></li>
                                <li><a href="<c:url value="/logout" />">Sign out</a></li>
                                </sec:authorize>
                                <sec:authorize access="!isAuthenticated()">
                                <li><a href="<c:url value="/login"/>">Sign in</a></li>
                                </sec:authorize>
                    </nav>
                </div>
            </div>
            <!-- HEADER-RIGHT-MENU END -->
        </div>
    </div>
</div>
<section class="header-middle">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- LOGO START -->
                <div class="logo">
                    <a href="<c:url value="/home"/>"><img src="<c:url value="/resources/img/logo.png"/>" alt="bstore logo" /></a>
                </div>
                <!-- LOGO END -->
                <!-- HEADER-RIGHT-CALLUS START -->
                <div class="header-right-callus">
                    <h3>call us free</h3>
                    <span>070-520-7761</span>
                </div>
                <!-- HEADER-RIGHT-CALLUS END -->
                <!-- CATEGORYS-PRODUCT-SEARCH START -->
                <div class="categorys-product-search">
                    <form action="${pageContext.request.contextPath}/search" method="POST" class="search-form-cat">
                        <div class="search-product form-group">
                            <select name="categoryName" class="cat-search">
                                <c:forEach items="${categories}" var="c">
                                    <option value="${c.name}">${c.name}</option>
                                </c:forEach>
                            </select>
                            <select name="strObjectName" class="cat-search">
                                <c:forEach items="${objects}" var="o">
                                    <option value="${o.name}">${o.name}</option>
                                </c:forEach>
                            </select>
                            <input type="text" class="form-control search-form" name="strProductName"
                                   placeholder="Enter your search key ... " />
                            <button class="search-button" value="Search" name="s" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <!-- CATEGORYS-PRODUCT-SEARCH END -->
            </div>
        </div>
    </div>
</section>
<header class="main-menu-area">
    <div class="container">
        <div class="row">
            <!-- SHOPPING-CART START -->
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 pull-right shopingcartarea">
                <div class="shopping-cart-out pull-right">
                    <div class="shopping-cart">
                        <a class="shop-link" href="<c:url value="/cart"/>" title="View my shopping cart">
                            <i class="fa fa-shopping-cart cart-icon"></i>
                            <b>My Cart</b>
                            <c:if test="${totalProduct != 0}" >
                                <span class="ajax-cart-quantity">${totalProduct}</span>
                            </c:if>
                            <c:if test="${totalProduct == 0}" >
                                <span class="ajax-cart-quantity"></span>
                            </c:if>
                        </a>
                        <div class="shipping-cart-overly" style="overflow-y: auto;">
                            <c:forEach var="item" items="${sessionCart}">
                                <c:set var="total" value="${total + item.product.price * item.quantity }"></c:set>
                                    <div class="shipping-item">
                                        <span class="cross-icon"><a href="${pageContext.request.contextPath}/remove-product/${item.product.id}"
                                                                onclick="return confirm('Are you sure remove product?')"><i class="fa fa-times-circle"></i></a></span>
                                    <div class="shipping-item-image">
                                        <a href="<c:url value="/view-detail/${item.product.id}"/>"><img src="<c:url value="/resources/img/product/sale/${item.product.image}"/>" alt="shopping image" style="max-height: 80px; max-width: 80px"/></a>
                                    </div>
                                    <div class="shipping-item-text">
                                        <span>${item.quantity}<span class="pro-quan-x"> x</span> <a href="<c:url value="/view-detail/${item.product.id}"/>"
                                                                                                    class="pro-cat">${item.product.name}</a></span>
                                        <p style="color: orangered">$<fmt:formatNumber type="number" value = "${item.product.price * item.quantity}" pattern="###.##" /></p>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="shipping-total-bill">
                                <div class="cart-prices">
                                    <span class="shipping-cost">$0.00</span>
                                    <span>Shipping</span>
                                </div>
                                <div class="total-shipping-prices">
                                    <span class="shipping-total" style="color: orangered">$<fmt:formatNumber type="number" value = "${total}" pattern="###.##" /></span>
                                    <span>Total</span>
                                </div>
                            </div>
                            <div class="shipping-checkout-btn">
                                <a href="<c:url value="/order"/>">Check out <i class="fa fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SHOPPING-CART END -->
            <!-- MAINMENU START -->
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 no-padding-right menuarea">
                <div class="mainmenu">
                    <nav>
                        <ul class="list-inline mega-menu">
                            <li id = 'home' class="active">
                                <a href="<c:url value="/home"/>">Home</a>
                            </li>
                            <li id ='women'>
                                <a href="<c:url value="/women"/>">Women</a>
                            </li>
                            <li id ='men'>
                                <a href="<c:url value="/men"/>">Men</a>
                            </li>
                            <li id ='about'>
                                <a href="<c:url value="/about-us"/>">About us</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- MAINMENU END -->
        </div>
    </div>
</header>