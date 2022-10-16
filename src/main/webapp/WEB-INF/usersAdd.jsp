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
    <h3>Account Infor</h3>
    <form:form action="/admin/users/add" method="post" modelAttribute="userDTO" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm-5">

                <input type="hidden" name="id" value="${userDTO.id}">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" class="form-control" name="email" id="email" value="${userDTO.email}"
                           placeholder="Enter Email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" value="${userDTO.password}"  name="password" id="password"
                           placeholder="Enter Password" required>
                </div>
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" value="${userDTO.firstName}" name="firstName" id="firstName"
                           placeholder="Enter First Name" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control"  value="${userDTO.lastName}"  name="lastName" id="lastName"
                           placeholder="Enter Last Name" required>
                </div>

                <div class="form-group">
                    <label for="roleIds">Roles</label>
                    <select class="form-control" id="roleIds" name="roleIds">
                        <c:forEach items="${roles}" var="role">
                            <option value="${role.id}"  ${role.name == 'ROLE_ADMIN' ? 'selected="selected"' : ''}>
                                    ${role.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="mt-3 btn btn-primary">Submit</button>
                <button type="button" class="mt-3 btn btn-danger" th:onclick="window.location.href='/admin/users'" href="#">
                    Cancel
                </button>
            </div>
        </div>
    </form:form>
</div>

<jsp:include page="components/FooterJS.jsp"/>
</body>
</html>