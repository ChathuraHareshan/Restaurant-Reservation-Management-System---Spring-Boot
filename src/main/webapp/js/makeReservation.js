

$(document).ready(function() {
    if(allTables.length > 0) {
        displayTables(allTables);
    } else {
        $('#tablesContainer').html('<div class="alert alert-warning">No tables available</div>');
    }

    var today = new Date().toISOString().split('T')[0];
    $('#date').attr('min', today);

    var errorMsg = $('#errorMsg').data('message');
    if(errorMsg) {
        Swal.fire({
            icon: 'error',
            title: 'Booking Failed',
            text: errorMsg,
            confirmButtonColor: '#e74c3c'
        });
    }


    $(document).on('click', '.table-card:not(.unavailable)', function() {
        $('.table-card').removeClass('selected');
        $(this).addClass('selected');
        $('#tableId').val($(this).data('table-id'));
        $('#submitBtn').prop('disabled', false);
    });



    function displayTables(tables) {
        if(!tables || tables.length === 0) {
            $('#tablesContainer').html('<div class="alert alert-info">No tables available</div>');
            return;
        }

        var html = '';
        for(var i = 0; i < tables.length; i++) {
            var table = tables[i];
            var isAvailable = table.isAvailable !== undefined ? table.isAvailable : true;
            var unavailableClass = !isAvailable ? 'unavailable' : '';
            var badge = isAvailable ? '<span class="availability-badge badge-available">Available</span>' : '<span class="availability-badge badge-booked">Booked</span>';

            var iconHtml = '';
            var locationText = '';
            var iconClass = '';

            if(table.location === 'INDOOR') {
                iconHtml = '<i class="fas fa-building table-icon" style="color: #3498db;"></i>';
                locationText = 'Indoor';
                iconClass = 'fa-building';
            } else if(table.location === 'OUTDOOR') {
                iconHtml = '<i class="fas fa-umbrella-beach table-icon" style="color: #f1c40f;"></i>';
                locationText = 'Outdoor';
                iconClass = 'fa-umbrella-beach';
            } else {
                iconHtml = '<i class="fas fa-chair table-icon" style="color: #2ecc71;"></i>';
                locationText = 'Standard';
                iconClass = 'fa-chair';
            }

            html += '<div class="table-card ' + unavailableClass + '" data-table-id="' + table.id + '" data-table-number="' + table.tableNumber + '">';
            html += badge;
            html += '<div class="text-center">';
            html += iconHtml;
            html += '<div class="table-number">Table ' + table.tableNumber + '</div>';
            html += '</div>';
            html += '<ul class="table-info-list">';
            html += '<li><i class="fas fa-users"></i><span>Seating Capacity</span><span class="value">' + table.seatingCapacity + ' persons</span></li>';
            html += '<li><i class="fas ' + iconClass + '"></i><span>Location</span><span class="value">' + locationText + '</span></li>';
            html += '<li><i class="fas fa-dollar-sign"></i><span>Price per Hour</span><span class="value">Rs.' + table.pricePerHour + '.00</span></li>';
            html += '</ul>';
            html += '<div class="table-price"><i class="fas fa-clock"></i> Minimum 2 hours booking</div>';
            html += '</div>';
        }
        $('#tablesContainer').html(html);
    }
});

$('#reservationForm').on('submit', function(e) {
    var tableId = $('#tableId').val();
    var date = $('#date').val();
    var time = $('#time').val();
    var partySize = $('#partySize').val();

    if(!tableId) {
        e.preventDefault();
        Swal.fire({ icon: 'warning', title: 'Select Table', text: 'Please select a table to continue', confirmButtonColor: '#e74c3c' });
        return false;
    }
    if(!date || !time || !partySize) {
        e.preventDefault();
        Swal.fire({ icon: 'warning', title: 'Missing Information', text: 'Please fill all booking details', confirmButtonColor: '#e74c3c' });
        return false;
    }

    Swal.fire({ title: 'Processing Reservation...', text: 'Please wait', allowOutsideClick: false, didOpen: function() { Swal.showLoading(); } });
    return true;
});