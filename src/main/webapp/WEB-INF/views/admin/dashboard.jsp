<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    .dashboard-card {
      transition: transform 0.3s;
      cursor: pointer;
    }
    .dashboard-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">
      <i class="fas fa-utensils"></i> Restaurant Admin Panel
    </a>
    <div class="navbar-nav ms-auto">
                <span class="nav-link text-white">
                    <i class="fas fa-user-shield"></i> Welcome, ${admin.fullName}
                </span>
      <a class="nav-link" href="/admin/logout">
        <i class="fas fa-sign-out-alt"></i> Logout
      </a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h1 class="mb-4"><i class="fas fa-tachometer-alt"></i> Dashboard Overview</h1>

  <div class="row">
    <div class="col-md-4 mb-4">
      <div class="card dashboard-card text-white bg-primary h-100" onclick="location.href='/customer/admin/list'">
        <div class="card-body text-center">
          <i class="fas fa-users fa-4x mb-3"></i>
          <h4>Customer Management</h4>
          <p>Manage customers, view profiles, delete accounts</p>
        </div>
      </div>
    </div>

    <div class="col-md-4 mb-4">
      <div class="card dashboard-card text-white bg-success h-100" onclick="location.href='/admin/tables/list'">
        <div class="card-body text-center">
          <i class="fas fa-chair fa-4x mb-3"></i>
          <h4>Table Management</h4>
          <p>Add, edit, delete tables</p>
        </div>
      </div>
    </div>

    <div class="col-md-4 mb-4">
      <div class="card dashboard-card text-white bg-warning h-100" onclick="location.href='/offers/admin/list'">
        <div class="card-body text-center">
          <i class="fas fa-tag fa-4x mb-3"></i>
          <h4>Special Offers</h4>
          <p>Manage promotions and discounts</p>
        </div>
      </div>
    </div>

    <div class="col-md-4 mb-4">
      <div class="card dashboard-card text-white bg-info h-100" onclick="location.href='/reservation/admin/list'">
        <div class="card-body text-center">
          <i class="fas fa-calendar-alt fa-4x mb-3"></i>
          <h4>Reservations</h4>
          <p>View all bookings</p>
        </div>
      </div>
    </div>

    <div class="col-md-4 mb-4">
      <div class="card dashboard-card text-white bg-danger h-100" onclick="location.href='/review/admin/moderation'">
        <div class="card-body text-center">
          <i class="fas fa-star fa-4x mb-3"></i>
          <h4>Review Moderation</h4>
          <p>Approve or reject customer reviews</p>
        </div>
      </div>
    </div>

    <div class="col-md-4 mb-4">
      <div class="card dashboard-card text-white bg-secondary h-100" onclick="location.href='/admin/list'">
        <div class="card-body text-center">
          <i class="fas fa-user-shield fa-4x mb-3"></i>
          <h4>Admin Management</h4>
          <p>Manage admin accounts</p>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  document.querySelectorAll('.dashboard-card').forEach(card => {
    card.style.cursor = 'pointer';
  });
</script>
</body>
</html>