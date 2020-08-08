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
                            <span>Orders history</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="bg-light border-right" id="sidebar-wrapper">
                            <div class="list-group list-group-flush">
                                <a href="<c:url value="/user/profile"/>" class="list-group-item list-group-item-action bg-light">Information and contact</a>
                                <a href="<c:url value="/user/favourites"/>" class="list-group-item list-group-item-action bg-light">List product favorites</a>
                                <a href="<c:url value="/user/order-history"/>" class="list-group-item list-group-item-action bg-light active">Orders history</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div style="margin-bottom: 30px">
                                <h2>Orders history</h2>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Order Date</th>
                                            <th scope="col">Total Price</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td><fmt:formatDate value = "${order.orderDate}" pattern="dd/MM/yyyy" /></td>
                                                <td>$ <fmt:formatNumber type="number" value = "${order.totalPrice}" pattern="###.##" /></td>
                                                <td>${order.status}</td>
                                                <td>
                                                    <c:if test="${order.status eq null or order.status eq ''}">
                                                        <a href="${pageContext.request.contextPath}/user/remove-order/${order.id}"
                                                           onclick="return confirm('Are you sure remove order?')" type="button" class="btn btn-danger" style="background-color:#ff4f4f;color: white">Cancel</a>
                                                    </c:if>
                                                    <c:if test="${order.status ne null and order.status ne ''}">
                                                        <button type="button" class="btn btn-danger" disabled style="background-color:#ff4f4f; color: white">Cancel</button>
                                                    </c:if>
                                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/view-order-detail/${order.id}" style="background-color: #3A3D42;color: white">View Detail</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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