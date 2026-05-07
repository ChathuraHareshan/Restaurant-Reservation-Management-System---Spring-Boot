<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Special Offers</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <link rel="stylesheet" href="../../../../css/offerManager.css">

</head>
<body>
<button class="menu-toggle" id="menuToggle">
  <i class="fas fa-bars"></i> Menu
</button>

<div class="container-fluid">
  <div class="row">
    <div class="col-md-2 p-0 sidebar" id="sidebar">
      <div class="brand">
        <h4><i class="fas fa-utensils"></i> Admin Panel</h4>
        <p>Restaurant Management</p>
      </div>
      <div class="nav flex-column">
        <a href="/admin/dashboard" class="nav-link">
          <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="/customer/admin/list" class="nav-link">
          <i class="fas fa-users"></i> Customer Management
        </a>
        <a href="/admin/tables/list" class="nav-link">
          <i class="fas fa-chair"></i> Table Management
        </a>
        <a href="/offers/admin/list" class="nav-link active">
          <i class="fas fa-tag"></i> Special Offers
        </a>
        <a href="/reservation/admin/list" class="nav-link">
          <i class="fas fa-calendar-alt"></i> Reservations
        </a>
        <a href="/review/admin/moderation" class="nav-link">
          <i class="fas fa-star"></i> Review Moderation
        </a>
        <a href="/admin/list" class="nav-link">
          <i class="fas fa-user-shield"></i> Admin Management
        </a>
        <a href="/admin/logout" class="nav-link">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </div>
    </div>

    <div class="col-md-10 main-content">
      <div class="page-title">
        <h2><i class="fas fa-tag"></i> Special Offers Management</h2>
        <p class="text-white-50">Create and manage promotional discounts for customers</p>
      </div>

      <div class="row mb-4">
        <div class="col-md-4 mb-3">
          <div class="stats-card">
            <div class="stats-icon">
              <i class="fas fa-tag" style="color: #e74c3c;"></i>
            </div>
            <div class="stats-number">${totalOffers}</div>
            <div class="stats-label">Total Offers</div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="stats-card">
            <div class="stats-icon">
              <i class="fas fa-check-circle" style="color: #27ae60;"></i>
            </div>
            <div class="stats-number">${activeCount}</div>
            <div class="stats-label">Active Offers</div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="stats-card">
            <div class="stats-icon">
              <i class="fas fa-chart-line" style="color: #3498db;"></i>
            </div>
            <div class="stats-number">${maxDiscount}%</div>
            <div class="stats-label">Max Discount</div>
          </div>
        </div>
      </div>

      <div class="action-buttons">
        <a href="/offers/admin/add" class="btn-add">
          <i class="fas fa-plus"></i> Add New Offer
        </a>
        <a href="/admin/dashboard" class="btn-back">
          <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
      </div>

      <div class="offer-table">
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead class="table-header">
            <tr>
              <th>ID</th>
              <th>Title</th>
              <th>Discount</th>
              <th>Valid From</th>
              <th>Valid To</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${offers}" var="o">
              <tr>
                <td>${o.id}</td>
                <td>
                  <i class="fas fa-gift" style="color: #e74c3c;"></i> ${o.title}
                </td>
                <td class="discount-cell">${o.discountPercentage}% OFF</td>
                <td>${o.validFromStr}</td>
                <td>${o.validToStr}</td>
                <td>
                  <c:choose>
                    <c:when test="${o.active}">
                                                    <span class="badge-active">
                                                        <i class="fas fa-check-circle"></i> Active
                                                    </span>
                    </c:when>
                    <c:otherwise>
                                                    <span class="badge-inactive">
                                                        <i class="fas fa-times-circle"></i> Inactive
                                                    </span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <button class="btn-delete text-white" onclick="deleteOffer(${o.id})">
                    <i class="fas fa-trash"></i> Delete
                  </button>
                </td>

            </c:forEach>
            <c:if test="${empty offers}">
              <tr>
                <td colspan="7" class="text-center py-5">
                  <i class="fas fa-info-circle fa-2x text-muted mb-2 d-block"></i>
                  <span class="text-muted">No offers found. Click "Add New Offer" to create one.</span>
                </td>
              </tr>
            </c:if>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
  $('#menuToggle').click(function() {
    $('#sidebar').toggleClass('show');
  });

  $(document).click(function(event) {
    if (!$(event.target).closest('#sidebar').length && !$(event.target).closest('#menuToggle').length) {
      if ($('#sidebar').hasClass('show')) {
        $('#sidebar').removeClass('show');
      }
    }
  });

  function deleteOffer(id) {
    Swal.fire({
      title: 'Delete Offer?',
      text: 'This action cannot be undone. The offer will be permanently removed.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#e74c3c',
      cancelButtonColor: '#6c757d',
      confirmButtonText: 'Yes, delete it',
      cancelButtonText: 'Cancel'
    }).then((result) => {
      if(result.isConfirmed) {
        window.location.href = '/offers/admin/delete/' + id;
      }
    });
  }

  $('.stats-number').each(function() {
    var $this = $(this);
    var target = parseInt($this.text());
    if(target > 0 && !isNaN(target)) {
      var current = 0;
      var interval = setInterval(function() {
        if(current <= target) {
          $this.text(current);
          current++;
        } else {
          clearInterval(interval);
        }
      }, 30);
    }
  });
</script>
</body>
</html>