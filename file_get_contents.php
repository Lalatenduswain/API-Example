<?php
// Define the API URL
$apiUrl = "http://localhost/apifont.php";

// Define your API key securely
$apiKey = "Lalatendu@594";

// Use cURL for secure and robust HTTP requests
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Authorization: Bearer $apiKey"
]);

// Execute the cURL request
$response = curl_exec($ch);

// Check for cURL errors
if (curl_errno($ch)) {
    echo "<p style='color: red;'><strong>Error:</strong> " . htmlspecialchars(curl_error($ch)) . "</p>";
    curl_close($ch);
    exit;
}

// Close the cURL session
curl_close($ch);

// Decode the JSON response into an associative array
$data = json_decode($response, true);

// Check the API response status
if ($data && $data['status'] === 'success') {
    echo "<h1>User Data</h1>";
    echo "<table border='1' cellpadding='10' cellspacing='0'>";
    echo "<thead>";
    echo "<tr>";
    echo "<th>ID</th>";
    echo "<th>Name</th>";
    echo "<th>Email</th>";
    echo "<th>Age</th>";
    echo "</tr>";
    echo "</thead>";
    echo "<tbody>";

    // Loop through and display each user's data
    foreach ($data['data'] as $user) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($user['id']) . "</td>";
        echo "<td>" . htmlspecialchars($user['name']) . "</td>";
        echo "<td>" . htmlspecialchars($user['email']) . "</td>";
        echo "<td>" . htmlspecialchars($user['age']) . "</td>";
        echo "</tr>";
    }

    echo "</tbody>";
    echo "</table>";
} else {
    // Display an error message if the API response is not successful
    $errorMessage = isset($data['error']) ? htmlspecialchars($data['error']) : "Unknown error occurred.";
    echo "<p style='color: red;'><strong>Error:</strong> $errorMessage</p>";
}
?>