<?php
session_start();
header('Content-Type: application/json');

$request = json_decode(file_get_contents('php://input'), true);
$username = $request['username'];
$password = $request['password'];

// Simulated users with hardcoded credentials
$users = [
    'admin' => ['password' => 'admin', 'role' => 'administrador'],
    'prof' => ['password' => 'prof', 'role' => 'profesor'],
    'alumno' => ['password' => 'alumno', 'role' => 'alumno']
];

// Check if the user exists and password matches
if (isset($users[$username]) && $users[$username]['password'] === $password) {
    $_SESSION['user_id'] = $username;
    $_SESSION['role'] = $users[$username]['role'];
    echo json_encode(['success' => true, 'role' => $users[$username]['role']]);
} else {
    echo json_encode(['success' => false]);
}
?>
