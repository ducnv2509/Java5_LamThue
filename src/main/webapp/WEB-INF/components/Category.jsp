<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-3 justify-content-center">
    <div class="card" style="width: 18rem;">
        <ul class="list-group list-group-flush">
            <c:forEach items="${categories}" var="i" varStatus="loop">
                <a  href="/shop/category/${i.id}" style="text-decoration:none">
                    <li class="list-group-item">${i.name}</li>
                </a>
            </c:forEach>
        </ul>
    </div>
</div>