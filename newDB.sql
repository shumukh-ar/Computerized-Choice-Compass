-- create the database
CREATE DATABASE mydb;
USE mydb;

-- CREATE TABLE Users (
UserID INT AUTO_INCREMENT PRIMARY KEY,
  FullName VARCHAR(100) NOT NULL,
  Username VARCHAR(50) UNIQUE NOT NULL,
  Password VARCHAR(100) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  RememberMe BOOLEAN DEFAULT FALSE
);

-- Table for surveys
CREATE TABLE Surveys(
  SurveyID INT AUTO_INCREMENT PRIMARY KEY,
  SurveyName VARCHAR (100) NOT NULL,
  Description TEXT,
  CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Question
CREATE TABLE Questions (
  QuestionsID INT AUTO_INCREMENT PRIMARY KEY,
  SurveyID INT NOT NULL,
  QuestionsText TEXT OT NULL,
  FOREIGN KEY (SurveyID) REFERENCES SurveyS(SurveyID) ON DELETE CASCADE
  );

-- Table for responses
CREATE TABLE Responses (
  ResponseID INT AUTO_INCREMENT PRIMARY KEY,
  UserID INT NOT NULL,
  QuestionID INT NOT NULL,
  ResponseValue ENUM('yes','medium','no') NOT NULL,
  ResponseTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
  FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) ON DELETE CASCADE
);

-- Table for messages
CREATE TABLE ContactMessages (
  MessageID INT AUTO_INCREMENT PRIMARY KEY,
  FullName VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Message TEXT NOT NULL,
  CreatedAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data into Users
INSERT INTO Users (FullName, Username, Password, Email, RememberMe) VALUES
('عبدالله الغامدي', 'abdullah', '12345', abdullah@example.com, TRUE),
('فاطمة الحربي', 'fatimah', '54321', fatimah@example.com, FALSE),
('محمد الشمري', 'mohammed', '11111', mohammed@example.com, TRUE);

-- Insert sample data into Surveys
INSERT INTO Surveys (SurveyName, Description) VALUES
('استبيان المهارات الأساسية', 'استبيان لجمع معلومات حول المهارات الأساسية'),
('استبيان المهارات الإدارية', 'أسئلة حول المهارات الإدارية للمستخدمين'),
('استبيان الاهتمامات المستقبلية', 'أسئلة تتعلق بالتقنيات والاهتمامات المستقبلية'),
('استبيان العمل اليومي', 'أسئلة تتعلق بالعمل اليومي والمهارات المطلوبة');

-- Insert sample data into Questions
INSERT INTO Questions (SurveyID, QuestionText) VALUES
(1, 'هل لديك فهم جيد لكيفية عمل الشبكات (Networks)؟'),
(1, 'هل يمكنك تقديم مثال عن مشروع تم تطويره باستخدام الشبكات؟'),
(1, 'هل تشارك في دورات تدريبية لتوسيع معرفتك في مجال التكنولوجيا؟'),
(2, 'هل تهتم بتقنيات إدارة البيانات في المؤسسات؟'),
(2, 'هل لديك اهتمام بجمع البيانات وتحليلها في مجالات مثل التجارة الإلكترونية؟'),
(2, 'هل تفضل استخدام البيانات لتحليلها وتقديم تقارير مفيدة؟'),
(3, 'هل تتابع التطورات في مجالات مثل الذكاء الاصطناعي وإنترنت الأشياء؟'),
(3, 'هل ترغب في تعلم تقنيات جديدة باستمرار في مجال علوم الحاسوب؟'),
(4, 'هل تستمتع بحل المشكلات التقنية المعقدة بشكل يومي؟'),
(4, 'هل تفضل العمل ضمن فرق في مشاريع كبيرة في مجال البرمجة؟');





