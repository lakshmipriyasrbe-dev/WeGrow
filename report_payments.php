<?php require_once 'common_file.php'; 
$from_page = 'Payments Report';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $course_type = isset($_POST['course_type']) ? $bf->sanitize($_POST['course_type']) : '';
    $student_id = isset($_POST['student_id']) ? $bf->sanitize($_POST['student_id']) : '';
    $payment_mode_id = isset($_POST['payment_mode_id']) ? $bf->sanitize($_POST['payment_mode_id']) : '';
    $from_date = isset($_POST['from_date']) ? $bf->sanitize($_POST['from_date']) : '';
    $to_date = isset($_POST['to_date']) ? $bf->sanitize($_POST['to_date']) : '';
} else {
    $course_type = '';
    $student_id = '';
    $payment_mode_id = '';
    $from_date = date('Y-m-d', strtotime('-30 days'));
    $to_date = date('Y-m-d');
}

// Load payment modes for filter dropdown
// $payment_mode_list = $bf->getQueryRecords("SELECT payment_mode_id, payment_mode_name FROM {$GLOBALS['payment_mode_table']} WHERE deleted = 0");

// Load payment modes map for display mapping
$payment_modes_map = [];
$all_modes_list = $bf->getQueryRecords("SELECT payment_mode_id, payment_mode_name FROM {$GLOBALS['payment_mode_table']} WHERE deleted = 0");
if (!empty($all_modes_list)) {
    foreach ($all_modes_list as $m) {
        $payment_modes_map[trim($m['payment_mode_id'])] = $m['payment_mode_name'];
    }
}

// Load students for receipt filter dropdown
// $all_payments = $bf->getQueryRecords("SELECT DISTINCT student_id, course_type FROM {$GLOBALS['payment_table']} WHERE deleted = 0");
// $students_options = [];
// foreach ($all_payments as $ap) {
//     $sid = $ap['student_id'];
//     $ctype = $ap['course_type'];
//     $table = $ctype === 'internship' ? $GLOBALS['enrollment_internship_table'] : $GLOBALS['enrollment_table'];
//     $id_field = $ctype === 'internship' ? 'enrollment_internship_id' : 'enrollment_id';
//     $stu_rec = $bf->getTableRecords($table, 'student_id', $sid);
//     if(!empty($stu_rec)) {
//         $dec_id = $bf->encode_decode('decrypt', $stu_rec[0]['student_id']);
//         $students_options[$sid] = $dec_id . ' - ' . $stu_rec[0]['student_name'] . ' (' . ucfirst($ctype) . ')';
//     }
// }

$students_options = [];

// Training Students
$training_students = $bf->getQueryRecords("
    SELECT DISTINCT student_id, student_name
    FROM {$GLOBALS['enrollment_table']}
    WHERE deleted = 0
    ORDER BY student_name
");

foreach ($training_students as $row) {

    $students_options[$row['student_id']] =
        $bf->encode_decode('decrypt', $row['student_id'])
        . ' - '
        . $row['student_name']
        . ' (Training)';
}

// Internship Students
$intern_students = $bf->getQueryRecords("
    SELECT DISTINCT student_id, student_name
    FROM {$GLOBALS['enrollment_internship_table']}
    WHERE deleted = 0
    ORDER BY student_name
");

foreach ($intern_students as $row) {

    $students_options[$row['student_id']] =
        $bf->encode_decode('decrypt', $row['student_id'])
        . ' - '
        . $row['student_name']
        . ' (Internship)';
}

asort($students_options);

// Fetch combined report data
$payments = $bf->getPaymentReportList($course_type, $student_id, $from_date, $to_date, 'Receipt', '', $payment_mode_id);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments Report - <?php echo get_company_name(); ?></title>
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
            <h2><?php if(!empty($from_page)) echo ucfirst($from_page); ?></h2>
        </div>

        <div class="module-section">
            <div id="course_list">
                <form name="payment_report_form" id="payment_report_form" method="post">
                    <div class="filter-row">
                        <!-- Course Type filter -->
                        <div class="form-group" id="filter_course_type">
                            <label>Course Type</label>
                            <select name="course_type" id="course_type" class="form-input" onchange="getReport()">
                                <option value="">All</option>
                                <option value="training" <?php echo $course_type === 'training' ? 'selected' : ''; ?>>Training</option>
                                <option value="internship" <?php echo $course_type === 'internship' ? 'selected' : ''; ?>>Internship</option>
                            </select>
                        </div>

                        <!-- Student filter -->
                        <div class="form-group" id="filter_student">
                            <label>Student</label>
                            <select name="student_id" id="student_id" class="form-input" onchange="getReport()">
                                <option value="">All Students</option>
                                <?php foreach ($students_options as $sid => $sname) { ?>
                                    <option value="<?php echo $sid; ?>" <?php echo $student_id === $sid ? 'selected' : ''; ?>><?php echo $sname; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                        <!-- Payment Mode filter -->
                        <div class="form-group" id="filter_payment_mode">
                            <label>Payment Mode</label>
                            <select name="payment_mode_id" id="payment_mode_id" class="form-input" onchange="getReport()">
                                <option value="">All Payment Modes</option>
                                <?php if(!empty($all_modes_list)) {
                                    foreach($all_modes_list as $pm) { ?>
                                        <option value="<?php echo $pm['payment_mode_id']; ?>"
                                            <?php echo ($payment_mode_id == $pm['payment_mode_id']) ? 'selected' : ''; ?>>
                                            <?php echo $pm['payment_mode_name']; ?>
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
                    $total_credit = 0;
                    if (!empty($payments)) {
                        foreach ($payments as $p) {
                            $total_credit += $p['credit'];
                        }
                    }
                ?>

                <!-- Summary Cards -->
                <div class="summary-cards">
                    <div class="summary-card" style="background: rgba(16,185,129,0.06); max-width: 300px;">
                        <div class="label">Total Receipts (Payments)</div>
                        <div class="value credit-amount">₹<?php echo number_format($total_credit, 2); ?></div>
                    </div>
                </div>

                <div class="report-actions">
                    <button type="button" class="btn-report btn-print"
                        onclick="window.open('reports/rpt_payments_report.php?course_type=<?php echo $course_type; ?>&student_id=<?php echo $student_id; ?>&payment_mode_id=<?php echo $payment_mode_id; ?>&from_date=<?php echo $from_date; ?>&to_date=<?php echo $to_date; ?>', '_blank')">
                        <i class="fas fa-print"></i> Print Report
                    </button>
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
                                                <span class="credit-amount">₹<?php echo number_format($first_split['amount'], 2); ?></span>
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
                                                    <span class="credit-amount">₹<?php echo number_format($split['amount'], 2); ?></span>
                                                <?php } else { echo '-'; } ?>
                                            </td>
                                        </tr>
                                    <?php 
                                        } 
                                    ?>
                                <?php } ?>
                                <tr style="background: #f8fafc;">
                                    <td colspan="5" style="text-align: right; font-weight: bold; font-size: 1.05rem; color: var(--primary);">Grand Total</td>
                                    <td><span class="credit-amount" style="font-size: 1.05rem;">₹<?php echo number_format($total_credit, 2); ?></span></td>
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

        function getExcelReport() {
            let table = document.getElementById("payment_report_table");
            let workbook = XLSX.utils.table_to_book(table, {
                sheet: "Payments Report"
            });
            XLSX.writeFile(workbook, "Payments_Report.xlsx");
        }
    </script>
</body>
</html>
