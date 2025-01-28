<?php
header("Content-Type: application/json");

// List of valid API keys (can also fetch from a database)
$validApiKeys = [
    'abc123xyz' // Add all valid keys here
];

// Get the API key from query parameters or headers
$apiKey = isset($_GET['api_key']) ? $_GET['api_key'] : null;

// Validate the API key
if (!$apiKey || !in_array($apiKey, $validApiKeys)) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Invalid or missing API key"]);
    exit;
}

// Proceed with the API logic if the API key is valid
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "my_database";

// Create a connection to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    http_response_code(500); // Internal Server Error
    echo json_encode(["error" => "Database connection failed"]);
    exit;
}

// Fetch data from the database
$sql = "SELECT * FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $users = [];
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
    echo json_encode(["status" => "success", "data" => $users]);
} else {
    echo json_encode(["status" => "success", "data" => []]);
}

// Close the connection
$conn->close();
?>
