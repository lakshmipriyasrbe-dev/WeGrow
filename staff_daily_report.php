<?php require_once 'common_file.php'; 
$from_page = 'staff daily report';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - <?php echo get_company_name(); ?></title>
    <!--<link rel="stylesheet" href="assets/outfit.css">-->
    <!--<script src="js/jquery.min.js"></script>-->
    <link rel="stylesheet" href="assets/outfit.css">
    <script src="js/jquery.min.js"></script>
    
    <?php include 'includes/head_assets.php'; ?>
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <div class="main-content update_content">
        <div class="header">
            <h2><?php if(!empty($from_page))  echo ucfirst($from_page); ?></h2>
        </div>

        <div class="module-section">
            <div class="section-title">
                Active staff daily reports
                <?php if (checkPermission($_SESSION['company_id'], $_SESSION['role_id'], 'daily_report', PERMISSION_ADD)): ?>
                    <button class="btn-add" onclick="ShowPage('staff_daily_report', '')">Add New staff daily report</button>
                <?php endif; ?>
            </div>

            <div class="list-controls">
                <div class="entries-control">
                    Show 
                    <select id="staff_daily_report_limit" onchange="loadData('staff_daily_report', 1, this.value, $('#staff_daily_report_search').val())">
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                    entries
                </div>
                <div class="search-control">
                    <i class="fas fa-search"></i>
                    <input type="text" id="staff_daily_report_search" placeholder="Search staff_daily_reports..." onkeyup="loadData('staff_daily_report', 1, $('#staff_daily_report_limit').val(), this.value)">
                </div>
            </div>

            <div id="staff_daily_report_list">
                <p style="text-align:center; padding: 2rem; color: var(--text-muted);">Loading staff daily reports...</p>
            </div>
        </div>
    </div>
    <div class="main-content new_content" style="display: none;">
    </div>

    <script>
        $(document).ready(function() {
            loadData('staff_daily_report');
        });
    </script>
    <script src="main/js/script.js"></script>
    <script src="main/js/keyboard_control.js"></script>
</body>
</html>