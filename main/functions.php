<?php

require_once 'basic_functions.php';
require_once 'report_functions.php';

class Core_Functions {

    public $con;
    private $basic_obj;
    private $report_obj;

    public function __construct($basic_obj = null, $report_obj = null) {

        $this->basic_obj = $basic_obj ?: new Basic_Functions();
        $this->report_obj = $report_obj ?: new Report_Functions($this->basic_obj);
        $this->con = $this->basic_obj->con;
    }

    // ================= BASIC FUNCTIONS =================

    public function getCompanyId() {
        return $this->basic_obj->getCompanyId();
    }

    public function encode_decode($action, $string) {
        return $this->basic_obj->encode_decode($action, $string);
    }

    public function sanitize($data) {
        return $this->basic_obj->sanitize($data);
    }

    public function InsertSQL($table, $data, $custom_id = '', $unique_number = '', $action = '') {
        return $this->basic_obj->InsertSQL($table, $data, $custom_id, $unique_number, $action);
    }

    public function UpdateSQL($table, $data, $where_clause, $where_params = []) {
        return $this->basic_obj->UpdateSQL($table, $data, $where_clause, $where_params);
    }

    public function getTableRecords($table, $field = '', $value = '', $orderby = 'id DESC') {
        return $this->basic_obj->getTableRecords($table, $field, $value, $orderby);
    }

    public function getTableColumnValue($table, $field, $value, $return_field) {
        return $this->basic_obj->getTableColumnValue($table, $field, $value, $return_field);
    }

    public function getQueryRecords($query, $params = []) {
        return $this->basic_obj->getQueryRecords($query, $params);
    }

    public function getLastRecordIDFromTable($table) {
        return $this->basic_obj->getLastRecordIDFromTable($table);
    }

    public function automate_number($table, $field, $last_id, $current_id) {
        return $this->basic_obj->automate_number($table, $field, $last_id, $current_id);
    }

    public function add_log($table, $id, $query, $action) {
        return $this->basic_obj->add_log($table, $id, $query, $action);
    }

    public function db_backup() {
        return $this->basic_obj->db_backup();
    }

    public function check_permission($action, $page = '') {
        return $this->basic_obj->check_permission($action, $page);
    }

    public function get_role_permissions($role_id) {
        return $this->basic_obj->get_role_permissions($role_id);
    }

    public function isRecordLinked($relations) {
        return $this->basic_obj->isRecordLinked($relations);
    }

    public function check_unique_username($username, $exclude_table = '', $exclude_id = '') {
        return $this->basic_obj->check_unique_username($username, $exclude_table, $exclude_id);
    }

    public function check_unique_mobile($mobile, $exclude_table = '', $exclude_id = '') {
        return $this->basic_obj->check_unique_mobile($mobile, $exclude_table, $exclude_id);
    }

    public function getPaginatedResults($query, $params, $start, $limit) {
        return $this->basic_obj->getPaginatedResults($query, $params, $start, $limit);
    }

    public function getStaffList($start = 0, $limit = 10, $search = '') {
        return $this->basic_obj->getStaffList($start, $limit, $search);
    }

    public function getTableList($table_name, $search_cols = [], $start = 0, $limit = 10, $search = '') {
        return $this->basic_obj->getTableList($table_name, $search_cols, $start, $limit, $search);
    }

    public function getAttendanceList($start = 0, $limit = 10, $search = '') {
        return $this->basic_obj->getAttendanceList($start, $limit, $search);
    }

    public function getStudentAttendanceList($start = 0, $limit = 10, $search = '', $staff_id = '') {
        return $this->basic_obj->getStudentAttendanceList($start, $limit, $search, $staff_id);
    }

    public function getEnrollmentList($table_name, $start = 0, $limit = 10, $search = '') {
        return $this->basic_obj->getEnrollmentList($table_name, $start, $limit, $search);
    }

    public function checkCompanyAlreadyExists($company_name, $branch) {
        return $this->basic_obj->checkCompanyAlreadyExists($company_name, $branch);
    }

    // ================= REPORT FUNCTIONS =================

    public function getEnrollmentReportList($course_type, $course_id, $from_date, $to_date) {
        return $this->report_obj->getEnrollmentReportList($course_type, $course_id, $from_date, $to_date);
    }

    public function getPayrollReportList($staff_id, $month, $year) {
        return $this->report_obj->getPayrollReportList($staff_id, $month, $year);
    }

    public function getPaymentReportList($course_type, $student_id, $from_date, $to_date, $bill_type = '', $expense_category_id = '', $payment_mode_id = '') {
        return $this->report_obj->getPaymentReportList($course_type, $student_id, $from_date, $to_date, $bill_type, $expense_category_id, $payment_mode_id);
    }

    public function getPlacementReportList($from_date, $to_date) {
        return $this->report_obj->getPlacementReportList($from_date, $to_date);
    }

    public function getDailyWorkReportList($staff_id, $from_date, $to_date) {
        return $this->report_obj->getDailyWorkReportList($staff_id, $from_date, $to_date);
    }
}
?>