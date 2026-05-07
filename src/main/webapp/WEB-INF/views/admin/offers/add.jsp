<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Special Offer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <link rel="stylesheet" href="../../../../css/addOffer.css">

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
        <h2><i class="fas fa-plus-circle"></i> Add Special Offer</h2>
        <p class="text-white-50">Create a new promotion or discount for customers</p>
      </div>

      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="card form-card">
            <div class="card-header">
              <i class="fas fa-gift"></i> Offer Details
            </div>
            <div class="card-body">
              <c:if test="${not empty error}">
                <div id="errorMsg" data-message="${error}" style="display: none;"></div>
              </c:if>

              <form id="offerForm" action="/offers/admin/add" method="post">
                <div class="mb-3">
                  <label class="form-label">
                    <i class="fas fa-heading"></i> Offer Title
                  </label>
                  <div class="input-icon">
                    <i class="fas fa-tag"></i>
                    <input type="text" name="title" id="title" class="form-control"
                           placeholder="e.g., Weekend Special, Happy Hour, Festival Offer" required>
                  </div>
                </div>

                <div class="mb-3">
                  <label class="form-label">
                    <i class="fas fa-align-left"></i> Description
                  </label>
                  <div class="input-icon">
                    <i class="fas fa-pen"></i>
                    <textarea name="description" id="description" class="form-control" rows="4"
                              placeholder="Describe the offer details, terms and conditions..." required></textarea>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label class="form-label">
                        <i class="fas fa-percent"></i> Discount Percentage
                      </label>
                      <div class="input-icon">
                        <i class="fas fa-percent"></i>
                        <input type="number" name="discountPercentage" id="discount" class="form-control"
                               step="0.01" min="0" max="100" placeholder="e.g., 20" required>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label class="form-label">
                        <i class="fas fa-calendar"></i> Valid From
                      </label>
                      <div class="input-icon">
                        <i class="fas fa-calendar-alt"></i>
                        <input type="date" name="validFrom" id="validFrom" class="form-control"
                               min="<fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/>" required>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label class="form-label">
                        <i class="fas fa-calendar-check"></i> Valid To
                      </label>
                      <div class="input-icon">
                        <i class="fas fa-calendar-alt"></i>
                        <input type="date" name="validTo" id="validTo" class="form-control" required>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label class="form-label">
                        <i class="fas fa-clock"></i> Offer Status
                      </label>
                      <div class="input-icon">
                        <i class="fas fa-toggle-on"></i>
                        <select class="form-control" disabled>
                          <option>Active (upon creation)</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>


                <div class="discount-preview" id="discountPreview" style="display: none;">
                  <i class="fas fa-fire" style="color: #e74c3c;"></i>
                  <span class="preview-text" id="previewText"></span>
                  <small class="d-block text-muted">Customers will see this discount on the offers page</small>
                </div>

                <div class="row mt-4">
                  <div class="col-md-6">
                    <button type="submit" class="btn-submit text-white">
                      <i class="fas fa-save"></i> Create Offer
                    </button>
                  </div>
                  <div class="col-md-6">
                    <a href="/offers/admin/list" class="btn-cancel text-white">
                      <i class="fas fa-times"></i> Cancel
                    </a>
                  </div>
                </div>
              </form>
            </div>
          </div>
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


  $('#discount').on('input', function() {
    var discount = $(this).val();
    if(discount && discount > 0) {
      $('#previewText').html(discount + '% OFF on all applicable items!');
      $('#discountPreview').fadeIn();
    } else {
      $('#discountPreview').fadeOut();
    }
  });


  var today = new Date().toISOString().split('T')[0];
  $('#validFrom').attr('min', today);

  $('#validFrom').on('change', function() {
    var fromDate = $(this).val();
    $('#validTo').attr('min', fromDate);
  });


  var errorMsg = $('#errorMsg').data('message');
  if(errorMsg) {
    Swal.fire({
      icon: 'error',
      title: 'Error!',
      text: errorMsg,
      confirmButtonColor: '#e74c3c'
    });
  }


  $('#offerForm').on('submit', function(e) {
    var title = $('#title').val().trim();
    var description = $('#description').val().trim();
    var discount = $('#discount').val();
    var validFrom = $('#validFrom').val();
    var validTo = $('#validTo').val();

    if(title === '') {
      e.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'Title Required',
        text: 'Please enter an offer title',
        confirmButtonColor: '#e74c3c'
      });
      return false;
    }

    if(description === '') {
      e.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'Description Required',
        text: 'Please enter offer description',
        confirmButtonColor: '#e74c3c'
      });
      return false;
    }

    if(!discount || discount <= 0) {
      e.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'Invalid Discount',
        text: 'Please enter a valid discount percentage (1-100)',
        confirmButtonColor: '#e74c3c'
      });
      return false;
    }

    if(!validFrom) {
      e.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'Start Date Required',
        text: 'Please select the offer start date',
        confirmButtonColor: '#e74c3c'
      });
      return false;
    }

    if(!validTo) {
      e.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'End Date Required',
        text: 'Please select the offer end date',
        confirmButtonColor: '#e74c3c'
      });
      return false;
    }

    if(validFrom > validTo) {
      e.preventDefault();
      Swal.fire({
        icon: 'error',
        title: 'Invalid Date Range',
        text: 'End date must be after start date',
        confirmButtonColor: '#e74c3c'
      });
      return false;
    }

    Swal.fire({
      title: 'Creating Offer...',
      text: 'Please wait',
      allowOutsideClick: false,
      didOpen: () => {
        Swal.showLoading();
      }
    });

    return true;
  });
</script>
</body>
</html>