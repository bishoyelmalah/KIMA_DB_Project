
// Variable to track the current mode
let isEditing = false;

// Function to get transport ID dynamically
function getTransportId() {
    const transportIdElement = document.querySelector('.transport-id');
    if (transportIdElement) {
        return transportIdElement.getAttribute('data-transport-id');
    }
    return null;
}

/**
 * Toggles the card between view and edit modes.
 */
function toggleEditMode() {
    isEditing = !isEditing;

    const detailTexts = document.querySelectorAll('.detail-text');
    const detailInputs = document.querySelectorAll('.detail-input');
    const editBtn = document.getElementById('edit-btn');
    const saveBtn = document.getElementById('save-btn');

    if (isEditing) {
        // --- ENTER EDIT MODE ---
        editBtn.classList.add('hidden'); // Hide Edit
        saveBtn.classList.remove('hidden'); // Show Save

        detailTexts.forEach(text => {
            text.classList.add('hidden'); // Hide display text
        });

        detailInputs.forEach(input => {
            // Update input value with the current display text value
            const currentValue = input.parentNode.querySelector('.detail-text').textContent;
            input.value = currentValue.trim();
            input.classList.remove('hidden'); // Show input field
        });

    } else {
        // --- ENTER VIEW MODE (or cancel editing without saving) ---
        editBtn.classList.remove('hidden'); // Show Edit
        saveBtn.classList.add('hidden'); // Hide Save

        detailTexts.forEach(text => {
            text.classList.remove('hidden'); // Show display text
        });

        detailInputs.forEach(input => {
            input.classList.add('hidden'); // Hide input field
        });
    }
}

/**
 * Collects data from input fields and sends it to the Flask backend.
 */
async function saveTransport() {
    const formData = {};
    const detailInputs = document.querySelectorAll('.detail-input');
    const transportId = getTransportId();
    
    // 1. Collect data from input fields
    detailInputs.forEach(input => {
        // Use the 'name' attribute as the key for the data
        formData[input.name] = input.value;
    });

    console.log('Data to be sent:', formData);

    if (!transportId) {
        alert('Transport ID not found');
        return;
    }

    try {
        // 2. Send data using the Fetch API (AJAX)
        const response = await fetch(`/api/transport/${transportId}`, { // <-- YOUR FLASK ENDPOINT HERE
            method: 'PUT', // Use PUT or POST for updates
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const result = await response.json();
        
        // 3. Update the displayed text with the saved data
        // (Use the data returned from the server for accuracy)
        detailInputs.forEach(input => {
             // Find the corresponding display element and update its content
            const detailText = input.parentNode.querySelector('.detail-text');
            // Use the value from the input field for immediate visual update
            detailText.textContent = input.value; 
        });

        // 4. Switch back to view mode
        toggleEditMode(); 
        alert('Transportation record updated successfully!');

    } catch (error) {
        console.error('Error saving transportation record:', error);
        alert('Failed to save changes. Check console for details.');
        // Optionally, don't switch back to view mode on error
    }
}

/**
 * Handles the delete action (as you had before)
 */
function deleteTransport() {
    const transportId = getTransportId();
    if (confirm('Are you sure you want to delete this transportation record?')) {
        console.log('Delete action triggered for ID:', transportId);
        // Add your AJAX delete logic here
        // After successful deletion, you might want to close the modal
        // closeTransportModal();
    }
}
