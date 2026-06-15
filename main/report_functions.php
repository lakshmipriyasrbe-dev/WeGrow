<?php
    include_once("basic_functions.php");
    
    class Report_Functions {
        private $basic_obj;

        public function __construct($basic_obj = null) {
            $this->basic_obj = $basic_obj ?: new Basic_Functions();
        }

        // public function getEnrollmentReportList($course_type, $course_id, $from_date, $to_date) {
        //     $where = [];
        //     $params = [];

        //     if(!empty($course_type)) {
        //         $where[] = "type = :course_type";
        //         $params[':course_type'] = $course_type;
        //     }

        //     if(!empty($course_id)) {
        //         $where[] = "course_id = :course_id";
        //         $params[':course_id'] = $course_id;
        //     }

        //     if(!empty($from_date)) {
        //         $where[] = "enrollment_date >= :from_date";
        //         $params[':from_date'] = $from_date;
        //     }

        //     if(!empty($to_date)) {
        //         $where[] = "enrollment_date <= :to_date";
        //         $params[':to_date'] = $to_date;
        //     }

        //     $whereClause = "";

        //     if(!empty($where)) {
        //         $whereClause = " WHERE " . implode(" AND ", $where);
        //     }

        //     $query = "SELECT enroll_id, student_id, student_name, mobile_number, course_id, enrollment_date, fees_amount, type FROM (
        //         SELECT e.enrollment_id AS enroll_id, e.student_id, e.student_name, e.mobile_number, e.course_id, e.doj AS enrollment_date, e.fees_amount, 'training' AS type 
        //         FROM {$GLOBALS['enrollment_table']} e WHERE e.deleted = 0 AND e.company_id = '{$_SESSION['company_id']}'
        //         UNION ALL 
        //         SELECT ei.enrollment_internship_id AS enroll_id, ei.student_id, ei.student_name, ei.mobile_number, ei.course_id, ei.doj AS enrollment_date, ei.fees_amount, 'internship' AS type 
        //         FROM {$GLOBALS['enrollment_internship_table']} ei WHERE ei.deleted = 0 AND ei.company_id = '{$_SESSION['company_id']}'
        //     ) AS enrollments $whereClause ORDER BY enrollment_date ASC";

        //     // echo $this->debugQuery($query, $params);

        //     $enrollments = $this->basic_obj->getQueryRecords($query, $params);

        //     // Calculate paid_amount from payment table for each enrollment
        //     foreach ($enrollments as &$enrollment) {
        //         $paid_query = "SELECT COALESCE(SUM(total_amount), 0) as total_paid FROM {$GLOBALS['payment_table']} WHERE (enrollment_id = :enroll_id OR student_id = :enroll_id) AND deleted = 0";
        //         $paid_params = [':enroll_id' => $enrollment['enroll_id']];
        //         $paid_result = $this->basic_obj->getQueryRecords($paid_query, $paid_params);
        //         $enrollment['paid_amount'] = floatval($paid_result[0]['total_paid'] ?? 0);
        //         $enrollment['balance_amount'] = floatval($enrollment['fees_amount'] ?? 0) - $enrollment['paid_amount'];
        //     }
        //     unset($enrollment);

        //     return $enrollments;
        // }   
        /* public function getEnrollmentReportList($course_type, $course_id, $from_date, $to_date) {

            $where = [];
            $params = [];

            $company_id = $this->basic_obj->getCompanyId();

            if(!empty($course_type)) {
                $where[] = "type = :course_type";
                $params[':course_type'] = $course_type;
            }

            if(!empty($course_id)) {
                $where[] = "course_id = :course_id";
                $params[':course_id'] = $course_id;
            }

            if(!empty($from_date)) {
                $where[] = "enrollment_date >= :from_date";
                $params[':from_date'] = $from_date;
            }

            if(!empty($to_date)) {
                $where[] = "enrollment_date <= :to_date";
                $params[':to_date'] = $to_date;
            }

            $params[':company_id'] = $company_id;

            $whereClause = "";

            if(!empty($where)) {
                $whereClause = " WHERE " . implode(" AND ", $where);
            }

            $query = "
                SELECT 
                    enroll_id,
                    student_id,
                    student_name,
                    mobile_number,
                    course_id,
                    enrollment_date,
                    fees_amount,
                    type
                FROM (
                    SELECT 
                        e.enrollment_id AS enroll_id,
                        e.student_id,
                        e.student_name,
                        e.mobile_number,
                        e.course_id,
                        e.doj AS enrollment_date,
                        e.fees_amount,
                        'training' AS type
                    FROM {$GLOBALS['enrollment_table']} e
                    WHERE e.deleted = 0
                    AND e.company_id = :company_id

                    UNION ALL

                    SELECT 
                        ei.enrollment_internship_id AS enroll_id,
                        ei.student_id,
                        ei.student_name,
                        ei.mobile_number,
                        ei.course_id,
                        ei.doj AS enrollment_date,
                        ei.fees_amount,
                        'internship' AS type
                    FROM {$GLOBALS['enrollment_internship_table']} ei
                    WHERE ei.deleted = 0
                    AND ei.company_id = :company_id

                ) AS enrollments

                $whereClause

                ORDER BY enrollment_date ASC
            ";

            $enrollments = $this->basic_obj->getQueryRecords($query, $params);

            // Fetch all payment totals once
            $payment_query = "
                SELECT
                    enrollment_id,
                    SUM(CAST(paid_amount AS DECIMAL(10,2))) AS total_paid
                FROM {$GLOBALS['payment_table']}
                WHERE deleted = 0
                GROUP BY enrollment_id
            ";

            $payments = $this->basic_obj->getQueryRecords($payment_query);

            $payment_lookup = [];

            if(!empty($payments)) {
                foreach($payments as $payment) {
                    $payment_lookup[$payment['enrollment_id']] = $payment['total_paid'];
                }
            }

            foreach($enrollments as &$enrollment) {

                $paid_amount = 0;

                if(isset($payment_lookup[$enrollment['enroll_id']])) {
                    $paid_amount = floatval($payment_lookup[$enrollment['enroll_id']]);
                }

                $enrollment['paid_amount'] = $paid_amount;

                $enrollment['balance_amount'] =
                    floatval($enrollment['fees_amount']) - $paid_amount;
            }

            unset($enrollment);

            return $enrollments;
        } */

        public function getEnrollmentReportList($course_type, $course_id, $from_date, $to_date) {

            $where = [];
            $params = [];

            $company_id = $this->basic_obj->getCompanyId();

            if (!empty($course_type)) {
                $where[] = "type = :course_type";
                $params[':course_type'] = $course_type;
            }

            if (!empty($course_id)) {
                $where[] = "course_id = :course_id";
                $params[':course_id'] = $course_id;
            }

            if (!empty($from_date)) {
                $where[] = "enrollment_date >= :from_date";
                $params[':from_date'] = $from_date;
            }

            if (!empty($to_date)) {
                $where[] = "enrollment_date <= :to_date";
                $params[':to_date'] = $to_date;
            }

            $params[':company_id'] = $company_id;

            $whereClause = '';
            if (!empty($where)) {
                $whereClause = ' WHERE ' . implode(' AND ', $where);
            }

            $query = "
                SELECT
                    enroll_id,
                    student_id,
                    student_name,
                    mobile_number,
                    course_id,
                    enrollment_date,
                    fees_amount,
                    type
                FROM (

                    SELECT
                        e.enrollment_id AS enroll_id,
                        e.student_id,
                        e.student_name,
                        e.mobile_number,
                        e.course_id,
                        e.doj AS enrollment_date,
                        e.fees_amount,
                        'training' AS type
                    FROM {$GLOBALS['enrollment_table']} e
                    WHERE e.deleted = 0
                    AND e.company_id = :company_id

                    UNION ALL

                    SELECT
                        ei.enrollment_internship_id AS enroll_id,
                        ei.student_id,
                        ei.student_name,
                        ei.mobile_number,
                        ei.course_id,
                        ei.doj AS enrollment_date,
                        ei.fees_amount,
                        'internship' AS type
                    FROM {$GLOBALS['enrollment_internship_table']} ei
                    WHERE ei.deleted = 0
                    AND ei.company_id = :company_id

                ) enrollments

                $whereClause

                ORDER BY enrollment_date ASC
            ";

            $enrollments = $this->basic_obj->getQueryRecords($query, $params);

            if (empty($enrollments)) {
                return [];
            }

            /*
            |--------------------------------------------------------------------------
            | Get only required enrollment ids
            |--------------------------------------------------------------------------
            */
            $enrollment_ids = [];

            foreach ($enrollments as $row) {
                if (!empty($row['enroll_id'])) {
                    $enrollment_ids[] = $row['enroll_id'];
                }
            }

            $payment_lookup = [];

            if (!empty($enrollment_ids)) {

                $placeholders = [];

                foreach ($enrollment_ids as $key => $id) {
                    $placeholders[] = ":eid{$key}";
                }

                $payment_query = "
                    SELECT
                        enrollment_id,
                        SUM(CAST(paid_amount AS DECIMAL(10,2))) AS total_paid
                    FROM {$GLOBALS['payment_table']}
                    WHERE deleted = 0
                    AND enrollment_id IN (" . implode(',', $placeholders) . ")
                    GROUP BY enrollment_id
                ";

                $payment_params = [];

                foreach ($enrollment_ids as $key => $id) {
                    $payment_params[":eid{$key}"] = $id;
                }

                $payments = $this->basic_obj->getQueryRecords(
                    $payment_query,
                    $payment_params
                );

                foreach ($payments as $payment) {
                    $payment_lookup[$payment['enrollment_id']]
                        = floatval($payment['total_paid']);
                }
            }

            foreach ($enrollments as &$enrollment) {

                $paid_amount =
                    $payment_lookup[$enrollment['enroll_id']]
                    ?? 0;

                $enrollment['paid_amount'] = $paid_amount;

                $enrollment['balance_amount'] =
                    floatval($enrollment['fees_amount'])
                    - $paid_amount;
            }

            unset($enrollment);

            return $enrollments;
        }

        public function getPayrollReportList($staff_id, $month, $year) {
            $where = ["p.company_id = :comp_id"];
            $params = [':comp_id' => $_SESSION['company_id']];

            if(!empty($staff_id)) {
                $where[] = "p.staff_id = :staff_id";
                $params[':staff_id'] = $staff_id;
            }

            if(!empty($month)) {
                $where[] = "month = :month";
                $params[':month'] = $month;
            }

            if(!empty($year)) {
                $where[] = "year = :year";
                $params[':year'] = $year;
            }

            $whereClause = "";

            if(!empty($where)) {
                $whereClause = " WHERE " . implode(" AND ", $where);
            }

            $query = "SELECT p.staff_id, p.payroll_number, p.cl_days, p.lop_days, p.total_deduction, p.incentive_amount, p.payment_date, p.net_salary FROM {$GLOBALS['payroll_table']} p LEFT JOIN {$GLOBALS['staff_table']} s ON p.staff_id = s.staff_id $whereClause ORDER BY p.payment_date DESC";

            // echo $this->debugQuery($query, $params);

            $payrolls = $this->basic_obj->getQueryRecords($query, $params);

            return $payrolls;
        }

        public function getPaymentReportListOld($course_type, $student_id, $from_date, $to_date, $bill_type = '', $expense_category_id = '', $payment_mode_id = '') {
            $results = [];

            // ---- Fetch Receipts (Credits) from payment_table ----
            if (empty($bill_type) || $bill_type == 'Receipt') {
                $where = ["deleted = 0", "company_id = :comp_id"];
                $params = [':comp_id' => $_SESSION['company_id']];

                if (!empty($course_type)) {
                    $where[] = "course_type = :course_type";
                    $params[':course_type'] = $course_type;
                }
                if (!empty($student_id)) {
                    $where[] = "student_id = :student_id";
                    $params[':student_id'] = $student_id;
                }
                if (!empty($from_date)) {
                    $where[] = "payment_date >= :from_date";
                    $params[':from_date'] = $from_date;
                }
                if (!empty($to_date)) {
                    $where[] = "payment_date <= :to_date";
                    $params[':to_date'] = $to_date;
                }
                if (!empty($payment_mode_id)) {
                    $where[] = "FIND_IN_SET(:payment_mode_id, payment_mode)";
                    $params[':payment_mode_id'] = $payment_mode_id;
                }

                $whereClause = " WHERE " . implode(" AND ", $where);
                $query = "SELECT * FROM {$GLOBALS['payment_table']} $whereClause ORDER BY payment_date ASC";
                $receipts = $this->basic_obj->getQueryRecords($query, $params);

                foreach ($receipts as $r) {
                    // Resolve student name
                    $student_name = '';
                    $student_dec_id = '';
                    $table = ($r['course_type'] === 'internship') ? $GLOBALS['enrollment_internship_table'] : $GLOBALS['enrollment_table'];
                    $id_field = ($r['course_type'] === 'internship') ? 'enrollment_internship_id' : 'enrollment_id';
                    $stu_rec = $this->basic_obj->getTableRecords($table, $id_field, $r['enrollment_id']);
                    if (empty($stu_rec)) {
                        $stu_rec = $this->basic_obj->getTableRecords($table, 'student_id', $r['student_id']);
                    }
                    if (!empty($stu_rec)) {
                        $student_name = $stu_rec[0]['student_name'];
                        $student_dec_id = $this->basic_obj->encode_decode('decrypt', $stu_rec[0]['student_id']);
                    }

                    // Calculate filtered amount: if payment_mode_id filter is set, use only that mode's amount
                    $credit_amount = floatval($r['total_amount']);
                    if (!empty($payment_mode_id) && !empty($r['payment_mode']) && !empty($r['amount'])) {
                        $modes = array_map('trim', explode(',', $r['payment_mode']));
                        $amounts_arr = array_map('trim', explode(',', $r['amount']));
                        $credit_amount = 0;
                        foreach ($modes as $idx => $mode) {
                            if ($mode === $payment_mode_id) {
                                $credit_amount += floatval($amounts_arr[$idx] ?? 0);
                            }
                        }
                    }

                    $results[] = [
                        'bill_id' => $r['payment_id'] ?? '',
                        'bill_date' => $r['payment_date'],
                        'bill_type' => 'Receipt',
                        'bill_details' => $student_dec_id . ' - ' . $student_name . ' (' . ucfirst($r['course_type']) . ')',
                        'payment_mode' => $r['payment_mode'] ?? '',
                        'credit' => $credit_amount,
                        'debit' => 0,
                        'raw' => $r
                    ];
                }
            }

            // ---- Fetch Expenses (Debits) from expense_entry_table ----
            if (empty($bill_type) || $bill_type == 'Expense') {
                $where = ["deleted = 0", "company_id = :comp_id"];
                $params = [':comp_id' => $_SESSION['company_id']];

                if (!empty($expense_category_id)) {
                    $where[] = "expense_category_id = :expense_category_id";
                    $params[':expense_category_id'] = $expense_category_id;
                }
                if (!empty($from_date)) {
                    $where[] = "expense_entry_date >= :from_date";
                    $params[':from_date'] = $from_date;
                }
                if (!empty($to_date)) {
                    $where[] = "expense_entry_date <= :to_date";
                    $params[':to_date'] = $to_date;
                }
                if (!empty($payment_mode_id)) {
                    $where[] = "FIND_IN_SET(:payment_mode_id, payment_mode)";
                    $params[':payment_mode_id'] = $payment_mode_id;
                }

                $whereClause = " WHERE " . implode(" AND ", $where);
                $query = "SELECT * FROM {$GLOBALS['expense_entry_table']} $whereClause ORDER BY expense_entry_date ASC";
                $expenses = $this->basic_obj->getQueryRecords($query, $params);

                foreach ($expenses as $e) {
                    // Resolve category name
                    $category_name = '';
                    if (!empty($e['expense_category_id'])) {
                        $category_name = $this->basic_obj->getTableColumnValue($GLOBALS['expense_category_table'], 'expense_category_id', $e['expense_category_id'], 'expense_category_name') ?: '';
                    }
                    $detail = $category_name;
                    if (!empty($e['description'])) {
                        $detail .= (!empty($detail) ? ' - ' : '') . $e['description'];
                    }

                    // Calculate filtered amount: if payment_mode_id filter is set, use only that mode's amount
                    $debit_amount = floatval($e['total_amount']);
                    if (!empty($payment_mode_id) && !empty($e['payment_mode']) && !empty($e['amount'])) {
                        $modes = array_map('trim', explode(',', $e['payment_mode']));
                        $amounts_arr = array_map('trim', explode(',', $e['amount']));
                        $debit_amount = 0;
                        foreach ($modes as $idx => $mode) {
                            if ($mode === $payment_mode_id) {
                                $debit_amount += floatval($amounts_arr[$idx] ?? 0);
                            }
                        }
                    }

                    $results[] = [
                        'bill_id' => $e['expense_entry_number'] ?? '',
                        'bill_date' => $e['expense_entry_date'],
                        'bill_type' => 'Expense',
                        'bill_details' => $detail,
                        'payment_mode' => $e['payment_mode'] ?? '',
                        'credit' => 0,
                        'debit' => $debit_amount,
                        'raw' => $e
                    ];
                }
            }

            // Sort all records by date ascending
            usort($results, function($a, $b) {
                return strtotime($a['bill_date']) - strtotime($b['bill_date']);
            });

            // Calculate running balance (Credit - Debit)
            $balance = 0;
            foreach ($results as &$row) {
                $balance += $row['credit'] - $row['debit'];
                $row['balance'] = $balance;
            }
            unset($row);

            return $results;
        }

        public function getPaymentReportList($course_type, $student_id, $from_date, $to_date, $bill_type = '', $expense_category_id = '', $payment_mode_id = '') {
            $results = [];

            // Student Lookup Cache
            $student_lookup = [];

            // Training Students
            $training_students = $this->basic_obj->getQueryRecords("
                SELECT enrollment_id,
                    student_id,
                    student_name
                FROM {$GLOBALS['enrollment_table']}
                WHERE deleted = 0
            ");

            foreach ($training_students as $row) {

                $student_lookup[$row['enrollment_id']] = [
                    'student_name' => $row['student_name'],
                    'student_id' => $row['student_id']
                ];

                $student_lookup['SID_' . $row['student_id']] = [
                    'student_name' => $row['student_name'],
                    'student_id' => $row['student_id']
                ];
            }

            // Internship Students
            $intern_students = $this->basic_obj->getQueryRecords("
                SELECT enrollment_internship_id,
                    student_id,
                    student_name
                FROM {$GLOBALS['enrollment_internship_table']}
                WHERE deleted = 0
            ");

            foreach ($intern_students as $row) {

                $student_lookup[$row['enrollment_internship_id']] = [
                    'student_name' => $row['student_name'],
                    'student_id' => $row['student_id']
                ];

                $student_lookup['SID_' . $row['student_id']] = [
                    'student_name' => $row['student_name'],
                    'student_id' => $row['student_id']
                ];
            }

            // Expense Category Lookup Cache
            $category_lookup = [];

            $categories = $this->basic_obj->getQueryRecords("
                SELECT expense_category_id,
                    expense_category_name
                FROM {$GLOBALS['expense_category_table']}
                WHERE deleted = 0
            ");

            foreach ($categories as $row) {
                $category_lookup[$row['expense_category_id']]
                    = $row['expense_category_name'];
            }

            // ---- Fetch Receipts (Credits) from payment_table ----
            if (empty($bill_type) || $bill_type == 'Receipt') {
                $where = ["deleted = 0", "company_id = :comp_id"];
                $params = [':comp_id' => $_SESSION['company_id']];

                if (!empty($course_type)) {
                    $where[] = "course_type = :course_type";
                    $params[':course_type'] = $course_type;
                }
                if (!empty($student_id)) {
                    $where[] = "student_id = :student_id";
                    $params[':student_id'] = $student_id;
                }
                if (!empty($from_date)) {
                    $where[] = "payment_date >= :from_date";
                    $params[':from_date'] = $from_date;
                }
                if (!empty($to_date)) {
                    $where[] = "payment_date <= :to_date";
                    $params[':to_date'] = $to_date;
                }
                if (!empty($payment_mode_id)) {
                    $where[] = "FIND_IN_SET(:payment_mode_id, payment_mode)";
                    $params[':payment_mode_id'] = $payment_mode_id;
                }

                $whereClause = " WHERE " . implode(" AND ", $where);
                $query = "SELECT * FROM {$GLOBALS['payment_table']} $whereClause ORDER BY payment_date DESC";
                $receipts = $this->basic_obj->getQueryRecords($query, $params);

                foreach ($receipts as $r) {
                    // Resolve student name
                    $student_name = '';
                    $student_dec_id = '';
                    if (isset($student_lookup[$r['enrollment_id']])) {

                        $student_name =
                            $student_lookup[$r['enrollment_id']]['student_name'];

                        $student_dec_id =
                            $this->basic_obj->encode_decode(
                                'decrypt',
                                $student_lookup[$r['enrollment_id']]['student_id']
                            );

                    } elseif (isset($student_lookup['SID_' . $r['student_id']])) {

                        $student_name =
                            $student_lookup['SID_' . $r['student_id']]['student_name'];

                        $student_dec_id =
                            $this->basic_obj->encode_decode(
                                'decrypt',
                                $student_lookup['SID_' . $r['student_id']]['student_id']
                            );
                    }

                    // Calculate filtered amount: if payment_mode_id filter is set, use only that mode's amount
                    $credit_amount = floatval($r['total_amount']);
                    if (!empty($payment_mode_id) && !empty($r['payment_mode']) && !empty($r['amount'])) {
                        $modes = array_map('trim', explode(',', $r['payment_mode']));
                        $amounts_arr = array_map('trim', explode(',', $r['amount']));
                        $credit_amount = 0;
                        foreach ($modes as $idx => $mode) {
                            if ($mode === $payment_mode_id) {
                                $credit_amount += floatval($amounts_arr[$idx] ?? 0);
                            }
                        }
                    }

                    $results[] = [
                        'bill_id' => $r['payment_id'] ?? '',
                        'bill_date' => $r['payment_date'],
                        'bill_type' => 'Receipt',
                        'bill_details' => $student_dec_id . ' - ' . $student_name . ' (' . ucfirst($r['course_type']) . ')',
                        'payment_mode' => $r['payment_mode'] ?? '',
                        'credit' => $credit_amount,
                        'debit' => 0,
                        'raw' => $r
                    ];
                }
            }

            // ---- Fetch Expenses (Debits) from expense_entry_table ----
            if (empty($bill_type) || $bill_type == 'Expense') {
                $where = ["deleted = 0", "company_id = :comp_id"];
                $params = [':comp_id' => $_SESSION['company_id']];

                if (!empty($expense_category_id)) {
                    $where[] = "expense_category_id = :expense_category_id";
                    $params[':expense_category_id'] = $expense_category_id;
                }
                if (!empty($from_date)) {
                    $where[] = "expense_entry_date >= :from_date";
                    $params[':from_date'] = $from_date;
                }
                if (!empty($to_date)) {
                    $where[] = "expense_entry_date <= :to_date";
                    $params[':to_date'] = $to_date;
                }
                if (!empty($payment_mode_id)) {
                    $where[] = "FIND_IN_SET(:payment_mode_id, payment_mode)";
                    $params[':payment_mode_id'] = $payment_mode_id;
                }

                $whereClause = " WHERE " . implode(" AND ", $where);
                $query = "SELECT * FROM {$GLOBALS['expense_entry_table']} $whereClause ORDER BY expense_entry_date DESC";
                $expenses = $this->basic_obj->getQueryRecords($query, $params);

                foreach ($expenses as $e) {
                    // Resolve category name
                    $category_name = '';
                    $category_name = $category_lookup[$e['expense_category_id']] ?? '';
                    $detail = $category_name;
                    if (!empty($e['description'])) {
                        $detail .= (!empty($detail) ? ' - ' : '') . $e['description'];
                    }

                    // Calculate filtered amount: if payment_mode_id filter is set, use only that mode's amount
                    $debit_amount = floatval($e['total_amount']);
                    if (!empty($payment_mode_id) && !empty($e['payment_mode']) && !empty($e['amount'])) {
                        $modes = array_map('trim', explode(',', $e['payment_mode']));
                        $amounts_arr = array_map('trim', explode(',', $e['amount']));
                        $debit_amount = 0;
                        foreach ($modes as $idx => $mode) {
                            if ($mode === $payment_mode_id) {
                                $debit_amount += floatval($amounts_arr[$idx] ?? 0);
                            }
                        }
                    }

                    $results[] = [
                        'bill_id' => $e['expense_entry_number'] ?? '',
                        'bill_date' => $e['expense_entry_date'],
                        'bill_type' => 'Expense',
                        'bill_details' => $detail,
                        'payment_mode' => $e['payment_mode'] ?? '',
                        'credit' => 0,
                        'debit' => $debit_amount,
                        'raw' => $e
                    ];
                }
            }

            // Sort all records by date ascending
            // usort($results, function($a, $b) {
            //     return strtotime($a['bill_date']) - strtotime($b['bill_date']);
            // });

            // // Calculate running balance (Credit - Debit)
            // $balance = 0;
            // foreach ($results as &$row) {
            //     $balance += $row['credit'] - $row['debit'];
            //     $row['balance'] = $balance;
            // }
            // unset($row);

            return $results;
        }

        public function getPlacementReportList($from_date, $to_date) {
            $where = ["deleted = 0", "placed = 1", "company_id = :comp_id"];
            $params = [':comp_id' => $_SESSION['company_id']];

            if(!empty($from_date)) {
                $where[] = "closure_date >= :from_date";
                $params[':from_date'] = $from_date;
            }

            if(!empty($to_date)) {
                $where[] = "closure_date <= :to_date";
                $params[':to_date'] = $to_date;
            }

            $whereClause = " WHERE " . implode(" AND ", $where);
            $query = "SELECT * FROM {$GLOBALS['course_closure_table']} $whereClause ORDER BY closure_date ASC";

            return $this->basic_obj->getQueryRecords($query, $params);
        }
        
        public function getDailyWorkReportList($staff_id, $from_date, $to_date) {
            $where = ["deleted = 0"];
            $params = [];

            $company_id = $this->basic_obj->getCompanyId();
            if ($company_id) {
                $where[] = "company_id = :comp_id";
                $params[':comp_id'] = $company_id;
            }

            if(!empty($staff_id)) {
                $where[] = "user_id = :staff_id";
                $params[':staff_id'] = $staff_id;
            }

            if(!empty($from_date)) {
                $where[] = "report_date >= :from_date";
                $params[':from_date'] = $from_date;
            }

            if(!empty($to_date)) {
                $where[] = "report_date <= :to_date";
                $params[':to_date'] = $to_date;
            }

            $whereClause = " WHERE " . implode(" AND ", $where);
            $query = "SELECT * FROM {$GLOBALS['report_table']} $whereClause ORDER BY report_date ASC";

            return $this->basic_obj->getQueryRecords($query, $params);
        }
    }
?>