<?php require_once 'common_file.php'; 
$from_page = 'Daily Work Report';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $from_date = isset($_POST['from_date']) ? $bf->sanitize($_POST['from_date']) : '';
    $to_date = isset($_POST['to_date']) ? $bf->sanitize($_POST['to_date']) : '';
    $staff_id = isset($_POST['staff_id']) ? $bf->sanitize($_POST['staff_id']) : '';
} else {
    $from_date = date('Y-m-d');
    $to_date = date('Y-m-d');
    $staff_id = '';
} 

$staffs = $bf->getTableRecords($GLOBALS['staff_table'], 'deleted', 0);
$reports = $bf->getDailyWorkReportList($staff_id, $from_date, $to_date);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daily Work Report - <?php echo get_company_name(); ?></title>
    <link rel="stylesheet" href="assets/outfit.css">
    <script src="js/jquery.min.js"></script>
    <?php include 'includes/head_assets.php'; ?>
</head>
<body>
    <?php include_once 'sidebar.php'; ?>

    <div class="main-content update_content">
        <div class="header">
            <h2><?php if(!empty($from_page))  echo ucfirst($from_page); ?></h2>
        </div>

        <div class="module-section">
            <div id="daily_work_list">
                <form name="daily_work_report_form" id="daily_work_report_form" method="post">
                    <div class="form-row">
                        <div class="form-group col-3">
                            <label>From Date </label>
                            <input
                                type="date"
                                name="from_date"
                                id="from_date"
                                class="form-input"
                                value="<?php echo $from_date; ?>"
                                max="<?php echo date('Y-m-d'); ?>" onchange="getReport()"
                            >
                        </div>
                        <div class="form-group col-3">
                            <label>To Date </label>
                            <input
                                type="date"
                                name="to_date"
                                id="to_date"
                                class="form-input"
                                value="<?php echo $to_date; ?>"
                                max="<?php echo date('Y-m-d'); ?>" onchange="getReport()"
                            >
                        </div>
                        <div class="form-group col-3">
                            <label>Staff </label>
                            <select name="staff_id" id="staff_id" class="form-input" onchange="getReport()">
                                <option value="">All Staff</option>
                                <?php foreach ($staffs as $data) { ?>
                                    <option value="<?php echo $data['staff_id']; ?>" <?php echo $staff_id === $data['staff_id'] ? 'selected' : ''; ?>>
                                        <?php echo htmlspecialchars($data['staff_name']); ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="report-actions">
                    <button type="button" class="btn-report btn-print"
                        onclick="window.open('reports/rpt_daily_work.php?from_date=<?php echo $from_date; ?>&to_date=<?php echo $to_date; ?>&staff_id=<?php echo $staff_id; ?>', '_blank')">
                        <i class="fas fa-print"></i> Print Report
                    </button>
                    <button type="button" class="btn-report btn-excel"
                        onclick="getExcelReport();">
                        <i class="fas fa-file-excel"></i> Export Excel
                    </button>
                </div>

                <table class="responsive table table-bordered" id="daily_work_report_table">
                    <thead>
                        <tr>
                            <th style="width: 5%">Sno</th>                            
                            <th style="width: 12%">Date</th>
                            <th style="width: 15%">Staff Name</th>
                            <th style="width: 15%">Role</th>
                            <th style="width: 43%">Activity Details</th>
                            <th style="width: 10%">Hours Spent</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            $sno = 1;
                            if(!empty($reports)) {
                                foreach ($reports as $r) { 
                                ?>
                                    <tr>
                                        <td><?php echo $sno++; ?></td>
                                        <td><?php echo date('d M Y', strtotime($r['report_date'])); ?></td>
                                        <td>
                                            <span style="color: var(--primary); font-weight: 600;">
                                                <?php echo htmlspecialchars($r['user_name']); ?>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="status-badge" style="background: var(--primary-light); color: var(--primary);">
                                                <?php echo ucfirst(htmlspecialchars($r['role_name'])); ?>
                                            </span>
                                        </td>
                                        <td style="white-space: normal; line-height: 1.4; word-break: break-word;">
                                            <?php echo nl2br(htmlspecialchars($r['activity_details'])); ?>
                                        </td>
                                        <td><strong><?php echo htmlspecialchars($r['hours_spent']); ?> hrs</strong></td>
                                    </tr>
                                <?php } 
                            } else { ?>
                                <tr>
                                    <td colspan="6" style="text-align:center; padding: 2rem; color: var(--text-muted);">No daily reports found for the selected filters.</td>
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
            if($('#daily_work_report_form').length > 0) {
                $('#daily_work_report_form').submit();
            }
        }

        function getExcelReport() {
            let table = document.getElementById("daily_work_report_table");
            let workbook = XLSX.utils.table_to_book(table, {
                sheet: "Daily Work Report"
            });
            XLSX.writeFile(workbook, "Daily_Work_Report.xlsx");
        }
    </script>
</body>
</html>
