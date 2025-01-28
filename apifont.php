<?php
header("Content-Type: application/json");

// Database connection
$servername = "localhost";
$username = "root";
$password = ""; // Replace with your database password
$dbname = "api_management";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    http_response_code(500); // Internal Server Error
    echo json_encode(["error" => "Database connection failed"]);
    exit;
}

// Get the API key from the Authorization header or query string
$headers = getallheaders();
$apiKey = isset($headers['Authorization']) ? str_replace('Bearer ', '', $headers['Authorization']) : (isset($_GET['api_key']) ? $_GET['api_key'] : null);

// Validate the API key
$stmt = $conn->prepare("SELECT id FROM api_keys WHERE api_key = ?");
$stmt->bind_param("s", $apiKey);
$stmt->execute();
$stmt->bind_result($apiKeyId);
$stmt->fetch();
$stmt->close();

if (!$apiKeyId) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Invalid or missing API key"]);
    exit;
}

// Log the API request
$endpoint = $_SERVER['REQUEST_URI'];
$logStmt = $conn->prepare("INSERT INTO api_logs (api_key_id, endpoint) VALUES (?, ?)");
$logStmt->bind_param("is", $apiKeyId, $endpoint);
$logStmt->execute();
$logStmt->close();

// Proceed with the API logic
echo json_encode(["status" => "success", "data" => [
    ["id" => 1, "name" => "Lalatendu Swain", "email" => "swain@lalatendu.info", "age" => 29],
    ["id" => 2, "name" => "Swain", "email" => "swain@example.com", "age" => 31]
]]);

// Close the database connection
$conn->close();
?>
