<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Review Moderation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<div class="container mt-4">
  <h2><i class="fas fa-comments"></i> Review Moderation Panel</h2>

  <div class="row mb-4">
    <div class="col-md-3">
      <div class="card text-white bg-info">
        <div class="card-body">
          <h6>Average Rating</h6>
          <h2>${stats.averageRating != null ? String.format("%.1f", stats.averageRating) : 'N/A'}/5.0</h2>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-white bg-success">
        <div class="card-body">
          <h6>Total Reviews</h6>
          <h2>${stats.totalReviews}</h2>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-white bg-warning">
        <div class="card-body">
          <h6>5-Star Reviews</h6>
          <h2>${stats.fiveStarCount}</h2>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-white bg-danger">
        <div class="card-body">
          <h6>Pending Approval</h6>
          <h2>${pendingReviews.size()}</h2>
        </div>
      </div>
    </div>
  </div>

  <h3>Pending Reviews</h3>
  <c:forEach items="${pendingReviews}" var="review">
    <div class="card mb-3 border-warning">
      <div class="card-body">
        <div class="d-flex justify-content-between">
          <h5>${review.customerName}</h5>
          <div>Rating: <c:forEach begin="1" end="${review.rating}">⭐</c:forEach></div>
        </div>
        <p>${review.comment}</p>
        <small class="text-muted">${review.createdAt}</small>
        <div class="mt-2">
          <a href="/review/admin/approve/${review.id}" class="btn btn-success btn-sm">
            <i class="fas fa-check"></i> Approve
          </a>
          <a href="/review/admin/reject/${review.id}" class="btn btn-danger btn-sm"
             onclick="return confirm('Reject this review?')">
            <i class="fas fa-times"></i> Reject
          </a>
        </div>
      </div>
    </div>
  </c:forEach>

  <h3 class="mt-4">All Reviews</h3>
  <table class="table table-bordered">
    <thead class="table-dark">
    <tr><th>Customer</th><th>Rating</th><th>Comment</th><th>Status</th><th>Date</th><th>Actions</th></tr>
    </thead>
    <tbody>
    <c:forEach items="${allReviews}" var="review">
      <tr>
        <td>${review.customerName}</td>
        <td><c:forEach begin="1" end="${review.rating}">⭐</c:forEach></td>
        <td>${review.comment}</td>
        <td>${review.approved ? 'Approved' : 'Pending'}</td>
        <td>${review.createdAt}</td>
        <td>
          <c:if test="${!review.approved}">
            <a href="/review/admin/approve/${review.id}" class="btn btn-sm btn-success">Approve</a>
          </c:if>
          <a href="/review/admin/reject/${review.id}" class="btn btn-sm btn-danger">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>