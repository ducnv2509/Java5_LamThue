<%@ page contentType="text/html; ISO-8859-1" language="java" %>

<!doctype html>
<html lang="en">

<jsp:include page="components/HeadJS.jsp"/>

<body>
<div class="container">
    <jsp:include page="components/Header.jsp"/>
    <!-- <div class="jumbotron text-center">
        <h1 class="display-4">Welcome </h1>
        <p>Take a trip to the Cloudy Store</p>
        <form th:action="@{/users/add}">
            <button type="submit" class="btn btn-primary">Manage your Account</button>
        </form>
    </div> -->
    <jsp:include page="components/Carouse.jsp"/>

</div>


<!-- Bootstrap JavaScript Libraries -->
<jsp:include page="components/FooterJS.jsp"/>
</body>

</html>