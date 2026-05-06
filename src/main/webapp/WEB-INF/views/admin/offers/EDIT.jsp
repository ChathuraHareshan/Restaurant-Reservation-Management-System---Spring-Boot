<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Special Offer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-warning text-white">
          <h4>Edit Special Offer</h4>
        </div>
        <div class="card-body">
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>

          <form action="/offers/admin/edit/${offer.id}" method="post">
            <div class="mb-3">
              <label>Offer Title *</label>
              <input type="text" name="title" value="${offer.title}" class="form-control" required>
            </div>

            <div class="mb-3">
              <label>Description *</label>
              <textarea name="description" class="form-control" rows="3" required>${offer.description}</textarea>
            </div>

            <div class="mb-3">
              <label>Discount Percentage *</label>
              <input type="number" name="discountPercentage" value="${offer.discountPercentage}"
                     class="form-control" step="0.01" min="0" max="100" required>
            </div>

            <div class="mb-3">
              <label>Valid From *</label>
              <input type="date" name="validFrom" value="${offer.validFrom}" class="form-control" required>
            </div>

            <div class="mb-3">
              <label>Valid To *</label>
              <input type="date" name="validTo" value="${offer.validTo}" class="form-control" required>
            </div>

            <div class="mb-3 form-check">
              <input type="checkbox" name="isActive" class="form-check-input" ${offer.active ? 'checked' : ''}>
              <label class="form-check-label">Active</label>
            </div>

            <button type="submit" class="btn btn-warning w-100">Update Offer</button>
            <a href="/offers/admin/list" class="btn btn-secondary w-100 mt-2">Cancel</a>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>