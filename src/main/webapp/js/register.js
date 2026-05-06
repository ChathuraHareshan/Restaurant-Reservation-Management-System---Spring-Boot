$(document).ready(function() {

    var errorMsg = $('#errorMessage').data('message');
    if(errorMsg && errorMsg !== '') {
        Swal.fire({
            icon: 'error',
            title: 'Registration Failed!',
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
            title: 'Registration Successful!',
            text: successMsg,
            confirmButtonColor: '#e74c3c',
            confirmButtonText: 'Continue to Login',
            showConfirmButton: true,
            allowOutsideClick: false
        }).then((result) => {
            if(result.isConfirmed) {
                window.location.href = '/customer/login';
            }
        });
        $('#successMessage').remove();
    }

    $('#password').on('keyup', function() {
        var password = $(this).val();
        var strength = checkPasswordStrength(password);
        $('#passwordStrength').html(strength.message).removeClass('strength-weak strength-medium strength-strong').addClass(strength.class);
    });

    function checkPasswordStrength(password) {
        if(password.length === 0) {
            return { message: '', class: '' };
        }
        if(password.length < 6) {
            return { message: '⚠️ Weak password (minimum 6 characters)', class: 'strength-weak' };
        }
        var strength = 0;
        if(password.length >= 8) strength++;
        if(password.match(/[a-z]+/)) strength++;
        if(password.match(/[A-Z]+/)) strength++;
        if(password.match(/[0-9]+/)) strength++;
        if(password.match(/[$@#&!]+/)) strength++;

        if(strength < 2) {
            return { message: '⚠️ Weak password', class: 'strength-weak' };
        } else if(strength < 4) {
            return { message: '⚡ Medium password', class: 'strength-medium' };
        } else {
            return { message: '✅ Strong password', class: 'strength-strong' };
        }
    }

    $('#confirmPassword').on('keyup', function() {
        var password = $('#password').val();
        var confirm = $(this).val();
        if(confirm !== '' && password !== confirm) {
            $(this).css('border-color', '#e74c3c');
        } else {
            $(this).css('border-color', '#e0e0e0');
        }
    });

    $('#registerForm').on('submit', function(e) {
        var email = $('#email').val().trim();
        var password = $('#password').val();
        var confirmPassword = $('#confirmPassword').val();
        var phone = $('#phone').val().trim();


        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(!emailRegex.test(email)) {
            e.preventDefault();
            Swal.fire({
                icon: 'error',
                title: 'Invalid Email',
                text: 'Please enter a valid email address',
                confirmButtonColor: '#e74c3c'
            });
            return false;
        }

        if(password.length < 6) {
            e.preventDefault();
            Swal.fire({
                icon: 'warning',
                title: 'Weak Password',
                text: 'Password must be at least 6 characters long',
                confirmButtonColor: '#e74c3c'
            });
            return false;
        }

        if(password !== confirmPassword) {
            e.preventDefault();
            Swal.fire({
                icon: 'error',
                title: 'Password Mismatch',
                text: 'Password and confirm password do not match',
                confirmButtonColor: '#e74c3c'
            });
            return false;
        }

        var phoneRegex = /^[0-9+\-\s()]{10,15}$/;
        if(!phoneRegex.test(phone)) {
            e.preventDefault();
            Swal.fire({
                icon: 'error',
                title: 'Invalid Phone',
                text: 'Please enter a valid phone number',
                confirmButtonColor: '#e74c3c'
            });
            return false;
        }
        Swal.fire({
            title: 'Creating Account...',
            text: 'Please wait',
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        });

        return true;
    });
});

if(window.history.replaceState) {
    var url = new URL(window.location.href);
    if(url.searchParams.has('error')) {
        url.searchParams.delete('error');
        window.history.replaceState({}, document.title, url.toString());
    }
}