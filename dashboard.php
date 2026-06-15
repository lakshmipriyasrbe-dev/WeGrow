<?php require_once 'common_file.php'; 

// echo $bf->encode_decode("decrypt", 'Uk5DdjMxYThRQ2NCR1ZaM2dYbVlLUT09');

// echo "<br>";

// echo $bf->encode_decode("encrypt", 'WeGrow@2025');

$is_management = false;
if (!empty($_SESSION['role_id'])) {
    $role_row = $bf->getQueryRecords("SELECT id FROM " . $GLOBALS['role_table'] . " WHERE role_id = :role_id LIMIT 1", [':role_id' => $_SESSION['role_id']]);
    if (!empty($role_row) && intval($role_row[0]['id']) === 4) {
        $is_management = true;
    }
}

if (($user_role === 'admin' || $is_management) && isset($_POST['change_company_id'])) {
    $_SESSION['company_id'] = $_POST['change_company_id'];
    header("Location: dashboard.php");
    exit();
}

if (isset($_GET['action']) && $_GET['action'] === 'get_installment_details') {
    if ($user_role === 'admin' || $is_management || $user_role === 'manager') {
        header('Content-Type: application/json');
        $enrollment_id = $_GET['enrollment_id'] ?? '';
        
        $enrollment = $bf->getQueryRecords("
            SELECT e.student_name, e.student_id, e.enrollment_number, e.fees_amount, e.doj, c.course_name
            FROM " . $GLOBALS['enrollment_table'] . " e
            LEFT JOIN " . $GLOBALS['course_table'] . " c ON e.course_id = c.course_id
            WHERE e.enrollment_id = :enroll_id AND e.deleted = 0 LIMIT 1
        ", [':enroll_id' => $enrollment_id]);
        
        if (empty($enrollment)) {
            $enrollment = $bf->getQueryRecords("
                SELECT e.student_name, e.student_id, e.enrollment_number, e.fees_amount, e.doj, c.course_name
                FROM " . $GLOBALS['enrollment_internship_table'] . " e
                LEFT JOIN " . $GLOBALS['course_table'] . " c ON e.course_id = c.course_id
                WHERE e.enrollment_internship_id = :enroll_id AND e.deleted = 0 LIMIT 1
            ", [':enroll_id' => $enrollment_id]);
        }
        
        if (empty($enrollment)) {
            echo json_encode(['status' => 'error', 'message' => 'Student not found']);
            exit;
        }
        
        $student = $enrollment[0];
        $decrypted_student_id = $bf->encode_decode('decrypt', $student['student_id']);
        $decrypted_enrollment_id = $bf->encode_decode('decrypt', $enrollment_id);
        
        $payments = $bf->getQueryRecords("
            SELECT payment_date, total_amount 
            FROM " . $GLOBALS['payment_table'] . " 
            WHERE enrollment_id = :enroll_id AND deleted = 0 
            ORDER BY id ASC
        ", [':enroll_id' => $enrollment_id]);
        
        $installments = $bf->getQueryRecords("
            SELECT * 
            FROM " . $GLOBALS['installments_table'] . " 
            WHERE enrollment_id = :enroll_id AND deleted = 0 
            ORDER BY installment_number ASC
        ", [':enroll_id' => $enrollment_id]);
        
        $total_paid = 0;
        $payments_pool = [];
        foreach ($payments as $p) {
            $p_amt = floatval($p['total_amount']);
            $total_paid += $p_amt;
            $payments_pool[] = [
                'date' => $p['payment_date'],
                'remaining' => $p_amt
            ];
        }
        
        $total_fees = floatval($student['fees_amount']);
        $balance = $total_fees - $total_paid;
        
        $schedule = [];
        $pool_idx = 0;
        $pool_count = count($payments_pool);
        
        foreach ($installments as $inst) {
            $inst_amt = floatval($inst['amount']);
            $allocated = 0;
            $last_pay_date = '-';
            
            while ($allocated < $inst_amt && $pool_idx < $pool_count) {
                $available = $payments_pool[$pool_idx]['remaining'];
                $needed = $inst_amt - $allocated;
                
                if ($available <= 0) {
                    $pool_idx++;
                    continue;
                }
                
                if ($available >= $needed) {
                    $payments_pool[$pool_idx]['remaining'] -= $needed;
                    $allocated += $needed;
                    $last_pay_date = $payments_pool[$pool_idx]['date'];
                } else {
                    $allocated += $available;
                    $payments_pool[$pool_idx]['remaining'] = 0;
                    $last_pay_date = $payments_pool[$pool_idx]['date'];
                    $pool_idx++;
                }
            }
            
            if (round($allocated, 2) >= round($inst_amt, 2)) {
                $status = '✅ Paid';
            } elseif ($allocated > 0) {
                $status = '⚠️ Partially Paid';
            } else {
                $status = '❌ Due';
            }
            
            $schedule[] = [
                'number' => $inst['installment_number'],
                'due_date' => date('d-m-Y', strtotime($inst['due_date'])),
                'amount' => '₹' . number_format($inst_amt),
                'paid_date' => $last_pay_date !== '-' ? date('d-m-Y', strtotime($last_pay_date)) : '-',
                'status' => $status
            ];
        }
        
        echo json_encode([
            'status' => 'success',
            'data' => [
                'student_name' => $student['student_name'],
                'student_id' => $decrypted_student_id,
                'enrollment_number' => $student['enrollment_number'] ?? '',
                'enrollment_id' => $decrypted_enrollment_id,
                'course_name' => $student['course_name'] ?? 'N/A',
                'doj' => date('d-m-Y', strtotime($student['doj'])),
                'fees_amount' => '₹' . number_format($total_fees),
                'paid_amount' => '₹' . number_format($total_paid),
                'balance_amount' => '₹' . number_format($balance),
                'schedule' => $schedule
            ]
        ]);
        exit;
    }
}

// Fetch Stats
$today = date('Y-m-d');
$comp_id = $_SESSION['company_id'];
$pending_count = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['task_table'] . " WHERE status != 'completed' AND deleted = 0 AND company_id = :comp_id", [':comp_id' => $comp_id])[0]['total'];
//$completed_count = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['task_table'] . " WHERE status = 'completed' AND deleted = 0 AND company_id = :comp_id", [':comp_id' => $comp_id])[0]['total'];
$completed_count = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['task_table'] . " WHERE status = 'completed' AND deleted = 0 AND company_id = :comp_id AND DATE(due_date) = :report_date", [':comp_id' => $comp_id, ':report_date' => $today])[0]['total'];
//$report_count = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['report_table'] . " WHERE deleted = 0 AND company_id = :comp_id", [':comp_id' => $comp_id])[0]['total'];
$report_count = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['report_table'] . " WHERE deleted = 0 AND company_id = :comp_id AND report_date = :report_date", [':comp_id' => $comp_id, ':report_date' => $today])[0]['total'];
// Role-Specific Metric Calculations
$student_attendance_percentage = 0;
$student_pending_tasks = 0;
$student_reports_count = 0;

$staff_pending_reviews = 0;
$staff_student_tasks = 0;
$staff_attendance_alerts = 0;

if ($user_role === 'student') {
    // 1. Calculate Attendance Percentage
    $encrypted_student_id = $bf->encode_decode('encrypt', $username);
    $attendance_records = $bf->getQueryRecords("SELECT present_code FROM " . $GLOBALS['student_attendance_table'] . " WHERE student_id = :student_id AND deleted = 0", [':student_id' => $encrypted_student_id]);
    
    if (!empty($attendance_records)) {
        $total_days = count($attendance_records);
        $present_weight = 0;
        foreach ($attendance_records as $rec) {
            $code = strtoupper($rec['present_code']);
            if ($code === 'PP') {
                $present_weight += 1.0;
            } elseif ($code === 'PA' || $code === 'AP') {
                $present_weight += 0.5;
            }
        }
        $student_attendance_percentage = round(($present_weight / $total_days) * 100, 1);
    }

    // 2. Pending tasks for student
    $student_pending_tasks = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['student_tasks_table'] . " WHERE assigned_to_student = :student_id AND status != 'Completed' AND deleted = 0", [':student_id' => $username])[0]['total'];

    // 3. Reports submitted
    //$student_reports_count = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['student_reports_table'] . " WHERE student_id = :student_id AND deleted = 0", [':student_id' => $username])[0]['total'];
    $student_reports_count = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['student_reports_table'] . " WHERE student_id = :student_id AND report_date = :report_date AND deleted = 0", [':student_id' => $username, ':report_date' => $today])[0]['total'];
} elseif ($user_role === 'staff') {
    // Get staff's assigned student plain IDs
    $query_training = "SELECT student_id FROM " . $GLOBALS['enrollment_table'] . " WHERE staff_id = :staff_id AND deleted = 0";
    $query_intern = "SELECT student_id FROM " . $GLOBALS['enrollment_internship_table'] . " WHERE staff_id = :staff_id AND deleted = 0";
    
    $training_students = $bf->getQueryRecords($query_training, [':staff_id' => $user_id]);
    $intern_students = $bf->getQueryRecords($query_intern, [':staff_id' => $user_id]);
    
    $assigned_student_ids = [];
    $assigned_student_encrypts = [];
    foreach ($training_students as $s) {
        $assigned_student_encrypts[] = $s['student_id'];
        $assigned_student_ids[] = $bf->encode_decode('decrypt', $s['student_id']);
    }
    foreach ($intern_students as $s) {
        $assigned_student_encrypts[] = $s['student_id'];
        $assigned_student_ids[] = $bf->encode_decode('decrypt', $s['student_id']);
    }

    if (!empty($assigned_student_ids)) {
        // Pending reports review count
        $placeholders = [];
        $params_reports = [];
        foreach ($assigned_student_ids as $idx => $sid) {
            $key = ":sid_" . $idx;
            $placeholders[] = $key;
            $params_reports[$key] = $sid;
        }
        $params_reports[':status'] = 'Pending';
        $staff_pending_reviews = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['student_reports_table'] . " WHERE status = :status AND student_id IN (" . implode(',', $placeholders) . ") AND deleted = 0", $params_reports)[0]['total'];

        // Total assigned student tasks count
        $params_tasks = [];
        foreach ($assigned_student_ids as $idx => $sid) {
            $key = ":sid_" . $idx;
            $params_tasks[$key] = $sid;
        }
        $staff_student_tasks = $bf->getQueryRecords("SELECT COUNT(*) as total FROM " . $GLOBALS['student_tasks_table'] . " WHERE assigned_to_student IN (" . implode(',', $placeholders) . ") AND deleted = 0", $params_tasks)[0]['total'];

        // Attendance alerts (< 75%)
        if (!empty($assigned_student_encrypts)) {
            $placeholders_att = [];
            $params_att = [];
            foreach ($assigned_student_encrypts as $idx => $esid) {
                $key = ":esid_" . $idx;
                $placeholders_att[] = $key;
                $params_att[$key] = $esid;
            }
            $att_records = $bf->getQueryRecords("SELECT student_id, present_code FROM " . $GLOBALS['student_attendance_table'] . " WHERE student_id IN (" . implode(',', $placeholders_att) . ") AND deleted = 0", $params_att);
            
            $student_att = [];
            foreach ($att_records as $rec) {
                $sid = $rec['student_id'];
                if (!isset($student_att[$sid])) {
                    $student_att[$sid] = ['total' => 0, 'present' => 0.0];
                }
                $student_att[$sid]['total']++;
                $code = strtoupper($rec['present_code']);
                if ($code === 'PP') {
                    $student_att[$sid]['present'] += 1.0;
                } elseif ($code === 'PA' || $code === 'AP') {
                    $student_att[$sid]['present'] += 0.5;
                }
            }
            
            foreach ($student_att as $sid => $data) {
                if ($data['total'] > 0) {
                    $percentage = ($data['present'] / $data['total']) * 100;
                    if ($percentage < 75) {
                        $staff_attendance_alerts++;
                    }
                }
            }
        }
    }
}

// Fetch Analytics Data (Admin & Management)
$course_prefs = [];
$course_stats = [];

if ($user_role == 'admin' || $is_management) {
    $q_prefs = "SELECT c.course_name, c.course_id,
        (SELECT COUNT(*) FROM {$GLOBALS['enrollment_table']} e WHERE e.course_id = c.course_id AND e.deleted = 0 AND e.company_id = :comp_id) + 
        (SELECT COUNT(*) FROM {$GLOBALS['enrollment_internship_table']} ei WHERE ei.course_id = c.course_id AND ei.deleted = 0 AND ei.company_id = :comp_id) as student_count
        FROM {$GLOBALS['course_table']} c 
        WHERE c.deleted = 0 ORDER BY student_count DESC";
    $course_prefs_raw = $bf->getQueryRecords($q_prefs, [':comp_id' => $comp_id]);
    
    foreach ($course_prefs_raw as $c) {
        if ($c['student_count'] > 0) {
            $course_prefs[] = $c;
            $course_stats[$c['course_id']] = [
                'course_name' => $c['course_name'],
                'enrolled_count' => $c['student_count'],
                'placed_count' => 0
            ];
        }
    }

    $q_placed_training = "SELECT e.course_id, COUNT(*) as placed_count 
                          FROM {$GLOBALS['course_closure_table']} cc
                          JOIN {$GLOBALS['enrollment_table']} e ON cc.enrollment_id = e.enrollment_id
                          WHERE cc.placed = 1 AND cc.deleted = 0 AND cc.course_type = 'training' AND cc.company_id = :comp_id AND e.deleted = 0
                          GROUP BY e.course_id";
    $placed_training = $bf->getQueryRecords($q_placed_training, [':comp_id' => $comp_id]);
    foreach ($placed_training as $pt) {
        $cid = $pt['course_id'];
        if (isset($course_stats[$cid])) {
            $course_stats[$cid]['placed_count'] += intval($pt['placed_count']);
        }
    }

    $q_placed_internship = "SELECT ei.course_id, COUNT(*) as placed_count 
                            FROM {$GLOBALS['course_closure_table']} cc
                            JOIN {$GLOBALS['enrollment_internship_table']} ei ON cc.enrollment_id = ei.enrollment_internship_id
                            WHERE cc.placed = 1 AND cc.deleted = 0 AND cc.course_type = 'internship' AND cc.company_id = :comp_id AND ei.deleted = 0
                            GROUP BY ei.course_id";
    $placed_internship = $bf->getQueryRecords($q_placed_internship, [':comp_id' => $comp_id]);
    foreach ($placed_internship as $pi) {
        $cid = $pi['course_id'];
        if (isset($course_stats[$cid])) {
            $course_stats[$cid]['placed_count'] += intval($pi['placed_count']);
        }
    }
    $course_stats = array_values($course_stats);

    // --- Admin Dashboard Summary Counts ---
    $week_start = date('Y-m-d', strtotime('monday this week'));
    $week_end = date('Y-m-d', strtotime('sunday this week'));
    $month_start = date('Y-m-01');
    $month_end = date('Y-m-t');

    // Enrollment counts (training + internship)
    $enroll_today = $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['enrollment_table']} WHERE DATE(doj) = :today AND deleted = 0 AND company_id = :cid", [':today' => $today, ':cid' => $comp_id])[0]['c']
                  + $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['enrollment_internship_table']} WHERE DATE(doj) = :today AND deleted = 0 AND company_id = :cid", [':today' => $today, ':cid' => $comp_id])[0]['c'];
    $enroll_week  = $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['enrollment_table']} WHERE DATE(doj) BETWEEN :ws AND :we AND deleted = 0 AND company_id = :cid", [':ws' => $week_start, ':we' => $week_end, ':cid' => $comp_id])[0]['c']
                  + $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['enrollment_internship_table']} WHERE DATE(doj) BETWEEN :ws AND :we AND deleted = 0 AND company_id = :cid", [':ws' => $week_start, ':we' => $week_end, ':cid' => $comp_id])[0]['c'];

$enroll_month  = $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['enrollment_table']} WHERE DATE(doj) BETWEEN :ws AND :we AND deleted = 0 AND company_id = :cid", [':ws' => $month_start, ':we' => $month_end, ':cid' => $comp_id])[0]['c']
                  + $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['enrollment_internship_table']} WHERE DATE(doj) BETWEEN :ws AND :we AND deleted = 0 AND company_id = :cid", [':ws' => $month_start, ':we' => $month_end, ':cid' => $comp_id])[0]['c'];

    // Enquiry counts
    $enquiry_today = $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['course_enquiry_table']} WHERE DATE(created_date_time) = :today AND deleted = 0 AND company_id = :cid", [':today' => $today, ':cid' => $comp_id])[0]['c'];
    $enquiry_week  = $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['course_enquiry_table']} WHERE DATE(created_date_time) BETWEEN :ws AND :we AND deleted = 0 AND company_id = :cid", [':ws' => $week_start, ':we' => $week_end, ':cid' => $comp_id])[0]['c'];
    $enquiry_month = $bf->getQueryRecords("SELECT COUNT(*) as c FROM {$GLOBALS['course_enquiry_table']} WHERE DATE(created_date_time) BETWEEN :ms AND :me AND deleted = 0 AND company_id = :cid", [':ms' => $month_start, ':me' => $month_end, ':cid' => $comp_id])[0]['c'];

    // Expense totals
    $expense_today = $bf->getQueryRecords("SELECT COALESCE(SUM(total_amount),0) as t FROM {$GLOBALS['expense_entry_table']} WHERE DATE(expense_entry_date) = :today AND deleted = 0 AND company_id = :cid", [':today' => $today, ':cid' => $comp_id])[0]['t'];
    $expense_week  = $bf->getQueryRecords("SELECT COALESCE(SUM(total_amount),0) as t FROM {$GLOBALS['expense_entry_table']} WHERE DATE(expense_entry_date) BETWEEN :ws AND :we AND deleted = 0 AND company_id = :cid", [':ws' => $week_start, ':we' => $week_end, ':cid' => $comp_id])[0]['t'];
    $expense_month = $bf->getQueryRecords("SELECT COALESCE(SUM(total_amount),0) as t FROM {$GLOBALS['expense_entry_table']} WHERE DATE(expense_entry_date) BETWEEN :ms AND :me AND deleted = 0 AND company_id = :cid", [':ms' => $month_start, ':me' => $month_end, ':cid' => $comp_id])[0]['t'];

    // Payment totals
    $payment_today = $bf->getQueryRecords("SELECT COALESCE(SUM(total_amount),0) as t FROM {$GLOBALS['payment_table']} WHERE DATE(payment_date) = :today AND deleted = 0 AND company_id = :cid", [':today' => $today, ':cid' => $comp_id])[0]['t'];
    $payment_week  = $bf->getQueryRecords("SELECT COALESCE(SUM(total_amount),0) as t FROM {$GLOBALS['payment_table']} WHERE DATE(payment_date) BETWEEN :ws AND :we AND deleted = 0 AND company_id = :cid", [':ws' => $week_start, ':we' => $week_end, ':cid' => $comp_id])[0]['t'];
    $payment_month = $bf->getQueryRecords("SELECT COALESCE(SUM(total_amount),0) as t FROM {$GLOBALS['payment_table']} WHERE DATE(payment_date) BETWEEN :ms AND :me AND deleted = 0 AND company_id = :cid", [':ms' => $month_start, ':me' => $month_end, ':cid' => $comp_id])[0]['t'];
}

// Fetch Today's Tasks based on role
if ($user_role === 'admin' || $is_management) {
    $recent_tasks_query = "SELECT t.*, u.name as assignee_name FROM " . $GLOBALS['task_table'] . " t 
                           LEFT JOIN " . $GLOBALS['user_table'] . " u ON t.assigned_to = u.id 
                           WHERE t.deleted = 0 AND t.company_id = :comp_id AND t.due_date = :today ORDER BY t.id DESC";
    $params = [':today' => $today, ':comp_id' => $comp_id];
} elseif ($user_role === 'staff' || $user_role == 'trainer') {
    $recent_tasks_query = "SELECT t.*, u.name as assignee_name FROM " . $GLOBALS['task_table'] . " t 
                           LEFT JOIN " . $GLOBALS['user_table'] . " u ON t.assigned_to = u.id 
                           WHERE t.deleted = 0 AND t.company_id = :comp_id AND t.assigned_to = :user_id AND t.due_date = :today ORDER BY t.id DESC";
    $params = [':today' => $today, ':user_id' => $user_id, ':comp_id' => $comp_id];
} else {
    $recent_tasks_query = "SELECT * FROM " . $GLOBALS['student_tasks_table'] . " 
                           WHERE deleted = 0 AND company_id = :comp_id AND assigned_to_student = :student_id AND due_date = :today 
                           ORDER BY id DESC";
    $params = [':today' => $today, ':student_id' => $username, ':comp_id' => $comp_id];
}
$recent_tasks = $bf->getQueryRecords($recent_tasks_query, $params);

// Fetch Pending Installments for Manager / Admin Dashboard
$pending_reminders = [];
if ($user_role == 'admin' || $user_role == 'manager') {
    $q_inst = "SELECT i.*, e.student_name, e.student_id, e.enrollment_number, e.fees_amount, 
                      COALESCE(p.paid_amount, 0) AS paid_amount,
                      (e.fees_amount - COALESCE(p.paid_amount, 0)) AS balance_amount,
                      e.doj, c.course_name
               FROM " . $GLOBALS['installments_table'] . " i
               INNER JOIN " . $GLOBALS['enrollment_table'] . " e ON i.enrollment_id = e.enrollment_id
               LEFT JOIN (
                   SELECT enrollment_id, SUM(CAST(total_amount AS DECIMAL(10,2))) AS paid_amount
                   FROM " . $GLOBALS['payment_table'] . "
                   WHERE deleted = 0
                   GROUP BY enrollment_id
               ) p ON e.enrollment_id = p.enrollment_id
               LEFT JOIN " . $GLOBALS['course_table'] . " c ON e.course_id = c.course_id
               WHERE i.deleted = 0 AND e.deleted = 0 AND e.course_closed != 1 
                 AND i.course_type = 'training'
                 AND i.company_id = :comp_id AND e.company_id = :comp_id
                 AND NOT EXISTS (
                     SELECT 1 FROM " . $GLOBALS['course_closure_table'] . " cc 
                     WHERE cc.enrollment_id = e.enrollment_id AND cc.deleted = 0
                 )

               UNION ALL

               SELECT i.*, e.student_name, e.student_id, e.enrollment_number, e.fees_amount, 
                      COALESCE(p.paid_amount, 0) AS paid_amount,
                      (e.fees_amount - COALESCE(p.paid_amount, 0)) AS balance_amount,
                      e.doj, c.course_name
               FROM " . $GLOBALS['installments_table'] . " i
               INNER JOIN " . $GLOBALS['enrollment_internship_table'] . " e ON i.enrollment_id = e.enrollment_internship_id
               LEFT JOIN (
                   SELECT enrollment_id, SUM(CAST(total_amount AS DECIMAL(10,2))) AS paid_amount
                   FROM " . $GLOBALS['payment_table'] . "
                   WHERE deleted = 0
                   GROUP BY enrollment_id
               ) p ON e.enrollment_internship_id = p.enrollment_id
               LEFT JOIN " . $GLOBALS['course_table'] . " c ON e.course_id = c.course_id
               WHERE i.deleted = 0 AND e.deleted = 0 AND e.course_closed != 1 
                 AND i.course_type = 'internship'
                 AND i.company_id = :comp_id AND e.company_id = :comp_id
                 AND NOT EXISTS (
                     SELECT 1 FROM " . $GLOBALS['course_closure_table'] . " cc 
                     WHERE cc.enrollment_id = e.enrollment_internship_id AND cc.deleted = 0
                 )
               ORDER BY enrollment_id ASC, installment_number ASC";
              
    $all_installments = $bf->getQueryRecords($q_inst, [':comp_id' => $comp_id]);
    //  echo $bf->debugQuery($q_inst, [':comp_id' => $comp_id]);
    
    $running_totals = [];
    $today_ts = strtotime(date('Y-m-d'));
    $alert_threshold_ts = strtotime(date('Y-m-d', strtotime('+2 days')));
    
    
    foreach ($all_installments as $inst) {
        $enroll_id = $inst['enrollment_id'];
        if (!isset($running_totals[$enroll_id])) {
            $running_totals[$enroll_id] = 0;
        }
        
        $running_totals[$enroll_id] += floatval($inst['amount']);
        
        if ($running_totals[$enroll_id] > floatval($inst['paid_amount'])) {
            $paid_allocated = floatval($inst['paid_amount']) - ($running_totals[$enroll_id] - floatval($inst['amount']));
            $installment_pending = floatval($inst['amount']);
            if ($paid_allocated > 0) {
                $installment_pending -= $paid_allocated;
            }
            
            $due_date_ts = strtotime($inst['due_date']);
            if ($due_date_ts <= $alert_threshold_ts) {
                $inst['pending_amount'] = $installment_pending;
                if ($due_date_ts < $today_ts) {
                    $inst['priority'] = 'overdue';
                } else {
                    $inst['priority'] = 'upcoming';
                }
                $pending_reminders[] = $inst;
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - <?php echo get_company_name(); ?></title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <?php include 'includes/head_assets.php'; ?>
    <style>
        .charts-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-top: 1.5rem;
        }
        @media (max-width: 768px) {
            .charts-grid {
                grid-template-columns: 1fr;
            }
            .student-info-grid {
                grid-template-columns: 1fr;
            }
        }
        .chart-card {
            background: #ffffff;
            border: 1px solid rgba(0,0,0,0.05);
            border-radius: 1rem;
            padding: 1.5rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            min-width: 0;
        }
        .chart-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; height: 4px;
            background: linear-gradient(90deg, #1d4ed8, #0ea5e9, #f97316); /* Matches logo colors */
            opacity: 0.9;
        }
        .chart-card h3 {
            margin-top: 0;
            margin-bottom: 1.5rem;
            font-size: 1.1rem;
            font-weight: 600;
            color: #1e293b;
        }
        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }
        /* Premium Modal CSS */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(8px);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 99999;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }
        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }
        .modal-container {
            background: #ffffff;
            width: 100%;
            max-width: 700px;
            border-radius: 1.25rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            overflow: hidden;
            transform: scale(0.9) translateY(20px);
            transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            border: 1px solid rgba(0, 0, 0, 0.05);
            font-family: 'Outfit', sans-serif;
        }
        .modal-overlay.active .modal-container {
            transform: scale(1) translateY(0);
        }
        .modal-header {
            padding: 1.25rem 1.5rem;
            background: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .modal-title {
            margin: 0;
            font-size: 1.2rem;
            font-weight: 600;
            color: #0f172a;
        }
        .modal-close-btn {
            background: transparent;
            border: none;
            font-size: 1.5rem;
            color: #64748b;
            cursor: pointer;
            transition: color 0.2s;
            line-height: 1;
            padding: 0;
        }
        .modal-close-btn:hover {
            color: #ef4444;
        }
        .modal-body {
            padding: 1.5rem;
            max-height: 80vh;
            overflow-y: auto;
        }
        .info-section-title {
            font-size: 1rem;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .student-info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 0.75rem 1.5rem;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 1rem;
            margin-bottom: 1.5rem;
        }
        .info-item {
            font-size: 0.9rem;
            color: #64748b;
            border-bottom: 1px dashed #f1f5f9;
            padding-bottom: 0.4rem;
        }
        .info-item:nth-last-child(-n+2) {
            border-bottom: none;
            padding-bottom: 0;
        }
        .info-item strong {
            color: #0f172a;
            font-weight: 500;
        }
        .schedule-table-wrapper {
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            overflow-x: auto;
        }
        .schedule-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.85rem;
            text-align: left;
        }
        .schedule-table th {
            background: #f1f5f9;
            padding: 0.75rem 0.75rem;
            font-weight: 600;
            color: #475569;
        }
        .schedule-table td {
            padding: 0.75rem 0.75rem;
            border-bottom: 1px solid #e2e8f0;
            color: #334155;
        }
        .schedule-table tr:last-child td {
            border-bottom: none;
        }
        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.2rem 0.5rem;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        .status-paid {
            background: #ecfdf5;
            color: #059669;
        }
        .status-due {
            background: #fef2f2;
            color: #dc2626;
        }
        .status-partial {
            background: #fffbeb;
            color: #d97706;
        }

        /* Print Media Rules for Modal PDF generation */
        @media print {
            body * {
                visibility: hidden;
            }
            #installmentModal, #installmentModal * {
                visibility: visible;
            }
            #installmentModal {
                position: absolute !important;
                left: 0 !important;
                top: 0 !important;
                width: 100% !important;
                height: auto !important;
                background: transparent !important;
                backdrop-filter: none !important;
                display: block !important;
                opacity: 1 !important;
                visibility: visible !important;
            }
            .modal-container {
                border: none !important;
                box-shadow: none !important;
                max-width: 100% !important;
                width: 100% !important;
                transform: none !important;
                margin: 0 !important;
                padding: 0 !important;
            }
            .modal-body {
                max-height: none !important;
                overflow-y: visible !important;
                padding: 0 !important;
            }
            .modal-close-btn, .modal-print-btn {
                display: none !important;
            }
            .main-content, .sidebar {
                display: none !important;
            }
        }
    </style>
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <div class="main-content">
        <div class="header">
            <div>
                <h2 style="margin: 0;">Welcome, <?php echo $full_name; ?></h2>
                <p style="color: var(--text-muted); margin: 0.5rem 0 0 0;">Role: <?php echo ucfirst($user_role); ?></p>
            </div>
            <div class="user-profile">
                <span><?php echo $username; ?></span>
                <div class="avatar"><?php echo substr($username, 0, 1); ?></div>
            </div>
        </div>

        <?php if ($user_role === 'admin' || $is_management): ?>
        <div class="branch-selector-card" style="background: linear-gradient(to right, #ffffff, #f8fafc); border: 1px solid rgba(0,0,0,0.08); border-radius: 12px; padding: 1.5rem; margin-bottom: 2rem; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 4px 15px rgba(0,0,0,0.03);">
            <div style="display: flex; align-items: center; gap: 1.25rem;">
                <div style="width: 50px; height: 50px; border-radius: 12px; background: rgba(37, 99, 235, 0.1); color: #2563eb; display: flex; align-items: center; justify-content: center; font-size: 1.5rem;">
                    🏢
                </div>
                <div>
                    <h3 style="margin: 0; color: #0f172a; font-size: 1.15rem; font-weight: 600;">Active Branch / Company</h3>
                    <p style="margin: 0; color: #64748b; font-size: 0.9rem; margin-top: 0.25rem;">Switch branches to instantly load specific metrics and data.</p>
                </div>
            </div>
            <div>
                <?php 
                $companies = $bf->getTableRecords($GLOBALS['company_table']); 
                ?>
                <form method="POST" action="" id="companyForm" style="margin: 0;">
                    <div style="position: relative;">
                        <select name="change_company_id" onchange="document.getElementById('companyForm').submit()" style="appearance: none; -webkit-appearance: none; padding: 0.75rem 2.5rem 0.75rem 1.25rem; border-radius: 8px; border: 2px solid #3b82f6; font-family: 'Outfit'; min-width: 300px; cursor: pointer; background: white; font-weight: 600; color: #1e293b; font-size: 1rem; box-shadow: 0 4px 6px rgba(59, 130, 246, 0.1); outline: none; transition: all 0.2s;">
                            <?php foreach($companies as $comp): ?>
                                <option value="<?php echo htmlspecialchars($comp['company_id']); ?>" <?php echo ($_SESSION['company_id'] == $comp['company_id']) ? 'selected' : ''; ?>>
                                    <?php echo htmlspecialchars($comp['company_name'] . ' - ' . $comp['branch']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                        <div style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); pointer-events: none; color: #3b82f6;">
                            ▼
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <?php endif; ?>
        
         <?php if (($user_role == 'admin' || $user_role == 'manager') && !empty($pending_reminders)): ?>
        <div class="installment-reminders-card" style="background: #ffffff; border: 1px solid rgba(0,0,0,0.05); border-radius: 1rem; padding: 1.5rem; margin-bottom: 2rem; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03); position: relative; overflow: hidden; font-family: 'Outfit';">
            <div style="position: absolute; top: 0; left: 0; right: 0; height: 4px; background: linear-gradient(90deg, #ef4444, #f97316); opacity: 0.9;"></div>
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1.25rem; flex-wrap: wrap; gap: 0.5rem;">
                <div style="display: flex; align-items: center; gap: 0.75rem;">
                    <span style="font-size: 1.5rem;">🔔</span>
                    <h3 style="margin: 0; font-size: 1.2rem; font-weight: 600; color: #1e293b; font-family: 'Outfit';">Installment Payment Reminders</h3>
                </div>
                <span style="background: #fee2e2; color: #ef4444; font-size: 0.8rem; font-weight: 600; padding: 0.25rem 0.75rem; border-radius: 9999px; font-family: 'Outfit';">
                    <?php echo count($pending_reminders); ?> Action Required
                </span>
            </div>
            
            <div class="reminders-list" style="display: flex; flex-direction: column; gap: 1rem; max-height: 350px; overflow-y: auto; padding-right: 0.5rem;">
                <?php foreach ($pending_reminders as $reminder): 
                    $decrypted_student_id = $bf->encode_decode('decrypt', $reminder['student_id']);
                    $display_id = !empty($reminder['enrollment_number']) ? $reminder['enrollment_number'] : $decrypted_student_id;
                    $is_overdue = $reminder['priority'] === 'overdue';
                    $badge_bg = $is_overdue ? '#fee2e2' : '#ffedd5';
                    $badge_color = $is_overdue ? '#ef4444' : '#ea580c';
                    $badge_text = $is_overdue ? 'Overdue' : 'Due Soon';
                ?>
                <div style="display: flex; align-items: center; justify-content: space-between; padding: 1rem; border-radius: 0.75rem; background: #f8fafc; border: 1px solid #e2e8f0; transition: all 0.2s; cursor: pointer; flex-wrap: wrap; gap: 1rem;" onmouseover="this.style.borderColor='var(--primary)'; this.style.transform='translateY(-2px)'" onmouseout="this.style.borderColor='#e2e8f0'; this.style.transform='translateY(0)'">
                    <div style="display: flex; gap: 1.25rem; align-items: center; flex-wrap: wrap;">
                        <div style="width: 45px; height: 45px; border-radius: 50%; background: <?php echo $badge_bg; ?>; display: flex; align-items: center; justify-content: center; font-size: 1.1rem; color: <?php echo $badge_color; ?>;">
                            💰
                        </div>
                        <div>
                            <h4 style="margin: 0; font-size: 1rem; font-weight: 600; color: #0f172a; font-family: 'Outfit';">
                                <span onclick="openInstallmentModal('<?php echo htmlspecialchars($reminder['enrollment_id']); ?>')" style="cursor: pointer; color: #2563eb; text-decoration: underline;" onmouseover="this.style.color='#1d4ed8'" onmouseout="this.style.color='#2563eb'">
                                    <?php echo htmlspecialchars($reminder['student_name']); ?>
                                </span>
                                <span style="font-weight: 400; color: #64748b; font-size: 0.85rem;">(ID: <?php echo htmlspecialchars($display_id); ?>)</span>
                            </h4>
                            <p style="margin: 0.25rem 0 0 0; color: #64748b; font-size: 0.85rem;">
                                Course: <strong><?php echo htmlspecialchars($reminder['course_name'] ?? 'N/A'); ?></strong> | 
                                DOJ: <?php echo date('d-m-Y', strtotime($reminder['doj'])); ?>
                            </p>
                        </div>
                    </div>
                    <div style="text-align: right; display: flex; align-items: center; gap: 1.5rem; flex-wrap: wrap; justify-content: flex-end;">
                        <div>
                            <span style="background: <?php echo $badge_bg; ?>; color: <?php echo $badge_color; ?>; font-size: 0.75rem; font-weight: 600; padding: 0.2rem 0.5rem; border-radius: 4px; display: inline-block; margin-bottom: 0.25rem;">
                                <?php echo $badge_text; ?>
                            </span>
                            <p style="margin: 0; color: #64748b; font-size: 0.8rem;">
                                Due Date: <strong><?php echo date('d-m-Y', strtotime($reminder['due_date'])); ?></strong>
                            </p>
                        </div>
                        <div style="border-left: 1px solid #e2e8f0; padding-left: 1.5rem; min-width: 140px; text-align: right;">
                            <p style="margin: 0; color: #64748b; font-size: 0.75rem; text-transform: uppercase; font-weight: 600; letter-spacing: 0.05em; font-family: 'Outfit';">Installment Due</p>
                            <p style="margin: 0.15rem 0 0.25rem 0; font-size: 1.15rem; font-weight: 700; color: <?php echo $badge_color; ?>; font-family: 'Outfit';">₹<?php echo number_format($reminder['pending_amount'], 2); ?></p>
                            <p style="margin: 0; color: #94a3b8; font-size: 0.75rem; font-family: 'Outfit';">Bal: ₹<?php echo number_format($reminder['balance_amount'], 2); ?></p>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php endif; ?>

        <div class="stats-grid">
            <?php if ($user_role === 'student'): ?>
                <div class="stat-card">
                    <div class="stat-label">Attendance Percentage</div>
                    <div class="stat-value"><?php echo $student_attendance_percentage; ?>%</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Pending Student Tasks</div>
                    <div class="stat-value"><?php echo $student_pending_tasks; ?></div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Daily Reports Submitted</div>
                    <div class="stat-value"><?php echo $student_reports_count; ?></div>
                </div>
            <?php elseif ($user_role === 'staff'): ?>
                <div class="stat-card">
                    <div class="stat-label">Review Pending Reports</div>
                    <div class="stat-value"><?php echo $staff_pending_reviews; ?></div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Assigned Student Tasks</div>
                    <div class="stat-value"><?php echo $staff_student_tasks; ?></div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Attendance Alerts (< 75%)</div>
                    <div class="stat-value" style="color: <?php echo ($staff_attendance_alerts > 0) ? '#ef4444' : 'inherit'; ?>;"><?php echo $staff_attendance_alerts; ?></div>
                </div>
            <?php else: ?>
                <div class="stat-card">
                    <div class="stat-label">Pending Tasks</div>
                    <div class="stat-value"><?php echo $pending_count; ?></div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Tasks Completed</div>
                    <div class="stat-value"><?php echo $completed_count; ?></div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Reports Submitted</div>
                    <div class="stat-value"><?php echo $report_count; ?></div>
                </div>
            <?php endif; ?>
        </div>

        <?php if ($user_role == 'admin' || $is_management): ?>
        <!-- Admin Summary Cards -->
        <style>
            .summary-section { margin-bottom: 1.5rem; }
            .summary-section-title {
                font-size: 0.85rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em;
                color: #64748b; margin-bottom: 0.75rem; padding-left: 0.25rem;
                display: flex; align-items: center; gap: 0.5rem;
            }
            .summary-section-title i { font-size: 1rem; }
            .summary-cards-row {
                display: grid; gap: 1rem;
                grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            }
            .summary-card {
                background: #fff; border: 1px solid rgba(0,0,0,0.06); border-radius: 0.75rem;
                padding: 1.25rem; position: relative; overflow: hidden; cursor: pointer;
                box-shadow: 0 2px 8px rgba(0,0,0,0.03); transition: all 0.25s ease;
            }
            .summary-card:hover {
                transform: translateY(-3px); box-shadow: 0 8px 20px rgba(0,0,0,0.08);
                border-color: var(--primary);
            }
            .summary-card::before {
                content: ''; position: absolute; top: 0; left: 0; right: 0; height: 3px;
            }
            .summary-card.blue::before  { background: linear-gradient(90deg, #3b82f6, #0ea5e9); }
            .summary-card.orange::before { background: linear-gradient(90deg, #f97316, #fb923c); }
            .summary-card.green::before  { background: linear-gradient(90deg, #10b981, #34d399); }
            .summary-card.purple::before { background: linear-gradient(90deg, #8b5cf6, #a78bfa); }
            .summary-card .sc-label {
                font-size: 0.78rem; font-weight: 600; color: #64748b; text-transform: uppercase;
                letter-spacing: 0.03em; margin-bottom: 0.5rem;
            }
            .summary-card .sc-value {
                font-size: 1.6rem; font-weight: 700; color: #0f172a;
            }
            .summary-card .sc-download {
                position: absolute; top: 1rem; right: 1rem; color: #94a3b8; font-size: 0.9rem;
                transition: color 0.2s;
            }
            .summary-card:hover .sc-download { color: var(--primary); }
        </style>

        <!-- Enquiry & Enrollment Section -->
        <div class="summary-section">
            <div class="summary-section-title"><i class="fas fa-user-graduate"></i> Enquiry & Enrollment</div>
            <div class="summary-cards-row">
                <div class="summary-card purple" onclick="window.open('reports/rpt_dashboard_enquiry.php?period=today&type=enquiry','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">Today Enquiry</div>
                    <div class="sc-value"><?php echo $enquiry_today; ?></div>
                </div>
                
                <div class="summary-card purple" onclick="window.open('reports/rpt_dashboard_enquiry.php?period=month&type=enquiry','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">This Month Enquiry</div>
                    <div class="sc-value"><?php echo $enquiry_month; ?></div>
                </div>
                <div class="summary-card blue" onclick="window.open('reports/rpt_dashboard_enquiry.php?period=today&type=enrollment','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">Today Enrollment</div>
                    <div class="sc-value"><?php echo $enroll_today; ?></div>
                </div>
                
                <div class="summary-card blue" onclick="window.open('reports/rpt_dashboard_enquiry.php?period=week&type=enrollment','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">This Week Enrollment</div>
                    <div class="sc-value"><?php echo $enroll_week; ?></div>
                </div>
                <div class="summary-card purple" onclick="window.open('reports/rpt_dashboard_enquiry.php?period=month&type=enrollment','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">This Month Enrollment</div>
                    <div class="sc-value"><?php echo $enroll_month; ?></div>
                </div>
            </div>
        </div>

        <!-- Expense Section -->
        <div class="summary-section">
            <div class="summary-section-title"><i class="fas fa-wallet"></i> Expense</div>
            <div class="summary-cards-row">
                <div class="summary-card orange" onclick="window.open('reports/rpt_dashboard_expense.php?period=today','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">Today Expense</div>
                    <div class="sc-value">₹<?php echo number_format($expense_today, 2); ?></div>
                </div>
                <div class="summary-card orange" onclick="window.open('reports/rpt_dashboard_expense.php?period=week','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">This Week Expense</div>
                    <div class="sc-value">₹<?php echo number_format($expense_week, 2); ?></div>
                </div>
                <div class="summary-card orange" onclick="window.open('reports/rpt_dashboard_expense.php?period=month','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">This Month Expense</div>
                    <div class="sc-value">₹<?php echo number_format($expense_month, 2); ?></div>
                </div>
            </div>
        </div>

        <!-- Payment Section -->
        <div class="summary-section">
            <div class="summary-section-title"><i class="fas fa-file-invoice-dollar"></i> Payment</div>
            <div class="summary-cards-row">
                <div class="summary-card green" onclick="window.open('reports/rpt_dashboard_payment.php?period=today','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">Today Payment</div>
                    <div class="sc-value">₹<?php echo number_format($payment_today, 2); ?></div>
                </div>
                <div class="summary-card green" onclick="window.open('reports/rpt_dashboard_payment.php?period=week','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">This Week Payment</div>
                    <div class="sc-value">₹<?php echo number_format($payment_week, 2); ?></div>
                </div>
                <div class="summary-card green" onclick="window.open('reports/rpt_dashboard_payment.php?period=month','_blank')">
                    <div class="sc-download"><i class="fas fa-download"></i></div>
                    <div class="sc-label">This Month Payment</div>
                    <div class="sc-value">₹<?php echo number_format($payment_month, 2); ?></div>
                </div>
            </div>
        </div>
        <?php endif; ?>

        <?php if ($user_role == 'admin' || $is_management): ?>
        <div class="charts-grid">
            <div class="chart-card">
                <h3>Most Preferred Courses</h3>
                <div class="chart-container">
                    <canvas id="preferredCoursesChart"></canvas>
                </div>
            </div>
            <div class="chart-card">
                <h3>Enrolled vs Placed Students</h3>
                <div class="chart-container">
                    <canvas id="enrolledPlacedChart"></canvas>
                </div>
            </div>
        </div>

        <script>
            // Data for Most Preferred Courses
            const prefsData = <?php echo json_encode($course_prefs); ?>;
            const labelsPref = prefsData.map(d => d.course_name);
            const dataPref = prefsData.map(d => parseInt(d.student_count));
            
            // Create nice colors and offset for highest value
            const maxVal = Math.max(...dataPref);
            const offsets = dataPref.map(v => v === maxVal ? 15 : 0);
            
            // Brand-friendly colors
            const prefColors = [
                'rgba(14, 165, 233, 0.85)',  // bright blue
                'rgba(249, 115, 22, 0.85)',  // orange
                'rgba(29, 78, 216, 0.85)',   // dark blue
                'rgba(16, 185, 129, 0.85)',  // emerald
                'rgba(139, 92, 246, 0.85)',  // purple
                'rgba(236, 72, 153, 0.85)'   // pink
            ];

            const ctx1 = document.getElementById('preferredCoursesChart').getContext('2d');
            new Chart(ctx1, {
                type: 'doughnut',
                data: {
                    labels: labelsPref,
                    datasets: [{
                        data: dataPref,
                        backgroundColor: prefColors.slice(0, dataPref.length),
                        borderWidth: 2,
                        borderColor: '#ffffff',
                        hoverOffset: 10,
                        offset: offsets
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { position: window.innerWidth < 768 ? 'bottom' : 'right', labels: { color: '#475569', padding: window.innerWidth < 768 ? 10 : 20, font: { family: 'Outfit' } } },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    let label = context.label || '';
                                    if (label) label += ': ';
                                    let val = context.raw;
                                    let sum = context.chart._metasets[context.datasetIndex].total;
                                    let percentage = ((val * 100) / sum).toFixed(1) + "%";
                                    return label + val + ' students (' + percentage + ')';
                                }
                            },
                            backgroundColor: 'rgba(15, 23, 42, 0.9)',
                            titleFont: { family: 'Outfit' },
                            bodyFont: { family: 'Outfit' },
                            padding: 10,
                            cornerRadius: 8
                        }
                    },
                    cutout: '60%',
                    animation: { animateScale: true, animateRotate: true }
                }
            });

            // Data for Enrolled vs Placed Students
            const statsData = <?php echo json_encode($course_stats); ?>;
            const labelsStats = statsData.map(d => d.course_name);
            const dataEnrolled = statsData.map(d => parseInt(d.enrolled_count));
            const dataPlaced = statsData.map(d => parseInt(d.placed_count));

            const ctx2 = document.getElementById('enrolledPlacedChart').getContext('2d');
            new Chart(ctx2, {
                type: 'bar',
                data: {
                    labels: labelsStats,
                    datasets: [
                        {
                            label: 'Enrolled Students',
                            data: dataEnrolled,
                            backgroundColor: 'rgba(14, 165, 233, 0.85)', // matching the blue
                            borderColor: 'rgba(14, 165, 233, 1)',
                            borderWidth: 1,
                            borderRadius: 4
                        },
                        {
                            label: 'Placed Students',
                            data: dataPlaced,
                            backgroundColor: 'rgba(249, 115, 22, 0.85)', // matching the orange
                            borderColor: 'rgba(249, 115, 22, 1)',
                            borderWidth: 1,
                            borderRadius: 4
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { position: 'top', labels: { color: '#475569', font: { family: 'Outfit' } } },
                        tooltip: {
                            backgroundColor: 'rgba(15, 23, 42, 0.9)',
                            titleFont: { family: 'Outfit' },
                            bodyFont: { family: 'Outfit' },
                            padding: 10,
                            cornerRadius: 8
                        }
                    },
                    scales: {
                        x: {
                            grid: { color: '#f1f5f9', drawBorder: false },
                            ticks: { color: '#64748b', font: { family: 'Outfit' } }
                        },
                        y: {
                            beginAtZero: true,
                            grid: { color: '#f1f5f9', drawBorder: false },
                            ticks: { color: '#64748b', stepSize: 1, font: { family: 'Outfit' } }
                        }
                    },
                    animation: {
                        y: { duration: 1000, easing: 'easeOutQuart' }
                    }
                }
            });
        </script>
        <?php endif; ?>

        <div class="module-section" style="margin-top: 1.5rem;">
            <div class="section-title">
                <?php 
                if ($user_role == 'admin' || $is_management) {
                    echo "All Employee Tasks (Today)";
                    $view_all_url = "tasks.php";
                } elseif ($user_role == 'staff' || ($user_role == 'trainer')) {
                    echo "My Tasks (Today)";
                    $view_all_url = "tasks.php";
                } else {
                    echo "My Assigned Student Tasks (Today)";
                    $view_all_url = "student_tasks.php";
                }
                ?>
                <button class="btn-add" onclick="window.location.href='<?php echo $view_all_url; ?>'">View All</button>
            </div>
            <table class="responsive table table-bordered">
                <thead>
                    <tr>
                        <th>Task Title</th>
                        <th>Assigned To</th>
                        <th>Due Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($recent_tasks)): ?>
                    <tr><td colspan="4" style="text-align: center; color: var(--text-muted);">No tasks found today.</td></tr>
                    <?php else: ?>
                    <?php foreach ($recent_tasks as $t): 
                        if ($user_role === 'student') {
                            $title_display = $t['task_title'];
                            $assignee_display = 'Me (' . $t['assigned_to_student'] . ')';
                            $status_color = ($t['status'] == 'Completed') ? '#10b981' : (($t['status'] == 'In Progress') ? '#06b6d4' : '#fbbf24');
                            $status_display = $t['status'];
                        } else {
                            $title_display = $t['title'];
                            $assignee_name = $bf->getTableColumnValue($GLOBALS['staff_table'], 'staff_id', $t['assigned_to'], 'staff_name');
                            $assignee_display = $assignee_name ?: 'Unassigned';
                            $status_color = ($t['status'] == 'completed') ? '#10b981' : (($t['status'] == 'in_progress') ? '#06b6d4' : '#fbbf24');
                            $status_display = ucfirst($t['status']);
                        }
                    ?>
                    <tr>
                        <td style="font-weight:600;"><?php echo $title_display; ?></td>
                        <td><?php echo $assignee_display; ?></td>
                        <td><?php echo date('d-m-Y', strtotime($t['due_date'])); ?></td>
                        <td><span style="color: <?php echo $status_color; ?>; font-weight:700;"><?php echo $status_display; ?></span></td>
                    </tr>
                    <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
    <!-- Premium Installment Details Modal -->
    <div id="installmentModal" class="modal-overlay">
        <div class="modal-container">
            <div class="modal-header">
                <h3 class="modal-title">Student Installment Details</h3>
                <div style="display: flex; align-items: center; gap: 0.75rem;">
                    <button class="modal-print-btn" onclick="printInstallmentDetails()" style="background: #2563eb; color: #ffffff; border: none; padding: 0.4rem 0.8rem; border-radius: 6px; font-size: 0.85rem; font-weight: 500; cursor: pointer; display: flex; align-items: center; gap: 0.25rem; transition: background 0.2s;" onmouseover="this.style.background='#1d4ed8'" onmouseout="this.style.background='#2563eb'">
                        🖨️ Print / PDF
                    </button>
                    <button class="modal-close-btn" onclick="closeInstallmentModal()">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <div class="info-section-title">👤 Student Information</div>
                <div class="student-info-grid" id="modal-student-info">
                    <!-- Dynamic details will be loaded here -->
                </div>

                <div class="info-section-title">📅 Installment Schedule</div>
                <div class="schedule-table-wrapper">
                    <table class="schedule-table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Due Date</th>
                                <th>Amount</th>
                                <th>Paid Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="modal-schedule-tbody">
                            <!-- Dynamic rows will be loaded here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openInstallmentModal(enrollmentId) {
            if (!enrollmentId) return;
            
            const modal = document.getElementById('installmentModal');
            document.getElementById('modal-student-info').innerHTML = '<div style="grid-column: span 2; text-align: center; padding: 1rem; color: #64748b;">Loading student details...</div>';
            document.getElementById('modal-schedule-tbody').innerHTML = '<tr><td colspan="5" style="text-align: center; padding: 1rem; color: #64748b;">Loading schedule...</td></tr>';
            
            modal.classList.add('active');
            
            $.getJSON('dashboard.php', { action: 'get_installment_details', enrollment_id: enrollmentId }, function(response) {
                if (response.status === 'success') {
                    const data = response.data;
                    
                    let infoHtml = `
                        <div class="info-item">Name: <strong>${data.student_name}</strong></div>
                        <div class="info-item">Student ID: <strong>${data.student_id}</strong></div>
                        <div class="info-item">Course: <strong>${data.course_name}</strong></div>
                        <div class="info-item">DOJ: <strong>${data.doj}</strong></div>
                        <div class="info-item">Course Fee: <strong>${data.fees_amount}</strong></div>
                        <div class="info-item">Paid Amount: <strong>${data.paid_amount}</strong></div>
                        <div class="info-item">Balance: <strong>${data.balance_amount}</strong></div>
                    `;
                    if (data.enrollment_number) {
                        infoHtml += `<div class="info-item" style="grid-column: span 2;">Enrollment No: <strong>${data.enrollment_number}</strong> <span style="color:#94a3b8;">(${data.enrollment_id})</span></div>`;
                    } else {
                        infoHtml += `<div class="info-item" style="grid-column: span 2;">Enrollment ID: <strong>${data.enrollment_id}</strong></div>`;
                    }
                    document.getElementById('modal-student-info').innerHTML = infoHtml;
                    
                    let rowsHtml = '';
                    if (data.schedule && data.schedule.length > 0) {
                        data.schedule.forEach(function(inst) {
                            let statusClass = 'status-due';
                            if (inst.status.includes('Paid')) {
                                statusClass = inst.status.includes('Partially') ? 'status-partial' : 'status-paid';
                            }
                            
                            rowsHtml += `
                                <tr>
                                    <td>${inst.number}</td>
                                    <td>${inst.due_date}</td>
                                    <td>${inst.amount}</td>
                                    <td>${inst.paid_date}</td>
                                    <td><span class="status-badge ${statusClass}">${inst.status}</span></td>
                                </tr>
                            `;
                        });
                    } else {
                        rowsHtml = '<tr><td colspan="5" style="text-align: center; padding: 1.5rem; color: #64748b;">No installment schedule defined for this student.</td></tr>';
                    }
                    document.getElementById('modal-schedule-tbody').innerHTML = rowsHtml;
                } else {
                    document.getElementById('modal-student-info').innerHTML = `<div style="grid-column: span 2; color: #ef4444; padding: 1rem; text-align: center;">Error: ${response.message}</div>`;
                    document.getElementById('modal-schedule-tbody').innerHTML = `<tr><td colspan="5" style="text-align: center; color: #ef4444; padding: 1rem;">Failed to load data.</td></tr>`;
                }
            }).fail(function() {
                document.getElementById('modal-student-info').innerHTML = '<div style="grid-column: span 2; color: #ef4444; padding: 1rem; text-align: center;">Failed to connect to the server.</div>';
                document.getElementById('modal-schedule-tbody').innerHTML = '<tr><td colspan="5" style="text-align: center; color: #ef4444; padding: 1rem;">Failed to connect to the server.</td></tr>';
            });
        }

        function closeInstallmentModal() {
            document.getElementById('installmentModal').classList.remove('active');
        }

        function printInstallmentDetails() {
            window.print();
        }

        window.addEventListener('click', function(event) {
            const modal = document.getElementById('installmentModal');
            if (event.target === modal) {
                closeInstallmentModal();
            }
        });
    </script>
    <script src="main/js/script.js"></script>
</body>
</html>
