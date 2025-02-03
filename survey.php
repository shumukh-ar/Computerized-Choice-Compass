<?php
session_start();
require 'db_connect.php';

// Check if the user is logged in
if (!isset($_SESSION['UserID'])) {
    header('Location: index.php');
    exit;
}

// Initialize the session responses and specialization counts if they don't exist
if (!isset($_SESSION['responses'])) {
    $_SESSION['responses'] = [];
}
if (!isset($_SESSION['specialization_counts'])) {
    $_SESSION['specialization_counts'] = [
        'software_engineering' => 0,
        'network_engineering' => 0,
        'artificial_intelligence' => 0,
        'information_systems' => 0,
    ];
}


// Fetch all surveys from the database
$sql = "SELECT * FROM Surveys";
$result = $conn->query($sql);
$surveys = $result->fetch_all(MYSQLI_ASSOC);


// Get the current survey ID from the URL (default to the first survey)
$surveyID = isset($_GET['surveyID']) ? (int)$_GET['surveyID'] : $surveys[0]['SurveyID'];

// Fetch questions for the current survey
$sql = "SELECT * FROM Questions WHERE SurveyID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $surveyID);
$stmt->execute();
$result = $stmt->get_result();
$questions = $result->fetch_all(MYSQLI_ASSOC);


// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userID = $_SESSION['UserID'];

    // Store responses in the session and update specialization counts
    foreach ($_POST as $key => $value) {
        if (strpos($key, 'question') === 0) {
            $questionID = str_replace('question', '', $key);
            $responseValue = $value;

            // Save the response in the session
            $_SESSION['responses'][$questionID] = $responseValue;

            // Update specialization counts based on the question ID
            if ($questionID >= 1 && $questionID <= 5) {
                // Questions related to هندسة البرمجيات (Software Engineering)
                if ($responseValue === 'yes') {
                    $_SESSION['specialization_counts']['software_engineering']++;
                }
            } elseif ($questionID >= 6 && $questionID <= 10) {
                // Questions related to هندسة الشبكات (Network Engineering)
                if ($responseValue === 'yes') {
                    $_SESSION['specialization_counts']['network_engineering']++;
                }
            } elseif ($questionID >= 11 && $questionID <= 15) {
                // Questions related to الذكاء الاصطناعي (Artificial Intelligence)
                if ($responseValue === 'yes') {
                    $_SESSION['specialization_counts']['artificial_intelligence']++;
                }
            } elseif ($questionID >= 16 && $questionID <= 20) {
                // Questions related to نظم المعلومات (Information Systems)
                if ($responseValue === 'yes') {
                    $_SESSION['specialization_counts']['information_systems']++;
                }
            }
        }
    }


    // Redirect to the next survey or a completion page
    $nextSurveyID = $surveyID + 1;
    if ($nextSurveyID <= count($surveys)) {
        header("Location: survey.php?surveyID=$nextSurveyID");
        exit;
    } else {
        // Insert all responses into the database
        foreach ($_SESSION['responses'] as $questionID => $responseValue) {
            $sql = "INSERT INTO Responses (UserID, QuestionID, ResponseValue) VALUES (?, ?, ?)
                    ON DUPLICATE KEY UPDATE ResponseValue = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iiss", $userID, $questionID, $responseValue, $responseValue);
            $stmt->execute();
        }

        // Redirect to the completion page
        header('Location: completion.php');
        exit;
    }
}
?>


<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>استبيان المهارات الأساسية</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="survey-container">
        <img src="Logo.png" alt="شعار الصفحة">
        <h2>Computerized Choice Compass</h2>

        <h1><?php echo htmlspecialchars($surveys[$surveyID - 1]['SurveyName']); ?></h1>
        <p><?php echo htmlspecialchars($surveys[$surveyID - 1]['Description']); ?></p>

        <form method="POST">
            <?php foreach ($questions as $question): ?>
                <p><?php echo htmlspecialchars($question['QuestionText']); ?></p>
                <div class="radio-group">
                    <label><input type="radio" name="question<?php echo $question['QuestionID']; ?>" value="yes" required> نعم</label>
                    <label><input type="radio" name="question<?php echo $question['QuestionID']; ?>" value="medium"> متوسط</label>
                    <label><input type="radio" name="question<?php echo $question['QuestionID']; ?>" value="no"> لا</label>
                </div>
            <?php endforeach; ?>

            <div class="navigation">
                <?php if ($surveyID > 1): ?>
                    <a href="survey.php?surveyID=<?php echo $surveyID - 1; ?>" style="width:350px;"><button type="button">السابق</button></a>
                <?php endif; ?>
                <button type="submit">التالي</button>
            </div>
        </form>
    </div>
</body>
</html>
