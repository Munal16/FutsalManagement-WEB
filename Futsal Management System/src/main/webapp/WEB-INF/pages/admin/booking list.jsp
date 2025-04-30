
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Booking List - Admin Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/booking list.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<section class="booking-section">
		<div class="container">
			<h1>Booking Management</h1>
			<p class="intro-text">Manage all Futsal bookings. Add, Update,
				Delete or Search bookings easily!</p>

			<div class="top-actions">
				<div class="add-button">
					<a href="${pageContext.request.contextPath}/addBooking" class="btn">
						Add New Booking</a>
				</div>
				<div class="search-box">
					<input type="text" id="searchInput" onkeyup="searchTable()"
						placeholder=" Search by Customer Name...">
				</div>
			</div>

			<table class="booking-table" id="bookingTable">
				<thead>
					<tr>
						<th>Booking ID</th>
						<th>Customer Name</th>
						<th>Contact</th>
						<th>Booking Date</th>
						<th>Time Slot</th>
						<th>Court Name</th>
						<th>Actions</th>
					</tr>
				</thead>
			</table>
		</div>
	</section>

	<script>
function searchTable() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("searchInput");
  filter = input.value.toLowerCase();
  table = document.getElementById("bookingTable");
  tr = table.getElementsByTagName("tr");

  for (i = 1; i < tr.length; i++) { // Start from 1 to skip the header
    td = tr[i].getElementsByTagName("td")[1]; // Customer Name column
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
