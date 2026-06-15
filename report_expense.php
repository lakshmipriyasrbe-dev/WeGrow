<?php require_once 'common_file.php'; 
$from_page = 'Expense Report';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $expense_category_id = isset($_POST['expense_category_id']) ? $bf->sanitize($_POST['expense_category_id']) : '';
    $payment_mode_id = isset($_POST['payment_mode_id']) ? $bf->sanitize($_POST['payment_mode_id']) : '';
    $from_date = isset($_POST['from_date']) ? $bf->sanitize($_POST['from_date']) : '';
    $to_date = isset($_POST['to_date']) ? $bf->sanitize($_POST['to_date']) : '';
} else {
    $expense_category_id = '';
    $payment_mode_id = '';
    $from_date = date('Y-m-d', strtotime('-30 days'));
    $to_date = date('Y-m-d');
}

// Load expense categories for filter dropdown
$expense_category_list = $bf->getTableRecords($GLOBALS['expense_category_table'], 'deleted', 0);

// Load payment modes for filter dropdown
$payment_mode_list = $bf->getQueryRecords("SELECT payment_mode_id, payment_mode_name FROM {$GLOBALS['payment_mode_table']} WHERE deleted = 0");

// Load payment modes map for display mapping
$payment_modes_map = [];
$all_modes_list = $bf->getQueryRecords("SELECT payment_mode_id, payment_mode_name FROM {$GLOBALS['payment_mode_table']}");
if (!empty($all_modes_list)) {
    foreach ($all_modes_list as $m) {
        $payment_modes_map[trim($m['payment_mode_id'])] = $m['payment_mode_name'];
    }
}

// Fetch report data
$payments = $bf->getPaymentReportList('', '', $from_date, $to_date, 'Expense', $expense_category_id, $payment_mode_id);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Report - <?php echo get_company_name(); ?></title>
    <link rel="stylesheet" href="assets/outfit.css">
    <script src="js/jquery.min.js"></script>
    <?php include 'includes/head_assets.php'; ?>
    <style>
        .credit-amount { color: #10b981; font-weight: 700; }
        .debit-amount { color: #ef4444; font-weight: 700; }
        .balance-credit { color: #10b981; font-weight: 700; }
        .balance-debit { color: #ef4444; font-weight: 700; }
        .bill-type-receipt { background: rgba(16,185,129,0.12); color: #10b981; padding: 0.2rem 0.6rem; border-radius: 0.3rem; font-weight: 700; font-size: 0.8rem; }
        .bill-type-expense { background: rgba(239,68,68,0.12); color: #ef4444; padding: 0.2rem 0.6rem; border-radius: 0.3rem; font-weight: 700; font-size: 0.8rem; }
        .summary-cards { display: flex; gap: 1rem; margin-bottom: 1.5rem; flex-wrap: wrap; }
        .summary-card { flex: 1; min-width: 180px; padding: 1rem 1.25rem; border-radius: 0.75rem; border: 1px solid var(--border); }
        .summary-card .label { font-size: 0.8rem; color: var(--text-muted); margin-bottom: 0.25rem; }
        .summary-card .value { font-size: 1.3rem; font-weight: 700; }
        .filter-row { display: flex; gap: 0.75rem; flex-wrap: wrap; align-items: flex-end; }
        .filter-row .form-group { flex: 1; min-width: 160px; }
    </style>
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <div class="main-content update_content">
        <div class="header">
            <h2><?php if(!empty($from_page)) echo htmlspecialchars($from_page); ?></h2>
        </div>

        <div class="module-section">
            <div id="course_list">
                <form name="payment_report_form" id="payment_report_form" method="post">
                    <div class="filter-row">
                        <!-- Expense Category filter -->
                        <div class="form-group" id="filter_expense_category">
                            <label>Expense Category</label>
                            <select name="expense_category_id" id="expense_category_id" class="form-input" onchange="getReport()">
                                <option value="">All Categories</option>
                                <?php if(!empty($expense_category_list)) {
                                    foreach($expense_category_list as $category) { ?>
                                        <option value="<?php echo $category['expense_category_id']; ?>"
                                            <?php echo ($expense_category_id == $category['expense_category_id']) ? 'selected' : ''; ?>>
                                            <?php echo htmlspecialchars($category['expense_category_name']); ?>
                                        </option>
                                <?php } } ?>
                            </select>
                        </div>

                        <!-- Payment Mode filter -->
                        <div class="form-group" id="filter_payment_mode">
                            <label>Payment Mode</label>
                            <select name="payment_mode_id" id="payment_mode_id" class="form-input" onchange="getReport()">
                                <option value="">All Payment Modes</option>
                                <?php if(!empty($payment_mode_list)) {
                                    foreach($payment_mode_list as $pm) { ?>
                                        <option value="<?php echo $pm['payment_mode_id']; ?>"
                                            <?php echo ($payment_mode_id == $pm['payment_mode_id']) ? 'selected' : ''; ?>>
                                            <?php echo htmlspecialchars($pm['payment_mode_name']); ?>
                                        </option>
                                <?php } } ?>
                            </select>
                        </div>

                        <!-- Common date filters -->
                        <div class="form-group">
                            <label>From Date</label>
                            <input type="date" name="from_date" id="from_date" class="form-input"
                                value="<?php echo $from_date; ?>" max="<?php echo date('Y-m-d'); ?>" onchange="getReport()">
                        </div>
                        <div class="form-group">
                            <label>To Date</label>
                            <input type="date" name="to_date" id="to_date" class="form-input"
                                value="<?php echo $to_date; ?>" max="<?php echo date('Y-m-d'); ?>" onchange="getReport()">
                        </div>
                    </div>
                </form>

                <?php
                    // Calculate summary totals
                    $total_debit = 0;
                    if (!empty($payments)) {
                        foreach ($payments as $p) {
                            $total_debit += $p['debit'];
                        }
                    }
                ?>

                <!-- Summary Cards -->
                <div class="summary-cards">
                    <div class="summary-card" style="background: rgba(239,68,68,0.06); max-width: 300px;">
                        <div class="label">Total Expenses (Debits)</div>
                        <div class="value debit-amount">₹<?php echo number_format($total_debit, 2); ?></div>
                    </div>
                </div>

                <div class="report-actions">
                    <!-- <a href="reports/rpt_expense.php?expense_category_id=<?php echo $expense_category_id; ?>&payment_mode_id=<?php echo $payment_mode_id; ?>&from_date=<?php echo $from_date; ?>&to_date=<?php echo $to_date; ?>" 
                       target="_blank" 
                       class="btn-report btn-print" 
                       style="text-decoration: none;"
                       onclick="window.open('reports/rpt_expense_attachements.php?expense_category_id=<?php echo $expense_category_id; ?>&payment_mode_id=<?php echo $payment_mode_id; ?>&from_date=<?php echo $from_date; ?>&to_date=<?php echo $to_date; ?>', '_blank')">
                        <i class="fas fa-print"></i> Print Report
                    </a> -->
                    <a href="javascript:void(0);" onclick="openReports()"
                        class="btn-report btn-print" style="text-decoration:none;">
                        <i class="fas fa-print"></i> Print Report
                    </a>
                    <button type="button" class="btn-report btn-excel"
                        onclick="getExcelReport();">
                        <i class="fas fa-file-excel"></i> Export Excel
                    </button>
                </div>

                <table class="responsive table table-bordered" id="payment_report_table">
                    <thead>
                        <tr>
                            <th>Sno</th>
                            <th>Bill ID</th>
                            <th>Bill Date</th>
                            <th>Bill Details</th>
                            <th>Payment Mode</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            $sno = 1;
                            if(!empty($payments)) {
                                foreach ($payments as $p) {
                                    // Get all payment modes and their amounts
                                    $raw_modes = !empty($p['payment_mode']) ? array_map('trim', explode(',', $p['payment_mode'])) : [];
                                    $raw_amounts = !empty($p['raw']['amount']) ? array_map('trim', explode(',', $p['raw']['amount'])) : [];
                                    
                                    // Filter modes if a specific filter is set
                                    $display_splits = [];
                                    foreach ($raw_modes as $idx => $mode_id) {
                                        if (empty($payment_mode_id) || $mode_id == $payment_mode_id) {
                                            $mode_name = isset($payment_modes_map[$mode_id]) ? $payment_modes_map[$mode_id] : $mode_id;
                                            $amt = isset($raw_amounts[$idx]) ? floatval($raw_amounts[$idx]) : 0;
                                            $display_splits[] = [
                                                'name' => $mode_name,
                                                'amount' => $amt
                                            ];
                                        }
                                    }
                                    
                                    // Fallback if empty
                                    if (empty($display_splits)) {
                                        foreach ($raw_modes as $idx => $mode_id) {
                                            $mode_name = isset($payment_modes_map[$mode_id]) ? $payment_modes_map[$mode_id] : $mode_id;
                                            $amt = isset($raw_amounts[$idx]) ? floatval($raw_amounts[$idx]) : 0;
                                            $display_splits[] = [
                                                'name' => $mode_name,
                                                'amount' => $amt
                                            ];
                                        }
                                    }
                                    
                                    $rowspan = count($display_splits);
                                    if ($rowspan < 1) $rowspan = 1;
                                    
                                    $first_split = $display_splits[0] ?? ['name' => '-', 'amount' => 0];
                                ?>
                                    <tr>
                                        <td rowspan="<?php echo $rowspan; ?>"><?php echo $sno++; ?></td>
                                        <td rowspan="<?php echo $rowspan; ?>"><span style="font-weight: 600;"><?php echo htmlspecialchars($p['bill_id']); ?></span></td>
                                        <td rowspan="<?php echo $rowspan; ?>"><?php echo date('d M Y', strtotime($p['bill_date'])); ?></td>
                                        <td rowspan="<?php echo $rowspan; ?>"><?php echo htmlspecialchars($p['bill_details']); ?></td>
                                        <td><?php echo htmlspecialchars($first_split['name']); ?></td>
                                        <td>
                                            <?php if($first_split['amount'] > 0) { ?>
                                                <span class="debit-amount">₹<?php echo number_format($first_split['amount'], 2); ?></span>
                                            <?php } else { echo '-'; } ?>
                                        </td>
                                    </tr>
                                    <?php 
                                        // Render the remaining splits
                                        for ($i = 1; $i < $rowspan; $i++) {
                                            $split = $display_splits[$i];
                                    ?>
                                        <tr>
                                            <td><?php echo htmlspecialchars($split['name']); ?></td>
                                            <td>
                                                <?php if($split['amount'] > 0) { ?>
                                                    <span class="debit-amount">₹<?php echo number_format($split['amount'], 2); ?></span>
                                                <?php } else { echo '-'; } ?>
                                            </td>
                                        </tr>
                                    <?php 
                                        } 
                                    ?>
                                <?php } ?>
                                <tr style="background: #f8fafc;">
                                    <td colspan="5" style="text-align: right; font-weight: bold; font-size: 1.05rem; color: var(--primary);">Grand Total</td>
                                    <td><span class="debit-amount" style="font-size: 1.05rem;">₹<?php echo number_format($total_debit, 2); ?></span></td>
                                </tr>
                            <?php } else { ?>
                                <tr>
                                    <td colspan="6" style="text-align:center; padding: 2rem; color: var(--text-muted);">No records found.</td>
                                </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script src="main/js/script.js"></script>
    <script src="main/js/xlsx.full.min.js" type="text/javascript"></script>
    <script>
        function getReport() {
            if($('#payment_report_form').length > 0) {
                $('#payment_report_form').submit();
            }
        }

        function openReports() {

            // Open the report PDF in a new tab
            var reportTab = window.open('', '_blank');
            reportTab.location.href =
                'reports/rpt_expense.php?expense_category_id=<?php echo urlencode($expense_category_id); ?>' +
                '&payment_mode_id=<?php echo urlencode($payment_mode_id); ?>' +
                '&from_date=<?php echo urlencode($from_date); ?>' +
                '&to_date=<?php echo urlencode($to_date); ?>';

            // Query params for the attachment download check
            var params = 'expense_category_id=<?php echo urlencode($expense_category_id); ?>' +
                '&payment_mode_id=<?php echo urlencode($payment_mode_id); ?>' +
                '&from_date=<?php echo urlencode($from_date); ?>' +
                '&to_date=<?php echo urlencode($to_date); ?>';

            // Check if there are attachments before downloading
            $.getJSON('reports/download_expense_attachments.php?check=1&' + params, function(data) {
                if (data && data.has_attachments) {
                    var iframe = document.createElement('iframe');
                    iframe.style.display = 'none';
                    iframe.src = 'reports/download_expense_attachments.php?' + params;
                    document.body.appendChild(iframe);
                    setTimeout(function() {
                        document.body.removeChild(iframe);
                    }, 5000);
                } else {
                    alert('No expense attachments found for the selected filter criteria.');
                }
            }).fail(function() {
                console.error('Failed to check for expense attachments.');
            });
        }

        function getExcelReport() {
            let table = document.getElementById("payment_report_table");
            let workbook = XLSX.utils.table_to_book(table, {
                sheet: "Expenses Report"
            });
            XLSX.writeFile(workbook, "Expenses_Report.xlsx");
        }
    </script>
</body>
</html>
