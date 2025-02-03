<?php
session_start();
require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get input values
    $username = $_POST['username'];
    $password = $_POST['password'];

// Prepare SQL query to fetch user data
    $sql = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
    $stmt = $conn->prepare($sql);

 if ($stmt) {
        // Bind parameters and execute the query
        $stmt->bind_param("ss", $username, $password);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        // Check if user exists
        if ($user) {
            // Set session variables
            $_SESSION['UserID'] = $user['UserID'];
            $_SESSION['FullName'] = $user['FullName'];

            // Redirect to welcome page
            header('Location: welcome.php');
            exit;
        } else {
            $error = "اسم المستخدم أو كلمة المرور غير صحيحة.";
        }

        $stmt->close();
    } else {
        $error = "حدث خطأ أثناء معالجة طلبك. يرجى المحاولة مرة أخرى.";
    }
}
?>

<!DOCTYPE html>
<html lang="ar">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>تسجيل الدخول</title>
    <link rel="stylesheet" href="styles.css"> <!--  css -->
</head>

  <body>
        <div class="login-container">
        <!-- Add the logo here -->
        <div class="logo-container">
            <img src="logo.png" alt="شعار الموقع" class="logo">
 </div>
		 <?php if (!empty($error)) echo "<p style='color: red;'>$error</p>"; ?>
        <h1>محتار إيش تختار؟</h1>
        <form method="POST" action="">
            <input type="text" placeholder="اسم المستخدم" name="username" >
            <input type="password" placeholder="كلمة المرور" name="password" >
            <div class="forgot-password">
                <a href="reset_password.php">نسيت كلمة المرور</a>
            </div>
            <div class="remember-me">
                <input type="checkbox" id="remember">
                <label for="remember">تذكّرني</label>
            </div>
            <center><input class="mybutton" type="submit" value="تسجيل الدخول"></center>
            </br>
            <div class="register-link">لا يوجد لديك حساب؟ <a href="create_account.php" style="color: #666;">سجل الآن</a></div>
			
        </form>
    </div>
	<script src="javascript.js" defer></script>  <!--  JavaScript -->
</body>
</html>
