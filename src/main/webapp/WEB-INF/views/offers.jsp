<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Special Offers - Restaurant Reservation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=1600') no-repeat center center fixed;
      background-size: cover;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body::before {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.6);
      z-index: -1;
    }

    .navbar {
      background: rgba(0, 0, 0, 0.85) !important;
      backdrop-filter: blur(5px);
    }

    .navbar-brand {
      font-weight: 600;
      color: #e74c3c !important;
    }

    .nav-link {
      color: white !important;
      transition: 0.3s;
    }

    .nav-link:hover {
      color: #e74c3c !important;
    }

    .offers-header {
      background: linear-gradient(135deg, #e74c3c, #c0392b);
      padding: 30px;
      text-align: center;
      color: white;
      border-radius: 20px;
      margin-bottom: 30px;
    }

    .offers-header i {
      font-size: 50px;
      margin-bottom: 15px;
    }

    .offers-header h2 {
      font-size: 28px;
      font-weight: 600;
      margin-bottom: 10px;
    }

    .offers-header p {
      opacity: 0.9;
      font-size: 14px;
    }

    .stats-row {
      margin-bottom: 40px;
    }

    .stat-card {
      background: white;
      border-radius: 16px;
      padding: 20px;
      text-align: center;
      transition: all 0.3s ease;
      box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    }

    .stat-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    }

    .stat-icon {
      width: 60px;
      height: 60px;
      background: rgba(231, 76, 60, 0.1);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 12px;
    }

    .stat-icon i {
      font-size: 28px;
    }

    .stat-value {
      font-size: 28px;
      font-weight: 700;
      color: #2c3e50;
    }

    .stat-label {
      font-size: 13px;
      color: #6c757d;
      margin-top: 5px;
    }

    .offer-card {
      background: white;
      border-radius: 20px;
      overflow: hidden;
      transition: all 0.3s ease;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      height: 100%;
      position: relative;
    }

    .offer-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    }

    .offer-tag {
      position: absolute;
      top: 15px;
      left: 15px;
      background: #e74c3c;
      color: white;
      padding: 5px 15px;
      border-radius: 30px;
      font-size: 12px;
      font-weight: 600;
      z-index: 1;
    }

    .offer-image {
      background: linear-gradient(135deg, #e74c3c, #c0392b);
      padding: 25px;
      text-align: center;
      position: relative;
    }

    .offer-image i {
      font-size: 45px;
      color: white;
    }

    .discount-circle {
      position: absolute;
      bottom: -25px;
      right: 20px;
      width: 70px;
      height: 70px;
      background: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .discount-circle span {
      color: #e74c3c;
      font-size: 20px;
      font-weight: 700;
    }

    .discount-circle small {
      font-size: 12px;
      font-weight: normal;
    }

    .offer-content {
      padding: 25px 20px 20px;
      text-align: center;
    }

    .offer-title {
      font-size: 18px;
      font-weight: 700;
      color: #2c3e50;
      margin-bottom: 10px;
    }

    .offer-description {
      font-size: 13px;
      color: #6c757d;
      margin-bottom: 15px;
      line-height: 1.5;
    }

    .offer-date {
      background: #f8f9fa;
      padding: 8px 12px;
      border-radius: 30px;
      font-size: 11px;
      color: #6c757d;
      display: inline-block;
      margin-bottom: 15px;
    }

    .offer-date i {
      margin-right: 5px;
      color: #e74c3c;
    }

    .btn-claim {
      background: linear-gradient(135deg, #e74c3c, #c0392b);
      border: none;
      border-radius: 50px;
      padding: 10px 25px;
      color: white;
      font-weight: 600;
      font-size: 14px;
      transition: all 0.3s ease;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }

    .btn-claim:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
      color: white;
    }

    .empty-state {
      text-align: center;
      padding: 60px 20px;
      background: white;
      border-radius: 20px;
    }

    .empty-state i {
      font-size: 60px;
      color: #e74c3c;
      margin-bottom: 20px;
      opacity: 0.5;
    }

    .empty-state h4 {
      color: #2c3e50;
      margin-bottom: 10px;
    }

    .cta-section {
      background: white;
      border-radius: 20px;
      padding: 35px;
      text-align: center;
      margin-top: 40px;
    }

    .cta-section h4 {
      color: #2c3e50;
      margin-bottom: 10px;
      font-size: 22px;
    }

    .cta-section p {
      color: #6c757d;
      margin-bottom: 20px;
    }

    .btn-book {
      background: linear-gradient(135deg, #e74c3c, #c0392b);
      border: none;
      border-radius: 50px;
      padding: 12px 35px;
      color: white;
      font-weight: 600;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      transition: 0.3s;
    }

    .btn-book:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
      color: white;
    }

    @media (max-width: 768px) {
      .offers-header {
        padding: 20px;
      }
      .offers-header i {
        font-size: 35px;
      }
      .offers-header h2 {
        font-size: 22px;
      }
      .stat-value {
        font-size: 22px;
      }
      .stat-icon {
        width: 50px;
        height: 50px;
      }
      .stat-icon i {
        font-size: 22px;
      }
      .offer-title {
        font-size: 16px;
      }
      .cta-section h4 {
        font-size: 18px;
      }
    }
  </style>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="/customer/dashboard">
      <i class="fas fa-utensils"></i> Restaurant Reservation
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="/customer/dashboard">
            <i class="fas fa-tachometer-alt"></i> Dashboard
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/reservation/my">
            <i class="fas fa-calendar-check"></i> My Reservations
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/menu/view">
            <i class="fas fa-utensil-spoon"></i> Menu
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/offers/view">
            <i class="fas fa-tag"></i> Offers
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/customer/logout">
            <i class="fas fa-sign-out-alt"></i> Logout
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <div class="offers-header">
    <i class="fas fa-gift"></i>
    <h2>Special Offers & Promotions</h2>
    <p>Enjoy exclusive deals and save more on your dining experience</p>
  </div>

  <div class="row stats-row">
    <div class="col-md-3 col-6 mb-3">
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fas fa-fire" style="color: #e74c3c;"></i>
        </div>
        <div class="stat-value">${offers.size()}</div>
        <div class="stat-label">Active Offers</div>
      </div>
    </div>
    <div class="col-md-3 col-6 mb-3">
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fas fa-percent" style="color: #f1c40f;"></i>
        </div>
        <div class="stat-value">Up to 50%</div>
        <div class="stat-label">Discount</div>
      </div>
    </div>
    <div class="col-md-3 col-6 mb-3">
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fas fa-calendar-week" style="color: #27ae60;"></i>
        </div>
        <div class="stat-value">Limited</div>
        <div class="stat-label">Time Offer</div>
      </div>
    </div>
    <div class="col-md-3 col-6 mb-3">
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fas fa-smile" style="color: #3498db;"></i>
        </div>
        <div class="stat-value">100%</div>
        <div class="stat-label">Satisfaction</div>
      </div>
    </div>
  </div>

  <c:choose>
    <c:when test="${empty offers}">
      <div class="empty-state">
        <i class="fas fa-tag"></i>
        <h4>No Active Offers</h4>
        <p class="text-muted">There are no active offers at the moment. Please check back later!</p>
        <a href="/reservation/new" class="btn-book mt-3">
          <i class="fas fa-calendar-plus"></i> Book a Table
        </a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="row">
        <c:forEach items="${offers}" var="offer">
          <div class="col-md-4 mb-4">
            <div class="offer-card">
              <div class="offer-tag">
                <i class="fas fa-fire"></i> HOT OFFER
              </div>
              <div class="offer-image">
                <i class="fas fa-percent"></i>
                <div class="discount-circle">
                  <span>${offer.discountPercentage}<small>%</small></span>
                </div>
              </div>
              <div class="offer-content">
                <h4 class="offer-title">${offer.title}</h4>
                <p class="offer-description">${offer.description}</p>
                <div class="offer-date">
                  <i class="fas fa-calendar-alt"></i>
                    ${offer.validFrom} - ${offer.validTo}
                </div>
                <a href="/reservation/new" class="btn-claim">
                  Claim Offer <i class="fas fa-arrow-right"></i>
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>

  <div class="cta-section">
    <h4>Ready to Dine With Us?</h4>
    <p>Book your table now and enjoy our delicious food with amazing offers</p>
    <a href="/reservation/new" class="btn-book">
      <i class="fas fa-calendar-plus"></i> Book a Table
    </a>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>