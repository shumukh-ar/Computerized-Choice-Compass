-- Create the database
CREATE DATABASE mydb;
USE mydb;

-- Table for users
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL, 
    Email VARCHAR(100) UNIQUE NOT NULL,
    RememberMe BOOLEAN DEFAULT FALSE
);

-- Table for surveys
CREATE TABLE Surveys (
    SurveyID INT AUTO_INCREMENT PRIMARY KEY,
    SurveyName VARCHAR(100) NOT NULL,
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for questions
CREATE TABLE Questions (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    SurveyID INT NOT NULL,
    QuestionText TEXT NOT NULL,
    FOREIGN KEY (SurveyID) REFERENCES Surveys(SurveyID) ON DELETE CASCADE
);

-- Table for responses
CREATE TABLE Responses (
    ResponseID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    QuestionID INT NOT NULL,
    ResponseValue ENUM('yes', 'medium', 'no') NOT NULL,
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
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data into Users
INSERT INTO Users (FullName, Username, Password, Email, RememberMe) VALUES
('عبدالله الغامدي', 'abdullah', '12345', 'abdullah@example.com', TRUE),
('فاطمة الحربي', 'fatimah', '54321', 'fatimah@example.com', FALSE),
('محمد الشمري', 'mohammed', '11111', 'mohammed@example.com', TRUE);

-- Insert sample data into Surveys
INSERT INTO Surveys (SurveyName, Description) VALUES
('استبيان المهارات الأساسية', 'استبيان لجمع معلومات حول المهارات الأساسية'),
('استبيان المهارات الإدارية', 'أسئلة حول المهارات الإدارية للمستخدمين'),
('استبيان الاهتمامات المستقبلية', 'أسئلة تتعلق بالتقنيات والاهتمامات المستقبلية'),
('استبيان العمل اليومي', 'أسئلة تتعلق بالعمل اليومي والمهارات المطلوبة');

-- Insert sample data into Questions
-- Insert sample data into Questions
INSERT INTO Questions (SurveyID, QuestionText) VALUES
-- هندسة البرمجيات (Software Engineering)
(1, 'هل لديك خبرة في كتابة الأكواد البرمجية باستخدام لغات مثل Python أو Java؟'),
(1, 'هل تستمتع بتصميم وتطوير البرمجيات لحل المشكلات اليومية؟'),
(1, 'هل تهتم بتحسين أداء البرمجيات وتصحيح الأخطاء البرمجية؟'),
(1, 'هل ترغب في العمل على تطوير تطبيقات الويب أو الهاتف المحمول؟'),
(1, 'هل لديك معرفة بمفاهيم هندسة البرمجيات مثل أنماط التصميم (Design Patterns)؟'),

-- هندسة الشبكات (Network Engineering)
(2, 'هل لديك فهم جيد لكيفية عمل الشبكات (Networks)؟'),
(2, 'هل يمكنك إعداد وإدارة أجهزة الشبكات مثل الراوترات والسويتشات؟'),
(2, 'هل تهتم بتأمين الشبكات وحمايتها من الهجمات الإلكترونية؟'),
(2, 'هل لديك معرفة ببروتوكولات الشبكات مثل TCP/IP وDNS؟'),
(2, 'هل ترغب في العمل على تحسين أداء الشبكات وضمان استقرارها؟'),

-- الذكاء الاصطناعي (Artificial Intelligence)
(3, 'هل لديك اهتمام بتطوير أنظمة ذكية يمكنها التعلم من البيانات؟'),
(3, 'هل تعرف كيفية استخدام خوارزميات التعلم الآلي (Machine Learning)؟'),
(3, 'هل تهتم بتحليل البيانات الضخمة واستخراج الأنماط منها؟'),
(3, 'هل ترغب في العمل على تطوير أنظمة الذكاء الاصطناعي مثل الروبوتات أو السيارات ذاتية القيادة؟'),
(3, 'هل لديك معرفة بمفاهيم الذكاء الاصطناعي مثل الشبكات العصبية (Neural Networks)؟'),

-- نظم المعلومات (Information Systems)
(4, 'هل تهتم بإدارة وتنظيم البيانات في المؤسسات؟'),
(4, 'هل لديك معرفة بأنظمة قواعد البيانات مثل MySQL أو Oracle؟'),
(4, 'هل ترغب في العمل على تحليل البيانات لاتخاذ قرارات إدارية؟'),
(4, 'هل تهتم بتأمين البيانات وحمايتها من الاختراقات؟'),
(4, 'هل لديك معرفة بأنظمة إدارة المشاريع مثل Agile أو Scrum؟');





