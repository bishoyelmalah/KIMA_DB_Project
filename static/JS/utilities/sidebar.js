// Sidebar JavaScript
// Handles responsive toggle functionality and navigation
// Located in: static/utilities/Sidebar/sidebar.js

document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('sidebar');
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebarOverlay = document.getElementById('sidebarOverlay');
    const navItems = document.querySelectorAll('.sidebar .nav-item');
    
    // Check if elements exist
    if (!sidebar) {
        console.warn('Sidebar element not found');
        return;
    }
    
    // Set active page based on current URL
    setActivePage();
    
    // Toggle sidebar on mobile
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', function(e) {
            e.stopPropagation();
            toggleSidebar();
        });
    }
    
    // Close sidebar when clicking overlay
    if (sidebarOverlay) {
        sidebarOverlay.addEventListener('click', function() {
            closeSidebar();
        });
    }
    
    // Close sidebar when clicking outside on mobile
    document.addEventListener('click', function(e) {
        if (window.innerWidth <= 768) {
            if (!sidebar.contains(e.target) && !sidebarToggle.contains(e.target)) {
                closeSidebar();
            }
        }
    });
    
    // Handle navigation clicks
    navItems.forEach(item => {
        const link = item.querySelector('.nav-link');
        if (link) {
            link.addEventListener('click', function(e) {
                // Remove active class from all items
                navItems.forEach(nav => nav.classList.remove('active'));
                // Add active class to clicked item
                item.classList.add('active');
                
                // Close sidebar on mobile after navigation
                if (window.innerWidth <= 768) {
                    closeSidebar();
                }
            });
        }
    });
    
    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768) {
            // On desktop, ensure sidebar is always visible
            sidebar.classList.remove('open');
            if (sidebarOverlay) {
                sidebarOverlay.classList.remove('active');
            }
            document.body.classList.remove('sidebar-open');
        }
    });
    
    // Close sidebar on escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && sidebar.classList.contains('open')) {
            closeSidebar();
        }
    });
    
    /**
     * Toggle sidebar open/close
     */
    function toggleSidebar() {
        sidebar.classList.toggle('open');
        if (sidebarOverlay) {
            sidebarOverlay.classList.toggle('active');
        }
        document.body.classList.toggle('sidebar-open');
    }
    
    /**
     * Close sidebar
     */
    function closeSidebar() {
        sidebar.classList.remove('open');
        if (sidebarOverlay) {
            sidebarOverlay.classList.remove('active');
        }
        document.body.classList.remove('sidebar-open');
    }
    
    /**
     * Set active page based on current URL
     */
    function setActivePage() {
        const currentPath = window.location.pathname;
        const currentPage = getPageFromPath(currentPath);
        
        navItems.forEach(item => {
            const page = item.getAttribute('data-page');
            if (page === currentPage) {
                item.classList.add('active');
            } else {
                item.classList.remove('active');
            }
        });
    }
    
    /**
     * Extract page name from URL path
     */
    function getPageFromPath(path) {
        // Remove leading/trailing slashes and get last segment
        const segments = path.split('/').filter(segment => segment);
        const lastSegment = segments[segments.length - 1] || '';
        
        // Map common paths to page names
        const pageMap = {
            '': 'dashboard',
            'home': 'dashboard',
            'dashboard': 'dashboard',
            'employees': 'employees',
            'employee': 'employees',
            'suppliers': 'suppliers',
            'supplier': 'suppliers',
            'products': 'products',
            'product': 'products',
            'customers': 'customers',
            'customer': 'customers'
        };
        
        // Check if last segment matches any page
        const pageName = lastSegment.toLowerCase().replace('.html', '');
        return pageMap[pageName] || 'dashboard';
    }
});

