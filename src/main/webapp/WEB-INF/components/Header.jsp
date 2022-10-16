<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar scroll</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/shop">shop</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Tài Khoản
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <c:if test="${userdn==null}">
                            <li><a class="dropdown-item" href="/login"><b>Đăng Nhập</b></a></li>
                            <li><a class="dropdown-item" href="/register"><b>Đăng Kí</b> </a></li>
                            <li><a class="dropdown-item" href="#"><b>Quên Mật Khẩu</b> </a></li>
                        </c:if>
                        <c:if test="${userdn!=null}">
                            <li><a class="dropdown-item" href="#"><b>Thông Tin</b></a></li>
                            <li><a class="dropdown-item" href="#"><b>Đổi Mật Khẩu</b> </a></li>
                        </c:if>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <c:if test="${role == '1'}">
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/admin/categori/getall"><b>Quản lý Categori</b></a></li>
                            <li><a class="dropdown-item" href="/admin/card/getall"><b>Quản lý Card</b> </a></li>
                            <li><a class="dropdown-item" href="#"><b>Quản lý Order</b> </a></li>
                            <li><a class="dropdown-item" href="/admin/user/getall"><b>Quản lý User</b> </a></li>
                        </c:if>

                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/logout"><b>Đăng Xuất</b></a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="/cart" tabindex="-1" aria-disabled="true">Cart<span
                            class="badge bg-secondary" style="margin-left: 3px">${cartCount}</span></a>
                </li>
                <c:if test="${userdn==null}">
                    <li class="nav-item">
                        <a class="nav-link " href="login" tabindex="-1" aria-disabled="true">Login</a>
                    </li>
                </c:if>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>