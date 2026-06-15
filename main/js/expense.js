function addPaymentRow() {
    paymentRows.push({ payment_mode: '', bank: '', amount: '' });
    renderPaymentRows();
}

function removePaymentRow(index) {
    paymentRows.splice(index, 1);
    renderPaymentRows();
}

function renderPaymentRows() {
    const tbody = document.getElementById('payment_rows_body');
    if (!tbody) {
        setTimeout(renderPaymentRows, 50);
        return;
    }
    let html = '';
    paymentRows.forEach(function(row, index) {
        html += `
            <tr>
                <td>${index + 1}</td>
                <td>
                    <select name="payment_mode[]" class="form-input" onchange="onPaymentModeChange(${index}, this.value)">
                        <option value="">Select</option>
                        ${paymentModeOptions}
                    </select>
                </td>
                <td id="bank_cell_${index}">
                    <input type="hidden" name="bank[]" value="">-
                </td>
                <td>
                    <input type="text" name="amount[]" class="form-input" value="${row.amount}" oninput="updateTotal();" onkeypress="return allowNumbersOnly(event)">
                </td>
                <td>
                    <button type="button" class="btn-add" style="background: #ef4444; font-size: 0.75rem;" onclick="removePaymentRow(${index});">Remove</button>
                </td>
            </tr>
        `;
    });
    tbody.innerHTML = html;
    restoreSelections();
    updateTotal();
}

function restoreSelections() {
    paymentRows.forEach(function(row, index) {
        // Restore payment mode
        const select = document.querySelector(`#payment_rows_body tr:nth-child(${index + 1}) select[name='payment_mode[]']`);
        if (select && row.payment_mode) {
            select.value = row.payment_mode;
        }
        // Restore bank dropdown
        if (row.payment_mode) {
            const bankOptions = getBankOptions(row.payment_mode);
            const bankCell = document.getElementById('bank_cell_' + index);
            if (bankCell && bankOptions.length > 0) {
                let selectHtml = '<select name="bank[]" class="form-input">';
                selectHtml += '<option value="">Select</option>';
                bankOptions.forEach(function(bank) {
                    const selected = (bank.bank_id == row.bank) ? ' selected' : '';
                    selectHtml += `<option value="${bank.bank_id}"${selected}>${bank.bank_name}</option>`;
                });
                selectHtml += '</select>';
                bankCell.innerHTML = selectHtml;
            }
        }
    });
}

function getBankOptions(paymentModeId) {
    if (!paymentModeId) {
        return [];
    }
    return bankMap[paymentModeId] || [];
}

function onPaymentModeChange(index, paymentModeId) {
    paymentRows[index].payment_mode = paymentModeId;
    paymentRows[index].bank = '';
    const bankOptions = getBankOptions(paymentModeId);
    const bankCell = document.getElementById('bank_cell_' + index);
    if (bankCell) {
        if (bankOptions.length > 0) {
            let selectHtml = '<select name="bank[]" class="form-input">';
            selectHtml += '<option value="">Select</option>';
            bankOptions.forEach(function(bank) {
                selectHtml += `<option value="${bank.bank_id}">${bank.bank_name}</option>`;
            });
            selectHtml += '</select>';
            bankCell.innerHTML = selectHtml;
        } else {
            bankCell.innerHTML = '<input type="hidden" name="bank[]" value="">-';
        }
    }
}

function updateTotal() {
    let total = 0;
    const amountInputs = document.querySelectorAll('input[name="amount[]"]');
    amountInputs.forEach(function(input, index) {
        const amount = parseFloat(input.value) || 0;
        total += amount;
        if (paymentRows[index]) {
            paymentRows[index].amount = input.value;
        }
    });
    const totalInput = document.getElementById('total_amount');
    if (totalInput) {
        totalInput.value = total.toFixed(2);
    }
}

// ------------------ Attachments Preview JS ------------------

function handleFileSelect(event) {
    const files = event.target.files;
    addFiles(files);
}

function addFiles(files) {
    const allowedExtensions = ['jpg', 'jpeg', 'png', 'webp', 'pdf', 'doc', 'docx'];
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const ext = file.name.split('.').pop().toLowerCase();
        if (!allowedExtensions.includes(ext)) {
            alert('Invalid file type: ' + file.name + '. Allowed: ' + allowedExtensions.join(', '));
            continue;
        }
        if (!selectedFiles.some(f => f.name === file.name && f.size === file.size)) {
            selectedFiles.push(file);
        }
    }
    updateFileInputAndPreviews();
}

function removeNewFile(index) {
    selectedFiles.splice(index, 1);
    updateFileInputAndPreviews();
}

function removeExistingFile(fileName) {
    existingFiles = existingFiles.filter(f => f !== fileName);
    document.getElementById('existing_attachments').value = existingFiles.join(',');
    renderAllPreviews();
}

function updateFileInputAndPreviews() {
    const fileInput = document.getElementById('attachments_input');
    if (fileInput) {
        const dt = new DataTransfer();
        selectedFiles.forEach(file => dt.items.add(file));
        fileInput.files = dt.files;
    }
    renderAllPreviews();
}

function renderAllPreviews() {
    const container = document.getElementById('previews_container');
    if (!container) return;
    container.innerHTML = '';

    // Render existing files
    existingFiles.forEach(function(file) {
        const ext = file.split('.').pop().toLowerCase();
        const card = document.createElement('div');
        card.className = 'preview-card';
        
        let contentHtml = '';
        if (['jpg', 'jpeg', 'png', 'webp'].includes(ext)) {
            contentHtml = `<a href="upload/${file}" target="_blank"><img src="upload/${file}" alt="${file}"></a>`;
        } else {
            let iconClass = 'fa-file';
            if (ext === 'pdf') iconClass = 'fa-file-pdf';
            if (['doc', 'docx'].includes(ext)) iconClass = 'fa-file-word';
            contentHtml = `
                <a href="upload/${file}" target="_blank" style="text-decoration:none; display:flex; flex-direction:column; align-items:center;">
                    <i class="fas ${iconClass} doc-icon"></i>
                    <span class="file-ext-badge">${ext}</span>
                </a>
            `;
        }
        
        card.innerHTML = `
            ${contentHtml}
            <button type="button" class="btn-remove-preview" onclick="removeExistingFile('${file}')" title="Delete Attachment"><i class="fas fa-times"></i></button>
            <div class="file-name-tooltip">${file}</div>
        `;
        container.appendChild(card);
    });

    // Render newly selected files
    selectedFiles.forEach(function(file, index) {
        const ext = file.name.split('.').pop().toLowerCase();
        const card = document.createElement('div');
        card.className = 'preview-card';
        
        const objectUrl = URL.createObjectURL(file);
        let contentHtml = '';
        if (['jpg', 'jpeg', 'png', 'webp'].includes(ext)) {
            contentHtml = `<a href="${objectUrl}" target="_blank"><img src="${objectUrl}" alt="${file.name}"></a>`;
        } else {
            let iconClass = 'fa-file';
            if (ext === 'pdf') iconClass = 'fa-file-pdf';
            if (['doc', 'docx'].includes(ext)) iconClass = 'fa-file-word';
            contentHtml = `
                <a href="${objectUrl}" target="_blank" download="${file.name}" style="text-decoration:none; display:flex; flex-direction:column; align-items:center;">
                    <i class="fas ${iconClass} doc-icon"></i>
                    <span class="file-ext-badge">${ext}</span>
                </a>
            `;
        }
        
        card.innerHTML = `
            ${contentHtml}
            <button type="button" class="btn-remove-preview" onclick="removeNewFile(${index})" title="Remove Attachment"><i class="fas fa-times"></i></button>
            <div class="file-name-tooltip">${file.name}</div>
        `;
        container.appendChild(card);
    });
}

function initExpenseForm() {
    const form = document.getElementById('expense_entry_form');
    if (form) {
        form.addEventListener('change', function(event) {
            const target = event.target;
            if (target.name === 'bank[]') {
                const row = target.closest('tr');
                if (row) {
                    const rowIndex = Array.from(row.parentNode.children).indexOf(row);
                    if (paymentRows[rowIndex]) {
                        paymentRows[rowIndex].bank = target.value;
                    }
                }
            }
        });
    }

    // Use setTimeout to ensure DOM is fully rendered when loaded via AJAX .html()
    setTimeout(function() {
        // Dropzone drag & drop support
        const uploadZone = document.querySelector('.premium-upload-zone');
        if (uploadZone) {
            ['dragenter', 'dragover'].forEach(eventName => {
                uploadZone.addEventListener(eventName, (e) => {
                    e.preventDefault();
                    uploadZone.classList.add('dragover');
                }, false);
            });

            ['dragleave', 'drop'].forEach(eventName => {
                uploadZone.addEventListener(eventName, (e) => {
                    e.preventDefault();
                    uploadZone.classList.remove('dragover');
                }, false);
            });

            uploadZone.addEventListener('drop', (e) => {
                const dt = e.dataTransfer;
                if (dt && dt.files) {
                    addFiles(dt.files);
                }
            }, false);
        }

        renderAllPreviews();
        renderPaymentRows();
    }, 0);
}
