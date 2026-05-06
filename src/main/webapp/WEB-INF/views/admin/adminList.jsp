<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Admins</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<div class="container mt-4">
  <h2><i class="fas fa-user-shield"></i> Admin Management</h2>
  <a href="/admin/add" class="btn btn-primary mb-3">
    <i class="fas fa-plus"></i> Add New Admin
  </a>
  <a href="/admin/dashboard" class="btn btn-secondary mb-3">
    <i class="fas fa-arrow-left"></i> Back to Dashboard
  </a>

  <c:if test="${not empty param.error}">
    <div class="alert alert-danger">${param.error}</div>
  </c:if>

  <table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Username</th>
      <th>Email</th>
      <th>Full Name</th>
      <th>Role</th>
      <th>Status</th>
      <th>Last Login</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${admins}" var="a">
      <tr>
        <td>${a.id}</td>
        <td>${a.username}</td>
        <td>${a.email}</td>
        <td>${a.fullName}</td>
        <td>
          <c:choose>
            <c:when test="${a.role == 'SUPER_ADMIN'}">
              <span class="badge bg-danger">Super Admin</span>
            </c:when>
            <c:when test="${a.role == 'MODERATOR'}">
              <span class="badge bg-warning">Moderator</span>
            </c:when>
            <c:otherwise>
              <span class="badge bg-info">Viewer</span>
            </c:otherwise>
          </c:choose>
        </td>
        <td>
          <c:choose>
            <c:when test="${a.active}">
              <span class="badge bg-success">Active</span>
            </c:when>
            <c:otherwise>
              <span class="badge bg-danger">Inactive</span>
            </c:otherwise>
          </c:choose>
        </td>
        <td>${a.lastLogin != null ? a.lastLogin : 'Never'}</td>
        <td>
          <a href="/admin/delete/${a.id}" class="btn btn-sm btn-danger"
             onclick="return confirm('Delete this admin?')">
            <i class="fas fa-trash"></i> Delete
          </a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>