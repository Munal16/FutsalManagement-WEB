
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product List - Admin Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/productList.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<section class="product-section">
		<div class="container">
			<h1>Product Management</h1>
			<p class="intro-text">Manage futsal gear, refreshments, and other
				products easily.</p>

			<div class="top-actions">
				<div class="add-button"></div>
				<div class="search-box">
					<input type="text" id="searchInput" onkeyup="searchProduct()"
						placeholder="Search by Product Name...">
				</div>
			</div>

			<table class="product-table" id="productTable">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Price (NPR)</th>
						<th>Actions</th>
					</tr>
				</thead>
			</table>
		</div>
	</section>

	<script>
function searchProduct() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("searchInput");
  filter = input.value.toLowerCase();
  table = document.getElementById("productTable");
  tr = table.getElementsByTagName("tr");

  for (i = 1; i < tr.length; i++) { // Start from 1 to skip table header
    td = tr[i].getElementsByTagName("td")[1]; // Name column
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toLowerCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</body>
</html>
