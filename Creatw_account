<?php
require 'db_connect.php';

$error = ""; // Initialize error variable

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fullname = $_POST['fullname'];
    $username = $_POST['username'];
    $email = $_POST['email'];

    // Check if passwords match
    if ($_POST['password'] !== $_POST['confpassword']) {
        $error = "كلمة المرور غير متطابقة";
    } else {
        $password =$_POST['password'];

        $sql = "INSERT INTO Users (FullName, Username, Password, Email) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssss", $fullname, $username, $password, $email);

        if ($stmt->execute()) {
            header('Location: index.php');
            exit;
        } else {
            $error = "حدث خطأ: " . $stmt->error;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>إنشاء حساب</title>
    <link rel="stylesheet" href="styles.css"> <!-- ربط ملف CSS -->
</head>
<body>
    <div class="create-account-container">
        <h1>سجل معنا و لا تحتار</h1>

        <?php if (!empty($error)) echo "<p style='color: red;'>$error</p>"; ?>

        <form method="POST" action="">
            <input type="text" name="fullname" placeholder="الاسم الكامل" >
            <input type="text" name="username" placeholder="اسم المستخدم" >
            <input type="email" name="email" placeholder="البريد الإلكتروني" >
            <input type="password" name="password" placeholder="كلمة المرور" required>
            <input type="password" name="confpassword" placeholder="أعد كتابة كلمة المرور" required>
            <input class="mybutton" type="submit" value="سجل">
        </form>

        <div class="login-link">لديك حساب؟ <a href="index.php">تسجيل دخول</a></div>
    </div>
	<script src="javascript.js" defer></script>  <!-- ربط ملف JavaScript -->
</body>
</html>
