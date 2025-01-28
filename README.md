# API Management System

This repository contains a basic API management system that enables user data retrieval through an API with authentication and logging mechanisms. It is designed with PHP and MySQL, focusing on API key validation, logging API requests, and fetching user data from a database.

## Features

- **API Key Authentication**: Secure access to APIs using unique keys.
- **Request Logging**: Logs all API requests for monitoring and debugging.
- **User Data Retrieval**: Fetches and displays user data from the database in a structured format.
- **JSON-based Responses**: All responses are returned in JSON format for easy integration.

## File Overview

### 1. `file_get_contents.php`
- Client-side script to fetch data from the API.
- Uses cURL to send requests with the required API key.
- Displays the fetched data in an HTML table.
- Handles errors such as invalid API keys or server issues.

### 2. `apifont.php`
- Backend API script with:
  - Database connection for user data retrieval.
  - API key validation using a database (`api_keys` table).
  - Request logging in the `api_logs` table.
- Returns user data or error messages in JSON format.

### 3. `api.php`
- An alternative API implementation:
  - Validates API keys from a predefined array.
  - Fetches user data from the `users` table in the `my_database` database.
  - Provides JSON responses with user information.

### 4. `my_database.sql`
- SQL dump file for the `my_database` database.
- Contains a `users` table for storing user data.
- Example data:
  - **User 1**: `Lalatendu Swain`, `lalatendu@example.com`, `29`
  - **User 2**: `Swain`, `swain@example.com`, `31`

### 5. `api_management.sql`
- SQL dump file for the `api_management` database.
- Contains:
  - `api_keys` table: Stores API keys with descriptions.
  - `api_logs` table: Logs API requests, including the accessed endpoint and timestamp.

## Prerequisites

- PHP 8.0 or higher
- MySQL 5.7 or higher
- Web server (e.g., Apache, Nginx)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Lalatenduswain/API-Example
   cd API-Example
   ```

2. Import the databases:
   ```bash
   mysql -u root -p < my_database.sql
   mysql -u root -p < api_management.sql
   ```

3. Configure the database connection in `apifont.php` and `api.php`:
   - Update the `$servername`, `$username`, `$password`, and `$dbname` variables.

4. Run the project on your local web server.

## Usage

### Fetch User Data
1. Access `file_get_contents.php` in your browser.
2. Ensure the correct API key is set in the script.

### API Endpoints
1. **`apifont.php`**:
   - Validates API keys from the `api_management` database.
   - Example: `http://localhost/apifont.php?api_key=your_api_key`

2. **`api.php`**:
   - Validates API keys from a hardcoded list.
   - Example: `http://localhost/api.php?api_key=your_api_key`

### Logs
- View API usage logs in the `api_logs` table of the `api_management` database.

## License

This project is licensed under the MIT License. See `LICENSE` for details.
