<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<jsp:include page="components/HeadJS.jsp"/>
<body>
<jsp:include page="components/Header.jsp"/>
<div class="container">
    <div class="row mt-5">
        <div class="col-md-9">
            <div class="card-body">
                <h5 class="mb-4">Cart (<span ${cartCount} 2</span> items)</h5>
                <c:forEach items="${cart}" var="item">
                    <div class="mb-5 p-5">
                        <div class="col-md-5 col-lg-3 col-xl-3">
                            <div class="mb-3 mb-md-0">
                                <img class="img-fluid w-100"
                                     src="/productImages/${item.imageName}"
                                     alt="Sample">

                            </div>
                        </div>
                        <div class="col-md-7 col-lg-9 col-xl-9">
                            <div>
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h5>${item.name}</h5>
                                        <p class="mb-3 text-uppercase small">Weight: <span>${item.weight}</span> grams
                                        </p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <a href="/cart/removeItem/${iStat.index}"
                                           style="text-decoration: none"
                                           type="button"
                                           class="card-link-secondary small text-uppercase mr-3"><i
                                                ></i> Remove item </a>

                                    </div>
                                    <p class="mb-0"><span><strong>$<span>${item.price}</span></strong></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="card-body">

                    <h5 class="mb-3">The total amount </h5>

                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                            Amount Payable
                            <span>$<span>${total}</span></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                            Shipping
                            <span>Gratis</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                            <div>
                                <strong>The total amount of</strong>
                                <strong>
                                    <p class="mb-0">(including VAT)</p>
                                </strong>
                            </div>
                            <span><strong>$<span>${total}</span></strong></span>
                        </li>
                    </ul>

                    <a href="/checkout" class="btn btn-primary btn-block waves-effect waves-light">go to
                        checkout</a>

                </div>
            </div>

        </div>
    </div>
</div>
<!--Main layout-->
</body>

</html>
