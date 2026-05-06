<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Offers</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h2>Special Offers Management</h2>
  <a href="/offers/admin/add" class="btn btn-primary mb-3">Add New Offer</a>
  <a href="/admin/dashboard" class="btn btn-secondary mb-3">Back to Dashboard</a>

  <table class="table table-bordered">
    <thead class="table-dark">
    <tr><th>ID</th><th>Title</th><th>Discount</th><th>Valid From</th><th>Valid To</th><th>Status</th><th>Actions</th></tr>
    </thead>
    <tbody>
    <c:forEach items="${offers}" var="o">
      <tr>
        <td>${o.id}</td>
        <td>${o.title}</td>
        <td>${o.discountPercentage}%</td>
        <td>${o.validFrom}</td>
        <td>${o.validTo}</td>
        <td>${o.active ? 'Active' : 'Inactive'}</td>
        <td>
          <a href="/offers/admin/delete/${o.id}" class="btn btn-sm btn-danger"
             onclick="return confirm('Delete this offer?')">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>