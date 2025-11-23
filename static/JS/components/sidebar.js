// ----- عناصر الصفحة -----
const sidebar = document.getElementById("sidebar");
const toggle = document.getElementById("sidebarToggle");
const overlay = document.getElementById("sidebarOverlay");


// ----- Updates toggle button visibility -----
function updateToggleVisibility() {
    if (sidebar.classList.contains("closed")) {
        setTimeout(() => {
        toggle.style.display = 'flex';
    }, 250);    // السايدبار مقفولة → زرار ظاهر
    } else {
        toggle.style.display = "none";   // السايدبار مفتوحة → اخفي الزرار
    }
}


// ----- فتح وقفل السايدبار -----
function toggleSidebar() {
    const isClosed = sidebar.classList.toggle("closed");

    if (!isClosed) {
        // Open
        overlay.classList.add("active");
        document.body.classList.add("sidebar-open");
    } else {
        // Closed
        overlay.classList.remove("active");
        document.body.classList.remove("sidebar-open");
    }

    updateToggleVisibility();
}


// ----- الضغط على زرار التوجل -----
toggle.addEventListener("click", () => {
    toggleSidebar();
});


// ----- الضغط على overlay -----
overlay.addEventListener("click", () => {
    sidebar.classList.add("closed");
    overlay.classList.remove("active");
    document.body.classList.remove("sidebar-open");
    updateToggleVisibility();
});


// ----- عند تحميل الصفحة: السايدبار مقفولة على كل الأجهزة -----
window.addEventListener("load", () => {
    sidebar.classList.add("closed");
    overlay.classList.remove("active");
    document.body.classList.remove("sidebar-open");
    updateToggleVisibility();
});


// ----- عند تغيير حجم الشاشة -----
window.addEventListener("resize", () => {
    sidebar.classList.add("closed");
    overlay.classList.remove("active");
    document.body.classList.remove("sidebar-open");
    updateToggleVisibility();
});
