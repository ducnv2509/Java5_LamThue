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
    <h3>Product Infor</h3>
    <form:form action="/admin/products/add" method="post" modelAttribute="productDTO" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm-5">
                <input type="hidden" name="id" th:field="*{id}">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" required name="name" id="name"
                           placeholder="Enter name" value = "${productDTO.name}">

                </div>
                <div class="form-group">
                    <label for="categoryId">Select Category</label>
                    <select class="form-control" id="categoryId" name="categoryId">
                        <c:forEach items="${categories}" var="cate">
                            <option value="${cate.id}">
                                    ${cate.name}
                            </option>

                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" required name="price" id="price"
                           placeholder="Price" value = "${productDTO.price}">
                </div>
                <div class="form-group">
                    <label for="weight">Weight in grams</label>
                    <input type="number" class="form-control" required name="weight" id="weight"
                           placeholder="Weight" value = "${productDTO.weight}">
                </div>
                <div class="form-group">
                    <label for="description">Product Description</label>
                    <textarea class="form-control" rows="5"  name="description"
                              id="description">${productDTO.description}</textarea>
                </div>
            </div>
            <div class="col-sm-5">
                <p>Product Image</p>
                <div class="custom-file">
                    <input type="file" class="form-control" name="productImage"
                           accept="image/jpeg, image/png, image/jpg" id="productImage"/>
                    <label class="custom-file-label" for="productImage">Choose file</label>
                </div>
                <div class="form-group">
                    <img id="imgPreview" height="100px" width="100px"
                         src="/productImages/${productDTO.imageName}" style="margin-top: 20px" alt=" ">
                </div>
                <input type="hidden" name="imgName"  value = "${productDTO.imageName}"/>
                <button type="submit" class="btn btn-primary mt-3">Submit</button>
            </div>

        </div>
    </form:form>
</div>

<jsp:include page="components/FooterJS.jsp"/>

<script>
    function readURL(input){
        if(input.files && input.files[0]){
            var reader = new FileReader();
            reader.onload = function(e){
                $('#imgPreview').attr('src', e.target.result).width(100).height(100);
            }
            reader.readAsDataURL(input.files[0])
        }
    }
    $('#productImage').change(function(){
        readURL(this);
    });
    $(".custom-file-input").on("change", function() {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
</script>
</body>
</html>