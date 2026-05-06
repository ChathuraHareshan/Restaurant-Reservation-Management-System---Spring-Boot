<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Reservation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-warning text-white">
          <h4>Edit Reservation #${reservation.id}</h4>
        </div>
        <div class="card-body">
          <form action="/reservation/admin/update/${reservation.id}" method="post">
            <div class="mb-3">
              <label>Date</label>
              <input type="date" name="date" value="${reservation.reservationDate}"
                     class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Time</label>
              <input type="time" name="time" value="${reservation.reservationTime}"
                     class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Party Size</label>
              <input type="number" name="partySize" value="${reservation.partySize}"
                     class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Special Requests</label>
              <textarea name="specialRequests" class="form-control" rows="3">${reservation.specialRequests}</textarea>
            </div>
            <div class="mb-3">
              <label>Status</label>
              <select name="status" class="form-control">
                <option value="PENDING" ${reservation.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                <option value="CANCELLED" ${reservation.status == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                <option value="CONFIRMED" ${reservation.status == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
                <option value="COMPLETED" ${reservation.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
              </select>
            </div>
            <button type="submit" class="btn btn-warning w-100">Update Reservation</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>