-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edutracktest
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment` (
  `AssessmentID` int NOT NULL AUTO_INCREMENT,
  `SubjectID` int NOT NULL,
  `AssessmentName` varchar(100) NOT NULL,
  `MaxScore` decimal(5,2) NOT NULL,
  `ScoreObtained` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`AssessmentID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (1,1,'Individual Assignment',20.00,15.00),(2,1,'Group Project',30.00,20.00),(4,2,'Individual Assignment',20.00,18.00),(7,3,'Individual Assignment',20.00,17.00),(8,3,'Group Project',30.00,NULL),(9,3,'Final Paper',50.00,NULL),(10,4,'Individual Assignment',20.00,18.00),(11,4,'Group Project',30.00,NULL),(12,4,'Final Paper',50.00,NULL),(13,5,'Individual Assignment ',20.00,15.00),(20,1,'Final Paper',50.00,40.00),(27,8,'Individual Assignment',20.00,15.00),(28,8,'Test 1',30.00,NULL),(29,9,'Individual Assignment',20.00,12.00),(30,9,'Group Project',30.00,17.00),(31,9,'Final Paper',50.00,28.00),(35,13,'Individual Assignment',20.00,NULL),(37,15,'Individual Assignment',20.00,NULL),(38,15,'Test 1',30.00,NULL),(42,17,'Individual Assignment',20.00,12.00),(43,18,'Individual Assignment',20.00,13.00),(44,19,'Individual Assignment',20.00,13.00),(45,19,'Test 1',30.00,NULL),(46,20,'Individual Assignment',20.00,NULL),(47,20,'Group Project',30.00,NULL),(48,20,'Final Paper',50.00,NULL),(49,21,'Individual Assignment',20.00,NULL),(50,22,'Individual Assignment',20.00,NULL),(51,23,'Individual Assignment',20.00,NULL),(52,23,'Test 1',30.00,NULL),(53,24,'Individual Assignment',20.00,NULL),(54,24,'Group Project',30.00,NULL),(55,24,'Final Paper',50.00,NULL),(56,25,'Individual Assignment',20.00,NULL),(57,26,'Individual Assignment',20.00,NULL),(58,27,'Individual Assignment',20.00,NULL),(59,27,'Test 1',30.00,NULL),(60,28,'Individual Assignment',20.00,NULL),(61,28,'Group Project',30.00,NULL),(62,28,'Final Paper',50.00,NULL),(63,29,'Individual Assignment',20.00,NULL),(64,30,'Individual Assignment',20.00,NULL),(65,31,'Individual Assignment',20.00,NULL),(66,31,'Test 1',30.00,NULL);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `LectID` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`LectID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (9001,'DrAzman','azman@uitm.edu.my','123'),(9002,'DrSiti','siti@uitm.edu.my','123');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prediction`
--

DROP TABLE IF EXISTS `prediction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prediction` (
  `PredID` int NOT NULL AUTO_INCREMENT,
  `PredictionText` text,
  `StudID` int NOT NULL,
  `RiskLevel` enum('Low','Medium','High') DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PredID`),
  KEY `StudID` (`StudID`),
  CONSTRAINT `prediction_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `student` (`StudID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prediction`
--

LOCK TABLES `prediction` WRITE;
/*!40000 ALTER TABLE `prediction` DISABLE KEYS */;
INSERT INTO `prediction` VALUES (1,'<ul class=\'space-y-2\'>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">Overall Performance</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">The student demonstrates solid academic performance with consistent passing grades and excellent attendance, notably excelling in Software Engineering.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">Future Performance Trend</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">They are likely to maintain strong academic standing, particularly in courses aligning with their interests in software development and AI, consistently applying their strong problem-solving skills.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">Potential Career Path: Software Engineer</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">This path directly aligns with their strong performance in Software Engineering (90%) and proficiency in Python and Java programming.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">Potential Career Path: AI/Machine Learning Engineer</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">Their Python skills, strong problem-solving ability, and explicit interest in AI make them well-suited for roles in artificial intelligence development.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">Potential Career Path: Game Developer</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">Combining strong programming fundamentals (Python, Java) with a clear interest in gaming suggests a promising future in interactive entertainment development.</div>\n    </li>\n</ul>',2025839201,'Low','2026-01-14 11:25:37'),(2,'<ul class=\'space-y-2\'>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">1. Performance Trend</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">The student shows solid understanding in core CS subjects (75%) and excels in Software Engineering (90%), supported by excellent attendance.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">2. Future Outlook</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">They are predicted to maintain good academic standing and thrive in projects that combine their technical skills with creative expression.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">3. UI/UX Designer/Developer</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">This path effectively combines their programming skills with strong creative interests in graphic design, digital art, and storytelling.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">4. Interactive Media / Game Developer</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">Their interests in film-making, digital art, and skills like video editing strongly align with the technical and artistic demands of game or interactive experience development.</div>\n    </li>\n    <li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\">\n        <div class=\"font-bold text-slate-800 text-sm\">5. Creative Technologist</div>\n        <div class=\"text-xs text-slate-600 mt-1 leading-snug\">This role ideally blends their technical foundation in software and programming with their artistic skills to innovate digital experiences.</div>\n    </li>\n</ul>',2025839201,'Low','2026-01-14 12:18:07'),(3,'<ul class=\'space-y-2\'><li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\"><div class=\"font-bold text-slate-800 text-sm\">1. Future Performance Trends</div><div class=\"text-xs text-slate-600 mt-1 leading-snug\">The student is predicted to maintain strong academic performance, particularly excelling in advanced courses related to Artificial Intelligence and Robotics.</div></li><li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\"><div class=\"font-bold text-slate-800 text-sm\">2. AI/Machine Learning Engineer</div><div class=\"text-xs text-slate-600 mt-1 leading-snug\">Strong Python skills and a keen interest in AI position them well for roles developing intelligent systems.</div></li><li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\"><div class=\"font-bold text-slate-800 text-sm\">3. Robotics Engineer</div><div class=\"text-xs text-slate-600 mt-1 leading-snug\">Their proficiency in Python and Java, combined with an explicit interest in robotics, aligns perfectly with roles in robotic system design.</div></li><li class=\"p-3 bg-blue-50 rounded-md border border-blue-100\"><div class=\"font-bold text-slate-800 text-sm\">4. Software Engineer (Startup-focused)</div><div class=\"text-xs text-slate-600 mt-1 leading-snug\">Excellent software engineering grades and an interest in startup culture indicate a strong fit for agile development roles in innovative companies.</div></li></ul>',2025839201,'Low','2026-01-14 12:19:18'),(4,'<ul class=\'space-y-2\'><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>1. Future Performance Trend</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>The student is likely to maintain a consistent B to A- average due to strong foundational skills, high engagement, and clear interests.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>2. AI/Machine Learning Engineer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Their interest in Artificial Intelligence, strong Python skills, and problem-solving abilities align perfectly with this role.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>3. Robotics Engineer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Combining their interest in Robotics with practical skills in Python and Java, this career path is a natural fit.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>4. Software Engineer (Specializing in AI/Robotics)</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Their strong performance in Software Engineering and core programming suggests they will excel in specialized development roles within their interest areas.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>5. Tech Startup Founder/Engineer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>With an interest in startup culture and solid technical skills, they are well-positioned to contribute to or lead innovative ventures.</div></li></ul>',2025839201,'Low','2026-01-14 13:41:05'),(5,'<ul class=\'space-y-2\'><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>1. UI/UX Designer/Developer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Strong academic performance in software engineering and interactive programming perfectly complements a passion for graphic design and digital art.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>2. Game Developer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Combines robust programming skills with interests in storytelling, digital art, and film making, ideal for interactive entertainment.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>3. Multimedia Developer/Engineer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Leverages video editing, digital art skills, and software development knowledge to create compelling interactive digital experiences.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>4. Frontend Web Developer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Applies strong programming and software engineering foundations to build visually engaging and user-friendly web interfaces, aligning with design interests.</div></li></ul>',2025839201,'Low','2026-01-14 13:42:39'),(6,'<ul class=\'space-y-2\'><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>1. Future Performance Trends</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>The student is likely to maintain good academic performance, especially excelling in practical and project-based courses related to their interests in AI and Robotics. They demonstrate strong commitment through consistent high attendance.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>2. AI/Machine Learning Engineer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Strong interest in Artificial Intelligence, proficiency in Python, and data analysis skills make this a highly suitable and promising career path.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>3. Robotics Software Developer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Their interest in Robotics, coupled with Python skills and a solid Software Engineering foundation, positions them well for this specialized field.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>4. Full-Stack Developer (Startup Focus)</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Skills in Python and JavaScript, combined with an excellent Software Engineering grade and interest in startup culture, are ideal for a dynamic development role.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>5. Data Scientist/Analyst</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Proficiency in data analysis and Python, along with foundational data structures knowledge, provides a strong basis for a career in data interpretation.</div></li></ul>',2025839201,'Low','2026-01-15 01:32:54'),(7,'<ul class=\'space-y-2\'><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>Performance Trend</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>The student is likely to maintain a consistent academic performance, leveraging high attendance and dedicated effort to successfully pass all courses.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>Strengths and Aptitudes</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>A clear aptitude for Software Engineering is evident, and strong creative skills combined with academic foundation position them well for interdisciplinary roles.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>Area for Development</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>While performing adequately, core programming subjects indicate room for deeper mastery to achieve higher grades.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>1. UI/UX Designer/Developer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Combines graphic design, interactive programming, and software engineering principles to create user-centric digital experiences.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>2. Game Developer (Art/Design Focus)</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Leverages programming skills, storytelling, digital art, and video editing to contribute to interactive game development.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>3. Multimedia Specialist</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Utilizes video editing, graphic design, and programming to produce diverse digital content and interactive media solutions.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>4. Front-End Web Developer</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Focuses on building visually appealing and interactive user interfaces for websites and web applications using programming and design.</div></li><li class=\'p-3 bg-blue-50 rounded-md border border-blue-100\'><div class=\'font-bold text-slate-800 text-sm\'>5. Technical Artist</div><div class=\'text-xs text-slate-600 mt-1 leading-snug\'>Bridges artistic vision with technical implementation, often in fields like animation, film VFX, or game development.</div></li></ul>',2025839201,'Low','2026-01-15 01:34:30');
/*!40000 ALTER TABLE `prediction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudID` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ClassID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StudID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2025112233,'Harith','2025112233@student.uitm.edu.my','123','CDCS2534A'),(2025192834,'Mei Ling','2025192834@student.uitm.edu.my','123','CDCS2534B'),(2025647382,'Daniel','2025647382@student.uitm.edu.my','123','CDCS2534A'),(2025746352,'Muthu','2025746352@student.uitm.edu.my','123','CDCS2534A'),(2025839201,'Aiman','2025839201@student.uitm.edu.my','123','CDCS2534A'),(2025918273,'Siti','2025918273@student.uitm.edu.my','123','CDCS2534B');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentdata`
--

DROP TABLE IF EXISTS `studentdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentdata` (
  `DataID` int NOT NULL AUTO_INCREMENT,
  `Skills` text,
  `Interest` text,
  `StudID` int NOT NULL,
  `Cocuriculum` varchar(255) DEFAULT NULL,
  `Behaviour` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DataID`),
  UNIQUE KEY `StudID` (`StudID`),
  CONSTRAINT `studentdata_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `student` (`StudID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdata`
--

LOCK TABLES `studentdata` WRITE;
/*!40000 ALTER TABLE `studentdata` DISABLE KEYS */;
INSERT INTO `studentdata` VALUES (1,'Adobe Photoshop, Video Editing, Storytelling','Film making, Graphic Design, Digital Art',2025839201,'Robotics Club','Excellent'),(2,'Microsoft Office, Public Speaking, Event Planning','Reading, Talking, Writing',2025192834,'None','Good'),(3,'Knife Skills, Food Safety, Menu Planning','Culinary Arts, Baking, Fine Dining',2025746352,NULL,NULL),(4,'Graphic Design, Adobe Photoshop, Video Editing','Digital Media, Advertising, Content Creation',2025918273,NULL,NULL),(5,'Data Analysis, SQL, Statistics','Data Science, Market Research, Finance',2025647382,NULL,NULL),(6,'C++, Linux, Networking, Cybersecurity','Ethical Hacking, Cloud Computing, System Admin',2025112233,NULL,NULL);
/*!40000 ALTER TABLE `studentdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectID` int NOT NULL AUTO_INCREMENT,
  `StudID` int NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `CalculatedScore` decimal(5,2) DEFAULT '0.00',
  `Attendance` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`subjectID`),
  UNIQUE KEY `StudID` (`StudID`,`SubjectName`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `student` (`StudID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,2025839201,'CSC508 - Data Structure',75.00,90.00),(2,2025839201,'CSC577 - Software Engineering',90.00,100.00),(3,2025112233,'CSC508 - Data Structure',85.00,85.00),(4,2025112233,'CSC577 - Software Engineering',90.00,90.00),(5,2025839201,'CSC541 - Programming Interactive',75.00,90.00),(8,2025839201,'CSC584 - Enterprise Programming',75.00,90.00),(9,2025192834,'CSC508 - Data Structure',57.00,80.00),(13,2025112233,'CSC541 - Programming Interactive',0.00,0.00),(15,2025112233,'CSC584 - Enterprise Programming',0.00,0.00),(17,2025192834,'CSC541 - Programming Interactive',60.00,85.00),(18,2025192834,'CSC577 - Software Engineering',65.00,70.00),(19,2025192834,'CSC584 - Enterprise Programming',65.00,90.00),(20,2025647382,'CSC508 - Data Structure',0.00,0.00),(21,2025647382,'CSC541 - Programming Interactive',0.00,0.00),(22,2025647382,'CSC577 - Software Engineering',0.00,0.00),(23,2025647382,'CSC584 - Enterprise Programming',0.00,0.00),(24,2025746352,'CSC508 - Data Structure',0.00,0.00),(25,2025746352,'CSC541 - Programming Interactive',0.00,0.00),(26,2025746352,'CSC577 - Software Engineering',0.00,0.00),(27,2025746352,'CSC584 - Enterprise Programming',0.00,0.00),(28,2025918273,'CSC508 - Data Structure',0.00,0.00),(29,2025918273,'CSC541 - Programming Interactive',0.00,0.00),(30,2025918273,'CSC577 - Software Engineering',0.00,0.00),(31,2025918273,'CSC584 - Enterprise Programming',0.00,0.00);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-15 11:37:44
