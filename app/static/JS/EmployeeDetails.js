        // Profile Manager - Handles all profile operations
        const profileManager = {
            isEditing: false,
            profileId: null,
            originalData: {},

            init() {
                const profileWrapper = document.querySelector('.profile-wrapper');
                this.profileId = profileWrapper.getAttribute('data-profile-id');
                this.storeOriginalData();
            },

            storeOriginalData() {
                const allTexts = document.querySelectorAll('[data-field]');
                allTexts.forEach(text => {
                    const field = text.getAttribute('data-field');
                    this.originalData[field] = text.textContent;
                });
            },

            toggleEditMode() {
                this.isEditing = !this.isEditing;

                const infoTexts = document.querySelectorAll('.info-text');
                const infoInputs = document.querySelectorAll('.info-input');
                const detailTexts = document.querySelectorAll('.detail-text');
                const detailInputs = document.querySelectorAll('.detail-input');
                const editBtn = document.getElementById('edit-btn');
                const saveBtn = document.getElementById('save-btn');

                if (this.isEditing) {
                    // Enter edit mode
                    editBtn.classList.add('hidden');
                    saveBtn.classList.remove('hidden');

                    // Update info section
                    infoTexts.forEach(text => {
                        const input = text.parentNode.querySelector('.info-input');
                        input.value = text.textContent;
                        text.classList.add('hidden');
                        input.classList.remove('hidden');
                    });

                    // Update detail sections
                    detailTexts.forEach(text => {
                        const input = text.parentNode.querySelector('.detail-input');
                        if (input.tagName === 'SELECT') {
                            input.value = text.textContent;
                        } else if (input.type === 'date') {
                            // Convert date format from DD/MM/YYYY to YYYY-MM-DD
                            const dateText = text.textContent;
                            if (dateText && dateText.includes('/')) {
                                const [day, month, year] = dateText.split('/');
                                input.value = `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`;
                            }
                        } else {
                            input.value = text.textContent;
                        }
                        text.classList.add('hidden');
                        input.classList.remove('hidden');
                    });

                } else {
                    // Exit edit mode (cancel)
                    this.cancelEdit();
                }
            },

            cancelEdit() {
                const editBtn = document.getElementById('edit-btn');
                const saveBtn = document.getElementById('save-btn');

                editBtn.classList.remove('hidden');
                saveBtn.classList.add('hidden');

                // Restore all text displays
                document.querySelectorAll('.info-text, .detail-text').forEach(text => {
                    text.classList.remove('hidden');
                });

                // Hide all inputs
                document.querySelectorAll('.info-input, .detail-input').forEach(input => {
                    input.classList.add('hidden');
                });

                this.isEditing = false;
            },

            async saveProfile() {
                const formData = {};
                
                // Collect data from info inputs
                document.querySelectorAll('.info-input').forEach(input => {
                    formData[input.name] = input.value;
                });

                // Collect data from detail inputs
                document.querySelectorAll('.detail-input').forEach(input => {
                    if (input.type === 'date' && input.value) {
                        // Convert date from YYYY-MM-DD to DD/MM/YYYY for display
                        const [year, month, day] = input.value.split('-');
                        formData[input.name] = `${day}/${month}/${year}`;
                    } else {
                        formData[input.name] = input.value;
                    }
                });

                console.log('Saving customer profile data:', formData);

                try {
                    // Replace with your actual API endpoint
                    const response = await fetch(`/api/customer/${this.profileId}`, {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(formData),
                    });

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }

                    const result = await response.json();
                    
                    // Update displayed text with saved data
                    document.querySelectorAll('.info-input').forEach(input => {
                        const text = input.parentNode.querySelector('.info-text');
                        text.textContent = input.value;
                    });

                    document.querySelectorAll('.detail-input').forEach(input => {
                        const text = input.parentNode.querySelector('.detail-text');
                        if (input.type === 'date' && input.value) {
                            // Convert date for display
                            const [year, month, day] = input.value.split('-');
                            text.textContent = `${day}/${month}/${year}`;
                        } else {
                            text.textContent = input.value;
                        }
                    });

                    // Update original data
                    this.storeOriginalData();

                    // Exit edit mode
                    this.toggleEditMode();
                    
                    this.showMessage('Customer profile updated successfully!', 'success');

                } catch (error) {
                    console.error('Error saving customer profile:', error);
                    this.showMessage('Failed to save customer profile. Please try again.', 'error');
                }
            },


            triggerImageUpload() {
                if (this.isEditing) {
                    document.getElementById('image-upload').click();
                }
            },

            handleImageUpload(event) {
                const file = event.target.files[0];
                if (!file) return;

                // Validate file type
                if (!file.type.startsWith('image/')) {
                    this.showMessage('Please select a valid image file.', 'error');
                    return;
                }

                // Validate file size (max 5MB)
                if (file.size > 5 * 1024 * 1024) {
                    this.showMessage('Image size must be less than 5MB.', 'error');
                    return;
                }

                // Preview image
                const reader = new FileReader();
                reader.onload = (e) => {
                    document.getElementById('profile-img').src = e.target.result;
                };
                reader.readAsDataURL(file);

                // Upload image to server
                this.uploadImage(file);
            },

            async uploadImage(file) {
                const formData = new FormData();
                formData.append('image', file);
                formData.append('customer_id', this.profileId);

                try {
                    // Replace with your actual API endpoint
                    const response = await fetch(`/api/customer/${this.profileId}/image`, {
                        method: 'POST',
                        body: formData,
                    });

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }

                    this.showMessage('Customer profile image updated successfully!', 'success');

                } catch (error) {
                    console.error('Error uploading image:', error);
                    this.showMessage('Failed to upload image. Please try again.', 'error');
                }
            },

            showMessage(message, type) {
                const messageDiv = document.createElement('div');
                messageDiv.className = type === 'success' ? 'success-message' : 'error-message';
                messageDiv.textContent = message;
                document.body.appendChild(messageDiv);

                setTimeout(() => {
                    messageDiv.remove();
                }, 3000);
            }
        };

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', () => {
            profileManager.init();
        });

        // Keyboard shortcuts
        document.addEventListener('keydown', (e) => {
            // Ctrl/Cmd + E to toggle edit mode
            if ((e.ctrlKey || e.metaKey) && e.key === 'e') {
                e.preventDefault();
                profileManager.toggleEditMode();
            }
            
            // Ctrl/Cmd + S to save
            if ((e.ctrlKey || e.metaKey) && e.key === 's' && profileManager.isEditing) {
                e.preventDefault();
                profileManager.saveProfile();
            }
            
            // Escape to cancel edit
            if (e.key === 'Escape' && profileManager.isEditing) {
                profileManager.cancelEdit();
            }
        });