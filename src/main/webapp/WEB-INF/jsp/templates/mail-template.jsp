<link rel="stylesheet" type='text/css' href="https://uc3d77818442ae360007353bad74.previews.dropboxusercontent.com/p/html/AA0XDsA8RQJe-UAXtIH1s5FfJZcnXYBKXGTT6FlDPU_Sc1qihjY-JngLN9Tk1ckRMsDqvU2cJJv52xYLxOMLGqVpcGFt5NM_5pNp-uRru0N1PySuDgmgM7--oW4PTOCkbt3qwDtj-tSqviuoV8AyDegrikWm5FOOV1QnWfXSV2iTqQRfH0j_SrRlnrAjkUe8fBn_Vkkg3ms7i1YCM8n1Cy1InWtb-xvhlI5uMIuiDLcAuQiQI147Qp6D6OsPytINhPz0APte235alr98_gWKEJXgtKddmKB_xMLSfEOZJdfop5vrHS_ssjzxcJPhggOghdSn_kPLrzc7OXZlOh_-GgU7UokVK627wrxUIVSZxSyQSg/p.html">
<body>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <!-- CART TABLE_BLOCK START -->
            <div class="table-responsive">
                <!-- TABLE START -->
                <table class="table table-bordered" id="cart-summary" style="border-collapse: collapse">
                    <!-- TABLE HEADER START -->
                    <thead>
                        <tr>
                            <th class="cart-product" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">Product</th>
                            <th class="cart-description" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">Description</th>
                            <th class="cart-unit text-right" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">Unit price</th>
                            <th class="cart_quantity text-center" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">Qty</th>
                            <th class="cart-total text-right" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">Total</th>
                        </tr>
                    </thead>
                    <!-- TABLE HEADER END -->
                    <!-- TABLE BODY START -->
                    <tbody>	
                        <!-- SINGLE CART_ITEM START -->
                    <c:forEach var="item" items="${sessionCart}">
                        <c:set var="total"
                               value="${total + item.product.price * item.quantity }"></c:set>
                        <tr>
                            <td class="cart-product" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">
                                <img style="max-height: 100px; max-width: 100px;" alt="Blouse" src="<c:url value="/resources/img/product/sale/${item.product.image}"/>">
                            </td>
                            <td class="cart-description" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">
                                <p class="product-name"><a href="<c:url value="/view-detail/${item.product.id}"/>">${item.product.name}</a></p>
                                <small>Intended for :${sessionCart} + ${item.product.object.name}</small>
                                <small>Size : ${item.product.productDetailInOrder.size.name} </small>
                                <small>Color : ${item.product.productDetailInOrder.color.name}</small>
                            </td>
                            <td class="cart-unit" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">
                                <ul class="price text-right">

                                    <li class="price">$<fmt:formatNumber type="number" value = "${item.product.price}" pattern="###.##" /></li>
                                </ul>
                            </td>
                            <td class="cart_quantity text-center" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">
                                <small>${item.quantity}</small>
                            </td>
                            <td class="cart-total" style="border: 1px solid orange;
                                padding: 10px;
                                text-align: left;">
                                <span class="price">$<fmt:formatNumber type="number" value = "${item.product.price * item.quantity}" pattern="###.##" /></span>
                            </td>
                        </tr>
                    </c:forEach>
                    <!-- SINGLE CART_ITEM END -->
                    </tbody>
                    <!-- TABLE BODY END -->
                    <!-- TABLE FOOTER START -->
                    <tfoot>										
                        <tr>
                            <td class="total-price-container text-right" colspan="3">
                                <span>Total</span>
                            </td>
                            <td id="total-price-container" class="price" colspan="1">
                                <span id="total-price" style="color: red; font-size: 1.1rem">$<fmt:formatNumber type="number" value = "${total}" pattern="###.##" /></span>
                            </td>
                        </tr>
                    </tfoot>		
                    <!-- TABLE FOOTER END -->									
                </table>
                <!-- TABLE END -->
            </div>
            <!-- CART TABLE_BLOCK END -->
        </div>
    </div>
</body>
