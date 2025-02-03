<?php
session_start();
if (!isset($_SESSION['UserID'])) {
    header('Location: index.php');
    exit;
}

require 'db_connect.php'; // Ensure this file contains your database connection setup

$UserID = $_SESSION['UserID'];

// Delete user responses from the database
$stmt = $conn->prepare("DELETE FROM Responses WHERE UserID = ?");
$stmt->bind_param("i", $UserID);
$stmt->execute();
$stmt->close();

// Redirect back to welcome page
header('Location: welcome.php');
exit;
?>
