<?php
require_once '../common_file.php';
require_once '../fpdf/fpdf.php';

if ($user_role != 'admin' && $user_role != 'director' && !$is_management) { exit('Unauthorized'); }

$expense_category_id = '';
if(isset($_GET['expense_category_id']) && !empty($_GET['expense_category_id'])) {
    $expense_category_id = $bf->sanitize($_GET['expense_category_id']);
}

$payment_mode_id = '';
if(isset($_GET['payment_mode_id']) && !empty($_GET['payment_mode_id'])) {
    $payment_mode_id = $bf->sanitize($_GET['payment_mode_id']);
}

$from_date = '';
if(isset($_GET['from_date']) && !empty($_GET['from_date'])) {
    $from_date = $bf->sanitize($_GET['from_date']);
}

$to_date = '';
if(isset($_GET['to_date']) && !empty($_GET['to_date'])) {
    $to_date = $bf->sanitize($_GET['to_date']);
}

// Fetch report data
$payments = $bf->getPaymentReportList('', '', $from_date, $to_date, 'Expense', $expense_category_id, $payment_mode_id);

$payment_modes_map = [];
$all_modes_list = $bf->getQueryRecords("SELECT payment_mode_id, payment_mode_name FROM {$GLOBALS['payment_mode_table']}");
if (!empty($all_modes_list)) {
    foreach ($all_modes_list as $m) {
        $payment_modes_map[trim($m['payment_mode_id'])] = $m['payment_mode_name'];
    }
}

$pdf = new FPDF('L', 'mm', 'A4'); // Landscape for more columns
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->setTitle('Expense Report', true);
$from_page = 'Expense Report';

// Build filter display text
$filter_parts = [];
if (!empty($expense_category_id)) {
    $cat_name = $bf->getTableColumnValue($GLOBALS['expense_category_table'], 'expense_category_id', $expense_category_id, 'expense_category_name');
    if ($cat_name) $filter_parts[] = "Category: " . $cat_name;
}
if (!empty($payment_mode_id)) {
    $pm_name = $bf->getTableColumnValue($GLOBALS['payment_mode_table'], 'payment_mode_id', $payment_mode_id, 'payment_mode_name');
    if ($pm_name) $filter_parts[] = "Mode: " . $pm_name;
}

$date_display = "";
if(!empty($from_date) && !empty($to_date)) {
    $date_display = "From: " . date('d-m-Y', strtotime($from_date)) . "   To: " . date('d-m-Y', strtotime($to_date));
} elseif(!empty($from_date)) {
    $date_display = "From: " . date('d-m-Y', strtotime($from_date));
} elseif(!empty($to_date)) {
    $date_display = "To: " . date('d-m-Y', strtotime($to_date));
}

// ---- HEADER ----
$company_id = $_SESSION['company_id'] ?? $GLOBALS['bill_company_id'] ?? '';
$company = [];
if (!empty($company_id)) {
    $company_list = $bf->getTableRecords($GLOBALS['company_table'], 'company_id', $company_id);
    $company = !empty($company_list) ? $company_list[0] : [];
}
if (empty($company)) {
    $company_list = $bf->getTableRecords($GLOBALS['company_table'], 'deleted', 0);
    $company = !empty($company_list) ? $company_list[0] : [];
}

$pdf->Rect(10, 10, 277, 32);

$logo_path = "";
if (!empty($company['logo_image'])) {
    $logo_path = "../" . $company['logo_image'];
}
if (empty($logo_path) || !file_exists($logo_path)) {
    $logo_path = "../main/images/logo.png";
}
if(file_exists($logo_path)) {
    $pdf->Image($logo_path, 13, 13, 22);
}

$pdf->SetXY(45, 10);
if(!empty($company)) {
    $pdf->SetFont('Arial', 'B', 22);
    $pdf->Cell(232, 10, strtoupper($company['company_name']), 0, 1, 'C');

    $email  = $company['company_email'] ?? '';
    $mobile = $company['company_mobile'] ?? '';
    $pdf->SetFont('Arial', '', 11);
    $pdf->SetX(45);
    $pdf->Cell(232, 6, "Email: $email | Mobile: $mobile", 0, 1, 'C');

    if(!empty($company['company_address'])) {
        $pdf->SetX(45);
        $pdf->Cell(232, 6, $company['company_address'], 0, 1, 'C');
    }
}

$pdf->SetFont('Arial', 'B', 11);
$title_text = $from_page . ' ' . $date_display;
if (!empty($filter_parts)) {
    $title_text .= '  |  ' . implode(', ', $filter_parts);
}
$pdf->Cell(277, 10, $title_text, 1, 1, 'C');
$title_report_y = $pdf->GetY();

// ---- TABLE HEADER ----
$pdf->setY($title_report_y);
$pdf->SetFont('Arial', 'B', 9);
$pdf->cell(12, 8, 'S.No', 1, 0, 'C');
$pdf->cell(35, 8, 'Bill ID', 1, 0, 'C');
$pdf->cell(30, 8, 'Date', 1, 0, 'C');
$pdf->cell(110, 8, 'Bill Details', 1, 0, 'C');
$pdf->cell(40, 8, 'Payment Mode', 1, 0, 'C');
$pdf->cell(50, 8, 'Amount', 1, 1, 'C');

$sno = 0;
$total_debit = 0;

if(!empty($payments)) {
    foreach ($payments as $p) {
        $sno++;
        $total_debit += $p['debit'];

        // Check page break
        if ($pdf->getY() > 180) {
            $pdf->AddPage();
            $pdf->SetFont('Arial', 'B', 9);
            $pdf->cell(12, 8, 'S.No', 1, 0, 'C');
            $pdf->cell(35, 8, 'Bill ID', 1, 0, 'C');
            $pdf->cell(30, 8, 'Date', 1, 0, 'C');
            $pdf->cell(110, 8, 'Bill Details', 1, 0, 'C');
            $pdf->cell(40, 8, 'Payment Mode', 1, 0, 'C');
            $pdf->cell(50, 8, 'Amount', 1, 1, 'C');
        }
        
        $pdf->SetFont('Arial', '', 8);
        $row_start_y = $pdf->getY();
        $pdf->setX(10);
        
        // S.No
        $pdf->cell(12, 6, $sno, 0, 0, 'C');
        
        // Bill ID
        $pdf->Multicell(35, 6, $p['bill_id'], 0, 'C');
        $id_y = $pdf->getY();
        
        // Date
        $pdf->setXY(57, $row_start_y);
        $pdf->Multicell(30, 6, date('d-m-Y', strtotime($p['bill_date'])), 0, 'C');
        $date_y = $pdf->getY();
        
        // Bill Details
        $pdf->setXY(87, $row_start_y);
        $details_text = $p['bill_details'];
        if (strlen($details_text) > 95) {
            $details_text = substr($details_text, 0, 92) . '...';
        }
        $pdf->Multicell(110, 6, $details_text, 0, 'L');
        $details_y = $pdf->getY();
        
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
        $max_y = max([$id_y, $date_y, $details_y, $row_start_y + $rowspan * 6]);
        $row_height = $max_y - $row_start_y;
        $split_height = $row_height / $rowspan;
        
        // Print Payment Mode and Amount for each split
        for ($i = 0; $i < $rowspan; $i++) {
            $split = $display_splits[$i] ?? ['name' => '-', 'amount' => 0];
            
            // Payment Mode text
            $pdf->setXY(197, $row_start_y + $i * $split_height);
            $pdf->Cell(40, $split_height, $split['name'], 0, 0, 'C');
            
            // Amount text
            $pdf->setXY(237, $row_start_y + $i * $split_height);
            $amt_text = $split['amount'] > 0 ? number_format($split['amount'], 2) : '-';
            $pdf->Cell(50, $split_height, $amt_text, 0, 0, 'R');
        }
        
        // Draw cell borders
        $pdf->setY($row_start_y);
        $pdf->setX(10);
        $pdf->cell(12, $row_height, '', 1, 0, 'C');
        $pdf->cell(35, $row_height, '', 1, 0, 'C');
        $pdf->cell(30, $row_height, '', 1, 0, 'C');
        $pdf->cell(110, $row_height, '', 1, 0, 'C');
        
        // Draw cell borders for split columns
        for ($i = 0; $i < $rowspan; $i++) {
            $pdf->setXY(197, $row_start_y + $i * $split_height);
            $pdf->cell(40, $split_height, '', 1, 0, 'C');
            $pdf->cell(50, $split_height, '', 1, 0, 'C');
        }
        
        // Set Y position for the next row
        $pdf->setY($row_start_y + $row_height);
    }
    
    // Grand Total row
    $pdf->SetFont('Arial', 'B', 9);
    $pdf->setX(10);
    $pdf->cell(227, 8, 'Grand Total', 1, 0, 'R');
    $pdf->cell(50, 8, number_format($total_debit, 2), 1, 1, 'R');
    
} else {
    $pdf->SetFont('Arial', '', 9);
    $pdf->cell(0, 10, 'No records found', 1, 1, 'C');
}

// Footer
$pdf->Ln(3);
$pdf->setX(10);
$pdf->SetFont('Arial', 'I', 8);
$pdf->SetTextColor(148, 163, 184);
$pdf->cell(237, 5, 'Report generated on ' . date('d-m-Y H:i:s'), 0, 0, 'L');
$pdf->cell(0, 5, 'Page ' . $pdf->PageNo() . ' / {nb}', 0, 1, 'R');

$pdf->Output('I', 'Expenses_Report.pdf');
?>
