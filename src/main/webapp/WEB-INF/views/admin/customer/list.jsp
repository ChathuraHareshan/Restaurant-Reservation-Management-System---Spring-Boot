<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Management - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
        }
        .sidebar a:hover {
            background-color: #007bff;
        }
        .sidebar .active {
            background-color: #007bff;
        }
        .main-content {
            padding: 20px;
        }
        .customer-card {
            transition: transform 0.2s;
        }
        .customer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 p-0 sidebar">
            <div class="text-center py-3 bg-dark">
                <h4 class="text-white">Admin Panel</h4>
            </div>
            <a href="/admin/dashboard">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
            <a href="/customer/admin/list" class="active">
                <i class="fas fa-users"></i> Customer Management
            </a>
            <a href="/admin/tables/list">
                <i class="fas fa-chair"></i> Table Management
            </a>
            <a href="/offers/admin/list">
                <i class="fas fa-tag"></i> Special Offers
            </a>
            <a href="/reservation/admin/list">
                <i class="fas fa-calendar-alt"></i> Reservations
            </a>
            <a href="/review/admin/moderation">
                <i class="fas fa-star"></i> Reviews
            </a>
            <a href="/admin/list">
                <i class="fas fa-user-shield"></i> Admin Management
            </a>
            <a href="/admin/logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>

        <div class="col-md-10 main-content">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2><i class="fas fa-users"></i> Customer Management</h2>
                <div>
                        <span class="badge bg-primary p-2">
                            <i class="fas fa-calendar"></i> <fmt:formatDate value="<%= new java.util.Date() %>" pattern="dd/MM/yyyy"/>
                        </span>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card text-white bg-primary customer-card">
                        <div class="card-body">
                            <h5><i class="fas fa-users"></i> Total Customers</h5>
                            <h2>${totalCustomers}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-warning customer-card">
                        <div class="card-body">
                            <h5><i class="fas fa-crown"></i> Premium Members</h5>
                            <h2>${premiumCount}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-success customer-card">
                        <div class="card-body">
                            <h5><i class="fas fa-user-check"></i> Regular Members</h5>
                            <h2>${regularCount}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-info customer-card">
                        <div class="card-body">
                            <h5><i class="fas fa-chart-line"></i> Total Points</h5>
                            <h2>${totalPoints}</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header bg-secondary text-white">
                    <i class="fas fa-search"></i> Search Customers
                </div>
                <div class="card-body">
                    <form method="get" action="/customer/admin/list" class="row g-3">
                        <div class="col-md-10">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                <input type="text" name="search" class="form-control"
                                       placeholder="Search by name or email..."
                                       value="${searchKeyword}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-search"></i> Search
                            </button>
                        </div>
                    </form>
                    <c:if test="${not empty searchKeyword}">
                        <div class="mt-2">
                            <a href="/customer/admin/list" class="btn btn-sm btn-secondary">
                                <i class="fas fa-times"></i> Clear Search
                            </a>
                            <span class="ms-2">Found ${totalCustomers} results for "${searchKeyword}"</span>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="card">
                <div class="card-header bg-dark text-white">
                    <i class="fas fa-list"></i> Customer List
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover">
                            <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Type</th>
                                <th>Loyalty Points</th>
                                <th>Registered Date</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customers}" var="c">
                                <tr>
                                    <td>${c.id}</td>
                                    <td>
                                        <i class="fas fa-user-circle"></i> ${c.name}
                                    </td>
                                    <td>${c.email}</td>
                                    <td>${c.phone}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.customerType == 'PREMIUM'}">
                                                        <span class="badge bg-warning text-dark">
                                                            <i class="fas fa-crown"></i> Premium
                                                        </span>
                                            </c:when>
                                            <c:otherwise>
                                                        <span class="badge bg-secondary">
                                                            <i class="fas fa-user"></i> Regular
                                                        </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                                <span class="badge bg-info">
                                                    <i class="fas fa-star"></i> ${c.loyaltyPoints} pts
                                                </span>
                                    </td>
                                    <td>${c.registrationDate}</td>
                                    <td>
                                        <a href="/customer/admin/view/${c.id}" class="btn btn-sm btn-info">
                                            <i class="fas fa-eye"></i> View
                                        </a>
                                        <button class="btn btn-sm btn-danger" onclick="deleteCustomer(${c.id})">
                                            <i class="fas fa-trash"></i> Delete
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty customers}">
                                <tr>
                                    <td colspan="8" class="text-center text-muted">
                                        <i class="fas fa-info-circle"></i> No customers found
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
</div>

<script>
    function deleteCustomer(id) {
        if(confirm('Are you sure you want to delete this customer? This will also delete all their reservations and reviews.')) {
            $.ajax({
                url: '/customer/admin/delete/' + id,
                type: 'DELETE',
                success: function(response) {
                    if(response === 'success') {
                        location.reload();
                    } else {
                        alert('Failed to delete customer');
                    }
                },
                error: function() {
                    alert('Error deleting customer');
                }
            });
        }
    }
</script>
</body>
</html>