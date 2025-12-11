function showSettings() {
    document.getElementById('profileSection').style.display = 'none';
    document.getElementById('settingsSection').style.display = 'block';
    document.getElementById('changePasswordSection').style.display = 'none';
    
    // Update active sidebar link
    updateActiveLink(1);
}

function showChangePassword() {
    document.getElementById('profileSection').style.display = 'none';
    document.getElementById('settingsSection').style.display = 'none';
    document.getElementById('changePasswordSection').style.display = 'block';
    
    // Update active sidebar link
    updateActiveLink(2);
}

function showProfile() {
    document.getElementById('profileSection').style.display = 'block';
    document.getElementById('settingsSection').style.display = 'none';
    document.getElementById('changePasswordSection').style.display = 'none';
    
    // Update active sidebar link
    updateActiveLink(0);
}

function updateActiveLink(index) {
    const links = document.querySelectorAll('.sidebar ul li a');
    links.forEach((link, i) => {
        if (i === index) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
}
function showSettings() {
    document.getElementById('profileSection').style.display = 'none';
    document.getElementById('settingsSection').style.display = 'block';
    document.getElementById('changePasswordSection').style.display = 'none';
    
    updateActiveLink(1);
}

function showChangePassword() {
    document.getElementById('profileSection').style.display = 'none';
    document.getElementById('settingsSection').style.display = 'none';
    document.getElementById('changePasswordSection').style.display = 'block';
    
    updateActiveLink(2);
}

function showProfile() {
    document.getElementById('profileSection').style.display = 'block';
    document.getElementById('settingsSection').style.display = 'none';
    document.getElementById('changePasswordSection').style.display = 'none';
    
    updateActiveLink(0);
}

function updateActiveLink(index) {
    const links = document.querySelectorAll('.sidebar ul li a');
    links.forEach((link, i) => {
        if (i === index) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
}

// Local time update
function updateTime() {
    const now = new Date();
    document.getElementById('local-time').textContent = now.toLocaleString();
}

// Cairo time update
function updateCairoTime() {
    const now = new Date();
    document.getElementById('cairo-time').textContent = 
        now.toLocaleString('en-GB', { timeZone: 'Africa/Cairo', hour12: false });
}

// Initialize and update times every second
updateTime();
updateCairoTime();
setInterval(updateTime, 1000);
setInterval(updateCairoTime, 1000);

// Timezone change handler
document.addEventListener('DOMContentLoaded', function() {
    const timezoneSelect = document.getElementById('timezoneSelect');
    if (timezoneSelect) {
        timezoneSelect.addEventListener('change', function() {
            updateTime();
            updateCairoTime();
        });
    }
});