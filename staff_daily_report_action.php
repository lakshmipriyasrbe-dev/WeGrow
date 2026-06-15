<?php require_once 'common_file.php'; 
$action = $_REQUEST['action'] ?? '';

$staff_daily_report_id = ""; 
$report_date = date('Y-m-d');  
$activity_details = ""; 
$hours_spent = ""; 

// 1. Process Form Submission
if (isset($_POST['hours_spent'])) {
    $report_date = $bf->sanitize($_POST['report_date'] ?? '');
    $activity_details = $bf->sanitize($_POST['activity_details'] ?? '');
    $hours_spent = $bf->sanitize($_POST['hours_spent'] ?? '');
    $view_staff_daily_report_id = $bf->sanitize($_POST['view_staff_daily_report_id'] ?? '');

    $errors = [];
    $res = $valid->common_validation($report_date, 'Date', '');
    if ($res) $errors['report_date'] = $res;
    $res = $valid->common_validation($activity_details, 'Activity Details', '');
    if ($res) $errors['activity_details'] = $res;
    $res = $valid->common_validation($hours_spent, 'Hours Spent', '');
    if ($res) $errors['hours_spent'] = $res;
    
    if (empty($errors)) {
        // Enforce one report per day per user
        $existing_query = "SELECT id FROM " . $GLOBALS['report_table'] . " WHERE user_id = :user_id AND report_date = :report_date AND deleted = 0";
        $existing_params = [':user_id' => $user_id, ':report_date' => $report_date];
        if (!empty($view_staff_daily_report_id)) {
            $existing_query .= " AND report_id != :report_id";
            $existing_params[':report_id'] = $view_staff_daily_report_id;
        }
        $existing_query .= " LIMIT 1";
        
        $existing = $bf->getQueryRecords($existing_query, $existing_params);
        if (!empty($existing)) {
            $errors['report_date'] = "Report for this date has already been submitted.";
        }
    }

    if (empty($errors)) {
        $data = [
            'user_id' => $user_id,
            'user_name' => $full_name,
            'role_id' => $_SESSION['role_id'] ?? 0,
            'role_name' => $_SESSION['user_role'] ?? '',
            'report_date' => $report_date,
            'activity_details' => $activity_details,
            'hours_spent' => $hours_spent,
            'updated_date_time' => date('Y-m-d H:i:s')
        ];

        // INSERT
        if (empty($view_staff_daily_report_id)) { 
            $data['created_date_time'] = date('Y-m-d H:i:s');
            $bf->InsertSQL($GLOBALS['report_table'], $data, 'report_id', 'unique_number', 'ADD REPORT');

            echo json_encode([
                'status' => 'success',
                'message' => 'Report added successfully'
            ]);
        } 
        // UPDATE
        else {
            $bf->UpdateSQL($GLOBALS['report_table'], $data, 'report_id = :id', [':id' => $view_staff_daily_report_id]);

            echo json_encode([
                'status' => 'success',
                'message' => 'Report updated successfully'
            ]);
        }
        exit;
    } else {
        echo json_encode([
            'status' => 'error',
            'errors' => $errors
        ]);
        exit;
    }
}

// 2. Render HTML form (AJAX edit/new)
if (isset($_REQUEST['view_staff_daily_report_id'])) {
    $view_staff_daily_report_id = $_REQUEST['view_staff_daily_report_id'];

    if (!empty($view_staff_daily_report_id)) {
        $staff_daily_report_list = $bf->getTableRecords(
            $GLOBALS['report_table'],
            'report_id',
            $view_staff_daily_report_id
        );

        if (!empty($staff_daily_report_list)) {
            foreach ($staff_daily_report_list as $data) {
                if (!empty($data['report_date'])) {
                    $report_date = $data['report_date'];
                }
                if (!empty($data['activity_details'])) {
                    $activity_details = $data['activity_details'];
                }
                if (!empty($data['hours_spent'])) {
                    $hours_spent = $data['hours_spent'];
                }
            }
        }
    }
    ?>
    <div class="header">
        <h2>
            <?php echo empty($view_staff_daily_report_id) ? "New staff daily report" : "Update staff daily report"; ?>
        </h2>
    </div>

    <div class="module-section form-section">
        <form
            name="staff_daily_report_form"
            id="staff_daily_report_form"
            method="POST"
            enctype="multipart/form-data"
            onsubmit="event.preventDefault(); formSubmit('staff_daily_report_form', 'staff_daily_report_action.php', 'staff_daily_report.php', 'staff_daily_report');"
        >
            <input type="hidden" name="view_staff_daily_report_id" value="<?php echo $view_staff_daily_report_id; ?>">

            <div class="form-row">
                <div class="form-group col-4">
                    <label>Report Date *</label>
                    <input
                        type="date"
                        name="report_date"
                        class="form-input"
                        value="<?php echo $report_date; ?>"
                    >
                    <span id="error-report_date" class="error-msg"></span>
                </div> 

                <div class="form-group col-6">
                    <label>Activity Details</label>
                    <textarea name="activity_details" rows="8" placeholder="Describe what you worked on today..."><?php echo htmlspecialchars($activity_details); ?></textarea>
                    <span id="error-activity_details" class="error-msg"></span>
                </div>

                <div class="form-group col-4">
                    <label>Hours Spent</label> 
                    <input type="number" name="hours_spent" value="<?php echo $hours_spent; ?>" step="0.5" min="0" max="24" placeholder="e.g. 8">
                    <span id="error-hours_spent" class="error-msg"></span>
                </div>                 
            </div>

            <div class="form-buttons">
                <button type="submit" class="btn-add">
                    <?php echo empty($view_staff_daily_report_id) ? "Add staff daily report" : "Update staff daily report"; ?>
                </button>
                <?php if (!empty($view_staff_daily_report_id)) { ?>
                    <button
                        type="button"
                        class="btn-add"
                        style="background: #ef4444; font-size: 0.75rem;"
                        onclick="$('.new_content').hide().html(''); $('.update_content').show();"
                    >
                        Cancel
                    </button>
                <?php } ?>
            </div>
        </form>
    </div>
    <?php
    exit;
}

// 3. List
if ($action == 'list') {
    $page = isset($_POST['page']) ? (int)$_POST['page'] : 1;
    $limit = isset($_POST['limit']) ? (int)$_POST['limit'] : 10;
    $search = isset($_POST['search']) ? $_POST['search'] : '';
    $start = ($page - 1) * $limit;

    // $result = $bf->getTableList($GLOBALS['report_table'], ['user_name'], $start, $limit, $search);
    if ($user_role === 'staff' || $user_role === 'manager') {
        $where = "deleted = 0 AND user_id = :user_id";
        $params = [':user_id' => $user_id];
        
        $company_id = $bf->getCompanyId();
        if ($company_id) {
            $where .= " AND company_id = :comp_company_id";
            $params[':comp_company_id'] = $company_id;
        }
        
        if (!empty($search)) {
            $where .= " AND (user_name LIKE :search)";
            $params[':search'] = "%$search%";
        }
        
        $query = "SELECT * FROM " . $GLOBALS['report_table'] . " WHERE $where ORDER BY id DESC";
        $result = $bf->getPaginatedResults($query, $params, $start, $limit);
    } else {
        $result = $bf->getTableList($GLOBALS['report_table'], ['user_name'], $start, $limit, $search);
    }
    $reports = $result['data'];
    $total_records = $result['total_records'];
    $total_pages = ceil($total_records / $limit);

    if (empty($reports)) { ?>
        <div class="table-responsive">
            <table><tr><td style="text-align:center">No reports found.</td></tr></table>
        </div>
    <?php } else {
        ?>
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>User</th>
                        <th>Role</th>
                        <th>Activity</th>
                        <th>Hours</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                foreach ($reports as $r) { 
                ?>
                    <tr>
                        <td><?php echo date('d-m-Y', strtotime($r['report_date'])); ?></td>
                        <td><strong style="color: var(--primary);"><?php echo htmlspecialchars($r['user_name']); ?></strong></td>
                        <td><span class="status-badge" style="background: var(--primary-light); color: var(--primary);"><?php echo ucfirst($r['role_name']); ?></span></td>
                        <td style="max-width: 300px; white-space: normal; line-height: 1.4;"><?php echo nl2br(htmlspecialchars($r['activity_details'])); ?></td>
                        <td><?php echo htmlspecialchars($r['hours_spent']); ?> hrs</td>
                        <td>
                            <div style="display:flex; gap:0.5rem;">
                                <?php if (checkPermission($_SESSION['company_id'], $_SESSION['role_id'], 'daily_report', PERMISSION_EDIT)): ?>
                                    <button class="btn-add" style="padding: 0.25rem 0.75rem; font-size: 0.8rem;" onclick="ShowPage('staff_daily_report', '<?php echo $r['report_id']; ?>')">Edit</button>
                                <?php endif; ?>
                                <?php if (checkPermission($_SESSION['company_id'], $_SESSION['role_id'], 'daily_report', PERMISSION_DELETE)): ?>
                                    <button class="btn-add" style="padding: 0.25rem 0.75rem; font-size: 0.8rem; background: #ef4444;" onclick="deleteRecord('staff_daily_report', '<?php echo $r['report_id']; ?>')">Delete</button>
                                <?php endif; ?>
                            </div>
                        </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>

        <div class="pagination-container">
            <div class="pagination-info">
                Showing <?php echo ($total_records > 0) ? $start + 1 : 0; ?> to <?php echo min($start + $limit, $total_records); ?> of <?php echo $total_records; ?> entries
            </div>
            <div class="pagination-buttons">
                <button class="page-btn" <?php echo ($page <= 1) ? 'disabled' : ''; ?> onclick="loadData('staff_daily_report', <?php echo $page - 1; ?>, $('#staff_daily_report_limit').val(), $('#staff_daily_report_search').val())">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <?php 
                $start_page = max(1, $page - 2);
                $end_page = min($total_pages, $start_page + 4);
                if ($end_page - $start_page < 4) $start_page = max(1, $end_page - 4);
                for ($i = $start_page; $i <= $end_page; $i++) { ?>
                    <button class="page-btn <?php echo ($i == $page) ? 'active' : ''; ?>" onclick="loadData('staff_daily_report', <?php echo $i; ?>, $('#staff_daily_report_limit').val(), $('#staff_daily_report_search').val())">
                        <?php echo $i; ?>
                    </button>
                <?php } ?>
                <button class="page-btn" <?php echo ($page >= $total_pages) ? 'disabled' : ''; ?>" onclick="loadData('staff_daily_report', <?php echo $page + 1; ?>, $('#staff_daily_report_limit').val(), $('#staff_daily_report_search').val())">
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>
    <?php
    }
    exit;
}
    
// 4. Delete
if (isset($_POST['action']) && $_POST['action'] == 'delete') {
    $id = $bf->sanitize($_POST['id'] ?? '');
    $data = ['deleted' => 1, 'updated_date_time' => $GLOBALS['create_date_time_label']];
    $bf->UpdateSQL($GLOBALS['report_table'], $data, "report_id = :id", [':id' => $id]);
    echo "Success";
    exit;
}
?>