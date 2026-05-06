<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Table Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h2>Table Management</h2>
  <a href="/admin/tables/add" class="btn btn-primary mb-3">Add New Table</a>
  <a href="/admin/dashboard" class="btn btn-secondary mb-3">Back to Dashboard</a>

  <table class="table table-bordered">
    <thead class="table-dark">
    <tr><th>ID</th><th>Table #</th><th>Capacity</th><th>Location</th><th>Price/Hour</th><th>Status</th><th>Actions</th></tr>
    </thead>
    <tbody>
    <c:forEach items="${tables}" var="t">
      <tr>
        <td>${t.id}</td>
        <td>${t.tableNumber}</td>
        <td>${t.seatingCapacity}</td>
        <td>${t.location}</td>
        <td>$${t.pricePerHour}</td>
        <td>${t.available ? 'Available' : 'Booked'}</td>
        <td>
          <a href="/admin/tables/edit/${t.id}" class="btn btn-sm btn-warning">Edit</a>
          <a href="/admin/tables/delete/${t.id}" class="btn btn-sm btn-danger"
             onclick="return confirm('Delete this table?')">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>