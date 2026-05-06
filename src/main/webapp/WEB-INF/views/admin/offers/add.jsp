<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Special Offer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-success text-white">
          <h4>Add Special Offer</h4>
        </div>
        <div class="card-body">
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>

          <form action="/offers/admin/add" method="post">
            <div class="mb-3">
              <label>Offer Title *</label>
              <input type="text" name="title" class="form-control" required
                     placeholder="e.g., Weekend Special">
            </div>

            <div class="mb-3">
              <label>Description *</label>
              <textarea name="description" class="form-control" rows="3" required
                        placeholder="Describe the offer..."></textarea>
            </div>

            <div class="mb-3">
              <label>Discount Percentage *</label>
              <input type="number" name="discountPercentage" class="form-control"
                     step="0.01" min="0" max="100" required>
            </div>

            <div class="mb-3">
              <label>Valid From *</label>
              <input type="date" name="validFrom" class="form-control"
                     min="${LocalDate.now()}" required>
            </div>

            <div class="mb-3">
              <label>Valid To *</label>
              <input type="date" name="validTo" class="form-control"
                     min="${LocalDate.now()}" required>
            </div>

            <button type="submit" class="btn btn-success w-100">Create Offer</button>
            <a href="/offers/admin/list" class="btn btn-secondary w-100 mt-2">Cancel</a>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>