<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<jsp:include page="components/HeadJS.jsp"/>
<body>
<jsp:include page="components/Header.jsp"/>
<div class="row p-4">
    <div class="container">

        <a href="/admin/users/add" style="margin: 20px 0" class="btn btn-primary">Add Account</a>
        <table class="table">
            <thead class="thead-light">
            <tr>
                <th scope="col">SN</th>
                <th scope="col">Email</th>
                <th scope="col">Delete</th>
                <th scope="col">Update</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user" varStatus="loop">
                <tr>
                    <th scope="row" >${loop.index + 1}</th>
                    <td >${user.email}</td>
                    <td><a href="/admin/users/delete/${user.id}" class="btn btn-danger">Delete</a></td>
                    <td><a href="/admin/users/update/${user.id}" class="btn btn-warning">Update</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="components/FooterJS.jsp"/>
</body>

</html>