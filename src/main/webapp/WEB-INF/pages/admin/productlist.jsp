<%@ page import="java.util.*" %>
<%@ page import="com.futsal.model.productmodel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product list.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="container">

    <div class="header">
        <h1>Product Management</h1>
       <form action="${pageContext.request.contextPath}/logout" method="post" class="logout-form">
            <button type="submit" class="logout-btn">Logout</button>
            <a href="${pageContext.request.contextPath}/dashboard" class="back-link">← Back to Dashboard</a>
        </form>
    </div>



    <table id="productTable" class="product-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price (NPR)</th>
            <th>Quantity</th>
            <th>Image URL</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<productmodel> products = (List<productmodel>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (productmodel product : products) {
        %>
        <tr>
            <form method="post" action="productlist">
                <td><%= product.getProductId() %><input type="hidden" name="id" value="<%= product.getProductId() %>"></td>
                <td><input type="text" name="name" value="<%= product.getProductName() %>" required></td>
                <td><input type="text" name="price" value="<%= product.getProductPrice() %>" required></td>
                <td><input type="text" name="quantity" value="<%= product.getQuantity() %>" required></td>
                <td><input type="text" name="imageUrl" value="<%= product.getImageUrl() %>"></td>
                <td>
                    <button type="submit" class="btn edit-btn">Update</button>
                    <a href="productlist?action=delete&id=<%= product.getProductId() %>" class="btn delete-btn"
                       onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </form>
        </tr>
        <%
                }
            }
        %>

        <!-- Add New Product Row -->
        <tr class="add-form">
            <form method="post" action="productlist">
                <td>New</td>
                <td><input type="text" name="name" placeholder="Enter name" required></td>
                <td><input type="text" name="price" placeholder="Enter price" required></td>
                <td><input type="text" name="quantity" placeholder="Enter quantity" required></td>
                <td><input type="text" name="imageUrl" placeholder="Image URL (optional)"></td>
                <td><button type="submit" class="btn save-btn">Add</button></td>
            </form>
        </tr>

        <% if (products == null || products.isEmpty()) { %>
        <tr>
            <td colspan="6">No products available!</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
    function searchProduct() {
        var input = document.getElementById("searchInput");
        var filter = input.value.toLowerCase();
        var table = document.getElementById("productTable");
        var tr = table.getElementsByTagName("tr");

        for (var i = 1; i < tr.length; i++) {
            var td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                var txtValue = td.textContent || td.innerText;
                tr[i].style.display = txtValue.toLowerCase().indexOf(filter) > -1 ? "" : "none";
            }
        }
    }
</script>

</body>
</html>
