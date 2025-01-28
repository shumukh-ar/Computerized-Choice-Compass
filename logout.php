<?php
// Start the session
session_start();

// Destroy all session data
session_destroy();

// Redirect the user to the login page (index.php in this case)
header('Location: index.php');
exit;
?> 
