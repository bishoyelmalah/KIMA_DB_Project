// Profile Dropdown JavaScript
// Handles show/hide functionality for the profile dropdown menu
// Located in: static/utilities/Profile_DropDown/profile-dropdown.js

document.addEventListener('DOMContentLoaded', function() {
    const profileBtn = document.getElementById('profileIconBtn');
    const profileDropdown = document.getElementById('profileDropdown');
    
    if (!profileBtn || !profileDropdown) {
        console.warn('Profile dropdown elements not found');
        return;
    }
    
    // Toggle dropdown when clicking the profile icon
    profileBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        profileDropdown.classList.toggle('show');
    });
    
    // Close dropdown when clicking outside
    document.addEventListener('click', function(e) {
        if (!profileBtn.contains(e.target) && !profileDropdown.contains(e.target)) {
            profileDropdown.classList.remove('show');
        }
    });
    
    // Close dropdown when clicking on a dropdown item (optional)
    const dropdownItems = profileDropdown.querySelectorAll('.dropdown-item');
    dropdownItems.forEach(item => {
        item.addEventListener('click', function() {
            // Don't close immediately for logout/settings - let the action handle it
            // profileDropdown.classList.remove('show');
        });
    });
    
    // Close dropdown on escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && profileDropdown.classList.contains('show')) {
            profileDropdown.classList.remove('show');
        }
    });
});

// Logout function - update this to use Flask routes
function logout() {
    if (confirm('Are you sure you want to log out?')) {
        // Update this to use Flask's url_for when route is available
        // window.location.href = "{{ url_for('logout') }}";
        window.location.href = '/login';
    }
}

// Settings function - update this to use Flask routes
function openSettings() {
    // Update this to use Flask's url_for when route is available
    // window.location.href = "{{ url_for('settings') }}";
    alert('Settings page coming soon!');
}
