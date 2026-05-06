<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Customer Management - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="/admin/dashboard">Admin Panel</a>
    <div class="navbar-nav ms-auto">
      <a class="nav-link" href="/admin/dashboard">Dashboard</a>
      <a class="nav-link" href="/admin/logout">Logout</a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h2><i class="fas fa-users"></i> Customer Management</h2>

  <div class="card mb-4">
    <div class="card-body">
      <form method="get" action="/customer/admin/list" class="row g-3">
        <div class="col-md-10">
          <input type="text" name="search" class="form-control"
                 placeholder="Search by name or email..."
                 value="${searchKeyword}">
        </div>
        <div class="col-md-2">
          <button type="submit" class="btn btn-primary w-100">
            <i class="fas fa-search"></i> Search
          </button>
        </div>
      </form>
    </div>
  </div>

  <div class="row mb-4">
    <div class="col-md-3">
      <div class="card text-white bg-primary">
        <div class="card-body">
          <h5>Total Customers</h5>
          <h2>${customers.size()}</h2>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-white bg-success">
        <div class="card-body">
          <h5>Premium Members</h5>
          <h2>${customers.stream().filter(c -> c.customerType == 'PREMIUM').count()}</h2>
        </div>
      </div>
    </div>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered table-striped">
      <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Type</th>
        <th>Loyalty Points</th>
        <th>Registered Date</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${customers}" var="c">
        <tr>
          <td>${c.id}</td>
          <td>${c.name}</td>
          <td>${c.email}</td>
          <td>${c.phone}</td>
          <td>
            <c:choose>
              <c:when test="${c.customerType == 'PREMIUM'}">
                <span class="badge bg-warning">Premium</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-secondary">Regular</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td>${c.loyaltyPoints}</td>
          <td>${c.registrationDate}</td>
          <td>
            <a href="/customer/admin/view/${c.id}" class="btn btn-sm btn-info">
              <i class="fas fa-eye"></i> View
            </a>
            <button class="btn btn-sm btn-danger" onclick="deleteCustomer(${c.id})">
              <i class="fas fa-trash"></i> Delete
            </button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<script>
  function deleteCustomer(id) {
    if(confirm('Are you sure you want to delete this customer?')) {
      $.ajax({
        url: '/customer/admin/delete/' + id,
        type: 'DELETE',
        success: function() {
          location.reload();
        }
      });
    }
  }
</script>
</body>
</html>