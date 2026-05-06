$(document).ready(function() {
    var errorMsg = $('#errorMessage').data('message');
    if(errorMsg && errorMsg !== '') {
        Swal.fire({
            icon: 'error',
            title: 'Login Failed!',
            text: errorMsg,
            confirmButtonColor: '#e74c3c',
            confirmButtonText: 'Try Again',
            showConfirmButton: true,
            allowOutsideClick: false
        }).then((result) => {
            if(result.isConfirmed) {
                window.history.replaceState({}, document.title, window.location.pathname);
            }
        });
        $('#errorMessage').remove();
    }

    var successMsg = $('#successMessage').data('message');
    if(successMsg && successMsg !== '') {
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: successMsg,
            confirmButtonColor: '#e74c3c',
            timer: 3000,
            showConfirmButton: true
        });
        $('#successMessage').remove();
    }

    $('#showPassword').change(function() {
        var type = $(this).is(':checked') ? 'text' : 'password';
        $('#password').attr('type', type);
    });


    $('#password').on('keypress', function(e) {
        if(e.which === 13) {
            $('#loginForm').submit();
        }
    });
});

if(window.history.replaceState) {
    var url = new URL(window.location.href);
    if(url.searchParams.has('error')) {
        url.searchParams.delete('error');
        window.history.replaceState({}, document.title, url.toString());
    }
}