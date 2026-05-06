<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add New Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-primary text-white">
          <h4>Add New Admin</h4>
        </div>
        <div class="card-body">
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>

          <form action="/admin/add" method="post">
            <div class="mb-3">
              <label>Username *</label>
              <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Email *</label>
              <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Password *</label>
              <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Full Name *</label>
              <input type="text" name="fullName" class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Role *</label>
              <select name="role" class="form-control" required>
                <option value="MODERATOR">Moderator</option>
                <option value="VIEWER">Viewer</option>
              </select>
              <small class="text-muted">Super Admin role can only be assigned manually</small>
            </div>
            <button type="submit" class="btn btn-primary w-100">Create Admin</button>
            <a href="/admin/list" class="btn btn-secondary w-100 mt-2">Cancel</a>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>