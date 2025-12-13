// Sidebar functionality
document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('sidebar');
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebarOverlay = document.getElementById('sidebarOverlay');

    // Toggle sidebar
    function toggleSidebar() {
        const isOpen = !sidebar.classList.contains('closed');
        
        if (isOpen) {
            // Close sidebar
            sidebar.classList.add('closed');
            sidebarOverlay.classList.remove('active');
            sidebarToggle.classList.remove('hidden');
        } else {
            // Open sidebar
            sidebar.classList.remove('closed');
            sidebarOverlay.classList.add('active');
            sidebarToggle.classList.add('hidden');
        }
    }

    // Close sidebar
    function closeSidebar() {
        sidebar.classList.add('closed');
        sidebarOverlay.classList.remove('active');
        sidebarToggle.classList.remove('hidden');
    }

    // Event listeners
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', toggleSidebar);
    }

    if (sidebarOverlay) {
        sidebarOverlay.addEventListener('click', closeSidebar);
    }

    // Close sidebar on escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeSidebar();
        }
    });

    // Initialize sidebar as closed
    sidebar.classList.add('closed');
});
