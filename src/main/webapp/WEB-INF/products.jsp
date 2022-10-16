<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<jsp:include page="components/HeadJS.jsp"/>
<body>
<jsp:include page="components/Header.jsp"/>
<div class="container">
    <a href="/admin/products/add" style="margin: 20px 0" class="btn btn-primary">Add Product</a>
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th scope="col">SN</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Preview</th>
            <th scope="col">Delete</th>
            <th scope="col">Update</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${products}" var="product" varStatus="loop">
            <tr>
                <th scope="row">${loop.index + 1}</th>
                <td th:text="">${product.name}</td>
                <td th:text="${product.category.name}">${product.category.name}</td>
                <td><img height="100px" width="100px"  src="/productImages/${product.imageName}"></td>

                <td><a href="/admin/products/delete/${product.id}" class="btn btn-danger">Delete</a></td>
                <td><a  href="/admin/products/update/${product.id}" class="btn btn-warning">Update</a></td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<jsp:include page="components/FooterJS.jsp"/>
</body>
</html>