// ==========================================
// RECEIPT MODAL FUNCTIONS (for enrollment pages)
// ==========================================

function populateModalStudentOptions() {
    const studentSelect = document.getElementById('modal_student_id');
    if (!studentSelect) return;
    const list = modalStudentLists[modalSelectedCourseType] || [];
    studentSelect.innerHTML = '<option value="">Select</option>';
    list.forEach(function (student) {
        const selected = (student.id === modalSelectedStudentId ||
            student.student_id === modalSelectedStudentId ||
            student.student_id_decrypted === modalSelectedStudentId) ? 'selected' : '';
        studentSelect.innerHTML += `<option value="${student.id}" ${selected}>${student.label}</option>`;
    });
}

function onModalCourseTypeChange() {
    const courseTypeSelect = document.getElementById('modal_course_type');
    if (!courseTypeSelect) return;
    modalSelectedCourseType = courseTypeSelect.value;
    modalSelectedStudentId = '';
    populateModalStudentOptions();
}

function addModalPaymentRow() {
    modalPaymentRows.push({ payment_mode: '', bank: '', amount: '' });
    renderModalPaymentRows();
}

function removeModalPaymentRow(index) {
    modalPaymentRows.splice(index, 1);
    renderModalPaymentRows();
}

function renderModalPaymentRows() {
    const tbody = document.getElementById('modal_payment_rows_body');
    if (!tbody) {
        setTimeout(renderModalPaymentRows, 50);
        return;
    }
    let html = '';
    modalPaymentRows.forEach(function (row, index) {
        html += `
            <tr>
                <td>${index + 1}</td>
                <td>
                    <select name="payment_mode[]" class="form-input" onchange="onModalPaymentModeChange(${index}, this.value)">
                        <option value="">Select</option>
                        ${modalPaymentModeOptions}
                    </select>
                </td>
                <td id="modal_bank_cell_${index}">
                    <input type="hidden" name="bank[]" value="">-
                </td>
                <td>
                    <input type="text" name="amount[]" class="form-input" value="${row.amount}" oninput="updateModalTotal();" onkeypress="return allowNumbersOnly(event)">
                </td>
                <td>
                    <button type="button" class="btn-add" style="background: #ef4444; font-size: 0.75rem;" onclick="removeModalPaymentRow(${index});">Remove</button>
                </td>
            </tr>
        `;
    });
    tbody.innerHTML = html;
    restoreModalSelections();
    updateModalTotal();
}

function restoreModalSelections() {
    modalPaymentRows.forEach(function (row, index) {
        const select = document.querySelector(`#modal_payment_rows_body tr:nth-child(${index + 1}) select[name='payment_mode[]']`);
        if (select && row.payment_mode) {
            select.value = row.payment_mode;
        }
        if (row.payment_mode) {
            const bankOptions = getModalBankOptions(row.payment_mode);
            const bankCell = document.getElementById('modal_bank_cell_' + index);
            if (bankCell && bankOptions.length > 0) {
                let selectHtml = '<select name="bank[]" class="form-input">';
                selectHtml += '<option value="">Select</option>';
                bankOptions.forEach(function (bank) {
                    const selected = (bank.bank_id == row.bank) ? ' selected' : '';
                    selectHtml += `<option value="${bank.bank_id}"${selected}>${bank.bank_name}</option>`;
                });
                selectHtml += '</select>';
                bankCell.innerHTML = selectHtml;
            }
        }
    });
}

function getModalBankOptions(paymentModeId) {
    if (!paymentModeId) return [];
    return modalBankMap[paymentModeId] || [];
}

function onModalPaymentModeChange(index, paymentModeId) {
    modalPaymentRows[index].payment_mode = paymentModeId;
    modalPaymentRows[index].bank = '';
    const bankOptions = getModalBankOptions(paymentModeId);
    const bankCell = document.getElementById('modal_bank_cell_' + index);
    if (bankCell) {
        if (bankOptions.length > 0) {
            let selectHtml = '<select name="bank[]" class="form-input">';
            selectHtml += '<option value="">Select</option>';
            bankOptions.forEach(function (bank) {
                selectHtml += `<option value="${bank.bank_id}">${bank.bank_name}</option>`;
            });
            selectHtml += '</select>';
            bankCell.innerHTML = selectHtml;
        } else {
            bankCell.innerHTML = '<input type="hidden" name="bank[]" value="">-';
        }
    }
}

function updateModalTotal() {
    let total = 0;
    const amountInputs = document.querySelectorAll('#modal_receipt_form input[name="amount[]"]');
    amountInputs.forEach(function (input, index) {
        const amount = parseFloat(input.value) || 0;
        total += amount;
        if (modalPaymentRows[index]) {
            modalPaymentRows[index].amount = input.value;
        }
    });

    const modalFeesInput = document.getElementById('modal_fees_amount');
    const modalCgstInput = document.getElementById('modal_cgst_amount');
    const modalSgstInput = document.getElementById('modal_sgst_amount');
    const totalInput = document.getElementById('modal_total_amount');

    if (modalFeesInput) {
        const fees = Math.round((total / 1.18 + Number.EPSILON) * 100) / 100;
        const totalTax = Math.round((total - fees + Number.EPSILON) * 100) / 100;
        const cgst = Math.round((totalTax / 2 + Number.EPSILON) * 100) / 100;
        const sgst = Math.round((totalTax - cgst + Number.EPSILON) * 100) / 100;

        modalFeesInput.value = fees.toFixed(2);
        modalCgstInput.value = cgst.toFixed(2);
        modalSgstInput.value = sgst.toFixed(2);
        if (totalInput) totalInput.value = total.toFixed(2);
    } else {
        if (totalInput) totalInput.value = total.toFixed(2);
    }

    // Show amount match status
    const statusDiv = document.getElementById('modal_amount_status');
    if (statusDiv) {
        const diff = enrollmentPaidAmount - total;
        if (total === 0) {
            statusDiv.innerHTML = '';
        } else if (Math.abs(diff) < 0.01) {
            statusDiv.innerHTML = '<span style="color: #10b981; font-weight: 600;">✓ Amount matches enrollment paid amount</span>';
        } else if (diff > 0) {
            statusDiv.innerHTML = '<span style="color: #f59e0b; font-weight: 600;">⚠ Remaining: ₹' + diff.toFixed(2) + '</span>';
        } else {
            statusDiv.innerHTML = '<span style="color: #ef4444; font-weight: 600;">✕ Exceeds by: ₹' + Math.abs(diff).toFixed(2) + '</span>';
        }
    }
}

function submitModalReceipt() {
    const form = document.getElementById('modal_receipt_form');
    if (!form) return;
    const errorSpans = form.querySelectorAll('.error-msg');
    errorSpans.forEach(span => span.innerText = '');

    // Calculate total and validate against enrollmentPaidAmount
    let total = 0;
    document.querySelectorAll('#modal_receipt_form input[name="amount[]"]').forEach(function (input) {
        total += parseFloat(input.value) || 0;
    });
    const diff = Math.abs(enrollmentPaidAmount - total);
    if (enrollmentPaidAmount > 0 && diff >= 0.01) {
        const errorSpan = document.getElementById('error-payment_rows');
        if (errorSpan) {
            errorSpan.innerText = 'Total amount (₹' + total.toFixed(2) + ') must exactly equal enrollment paid amount (₹' + enrollmentPaidAmount.toFixed(2) + ')';
            errorSpan.style.color = '#ef4444';
        } else {
            alert('Total amount (₹' + total.toFixed(2) + ') must exactly equal enrollment paid amount (₹' + enrollmentPaidAmount.toFixed(2) + ')');
        }
        return;
    }

    const submitBtn = document.getElementById('modal_submit_btn');
    submitBtn.disabled = true;
    submitBtn.innerText = 'Processing...';

    const formData = new FormData(form);

    fetch('receipt_action.php', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                const msgDiv = document.getElementById('modal-success-msg');
                if (msgDiv) {
                    msgDiv.innerText = data.message;
                    msgDiv.classList.remove('hidden');
                    msgDiv.style.background = 'rgba(16, 185, 129, 0.1)';
                    msgDiv.style.color = '#10b981';
                }
                setTimeout(function () {
                    closePaymentModal();
                }, 1500);
            } else {
                if (data.errors) {
                    for (const field in data.errors) {
                        const errorSpan = document.getElementById('error-' + field);
                        if (errorSpan) {
                            errorSpan.innerText = data.errors[field];
                            errorSpan.style.color = '#ef4444';
                        }
                    }
                }
                if (data.message) {
                    const msgDiv = document.getElementById('modal-success-msg');
                    if (msgDiv) {
                        msgDiv.innerText = data.message;
                        msgDiv.classList.remove('hidden');
                        msgDiv.style.background = 'rgba(239, 68, 68, 0.1)';
                        msgDiv.style.color = '#ef4444';
                    }
                }
                submitBtn.disabled = false;
                submitBtn.innerText = 'Save Receipt';
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An unexpected error occurred.');
            submitBtn.disabled = false;
            submitBtn.innerText = 'Save Receipt';
        });
}

function initModalReceiptForm() {
    const form = document.getElementById('modal_receipt_form');
    if (form) {
        form.addEventListener('change', function (event) {
            const target = event.target;
            if (target.name === 'bank[]') {
                const row = target.closest('tr');
                if (row) {
                    const rowIndex = Array.from(row.parentNode.children).indexOf(row);
                    if (modalPaymentRows[rowIndex]) {
                        modalPaymentRows[rowIndex].bank = target.value;
                    }
                }
            }
        });
    }

    populateModalStudentOptions();
    renderModalPaymentRows();
}


// ==========================================
// NORMAL RECEIPT FORM FUNCTIONS
// ==========================================

function populateStudentOptions() {
    const studentSelect = document.getElementById('student_id');
    if (!studentSelect) return;
    const list = studentLists[selectedCourseType] || [];
    studentSelect.innerHTML = '<option value="">Select</option>';
    list.forEach(function (student) {
        const selected = (student.id === selectedStudentId ||
            student.student_id === selectedStudentId ||
            student.student_id_decrypted === selectedStudentId) ? 'selected' : '';
        studentSelect.innerHTML += `<option value="${student.id}" ${selected}>${student.label}</option>`;
    });
}

function onCourseTypeChange() {
    const courseTypeSelect = document.getElementById('course_type');
    if (!courseTypeSelect) return;
    selectedCourseType = courseTypeSelect.value;
    selectedStudentId = '';
    populateStudentOptions();
}

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
    paymentRows.forEach(function (row, index) {
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
    paymentRows.forEach(function (row, index) {
        const select = document.querySelector(`#payment_rows_body tr:nth-child(${index + 1}) select[name='payment_mode[]']`);
        if (select && row.payment_mode) {
            select.value = row.payment_mode;
        }
        if (row.payment_mode) {
            const bankOptions = getBankOptions(row.payment_mode);
            const bankCell = document.getElementById('bank_cell_' + index);
            if (bankCell && bankOptions.length > 0) {
                let selectHtml = '<select name="bank[]" class="form-input">';
                selectHtml += '<option value="">Select</option>';
                bankOptions.forEach(function (bank) {
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
    if (!paymentModeId) return [];
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
            bankOptions.forEach(function (bank) {
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
    amountInputs.forEach(function (input, index) {
        const amount = parseFloat(input.value) || 0;
        total += amount;
        if (paymentRows[index]) {
            paymentRows[index].amount = input.value;
        }
    });

    const feesInput = document.getElementById('fees_amount');
    const cgstInput = document.getElementById('cgst_amount');
    const sgstInput = document.getElementById('sgst_amount');
    const totalInput = document.getElementById('total_amount');

    if (feesInput) {
        const fees = Math.round((total / 1.18 + Number.EPSILON) * 100) / 100;
        const totalTax = Math.round((total - fees + Number.EPSILON) * 100) / 100;
        const cgst = Math.round((totalTax / 2 + Number.EPSILON) * 100) / 100;
        const sgst = Math.round((totalTax - cgst + Number.EPSILON) * 100) / 100;

        feesInput.value = fees.toFixed(2);
        cgstInput.value = cgst.toFixed(2);
        sgstInput.value = sgst.toFixed(2);
        if (totalInput) totalInput.value = total.toFixed(2);
    } else {
        if (totalInput) totalInput.value = total.toFixed(2);
    }
}

function initReceiptForm() {
    const form = document.getElementById('receipt_form');
    if (form) {
        form.addEventListener('change', function (event) {
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
            if (target.name === 'student_id') {
                selectedStudentId = target.value;
            }
        });
    }

    populateStudentOptions();
    renderPaymentRows();

    const courseTypeInput = document.getElementById('course_type');
    if (courseTypeInput) {
        courseTypeInput.value = selectedCourseType;
    }

    // Initialize Select2 on student select box
    setTimeout(function () {
        if (window.jQuery && $.fn.select2) {
            const selectEl = $('#student_id');
            selectEl.select2({
                placeholder: "Select Student",
                allowClear: true,
                width: '100%'
            });
            selectEl.on('change', function () {
                selectedStudentId = this.value;
            });
        }
    }, 50);
}
