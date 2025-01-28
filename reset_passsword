<?php
require 'db_connect.php';

$message = ""; // Success message
$error = "";   // Error message

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $new_password = $_POST['new_password']; // Save password as plain text

    // Update the password in the database
    $sql = "UPDATE Users SET Password = ? WHERE Email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $new_password, $email);

    if ($stmt->execute() && $stmt->affected_rows > 0) {
        $message = "تمت إعادة تعيين كلمة المرور بنجاح!";
    } else {
        $error = "فشل في إعادة تعيين كلمة المرور. تأكد من صحة البريد الإلكتروني.";
    }
}
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>نسيت كلمة المرور</title>
    <link rel="stylesheet" href="styles.css"> <!-- ربط ملف CSS -->
</head>
<body>
    <div class="reset-container">
        <h1>نسيت كلمة المرور</h1>
        <?php 
        if (!empty($message)) echo "<p style='color: green;'>$message</p>"; 
        if (!empty($error)) echo "<p style='color: red;'>$error</p>"; 
        ?>
        <form method="post">
            <input type="email" name="email" placeholder="البريد الإلكتروني" required>
            <input type="password" name="new_password" placeholder="كلمة المرور الجديدة" required>
            <button type="submit">إرسال</button>
        </form>
        <div class="login-link">لا يوجد لديك حساب؟ <a href="create_account.php">سجل الآن</a></div>
    </div>
</body>
</html>
