// Employee Profile Page JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Search functionality
    const searchInput = document.querySelector('.search-input');
    const micIcon = document.querySelector('.mic-icon');

    // Search input focus effects
    searchInput.addEventListener('focus', function() {
        this.style.borderColor = '#F6A416';
    });

    searchInput.addEventListener('blur', function() {
        this.style.borderColor = '#E5E5E5';
    });

    // Microphone icon click (placeholder for voice search)
    micIcon.addEventListener('click', function() {
        alert('Voice search functionality would be implemented here');
    });

    // Top bar icons hover effects
    const iconCircles = document.querySelectorAll('.icon-circle');
    iconCircles.forEach(icon => {
        icon.addEventListener('mouseenter', function() {
            this.style.backgroundColor = '#D4EDDA';
        });

        icon.addEventListener('mouseleave', function() {
            this.style.backgroundColor = '#E8F7E9';
        });
    });

    // Navigation items hover effects
    const navItems = document.querySelectorAll('.nav-item:not(.active)');
    navItems.forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.style.backgroundColor = 'rgba(255, 255, 255, 0.1)';
        });

        item.addEventListener('mouseleave', function() {
            this.style.backgroundColor = 'transparent';
        });
    });

    // Action icons (edit/delete) hover effects
    const actionIcons = document.querySelectorAll('.action-icon');
    actionIcons.forEach(icon => {
        icon.addEventListener('mouseenter', function() {
            this.style.backgroundColor = '#E59A0F';
            this.style.transform = 'scale(1.1)';
        });

        icon.addEventListener('mouseleave', function() {
            this.style.backgroundColor = '#F6A416';
            this.style.transform = 'scale(1)';
        });

        // Add click functionality
        icon.addEventListener('click', function() {
            const iconClass = this.querySelector('i').className;
            if (iconClass.includes('trash')) {
                if (confirm('Are you sure you want to delete this employee?')) {
                    alert('Delete functionality would be implemented here');
                }
            } else if (iconClass.includes('pencil')) {
                alert('Edit functionality would be implemented here');
            }
        });
    });

    // Departments button hover effect
    const departmentsBtn = document.querySelector('.departments-btn');
    departmentsBtn.addEventListener('mouseenter', function() {
        this.style.backgroundColor = '#E59A0F';
    });

    departmentsBtn.addEventListener('mouseleave', function() {
        this.style.backgroundColor = '#F6A416';
    });

    departmentsBtn.addEventListener('click', function() {
        alert('Navigate to departments details page');
    });

    // Sidebar navigation click effects
    const sidebarNavItems = document.querySelectorAll('.sidebar-nav .nav-item');
    sidebarNavItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            // Remove active class from all items
            sidebarNavItems.forEach(navItem => navItem.classList.remove('active'));
            // Add active class to clicked item
            this.classList.add('active');
            // Here you would typically navigate to the respective page
            alert(`Navigate to ${this.textContent} page`);
        });
    });

    // Responsive adjustments
    function handleResize() {
        const windowWidth = window.innerWidth;
        if (windowWidth <= 1200) {
            // Adjust layout for smaller screens
            const profileSection = document.querySelector('.profile-section');
            if (profileSection) {
                profileSection.style.flexDirection = 'column';
                profileSection.style.alignItems = 'flex-start';
            }
        } else {
            const profileSection = document.querySelector('.profile-section');
            if (profileSection) {
                profileSection.style.flexDirection = 'row';
                profileSection.style.alignItems = 'center';
            }
        }
    }

    // Initial check and event listener for window resize
    handleResize();
    window.addEventListener('resize', handleResize);


});
