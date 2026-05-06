<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>All Reservations - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
  <h2><i class="fas fa-calendar-alt"></i> All Reservations</h2>

  <div class="card mb-4">
    <div class="card-header bg-info text-white">
      <h5>Search Filters</h5>
    </div>
    <div class="card-body">
      <form method="get" action="/reservation/admin/list" class="row g-3">
        <div class="col-md-3">
          <label>Date</label>
          <input type="date" name="date" class="form-control" value="${param.date}">
        </div>
        <div class="col-md-3">
          <label>Customer Name</label>
          <input type="text" name="customerName" class="form-control"
                 placeholder="Search by name" value="${param.customerName}">
        </div>
        <div class="col-md-3">
          <label>Table Number</label>
          <select name="tableId" class="form-control">
            <option value="">All Tables</option>
            <option value="1" ${param.tableId == 1 ? 'selected' : ''}>Table 1</option>
            <option value="2" ${param.tableId == 2 ? 'selected' : ''}>Table 2</option>
            <option value="3" ${param.tableId == 3 ? 'selected' : ''}>Table 3</option>
            <option value="4" ${param.tableId == 4 ? 'selected' : ''}>Table 4</option>
            <option value="5" ${param.tableId == 5 ? 'selected' : ''}>Table 5</option>
          </select>
        </div>
        <div class="col-md-3">
          <label>&nbsp;</label>
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
          <h6>Total Reservations</h6>
          <h3>${reservations.size()}</h3>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-white bg-success">
        <div class="card-body">
          <h6>Confirmed</h6>
          <h3>${reservations.stream().filter(r -> r.status == 'CONFIRMED').count()}</h3>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-white bg-warning">
        <div class="card-body">
          <h6>Pending</h6>
          <h3>${reservations.stream().filter(r -> r.status == 'PENDING').count()}</h3>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-white bg-danger">
        <div class="card-body">
          <h6>Cancelled</h6>
          <h3>${reservations.stream().filter(r -> r.status == 'CANCELLED').count()}</h3>
        </div>
      </div>
    </div>
  </div>


  <div class="table-responsive">
    <table class="table table-bordered table-striped">
      <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Customer</th>
        <th>Table</th>
        <th>Date</th>
        <th>Time</th>
        <th>Guests</th>
        <th>Status</th>
        <th>Special Requests</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${reservations}" var="r">
        <tr>
          <td>${r.id}</td>
          <td>${r.customerName}</td>
          <td>Table ${r.tableNumber}</td>
          <td>${r.reservationDate}</td>
          <td>${r.reservationTime}</td>
          <td>${r.partySize}</td>
          <td>
            <c:choose>
              <c:when test="${r.status == 'CONFIRMED'}">
                <span class="badge bg-success">Confirmed</span>
              </c:when>
              <c:when test="${r.status == 'PENDING'}">
                <span class="badge bg-warning">Pending</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-danger">${r.status}</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td>${r.specialRequests}</td>
          <td>
            <c:if test="${r.status == 'CONFIRMED'}">
              <a href="/reservation/admin/complete/${r.id}" class="btn btn-sm btn-success"
                 onclick="return confirm('Mark this reservation as completed? This will add loyalty points to the customer.')">
                <i class="fas fa-check-double"></i> Complete & Add Points
              </a>
            </c:if>
            <a href="/reservation/admin/edit/${r.id}" class="btn btn-sm btn-warning">
              <i class="fas fa-edit"></i> Edit
            </a>
            <a href="/reservation/admin/delete/${r.id}" class="btn btn-sm btn-danger"
               onclick="return confirm('Cancel this reservation?')">
              <i class="fas fa-times"></i> Cancel
            </a>

          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>