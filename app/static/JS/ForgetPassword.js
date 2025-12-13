document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const emailInput = document.getElementById('email');

    form.addEventListener('submit', function(event) {
        event.preventDefault();

        const email = emailInput.value.trim();

        if (!email) {
            alert('Please enter your email address.');
            return;
        }

        // Basic email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('Please enter a valid email address.');
            return;
        }

        // Simulate sending reset link
        alert('A password reset link has been sent to your email address.');

        // Clear the form
        emailInput.value = '';
    });
});
