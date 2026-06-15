<?php
require_once '../common_file.php';
require_once '../fpdf/fpdf.php';

if ($user_role != 'admin' && $user_role != 'director' && !$is_management) { exit('Unauthorized'); }

$from_date = '';
if(isset($_GET['from_date']) && !empty($_GET['from_date'])) {
    $from_date = $bf->sanitize($_GET['from_date']);
}

$to_date = '';
if(isset($_GET['to_date']) && !empty($_GET['to_date'])) {
    $to_date = $bf->sanitize($_GET['to_date']);
}

$staff_id = '';
if(isset($_GET['staff_id']) && !empty($_GET['staff_id'])) {
    $staff_id = $bf->sanitize($_GET['staff_id']);
}

$reports = $bf->getDailyWorkReportList($staff_id, $from_date, $to_date);

$pdf = new FPDF('P', 'mm', 'A4');
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->setTitle('Daily Work Report', true);
$from_page = 'Daily Work Report';

$date_display = "";
if(!empty($from_date) && !empty($to_date)) {
    $date_display = "From: " . date('d-m-Y', strtotime($from_date)) . "   To: " . date('d-m-Y', strtotime($to_date));
} elseif(!empty($from_date)) {
    $date_display = "From: " . date('d-m-Y', strtotime($from_date));
} elseif(!empty($to_date)) {
    $date_display = "To: " . date('d-m-Y', strtotime($to_date));
}

require 'rpt_header.php';
$pdf->setY($title_report_y);
$pdf->SetFont('Arial', 'B', 10);
$pdf->cell(10, 10, 'S.No', 1, 0, 'C');
$pdf->cell(25, 10, 'Date', 1, 0, 'C');
$pdf->cell(35, 10, 'Staff Name', 1, 0, 'C');
$pdf->cell(30, 10, 'Role', 1, 0, 'C');
$pdf->cell(70, 10, 'Activity Details', 1, 0, 'C');
$pdf->cell(20, 10, 'Hours', 1, 1, 'C');

$sno = 0;

if(!empty($reports)) {
    foreach ($reports as $r) {
        $sno++;
        if ($pdf->getY() > 220) {
            $pdf->setXY(10, 10);
            $pdf->cell(190, 258, '', 1, 1, 'C');
            $pdf->AddPage();
            require 'rpt_header.php';
            $pdf->setY($title_report_y);
            $pdf->SetFont('Arial', 'B', 10);
            $pdf->cell(10, 10, 'S.No', 1, 0, 'C');
            $pdf->cell(25, 10, 'Date', 1, 0, 'C');
            $pdf->cell(35, 10, 'Staff Name', 1, 0, 'C');
            $pdf->cell(30, 10, 'Role', 1, 0, 'C');
            $pdf->cell(70, 10, 'Activity Details', 1, 0, 'C');
            $pdf->cell(20, 10, 'Hours', 1, 1, 'C');
        }
        
        $pdf->setFont('Arial', '', 9);
        $row_start_y = $pdf->getY();
        $pdf->setX(10);
        $pdf->cell(10, 6, $sno, 0, 0, 'C');
        
        $pdf->Multicell(25, 6, date('d-m-Y', strtotime($r['report_date'])), 0, 'C');
        $date_y = $pdf->getY();
        
        $pdf->setXY(45, $row_start_y); 
        $pdf->Multicell(35, 6, $r['user_name'], 0, 'L');
        $name_y = $pdf->getY();
        
        $pdf->setXY(80, $row_start_y); 
        $pdf->Multicell(30, 6, ucfirst($r['role_name']), 0, 'L');
        $role_y = $pdf->getY();
        
        $pdf->setXY(110, $row_start_y); 
        $pdf->Multicell(70, 5, $r['activity_details'], 0, 'L');
        $activity_y = $pdf->getY();
        
        $pdf->setXY(180, $row_start_y); 
        $pdf->Multicell(20, 6, $r['hours_spent'] . ' hrs', 0, 'C');
        $hours_y = $pdf->getY();
        
        $max_y = max([$date_y, $name_y, $role_y, $activity_y, $hours_y]); 
        
        $pdf->setY($row_start_y);
        $pdf->setX(10);
        $pdf->cell(10, ($max_y - $row_start_y), '', '1', 0, 'C');
        $pdf->cell(25, ($max_y - $row_start_y), '', '1', 0, 'C');
        $pdf->cell(35, ($max_y - $row_start_y), '', '1', 0, 'C');
        $pdf->cell(30, ($max_y - $row_start_y), '', '1', 0, 'C');
        $pdf->cell(70, ($max_y - $row_start_y), '', '1', 0, 'C');
        $pdf->cell(20, ($max_y - $row_start_y), '', '1', 1, 'C');
    }
} else {
    $pdf->cell(0, 10, 'No daily reports found', 1, 1, 'C');
}

$pdf->setXY(10, 10);
$pdf->cell(190, 258, '', 1, 1, 'C');
$pdf->Ln(2);
$pdf->setX(10);
$pdf->setFont('Arial', 'I', 8);
$pdf->setTextColor(148, 163, 184);
$pdf->cell(160, 5, 'Report generated on ' . date('d-m-Y H:i:s'), 0, 0, 'L');
$pdf->cell(0, 5, 'Page ' . $pdf->PageNo() . ' / {nb}', 0, 1, 'R');

$pdf->Output('I', 'Daily_Work_Report.pdf');
?>
