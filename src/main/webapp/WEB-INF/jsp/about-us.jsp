<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us</title>
        <jsp:include page="include/css-page.jsp" />
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <script>
            document.getElementById("about").classList.add('active');
            document.getElementById("women").classList.remove('active');
            document.getElementById("home").classList.remove('active');
            document.getElementById("men").classList.remove('active');
        </script>
        <!-- content -->
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="<c:url value="/home"/>">HOMe</a>
                            <span><i class="fa fa-caret-right	"></i></span>
                            <span>About us</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h2 class="page-title about-page-title">About us</h2>
                    </div>		
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <!-- SINGLE-ABOUT-INFO START -->
                        <div class="single-about-info">
                            <div class="our-company">
                                <h3>Our company</h3>
                                <strong>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididun.</strong>
                                <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet conse ctetur adipisicing elit.</p>	
                                <div class="company-list-menu">
                                    <ul>
                                        <li>Top quality products</li>
                                        <li>Best customer service</li>
                                        <li>30-days money back guarantee</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-ABOUT-INFO END -->
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="single-about-info">
                            <!-- OUR-TEAM START -->
                            <div class="our-team">
                                <h3>Our team</h3>
                                <strong>Lorem set sint occaecat cupidatat non </strong>
                                <p>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>
                                <p>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>
                                <p>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>	
                            </div>
                            <!-- OUR-TEAM END -->
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="single-about-info">
                            <!-- OUR-TESTIMONIALS START -->
                            <div class="our-testimonials">
                                <h3>Testimonials</h3>
                                <!-- SINGLE-TESTIMONIALS START -->
                                <div class="single-testimonials">
                                    <div class="testimonials-text">
                                        <span class="before"></span>
                                        Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
                                        <span class="after"></span>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit</p>
                                <!-- SINGLE-TESTIMONIALS END -->
                                <!-- SINGLE-TESTIMONIALS START -->
                                <div class="single-testimonials">
                                    <div class="testimonials-text">
                                        <span class="before"></span>
                                        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod.
                                        <span class="after"></span>
                                    </div>
                                </div>
                                <p>Ipsum dolor sit</p>
                                <!-- SINGLE-TESTIMONIALS END -->
                            </div>
                            <!-- OUR-TESTIMONIALS END -->
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

