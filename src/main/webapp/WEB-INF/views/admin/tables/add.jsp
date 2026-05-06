<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add New Table</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-primary text-white">
          <h4>Add New Table</h4>
        </div>
        <div class="card-body">
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>

          <form action="/admin/tables/add" method="post">
            <div class="mb-3">
              <label>Table Number *</label>
              <input type="number" name="tableNumber" class="form-control" required>
              <small class="text-muted">Unique table number</small>
            </div>

            <div class="mb-3">
              <label>Seating Capacity *</label>
              <input type="number" name="seatingCapacity" class="form-control" min="1" max="20" required>
            </div>

            <div class="mb-3">
              <label>Location *</label>
              <select name="location" class="form-control" required>
                <option value="INDOOR">Indoor</option>
                <option value="OUTDOOR">Outdoor</option>
              </select>
            </div>

            <div class="mb-3">
              <label>Price per Hour ($) *</label>
              <input type="number" name="pricePerHour" class="form-control" step="0.01" required>
            </div>

            <div class="mb-3 form-check">
              <input type="checkbox" name="weatherProtected" class="form-check-input">
              <label class="form-check-label">Weather Protected (Outdoor only)</label>
            </div>

            <button type="submit" class="btn btn-primary w-100">Add Table</button>
            <a href="/admin/tables/list" class="btn btn-secondary w-100 mt-2">Cancel</a>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>