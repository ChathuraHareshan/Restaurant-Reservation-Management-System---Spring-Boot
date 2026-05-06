<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Table</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-warning text-white">
          <h4>Edit Table #${table.tableNumber}</h4>
        </div>
        <div class="card-body">
          <form action="/admin/tables/edit/${table.id}" method="post">
            <div class="mb-3">
              <label>Seating Capacity</label>
              <input type="number" name="seatingCapacity" value="${table.seatingCapacity}"
                     class="form-control" required>
            </div>

            <div class="mb-3">
              <label>Location</label>
              <select name="location" class="form-control" required>
                <option value="INDOOR" ${table.location == 'INDOOR' ? 'selected' : ''}>Indoor</option>
                <option value="OUTDOOR" ${table.location == 'OUTDOOR' ? 'selected' : ''}>Outdoor</option>
              </select>
            </div>

            <div class="mb-3">
              <label>Price per Hour ($)</label>
              <input type="number" name="pricePerHour" value="${table.pricePerHour}"
                     class="form-control" step="0.01" required>
            </div>

            <div class="mb-3 form-check">
              <input type="checkbox" name="isAvailable" class="form-check-input"
              ${table.available ? 'checked' : ''}>
              <label class="form-check-label">Available for booking</label>
            </div>

            <button type="submit" class="btn btn-warning w-100">Update Table</button>
            <a href="/admin/tables/list" class="btn btn-secondary w-100 mt-2">Back</a>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>