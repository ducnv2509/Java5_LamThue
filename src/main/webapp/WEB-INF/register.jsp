<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<jsp:include page="components/HeadJS.jsp"/>

<body>
<div class="container">
    <div class="container">
        <div class="col-sm-6">
            <h3 class="mt-3" style="margin-top: 10px">Sign Up Now</h3>
            <p>Please fill out this to register</p>
            <form:form action="register" modelAttribute="user" method="post">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" name="firstName" id="firstName" required placeholder="Your Firstname"
                           class="form-control form-control-lg">
                </div>
                <div class="form-group mt-3">
                    <label for="lastName">Last Name</label>
                    <input type="text" name="lastName" id="lastName" required placeholder="Your Lastname"
                           class="form-control form-control-lg">
                </div>
                <div class="form-group mt-3">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control form-control-lg" required minlength="6"
                           placeholder="Email" name="email" id="email" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                        anyone else.</small>
                </div>
                <div class="form-group mt-3">
                    <label for="password">Password</label>
                    <input type="password" class="form-control form-control-lg" required placeholder="Password"
                           name="password" id="password">
                </div>
                <div class="mt-3">
                    <input type="submit" value="Register" class="btn btn-primary btn-block">

                    <span style="margin-top: 10px">Already have an account <a class="linkControl"
                                                                              href="/login">Login here</a></span>
                </div>
            </form:form>
        </div>
    </div>

</div>
<jsp:include page="components/FooterJS.jsp" />
</body>

</html>