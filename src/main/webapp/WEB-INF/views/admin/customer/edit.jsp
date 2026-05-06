<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Customer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-primary text-white">
          <h4><i class="fas fa-edit"></i> Edit Customer</h4>
        </div>
        <div class="card-body">
          <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
          </c:if>
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>

          <form action="/customer/admin/update/${customer.id}" method="post">
            <div class="mb-3">
              <label><i class="fas fa-user"></i> Full Name</label>
              <input type="text" name="name" value="${customer.name}" class="form-control" required>
            </div>
            <div class="mb-3">
              <label><i class="fas fa-envelope"></i> Email</label>
              <input type="email" value="${customer.email}" class="form-control" disabled>
              <small class="text-muted">Email cannot be changed</small>
            </div>
            <div class="mb-3">
              <label><i class="fas fa-phone"></i> Phone Number</label>
              <input type="text" name="phone" value="${customer.phone}" class="form-control" required>
            </div>
            <div class="mb-3">
              <label><i class="fas fa-map-marker-alt"></i> Address</label>
              <textarea name="address" class="form-control" rows="3">${customer.address}</textarea>
            </div>
            <div class="mb-3">
              <label><i class="fas fa-tag"></i> Customer Type</label>
              <select name="customerType" class="form-control">
                <option value="REGULAR" ${customer.customerType == 'REGULAR' ? 'selected' : ''}>
                  Regular Member
                </option>
                <option value="PREMIUM" ${customer.customerType == 'PREMIUM' ? 'selected' : ''}>
                  Premium Member (15% discount)
                </option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary w-100">
              <i class="fas fa-save"></i> Save Changes
            </button>
            <a href="/customer/admin/view/${customer.id}" class="btn btn-secondary w-100 mt-2">
              <i class="fas fa-times"></i> Cancel
            </a>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>