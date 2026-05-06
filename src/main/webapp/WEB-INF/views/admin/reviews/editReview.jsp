<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Review</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .rating {
      display: flex;
      flex-direction: row-reverse;
      justify-content: flex-end;
    }
    .rating input { display: none; }
    .rating label {
      font-size: 30px;
      color: #ddd;
      cursor: pointer;
    }
    .rating label:hover,
    .rating label:hover ~ label,
    .rating input:checked ~ label {
      color: #ffc107;
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-warning">
          <h4>Edit Your Review</h4>
        </div>
        <div class="card-body">
          <form action="/review/update/${review.id}" method="post">
            <div class="mb-3">
              <label>Rating</label>
              <div class="rating">
                <input type="radio" name="rating" value="5" id="star5" ${review.rating == 5 ? 'checked' : ''}>
                <label for="star5">★</label>
                <input type="radio" name="rating" value="4" id="star4" ${review.rating == 4 ? 'checked' : ''}>
                <label for="star4">★</label>
                <input type="radio" name="rating" value="3" id="star3" ${review.rating == 3 ? 'checked' : ''}>
                <label for="star3">★</label>
                <input type="radio" name="rating" value="2" id="star2" ${review.rating == 2 ? 'checked' : ''}>
                <label for="star2">★</label>
                <input type="radio" name="rating" value="1" id="star1" ${review.rating == 1 ? 'checked' : ''}>
                <label for="star1">★</label>
              </div>
            </div>
            <div class="mb-3">
              <label>Your Review</label>
              <textarea name="comment" class="form-control" rows="5" required>${review.comment}</textarea>
            </div>
            <button type="submit" class="btn btn-warning w-100">Update Review</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>