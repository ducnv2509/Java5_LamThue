<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<jsp:include page="components/HeadJS.jsp"/>
<body>
<jsp:include page="components/Header.jsp"/>
<div class="col-md-9">
    <div class="row">
        <div class="col-sm-5 d-flex justify-content-center">
            <img class="mt-5" height="300px" width="300px" src="/productImages/${product.imageName}"
                 alt="">
        </div>
        <div class="col-sm-7 mt-5">
            <h2>${product.name}</h2>
            <p>${product.category.name}</p>
            <h2> ${product.price} $</h2>
            <h5>Weight:
                <span>${product.weight}</span> grams.
            </h5>
            <p>product.description</p>
            <a href="/addToCart/${product.id}" class="btn btn-primary">Add to cart</a>
        </div>
    </div>

</div>
</body>

</html>


