<?php
    class Database {

        // private $host = "localhost";
        // private $dbname = "a1767153_mgmt";
        // private $username = "a1767153_admin";
        // private $password = "Wegrow@@2026";

        private $host = "localhost";
        private $dbname = "training_center_db";
        private $username = "root";
        private $password = "";
        
        public $conn;
        private static $shared_conn = null;

        public function __construct() {
            $this->conn = $this->connect();
        }

        public function connect() {
            if (self::$shared_conn !== null) {
                $this->conn = self::$shared_conn;
                return $this->conn;
            }
            try {
                $pdo = new PDO(
                    "mysql:host=" . $this->host . ";dbname=" . $this->dbname . ";charset=utf8",
                    $this->username,
                    $this->password,
                    [
                        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                        PDO::ATTR_EMULATE_PREPARES   => true,
                        // PDO::ATTR_PERSISTENT removed — caused "too many connections" on live server
                    ]
                );
                self::$shared_conn = $pdo;
                $this->conn = $pdo;
                return $this->conn;
            } catch (PDOException $e) {
                // error_log("Database Connection Failed: " . $e->getMessage());
                // echo "Database Connection Failed : " . $e->getMessage();
                // exit;
                $msg = date('Y-m-d H:i:s') .
                    " Database Connection Failed: " .
                    $e->getMessage() . PHP_EOL;

                file_put_contents(
                    __DIR__ . '/connection_log.txt',
                    $msg,
                    FILE_APPEND
                );
            }
        }

        public function getConnection() {
            return $this->conn;
        }

        public function getDbConfig() {
            return [
                'host' => $this->host,
                'dbname' => $this->dbname,
                'user' => $this->username,
                'pass' => $this->password
            ];
        }
        
        public function __destruct() {
            $this->conn = null;
        }
    }
?>
