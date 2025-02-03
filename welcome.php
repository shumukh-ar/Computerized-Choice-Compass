<?php
session_start();
if (!isset($_SESSION['UserID'])) {
    header('Location: index.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>صفحة ترحيب</title>
    <link href="https://fonts.googleapis.com/css2?family=Amiri&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="welcome-container">
        <h2>مرحبًا، <?php echo htmlspecialchars($_SESSION['FullName']); ?>!</h2>
        <h1>! اهلا بك</h1>
        <p>ابدأ رحلتك معنا في تحديد تخصصك المناسب بناءً على مهاراتك واهتماماتك.</p>
        <a href="survey.php"><button>ابدأ الآن</button></a>
		</br>


        <p><a href="logout.php">تسجيل الخروج</a></p>
    </div>
</body>
</html>
