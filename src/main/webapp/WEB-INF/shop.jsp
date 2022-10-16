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
    <jsp:include page="components/Category.jsp"/>
    <jsp:include page="components/Product.jsp"/>
</div>

<jsp:include page="components/FooterJS.jsp"/>
</body>

</html>