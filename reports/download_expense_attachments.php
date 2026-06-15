<?php
require_once '../common_file.php';

if ($user_role != 'admin' && $user_role != 'director' && !$is_management) {
    exit('Unauthorized');
}

$expense_category_id = '';
if (isset($_GET['expense_category_id']) && !empty($_GET['expense_category_id'])) {
    $expense_category_id = $bf->sanitize($_GET['expense_category_id']);
}

$payment_mode_id = '';
if (isset($_GET['payment_mode_id']) && !empty($_GET['payment_mode_id'])) {
    $payment_mode_id = $bf->sanitize($_GET['payment_mode_id']);
}

$from_date = '';
if (isset($_GET['from_date']) && !empty($_GET['from_date'])) {
    $from_date = $bf->sanitize($_GET['from_date']);
}

$to_date = '';
if (isset($_GET['to_date']) && !empty($_GET['to_date'])) {
    $to_date = $bf->sanitize($_GET['to_date']);
}

// Fetch report data
$payments = $bf->getPaymentReportList('', '', $from_date, $to_date, 'Expense', $expense_category_id, $payment_mode_id);

$files_to_zip = []; // associative array: [ $target_zip_path => $source_file_path ]
$has_attachments = false;

if (!empty($payments)) {
    foreach ($payments as $p) {
        if ($p['bill_type'] === 'Expense' && !empty($p['raw']['attachments'])) {
            $files = array_filter(array_map('trim', explode(',', $p['raw']['attachments'])));
            if (!empty($files)) {
                $bill_date = $p['bill_date']; // e.g. 2026-06-01
                $bill_id = $p['bill_id'];     // e.g. EXP001
                
                // Clean dates and bill ids for safe directory names in zip
                $bill_date_clean = preg_replace('/[^0-9-]/', '', $bill_date);
                $bill_id_temp = str_replace('/', '-', $bill_id);
                $bill_id_clean = preg_replace('/[^a-zA-Z0-9_-]/', '', $bill_id_temp);
                
                foreach ($files as $fileName) {
                    $clean_file_name = basename($fileName);
                    $filePath = "../upload/" . $clean_file_name;
                    
                    if (file_exists($filePath)) {
                        // Zip folder structure: YYYY-MM-DD/EXPxxx/filename
                        $zipPath = $bill_date_clean . '/' . $bill_id_clean . '/' . $clean_file_name;
                        $files_to_zip[$zipPath] = $filePath;
                        $has_attachments = true;
                    }
                }
            }
        }
    }
}

// If it's just a check request, return JSON status
if (isset($_GET['check']) && $_GET['check'] == '1') {
    header('Content-Type: application/json');
    echo json_encode(['has_attachments' => $has_attachments]);
    exit;
}

if (!$has_attachments) {
    // If no attachments, return a message to the user
    echo "<script>alert('No expense attachments found matching the active filter criteria.');</script>";
    exit;
}

// Create a temporary file to store the ZIP
$temp_zip = tempnam(sys_get_temp_dir(), 'exp_zip_');
if ($temp_zip === false) {
    exit('Failed to create temporary file.');
}

$zip = new ZipArchive();
if ($zip->open($temp_zip, ZipArchive::CREATE | ZipArchive::OVERWRITE) === TRUE) {
    foreach ($files_to_zip as $zipPath => $filePath) {
        $zip->addFile($filePath, $zipPath);
    }
    $zip->close();
    
    // Clear output buffer to prevent corrupted files
    if (ob_get_level()) {
        ob_end_clean();
    }
    
    // Serve the file as attachment download
    header('Content-Type: application/zip');
    header('Content-Disposition: attachment; filename="Expense_Attachments.zip"');
    header('Content-Length: ' . filesize($temp_zip));
    header('Pragma: no-cache');
    header('Expires: 0');
    
    readfile($temp_zip);
    unlink($temp_zip);
    exit;
} else {
    exit('Could not create ZIP archive.');
}
?>
