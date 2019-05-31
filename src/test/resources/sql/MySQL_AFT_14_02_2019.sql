CREATE DATABASE  IF NOT EXISTS `aft` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aft`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: aft
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `complib_block`
--

DROP TABLE IF EXISTS `complib_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complib_block` (
  `blockID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) DEFAULT NULL,
  `blockName` varchar(155) DEFAULT NULL,
  `blockDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blockID`),
  KEY `fk_pageid_complibpage_idx` (`pageID`),
  CONSTRAINT `fk_pageid_complibpage` FOREIGN KEY (`pageID`) REFERENCES `object_repository` (`pageID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complib_block`
--

LOCK TABLES `complib_block` WRITE;
/*!40000 ALTER TABLE `complib_block` DISABLE KEYS */;
INSERT INTO `complib_block` VALUES (3,NULL,'Open Login Page','Opens the login page'),(4,NULL,'Enter Credentials and Submit','Fill Login Details');
/*!40000 ALTER TABLE `complib_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complib_blockcontent`
--

DROP TABLE IF EXISTS `complib_blockcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complib_blockcontent` (
  `blockcontentID` int(11) NOT NULL AUTO_INCREMENT,
  `blockID` int(11) DEFAULT NULL,
  `objectID` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `seqNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`blockcontentID`),
  KEY `fk_blockID_complibblock` (`blockID`),
  CONSTRAINT `fk_blockID_complibblock` FOREIGN KEY (`blockID`) REFERENCES `complib_block` (`blockID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complib_blockcontent`
--

LOCK TABLES `complib_blockcontent` WRITE;
/*!40000 ALTER TABLE `complib_blockcontent` DISABLE KEYS */;
INSERT INTO `complib_blockcontent` VALUES (1,3,NULL,1,1),(2,4,19,2,1),(3,4,NULL,5,2),(4,4,20,2,3),(5,4,NULL,5,4),(6,4,38,3,5);
/*!40000 ALTER TABLE `complib_blockcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complib_blockdata`
--

DROP TABLE IF EXISTS `complib_blockdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complib_blockdata` (
  `blockdataID` int(11) NOT NULL AUTO_INCREMENT,
  `blockcontentID` int(11) DEFAULT NULL,
  `eventParamID` int(11) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `formula` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`blockdataID`),
  KEY `fk_contID_complibblkcont` (`blockcontentID`),
  CONSTRAINT `fk_contID_complibblkcont` FOREIGN KEY (`blockcontentID`) REFERENCES `complib_blockcontent` (`blockcontentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complib_blockdata`
--

LOCK TABLES `complib_blockdata` WRITE;
/*!40000 ALTER TABLE `complib_blockdata` DISABLE KEYS */;
INSERT INTO `complib_blockdata` VALUES (1,1,NULL,'http://184.68.122.34:9081/maximo/webclient/login/login.jsp',NULL),(2,2,NULL,'sathik',NULL),(3,3,NULL,'500',NULL),(4,4,NULL,'password',NULL),(5,5,NULL,'500',NULL);
/*!40000 ALTER TABLE `complib_blockdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complib_blockparameter`
--

DROP TABLE IF EXISTS `complib_blockparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complib_blockparameter` (
  `BP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BD_ID` int(11) DEFAULT NULL,
  `BC_ID` int(11) DEFAULT NULL,
  `BLOCK_ID` int(11) DEFAULT NULL,
  `BLOCK_PRM_NAME` varchar(45) DEFAULT NULL,
  `BLOCK_PRM_DESC` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`BP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complib_blockparameter`
--

LOCK TABLES `complib_blockparameter` WRITE;
/*!40000 ALTER TABLE `complib_blockparameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `complib_blockparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complib_blockparamvalue`
--

DROP TABLE IF EXISTS `complib_blockparamvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complib_blockparamvalue` (
  `BLOCK_PRM_VAL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITERATION` int(11) NOT NULL,
  `OCCURANCE` int(11) NOT NULL,
  `TESTCASE_ID` varchar(45) NOT NULL,
  `BLOCK_PRM_ID` varchar(45) NOT NULL,
  `BLOCK_PRM_VALUE` text,
  PRIMARY KEY (`BLOCK_PRM_VAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complib_blockparamvalue`
--

LOCK TABLES `complib_blockparamvalue` WRITE;
/*!40000 ALTER TABLE `complib_blockparamvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `complib_blockparamvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complib_page`
--

DROP TABLE IF EXISTS `complib_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complib_page` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(45) NOT NULL,
  `pageDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complib_page`
--

LOCK TABLES `complib_page` WRITE;
/*!40000 ALTER TABLE `complib_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `complib_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complib_result_blockcontent`
--

DROP TABLE IF EXISTS `complib_result_blockcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complib_result_blockcontent` (
  `blockcontentRunID` int(64) NOT NULL AUTO_INCREMENT,
  `blockRunID` int(32) DEFAULT NULL,
  `blockContentID` int(32) DEFAULT NULL,
  `blockContentStatus` varchar(45) DEFAULT NULL,
  `tccRunID` int(32) DEFAULT NULL,
  `iteration` int(11) DEFAULT NULL,
  `Occurrance` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `ObjectID` int(11) DEFAULT NULL,
  `Param1` text,
  `Param2` text,
  `Param3` text,
  `Param4` text,
  `Param5` text,
  `Param6` text,
  `actualResult` varchar(1000) DEFAULT NULL,
  `ExpectedResult` varchar(1000) DEFAULT NULL,
  `TimeStamp` varchar(45) DEFAULT NULL,
  `linkPath` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`blockcontentRunID`),
  KEY `tccRunID_idx` (`tccRunID`),
  CONSTRAINT `fk_tccRunID` FOREIGN KEY (`tccRunID`) REFERENCES `testcasecontentrun` (`tccRunID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complib_result_blockcontent`
--

LOCK TABLES `complib_result_blockcontent` WRITE;
/*!40000 ALTER TABLE `complib_result_blockcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `complib_result_blockcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentdetail`
--

DROP TABLE IF EXISTS `componentdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentdetail` (
  `componentDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `componentID` int(11) NOT NULL,
  `objectID` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `componentData` varchar(200) DEFAULT '',
  `additionalData` varchar(250) DEFAULT '',
  `scrshot` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`componentDetailID`),
  KEY `FK_ComponentDetail_OR_idx` (`objectID`),
  KEY `FK_Component_Event_idx` (`eventID`),
  CONSTRAINT `FK_ComponentDetail_OR` FOREIGN KEY (`objectID`) REFERENCES `object_master` (`objectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Component_Event` FOREIGN KEY (`eventID`) REFERENCES `event_master` (`eventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentdetail`
--

LOCK TABLES `componentdetail` WRITE;
/*!40000 ALTER TABLE `componentdetail` DISABLE KEYS */;
INSERT INTO `componentdetail` VALUES (296,14,NULL,236,1,'http://www.google.com','',1),(297,14,NULL,561,2,'2','',1),(298,14,NULL,561,3,'2','',1),(299,14,NULL,561,4,'2','',1),(438,12,NULL,236,1,'http://www.google.com','',1),(439,12,NULL,561,2,'2','',0),(440,12,160,393,3,'asp .net book','',1),(441,12,NULL,561,4,'2','',0),(442,12,161,38,5,'','',1),(443,12,NULL,561,6,'2','',0),(444,12,160,417,7,'asp','',1),(445,12,NULL,561,8,'5','',1),(465,18,NULL,38,1,'','',0),(473,20,NULL,236,1,'http://www.google.com','',0),(474,20,NULL,561,2,'2','',0),(475,20,217,393,3,'latest book','',0),(476,20,216,38,4,'','',0);
/*!40000 ALTER TABLE `componentdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentmaster`
--

DROP TABLE IF EXISTS `componentmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentmaster` (
  `componentID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) DEFAULT NULL,
  `componentName` varchar(100) DEFAULT '',
  `componentDescription` varchar(100) DEFAULT '',
  `projectID` int(32) NOT NULL,
  PRIMARY KEY (`componentID`),
  KEY `fk_componentmaster_project_master_idx` (`projectID`),
  CONSTRAINT `fk_componentmaster_project_master` FOREIGN KEY (`projectID`) REFERENCES `project_master` (`projectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentmaster`
--

LOCK TABLES `componentmaster` WRITE;
/*!40000 ALTER TABLE `componentmaster` DISABLE KEYS */;
INSERT INTO `componentmaster` VALUES (12,0,'12 Jan 2019 Template','Temp',23),(14,0,'123','test',23),(18,0,'test','test',25),(20,0,'12 Jan 2019 Template','Template',26);
/*!40000 ALTER TABLE `componentmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configrunmaster`
--

DROP TABLE IF EXISTS `configrunmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configrunmaster` (
  `configDataID` bigint(20) NOT NULL AUTO_INCREMENT,
  `exeRunID` int(64) DEFAULT NULL,
  `pptID` varchar(45) DEFAULT NULL,
  `entity` varchar(45) DEFAULT NULL,
  `entityfieldValue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`configDataID`),
  KEY `fk_conrm_exeRunMaster_idx` (`exeRunID`),
  CONSTRAINT `fk_conrm_exeRunMaster` FOREIGN KEY (`exeRunID`) REFERENCES `runmaster` (`executionRunID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configrunmaster`
--

LOCK TABLES `configrunmaster` WRITE;
/*!40000 ALTER TABLE `configrunmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `configrunmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_master`
--

DROP TABLE IF EXISTS `event_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_master` (
  `eventID` int(32) NOT NULL AUTO_INCREMENT,
  `eventName` varchar(45) DEFAULT NULL,
  `freeText` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eventID`),
  UNIQUE KEY `eventName_UNIQUE` (`eventName`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_master`
--

LOCK TABLES `event_master` WRITE;
/*!40000 ALTER TABLE `event_master` DISABLE KEYS */;
INSERT INTO `event_master` VALUES (1,'Activate','Activate'),(2,'ActivateSWFTableCell','ActivateSWFTableCell'),(3,'ActivateTableCellValue','ActivateTableCellValue'),(4,'ActivateTBATableCell','ActivateTBATableCell'),(5,'ActivateUltraTab','ActivateUltraTab'),(6,'AddDate','AddDate'),(7,'AddTask','AddTask'),(8,'ArithCalculate','ArithCalculate'),(9,'Begin_InnerLoop','Begin_InnerLoop'),(10,'Begin_Loop','Begin_Loop'),(11,'Block_Begin','Block_Begin'),(12,'Block_End','Block_End'),(13,'BTCHLCCD','BTCHLCCD'),(14,'C3PI_SubmitJob','C3PI_SubmitJob'),(15,'CalCulateRETMOBYouwillhaveAmt','CalCulateRETMOBYouwillhaveAmt'),(16,'CalCulateRETMOBYouWillNeedAmt','CalCulateRETMOBYouWillNeedAmt'),(17,'Call','Call'),(18,'CallComponent','CallComponent'),(19,'CallPageComponent','CallPageComponent'),(20,'CaprureScreen','CaprureScreen'),(21,'CaptureObject','CaptureObject'),(22,'CaseValue','CaseValue'),(23,'CB_SetValue','CB_SetValue'),(24,'ChangeDateFormat','ChangeDateFormat'),(25,'ChangeDebugDate','ChangeDebugDate'),(26,'ChangeDebugname','ChangeDebugname'),(27,'ChangeFormat','ChangeFormat'),(28,'ChangeFormList','ChangeFormList'),(29,'ChangePersonId','ChangePersonId'),(30,'ChangeStringCase','ChangeStringCase'),(31,'Check','Check'),(32,'CheckUncheckMNR','CheckUncheckMNR'),(33,'CheckWebTableCell','CheckWebTableCell'),(34,'ChkUnchkChildCellCheckbox','ChkUnchkChildCellCheckbox'),(35,'ChoosePickerValue','ChoosePickerValue'),(36,'ClearLotusNotesField','ClearLotusNotesField'),(37,'ClearSwfTableFilter','ClearSwfTableFilter'),(38,'Click','Click'),(39,'ClickAdjecentObject','ClickAdjecentObject'),(40,'ClickAdjObject','ClickAdjObject'),(41,'ClickMUPEButton','ClickMUPEButton'),(42,'ClickMUPECloseButton','ClickMUPECloseButton'),(43,'ClickOnRowByName','ClickOnRowByName'),(44,'ClickOnText','ClickOnText'),(45,'ClickSWFToolbarItem','ClickSWFToolbarItem'),(46,'ClickWebTableCellLink','ClickWebTableCellLink'),(47,'ClickWebTableCellLinkIndex','ClickWebTableCellLinkIndex'),(48,'ClickWebTableCellLinkIndexMulti','ClickWebTableCellLinkIndexMulti'),(49,'ClickWebTableCellLinkText','ClickWebTableCellLinkText'),(50,'ClientNumber','ClientNumber'),(51,'Close','Close'),(52,'CloseAllBrowsers','CloseAllBrowsers'),(53,'CloseApp','CloseApp'),(54,'CloseBrowsers','CloseBrowsers'),(55,'CloseByProcessName','CloseByProcessName'),(56,'CloseMultipleNotepad','CloseMultipleNotepad'),(57,'Close_Security_Popup','Close_Security_Popup'),(58,'Close_Transaction','Close_Transaction'),(59,'CollapseSWFRow','CollapseSWFRow'),(60,'Commit_Transaction','Commit_Transaction'),(61,'CompareDate','CompareDate'),(62,'CompareExcelSheets','CompareExcelSheets'),(63,'CompareExcelSheetsByColumn','CompareExcelSheetsByColumn'),(64,'CompareValues','CompareValues'),(65,'CompareValuesIgnoreCase','CompareValuesIgnoreCase'),(66,'Com_CSPRO_select_Date','Com_CSPRO_select_Date'),(67,'Com_CSPRO_select_menu_Item','Com_CSPRO_select_menu_Item'),(68,'Com_CSPRO_windowwakeupcall','Com_CSPRO_windowwakeupcall'),(69,'Com_GuiVerifyDialogBox','Com_GuiVerifyDialogBox'),(70,'Com_New_GuiVerifyDialogBox','Com_New_GuiVerifyDialogBox'),(71,'Com_VerifyDialogBox','Com_VerifyDialogBox'),(72,'Com_VerifyDialogBox_Print','Com_VerifyDialogBox_Print'),(73,'ConcatenateString','ConcatenateString'),(74,'ConcatenateValues','ConcatenateValues'),(75,'ConvertCASE','ConvertCASE'),(76,'ConvertCSVtoExcel','ConvertCSVtoExcel'),(77,'ConvertCurrToNum','ConvertCurrToNum'),(78,'ConvertDateFormat','ConvertDateFormat'),(79,'ConvertStringToCurrencyFormat','ConvertStringToCurrencyFormat'),(80,'CopyFileFunction','CopyFileFunction'),(81,'CopyFolderFunction','CopyFolderFunction'),(82,'CreateChildTask','CreateChildTask'),(83,'CreateNewFolder','CreateNewFolder'),(84,'CreateTask','CreateTask'),(85,'CreatingTextFile','CreatingTextFile'),(86,'CrntDocAppendText','CrntDocAppendText'),(87,'CrntDocGoToField','CrntDocGoToField'),(88,'CrntDocSave','CrntDocSave'),(89,'CSPRO_Close','CSPRO_Close'),(90,'CSPRO_Insert_Keyboard_Key','CSPRO_Insert_Keyboard_Key'),(91,'CSPRO_Launch','CSPRO_Launch'),(92,'CSPRO_SelectTreePath','CSPRO_SelectTreePath'),(93,'CSPRO_SetValue','CSPRO_SetValue'),(94,'CustomProperties','CustomProperties'),(95,'DateAddition','DateAddition'),(96,'DateDecrement','DateDecrement'),(97,'dbDataSharing','dbDataSharing'),(98,'DblClick','DblClick'),(99,'DBSubSys','DBSubSys'),(100,'DB_TotalRecords','DB_TotalRecords'),(101,'DDDsnVal','DDDsnVal'),(102,'DeletingFolder','DeletingFolder'),(103,'DisplayUserText','DisplayUserText'),(104,'Down_Arrow','Down_Arrow'),(105,'Do_Until','Do_Until'),(106,'EditBatchJob','EditBatchJob'),(107,'Edit_maxlength','Edit_maxlength'),(108,'EM_Window_Exist','EM_Window_Exist'),(109,'EndSelect','EndSelect'),(110,'End_False','End_False'),(111,'End_InnerLoop','End_InnerLoop'),(112,'End_Loop','End_Loop'),(113,'End_True','End_True'),(114,'EnterDataInYBRFrame','EnterDataInYBRFrame'),(115,'Excel_CheckComboBox','Excel_CheckComboBox'),(116,'Excel_ClickonMacro','Excel_ClickonMacro'),(117,'Excel_CloseExcel','Excel_CloseExcel'),(118,'Excel_DeleteColumn','Excel_DeleteColumn'),(119,'Excel_DeleteRow','Excel_DeleteRow'),(120,'Excel_EnterCellValue','Excel_EnterCellValue'),(121,'Excel_FillCellColor','Excel_FillCellColor'),(122,'Excel_FindCellColor','Excel_FindCellColor'),(123,'Excel_FindCellValue','Excel_FindCellValue'),(124,'Excel_FindColumnCount','Excel_FindColumnCount'),(125,'Excel_FindRowCount','Excel_FindRowCount'),(126,'Excel_GetCellValue','Excel_GetCellValue'),(127,'Excel_OpenExcel','Excel_OpenExcel'),(128,'Excel_SelectCell','Excel_SelectCell'),(129,'Excel_SelectValueRadioBtn','Excel_SelectValueRadioBtn'),(130,'Excel_SetValueText','Excel_SetValueText'),(131,'Excel_SortColumnAscending','Excel_SortColumnAscending'),(132,'Excel_SortColumnDescending','Excel_SortColumnDescending'),(133,'Excel_SortRowAscending','Excel_SortRowAscending'),(134,'Excel_SortRowDescending','Excel_SortRowDescending'),(135,'Excel_UnCheckComboBox','Excel_UnCheckComboBox'),(136,'ExecuteDBQuery','ExecuteDBQuery'),(137,'ExecuteQTPStatement','ExecuteQTPStatement'),(138,'ExpandRow','ExpandRow'),(139,'ExpandSWFRow','ExpandSWFRow'),(140,'ExpandTableRow','ExpandTableRow'),(141,'ExpandTree','ExpandTree'),(142,'ExportTableColumnToExcel','ExportTableColumnToExcel'),(143,'ExportTableDataToExcel','ExportTableDataToExcel'),(144,'FileAidSet','FileAidSet'),(145,'FileExist','FileExist'),(146,'FileLayoutList','FileLayoutList'),(147,'FileToDelete','FileToDelete'),(148,'File_Detail_summary','File_Detail_summary'),(149,'FillDetailsJCL','FillDetailsJCL'),(150,'FindCellValue','FindCellValue'),(151,'Flex_CSV_BlankRowSearch','Flex_CSV_BlankRowSearch'),(152,'Flex_FieldReport_Comparision','Flex_FieldReport_Comparision'),(153,'Flex_NewTextFieldReport_Cmprsn','Flex_NewTextFieldReport_Cmprsn'),(154,'Flex_NextRowFieldReport_Cmprsn','Flex_NextRowFieldReport_Cmprsn'),(155,'Flex_Report_Comparision','Flex_Report_Comparision'),(156,'Flex_TXT_BlankRowSearch','Flex_TXT_BlankRowSearch'),(157,'fnc_GetEmpDetails','fnc_GetEmpDetails'),(158,'fnc_instance_detail','fnc_instance_detail'),(159,'fnc_myhr_metrics','fnc_myhr_metrics'),(160,'fnc_Verify_Reports','fnc_Verify_Reports'),(161,'FolderExist','FolderExist'),(162,'GenerateErrorMessages','GenerateErrorMessages'),(163,'GenerateMessages','GenerateMessages'),(164,'GenerateStatus','GenerateStatus'),(165,'GetActivityRunDateByName','GetActivityRunDateByName'),(166,'GetAdjacentRowValue','GetAdjacentRowValue'),(167,'GetAllListValues','GetAllListValues'),(168,'GetAttribute','GetAttribute'),(169,'GetClientData','GetClientData'),(170,'GetColumnCount','GetColumnCount'),(171,'GetColumn_PplSoft','GetColumn_PplSoft'),(172,'GetDSN','GetDSN'),(173,'GetExistance','GetExistance'),(174,'GetGUICellDataSingleCol','GetGUICellDataSingleCol'),(175,'GetGuiMatchingCellData','GetGuiMatchingCellData'),(176,'GetGuiTableContent','GetGuiTableContent'),(177,'GetGuiTableRowContent','GetGuiTableRowContent'),(178,'GetJobCode','GetJobCode'),(179,'GetJobName','GetJobName'),(180,'GetListCount','GetListCount'),(181,'GetListItemSelected','GetListItemSelected'),(182,'GetLotusDocumentFieldValues','GetLotusDocumentFieldValues'),(183,'GetLotusDocumentListValues','GetLotusDocumentListValues'),(184,'GetLotusDocumentProperty','GetLotusDocumentProperty'),(185,'GetMainframe_Table_vals','GetMainframe_Table_vals'),(186,'GetMatchingCellData','GetMatchingCellData'),(187,'GetMultipleListItemsSelected','GetMultipleListItemsSelected'),(188,'GetObjectProperty','GetObjectProperty'),(189,'GetProperty_frame','GetProperty_frame'),(190,'GetPSPDataElmnCellData','GetPSPDataElmnCellData'),(191,'GetPSPDataInstCellData','GetPSPDataInstCellData'),(192,'GetPSPReportData','GetPSPReportData'),(193,'GetRowCount','GetRowCount'),(194,'GetRowNumber','GetRowNumber'),(195,'GetSelectedTab','GetSelectedTab'),(196,'GetSwfRowIndexByColumn','GetSwfRowIndexByColumn'),(197,'GetSwfSelectedRowCellValue','GetSwfSelectedRowCellValue'),(198,'GetSwfTableCellData','GetSwfTableCellData'),(199,'GetSWFTableChildBandCellValue','GetSWFTableChildBandCellValue'),(200,'GetSWFTableChildBandRowsCount','GetSWFTableChildBandRowsCount'),(201,'GetSwfTableRowCount','GetSwfTableRowCount'),(202,'GetTableAdjacentCellData','GetTableAdjacentCellData'),(203,'GetTableCellValue','GetTableCellValue'),(204,'GetTableRowValue','GetTableRowValue'),(205,'GetText','GetText'),(206,'GetTimerDuration','GetTimerDuration'),(207,'GetTitle','GetTitle'),(208,'GetToolTip','GetToolTip'),(209,'GetTreeItemCount','GetTreeItemCount'),(210,'GetTreeValue','GetTreeValue'),(211,'GetTreeValueByIndex','GetTreeValueByIndex'),(212,'GetUltraTabName','GetUltraTabName'),(213,'GetURL','GetURL'),(214,'GetValue','GetValue'),(215,'GetVisibleProperty','GetVisibleProperty'),(216,'GetWebTableValue','GetWebTableValue'),(217,'GetXMLData','GetXMLData'),(218,'Get_ChildObject','Get_ChildObject'),(219,'Get_ChildObjects','Get_ChildObjects'),(220,'Get_ChildObjects_DefineFields','Get_ChildObjects_DefineFields'),(221,'Get_ColumnHeaders','Get_ColumnHeaders'),(222,'Get_FilesCount','Get_FilesCount'),(223,'Goto_False','Goto_False'),(224,'Goto_Label','Goto_Label'),(225,'Goto_True','Goto_True'),(226,'ImportTask','ImportTask'),(227,'InsertAssociate','InsertAssociate'),(228,'Insert_Keyboard_Key','Insert_Keyboard_Key'),(229,'InString','InString'),(230,'IntegerComparison','IntegerComparison'),(231,'IsObjectExsist','IsObjectExsist'),(232,'JobProcID','JobProcID'),(233,'JobRename','JobRename'),(234,'Label','Label'),(235,'LANIDVal','LANIDVal'),(236,'Launch','Launch'),(237,'LaunchMainframe','LaunchMainframe'),(238,'LeftValue','LeftValue'),(239,'LoadLotus','LoadLotus'),(240,'Logic_IF','Logic_IF'),(241,'LoginMainframe','LoginMainframe'),(242,'LogOffMainframe','LogOffMainframe'),(243,'LotusDocumentAttachFile','LotusDocumentAttachFile'),(244,'Lotus_VerifyActiveDoc','Lotus_VerifyActiveDoc'),(245,'Lotus_VerifyActiveTab','Lotus_VerifyActiveTab'),(246,'LstTransValues','LstTransValues'),(247,'MaestroLogin','MaestroLogin'),(248,'MainframeDataSet','MainframeDataSet'),(249,'Mainframe_Change_System_Date','Mainframe_Change_System_Date'),(250,'Mainframe_Change_System_Time','Mainframe_Change_System_Time'),(251,'Mainframe_Flex_Change_System_Date','Mainframe_Flex_Change_System_Date'),(252,'Mainframe_Flex_Close','Mainframe_Flex_Close'),(253,'Mainframe_Flex_Login_Genration','Mainframe_Flex_Login_Genration'),(254,'Mainframe_Flex_PCS_ClientSelect','Mainframe_Flex_PCS_ClientSelect'),(255,'Mainframe_Flex_PCS_JobSubmit','Mainframe_Flex_PCS_JobSubmit'),(256,'Mainframe_Flex_PCS_WorkWthEnvVersn','Mainframe_Flex_PCS_WorkWthEnvVersn'),(257,'Mainframe_Flex_PCS_WorkWthEvrnment','Mainframe_Flex_PCS_WorkWthEvrnment'),(258,'Mainframe_Full46_Zap','Mainframe_Full46_Zap'),(259,'Mainframe_Full_Zap','Mainframe_Full_Zap'),(260,'Mainframe_Login','Mainframe_Login'),(261,'Mainframe_Table_Zap','Mainframe_Table_Zap'),(262,'Mainframe_Zap_Storage','Mainframe_Zap_Storage'),(263,'Mainfrme_Flex_PCS_AZEnvRelesEdition','Mainfrme_Flex_PCS_AZEnvRelesEdition'),(264,'Mainfrme_Flex_PCS_EnvReleaseEdition','Mainfrme_Flex_PCS_EnvReleaseEdition'),(265,'Mainfrme_Flex_PCS_NewEditExprtBtch','Mainfrme_Flex_PCS_NewEditExprtBtch'),(266,'Mainfrme_Flex_PCS_NewEmpLstMem','Mainfrme_Flex_PCS_NewEmpLstMem'),(267,'Mainfrme_Flex_PCS_NewEnvRelsEditn','Mainfrme_Flex_PCS_NewEnvRelsEditn'),(268,'MakeSwfTableCellVisible','MakeSwfTableCellVisible'),(269,'MaxDate','MaxDate'),(270,'Maximize','Maximize'),(271,'Maximize8','Maximize8'),(272,'message','message'),(273,'Minimize','Minimize'),(274,'MouseClick','MouseClick'),(275,'MouseOver','MouseOver'),(276,'MoveOutOfTest','MoveOutOfTest'),(277,'MSPSync','MSPSync'),(278,'MSPSyncVerification','MSPSyncVerification'),(279,'MSP_Activate','MSP_Activate'),(280,'MSP_ClickButton','MSP_ClickButton'),(281,'MSP_ClickCo_ordinates','MSP_ClickCo_ordinates'),(282,'MSP_CloseMPP','MSP_CloseMPP'),(283,'MSP_DeleteTask','MSP_DeleteTask'),(284,'MSP_EnterData','MSP_EnterData'),(285,'MSP_GetFieldValue','MSP_GetFieldValue'),(286,'MSP_GetListCount','MSP_GetListCount'),(287,'MSP_GetText','MSP_GetText'),(288,'MSP_ModifyCustomProperty','MSP_ModifyCustomProperty'),(289,'MSP_OpenMPP','MSP_OpenMPP'),(290,'MSP_SaveAs','MSP_SaveAs'),(291,'MSP_SaveMPP','MSP_SaveMPP'),(292,'MSP_SelectMenu','MSP_SelectMenu'),(293,'MSP_SelectRadioButton','MSP_SelectRadioButton'),(294,'MSP_SetFocus','MSP_SetFocus'),(295,'MSP_SetValue','MSP_SetValue'),(296,'MSP_VerifyFieldData','MSP_VerifyFieldData'),(297,'MSP_VerifyFieldsWithOrder','MSP_VerifyFieldsWithOrder'),(298,'MSP_VerifyListValues','MSP_VerifyListValues'),(299,'MSP_VerifyMandetoryFields','MSP_VerifyMandetoryFields'),(300,'MSP_VerifyRequiredFields','MSP_VerifyRequiredFields'),(301,'Navigate','Navigate'),(302,'NewVerifyTableCellData','NewVerifyTableCellData'),(303,'ObjectClickbyProperty','ObjectClickbyProperty'),(304,'ObjectExistbyProperty','ObjectExistbyProperty'),(305,'ObjectExistbyPropertyXY','ObjectExistbyPropertyXY'),(306,'ObjectSelectbyProperty','ObjectSelectbyProperty'),(307,'ObjectSetbyProperty','ObjectSetbyProperty'),(308,'OpenDatabase','OpenDatabase'),(309,'OpenExcelFile','OpenExcelFile'),(310,'OpenForm','OpenForm'),(311,'OpenSearchBox','OpenSearchBox'),(312,'OpenTableColumnChooser','OpenTableColumnChooser'),(313,'Open_DBTransaction','Open_DBTransaction'),(314,'OutdentTask','OutdentTask'),(315,'Portal_SelectFileToUpload','Portal_SelectFileToUpload'),(316,'Radio_Enable_Disable','Radio_Enable_Disable'),(317,'ReadFile','ReadFile'),(318,'ReadResponseFile','ReadResponseFile'),(319,'Red_X','Red_X'),(320,'RefreshBrowser','RefreshBrowser'),(321,'RenameFile','RenameFile'),(322,'ResourceSync','ResourceSync'),(323,'Restore','Restore'),(324,'RoundDown','RoundDown'),(325,'RoundUp','RoundUp'),(326,'RtClick','RtClick'),(327,'Run_Batch_File','Run_Batch_File'),(328,'Run_DML_QUERY','Run_DML_QUERY'),(329,'Run_Select_query_var','Run_Select_query_var'),(330,'Run_Select_query_var_MultiValues','Run_Select_query_var_MultiValues'),(331,'Run_Update_query','Run_Update_query'),(332,'SaveExcelDocument','SaveExcelDocument'),(333,'ScrollDown','ScrollDown'),(334,'ScrollUp','ScrollUp'),(335,'SearchTableCellData','SearchTableCellData'),(336,'SearchTransaction','SearchTransaction'),(337,'SelectATEFooterTabs','SelectATEFooterTabs'),(338,'SelectCalenderDate','SelectCalenderDate'),(339,'SelectCase','SelectCase'),(340,'SelectCellDropdownValue','SelectCellDropdownValue'),(341,'SelectComboValueByIndex','SelectComboValueByIndex'),(342,'selectDatefromcalender','selectDatefromcalender'),(343,'SelectDefaultContent','SelectDefaultContent'),(344,'SelectEmbedDropdownValue','SelectEmbedDropdownValue'),(345,'SelectFrame','SelectFrame'),(346,'SelectGuiTableCell','SelectGuiTableCell'),(347,'SelectIndex','SelectIndex'),(348,'SelectMatchingCellData','SelectMatchingCellData'),(349,'SelectMaxRow','SelectMaxRow'),(350,'SelectMenu','SelectMenu'),(351,'SelectMultipleTableRow','SelectMultipleTableRow'),(352,'SelectRadiBtn','SelectRadiBtn'),(353,'SelectRadioGrp','SelectRadioGrp'),(354,'SelectSWFCellDropdownValue','SelectSWFCellDropdownValue'),(355,'SelectSwfTableCell','SelectSwfTableCell'),(356,'SelectSWFTableChildBand','SelectSWFTableChildBand'),(357,'SelectSWFTableRow','SelectSWFTableRow'),(358,'SelectSwfToolBar','SelectSwfToolBar'),(359,'SelectTableCell','SelectTableCell'),(360,'SelectTableCellItem','SelectTableCellItem'),(361,'SelectTableCellValue','SelectTableCellValue'),(362,'SelectTableRow','SelectTableRow'),(363,'SelectTableRowCellValue','SelectTableRowCellValue'),(364,'SelectTBATableRow','SelectTBATableRow'),(365,'SelectTBAValue','SelectTBAValue'),(366,'SelectTreeLastCol','SelectTreeLastCol'),(367,'SelectTreeNode','SelectTreeNode'),(368,'SelectTreeNodeByIndex','SelectTreeNodeByIndex'),(369,'SelectTreePath','SelectTreePath'),(370,'SelectUltaTreeValue','SelectUltaTreeValue'),(371,'SelectUltraTreeItem','SelectUltraTreeItem'),(372,'SelectValue','SelectValue'),(373,'SelectWebTableChkBox','SelectWebTableChkBox'),(374,'SelectWindow','SelectWindow'),(375,'SelectWinTreeNode','SelectWinTreeNode'),(376,'SendKeyboardInput','SendKeyboardInput'),(377,'SendmailNotification','SendmailNotification'),(378,'SerchTreeNode','SerchTreeNode'),(379,'SetC3PIGridValue','SetC3PIGridValue'),(380,'SetCellDataInSwfTable','SetCellDataInSwfTable'),(381,'SetCursoronPage','SetCursoronPage'),(382,'SetDBNode','SetDBNode'),(383,'SetExcelCellValue','SetExcelCellValue'),(384,'SetLotusDocumentProperty','SetLotusDocumentProperty'),(385,'SetPSPDataElmnChkBox','SetPSPDataElmnChkBox'),(386,'SetPSPDataInstChkbox','SetPSPDataInstChkbox'),(387,'SetPSPReportChkbox','SetPSPReportChkbox'),(388,'SetSecure','SetSecure'),(389,'SetSwfTableCell','SetSwfTableCell'),(390,'SetSWFTableCheckbox','SetSWFTableCheckbox'),(391,'SetSWFTableChildBandCellValue','SetSWFTableChildBandCellValue'),(392,'SetSwfTableFilter','SetSwfTableFilter'),(393,'SetValue','SetValue'),(394,'SetValueSWFtable','SetValueSWFtable'),(395,'SetValueToVar','SetValueToVar'),(396,'SetWebTableCell','SetWebTableCell'),(397,'SetWebTableCell_PplSoft','SetWebTableCell_PplSoft'),(398,'SetXMLData','SetXMLData'),(399,'ShowCustomFilterDialog','ShowCustomFilterDialog'),(400,'ShowDialog','ShowDialog'),(401,'SortColumn','SortColumn'),(402,'SortOutDDDsnVal','SortOutDDDsnVal'),(403,'SplitString','SplitString'),(404,'SplitText','SplitText'),(405,'SSSelectValueFromWinList','SSSelectValueFromWinList'),(406,'SSTreeSelectValue','SSTreeSelectValue'),(407,'SSUltraGridActivateCell','SSUltraGridActivateCell'),(408,'SSUltraGridGetCellValue','SSUltraGridGetCellValue'),(409,'SSUltraGridSelectRow','SSUltraGridSelectRow'),(410,'SSUltraGridSetCellValue','SSUltraGridSetCellValue'),(411,'StartTimer','StartTimer'),(412,'StatusConvert','StatusConvert'),(413,'Step','Step'),(414,'StopExecution','StopExecution'),(415,'StopTimer','StopTimer'),(416,'StoreVariable','StoreVariable'),(417,'StringContains','StringContains'),(418,'StringPartReplace','StringPartReplace'),(419,'StringReplace','StringReplace'),(420,'StringTrim','StringTrim'),(421,'submitJob','submitJob'),(422,'SubmittIDJcl','SubmittIDJcl'),(423,'SummaryValidation','SummaryValidation'),(424,'Sync','Sync'),(425,'SyncApplication','SyncApplication'),(426,'SyncLotus','SyncLotus'),(427,'SyncMaestroWithMSP','SyncMaestroWithMSP'),(428,'SyncMSPWithMaestro','SyncMSPWithMaestro'),(429,'SysDate','SysDate'),(430,'TableRecordSet','TableRecordSet'),(431,'Testcase','Testcase'),(432,'TimeReport_ClickPendingTimeImage','TimeReport_ClickPendingTimeImage'),(433,'Timestamp_Day','Timestamp_Day'),(434,'Tooltipverify','Tooltipverify'),(435,'TotalRowValue_PplSoft','TotalRowValue_PplSoft'),(436,'translation_summary','translation_summary'),(437,'Truncate','Truncate'),(438,'Type','Type'),(439,'TypeValue','TypeValue'),(440,'Uncheck','Uncheck'),(441,'UpdateInterfaceCalender','UpdateInterfaceCalender'),(442,'UpdateObject','UpdateObject'),(443,'UpdateResourcePool','UpdateResourcePool'),(444,'Up_Arrow','Up_Arrow'),(445,'ValidateTBAIDDropdown','ValidateTBAIDDropdown'),(446,'VerifyAllChildRowCellValue','VerifyAllChildRowCellValue'),(447,'VerifyAllRowCellValues','VerifyAllRowCellValues'),(448,'VerifyATEGridFromDB','VerifyATEGridFromDB'),(449,'VerifyBoldText','VerifyBoldText'),(450,'VerifyBooleanProperty','VerifyBooleanProperty'),(451,'VerifyBrokenLink','VerifyBrokenLink'),(452,'VerifyCellDataExists','VerifyCellDataExists'),(453,'VerifyCellEditableInRPMChildBands','VerifyCellEditableInRPMChildBands'),(454,'VerifyChecked','VerifyChecked'),(455,'VerifyChildbandRowValues','VerifyChildbandRowValues'),(456,'VerifyColumnDrag','VerifyColumnDrag'),(457,'VerifyColumnIsFixed','VerifyColumnIsFixed'),(458,'VerifyDataElemnFolderExpandable','VerifyDataElemnFolderExpandable'),(459,'VerifyDataInExcelSheetbyRowColumn','VerifyDataInExcelSheetbyRowColumn'),(460,'VerifyDataInRPMChildBands','VerifyDataInRPMChildBands'),(461,'VerifyDataInstanceFolder','VerifyDataInstanceFolder'),(462,'VerifyDataInstanceFolderList','VerifyDataInstanceFolderList'),(463,'VerifyDateExist','VerifyDateExist'),(464,'VerifyDefaultValues','VerifyDefaultValues'),(465,'VerifyDeletePopup_Display','VerifyDeletePopup_Display'),(466,'VerifyDropdownItemsExist','VerifyDropdownItemsExist'),(467,'VerifyEnabled','VerifyEnabled'),(468,'VerifyExist','VerifyExist'),(469,'VerifyExistFieldNames','VerifyExistFieldNames'),(470,'VerifyExistingFileValues_Fileformat','VerifyExistingFileValues_Fileformat'),(471,'VerifyExistingInboundFiles','VerifyExistingInboundFiles'),(472,'VerifyFeatureList','VerifyFeatureList'),(473,'VerifyFileDefinition','VerifyFileDefinition'),(474,'VerifyFileDefinitionValues','VerifyFileDefinitionValues'),(475,'VerifyFileLayout','VerifyFileLayout'),(476,'VerifyFileLayoutValues','VerifyFileLayoutValues'),(477,'VerifyFileName','VerifyFileName'),(478,'VerifyFundList_TBA','VerifyFundList_TBA'),(479,'VerifyGuiCellData','VerifyGuiCellData'),(480,'VerifyGUITableRowCount','VerifyGUITableRowCount'),(481,'VerifyIsEnabled','VerifyIsEnabled'),(482,'VerifyListCount','VerifyListCount'),(483,'VerifyListItemSelected','VerifyListItemSelected'),(484,'VerifyListItemsExist','VerifyListItemsExist'),(485,'VerifyListToDB','VerifyListToDB'),(486,'VerifyLotusDatabaseFormExist','VerifyLotusDatabaseFormExist'),(487,'VerifyLotusDocumentFieldExist','VerifyLotusDocumentFieldExist'),(488,'VerifyMatchingData','VerifyMatchingData'),(489,'VerifyMenuItemProperty','VerifyMenuItemProperty'),(490,'VerifyMNRNotInChildBand','VerifyMNRNotInChildBand'),(491,'VerifyNavigateURL','VerifyNavigateURL'),(492,'VerifyObjectColor','VerifyObjectColor'),(493,'VerifyOptionOnToolBar','VerifyOptionOnToolBar'),(494,'VerifyPanelData','VerifyPanelData'),(495,'VerifyPDFText','VerifyPDFText'),(496,'VerifyProperty','VerifyProperty'),(497,'VerifyPSPDataElmnCellData','VerifyPSPDataElmnCellData'),(498,'VerifyPSPDataInstCellData','VerifyPSPDataInstCellData'),(499,'VerifyPSPDataInstCellDataExists','VerifyPSPDataInstCellDataExists'),(500,'VerifyPSPReportCellEditable','VerifyPSPReportCellEditable'),(501,'VerifyPSPReportData','VerifyPSPReportData'),(502,'VerifyPSPReportTab','VerifyPSPReportTab'),(503,'VerifyRecentChangedData','VerifyRecentChangedData'),(504,'VerifyRowIsFixed','VerifyRowIsFixed'),(505,'VerifyRPMToolLaunchTime','VerifyRPMToolLaunchTime'),(506,'VerifySpecialTooltip','VerifySpecialTooltip'),(507,'VerifySummaryTask','VerifySummaryTask'),(508,'VerifySuperFlipRefreshComplete','VerifySuperFlipRefreshComplete'),(509,'VerifySWFColumnExists','VerifySWFColumnExists'),(510,'VerifySWFRowEditable','VerifySWFRowEditable'),(511,'VerifySwfTableCellActive','VerifySwfTableCellActive'),(512,'VerifySWFTableCellData','VerifySWFTableCellData'),(513,'VerifySwfTableCellDataExists','VerifySwfTableCellDataExists'),(514,'VerifySwfTableCellEmpty','VerifySwfTableCellEmpty'),(515,'VerifySWFTableCheckbox','VerifySWFTableCheckbox'),(516,'VerifySwfTableChildRowCellValue','VerifySwfTableChildRowCellValue'),(517,'VerifySwfTableColumnCount','VerifySwfTableColumnCount'),(518,'VerifySwfTableComboValues','VerifySwfTableComboValues'),(519,'VerifySwfTableComboValuesExists','VerifySwfTableComboValuesExists'),(520,'VerifySwfTableDropDownValues','VerifySwfTableDropDownValues'),(521,'VerifySwfTableFilter','VerifySwfTableFilter'),(522,'VerifySWFTableRecordExist','VerifySWFTableRecordExist'),(523,'VerifySwfTableRowCount','VerifySwfTableRowCount'),(524,'VerifySwfToolbarItemExists','VerifySwfToolbarItemExists'),(525,'VerifyTabItemExists','VerifyTabItemExists'),(526,'VerifyTableCellData','VerifyTableCellData'),(527,'VerifyTableCellDataInAllRows','VerifyTableCellDataInAllRows'),(528,'VerifyTableColumnCount','VerifyTableColumnCount'),(529,'VerifyTableItemExist','VerifyTableItemExist'),(530,'VerifyTableRecord','VerifyTableRecord'),(531,'VerifyTableRecordRow','VerifyTableRecordRow'),(532,'VerifyTableRowCount','VerifyTableRowCount'),(533,'VerifyTableRowHasChildRows','VerifyTableRowHasChildRows'),(534,'VerifyTableToDB','VerifyTableToDB'),(535,'VerifyTaskData','VerifyTaskData'),(536,'VerifyText','VerifyText'),(537,'VerifyTextColorRed','VerifyTextColorRed'),(538,'VerifyTextExist','VerifyTextExist'),(539,'VerifyTextOccurance','VerifyTextOccurance'),(540,'VerifyTreeLeafCount','VerifyTreeLeafCount'),(541,'VerifyTreeSelect','VerifyTreeSelect'),(542,'VerifyUltraToolEnabled','VerifyUltraToolEnabled'),(543,'VerifyUltraToolExists','VerifyUltraToolExists'),(544,'VerifyUltraTreeItemExists','VerifyUltraTreeItemExists'),(545,'VerifyValueInATextFile','VerifyValueInATextFile'),(546,'VerifyViolationCheck','VerifyViolationCheck'),(547,'VerifyWebListValueExist','VerifyWebListValueExist'),(548,'VerifyWinDialogBox_WithText','VerifyWinDialogBox_WithText'),(549,'VerifyYBRHighlightedTab','VerifyYBRHighlightedTab'),(550,'Verify_ChooseFields','Verify_ChooseFields'),(551,'Verify_StagingRadar_FieldValues','Verify_StagingRadar_FieldValues'),(552,'Verify_STG_Trans_Details_Page','Verify_STG_Trans_Details_Page'),(553,'Verify_STG_Trans_Edit_Page','Verify_STG_Trans_Edit_Page'),(554,'WaitFor','WaitFor'),(555,'WaitForTableData','WaitForTableData'),(556,'WaitForUntil','WaitForUntil'),(557,'WaitForUntill','WaitForUntill'),(558,'Waiting_TimeOutPopup','Waiting_TimeOutPopup'),(559,'WaitLoopUntill','WaitLoopUntill'),(560,'WaitUntillValue','WaitUntillValue'),(561,'Wait_Sec','Wait_Sec'),(562,'Webtable_Objects','Webtable_Objects'),(563,'WriteToFile','WriteToFile'),(564,'Ybr3xDatabaseValues','Ybr3xDatabaseValues'),(565,'YbrDatabaseValues','YbrDatabaseValues'),(566,'YSA_CheckSQLDataExistence','YSA_CheckSQLDataExistence');
/*!40000 ALTER TABLE `event_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_parameter`
--

DROP TABLE IF EXISTS `event_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_parameter` (
  `eventParaID` int(32) NOT NULL AUTO_INCREMENT,
  `paraName` varchar(45) DEFAULT NULL,
  `paraSeq` varchar(45) DEFAULT NULL,
  `paraType` varchar(45) DEFAULT NULL,
  `eventID` int(32) NOT NULL,
  PRIMARY KEY (`eventParaID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_parameter`
--

LOCK TABLES `event_parameter` WRITE;
/*!40000 ALTER TABLE `event_parameter` DISABLE KEYS */;
INSERT INTO `event_parameter` VALUES (1,'NA','1','d',1),(2,'NA','2','d',1),(3,'URL','3','d',1),(4,'Browser','4','d',1);
/*!40000 ALTER TABLE `event_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_details`
--

DROP TABLE IF EXISTS `execution_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_details` (
  `tccRUnID` int(64) NOT NULL AUTO_INCREMENT,
  `executionRunID` int(11) DEFAULT NULL,
  `tccrunDescription` varchar(3500) DEFAULT NULL,
  `screenshotName` varchar(1000) DEFAULT NULL,
  `ExecutionTime` varchar(45) DEFAULT NULL,
  `tccRunStatus` varchar(45) DEFAULT NULL,
  `suiteID` int(32) DEFAULT NULL,
  `testcaseID` int(32) DEFAULT NULL,
  `testcaseName` varchar(255) DEFAULT NULL,
  `scrshot` bit(1) NOT NULL DEFAULT b'1',
  `scrshot_update` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`tccRUnID`),
  KEY `fk_exerunID_idx` (`executionRunID`),
  CONSTRAINT `fk_exerunID` FOREIGN KEY (`executionRunID`) REFERENCES `execution_runmaster` (`executionRunID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_details`
--

LOCK TABLES `execution_details` WRITE;
/*!40000 ALTER TABLE `execution_details` DISABLE KEYS */;
INSERT INTO `execution_details` VALUES (875,213,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 12, 2019, 9-28-17 PM.png','12-January-2019-9:28:12 PM','PASS',88,195,'15 Jan 2019 Testcase','',''),(876,213,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-28-19 PM.png','12-January-2019-9:28:17 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(877,213,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 12, 2019, 9-28-20 PM.png','12-January-2019-9:28:20 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(878,213,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-28-22 PM.png','12-January-2019-9:28:20 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(879,213,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 12, 2019, 9-28-30 PM.png','12-January-2019-9:28:23 PM','PASS',88,195,'15 Jan 2019 Testcase','',''),(880,213,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-28-32 PM.png','12-January-2019-9:28:30 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(881,214,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 12, 2019, 9-33-34 PM.png','12-January-2019-9:33:29 PM','PASS',88,195,'15 Jan 2019 Testcase','',''),(882,214,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-33-36 PM.png','12-January-2019-9:33:34 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(883,214,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 12, 2019, 9-33-37 PM.png','12-January-2019-9:33:36 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(884,214,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-33-39 PM.png','12-January-2019-9:33:37 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(885,214,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 12, 2019, 9-33-46 PM.png','12-January-2019-9:33:39 PM','PASS',88,195,'15 Jan 2019 Testcase','',''),(886,214,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-33-48 PM.png','12-January-2019-9:33:46 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(887,215,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 12, 2019, 9-35-23 PM.png','12-January-2019-9:35:17 PM','PASS',88,195,'15 Jan 2019 Testcase','',''),(888,215,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-35-25 PM.png','12-January-2019-9:35:23 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(889,215,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 12, 2019, 9-35-25 PM.png','12-January-2019-9:35:25 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(890,215,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-35-28 PM.png','12-January-2019-9:35:26 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(891,215,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 12, 2019, 9-35-35 PM.png','12-January-2019-9:35:28 PM','PASS',88,195,'15 Jan 2019 Testcase','',''),(892,215,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-35-37 PM.png','12-January-2019-9:35:35 PM','PASS',88,195,'15 Jan 2019 Testcase','\0',''),(893,216,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 12, 2019, 9-47-12 PM.png','12-January-2019-9:47:07 PM','PASS',88,196,'15 Jan 2019 Testcase','',''),(894,216,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-47-15 PM.png','12-January-2019-9:47:13 PM','PASS',88,196,'15 Jan 2019 Testcase','\0',''),(895,216,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 12, 2019, 9-47-15 PM.png','12-January-2019-9:47:15 PM','PASS',88,196,'15 Jan 2019 Testcase','',''),(896,216,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-47-18 PM.png','12-January-2019-9:47:16 PM','PASS',88,196,'15 Jan 2019 Testcase','\0',''),(897,216,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 12, 2019, 9-47-25 PM.png','12-January-2019-9:47:18 PM','PASS',88,196,'15 Jan 2019 Testcase','',''),(898,216,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-47-27 PM.png','12-January-2019-9:47:25 PM','PASS',88,196,'15 Jan 2019 Testcase','\0',''),(899,217,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 12, 2019, 9-54-23 PM.png','12-January-2019-9:54:18 PM','PASS',88,197,'15 Jan 2019 Testcase','',''),(900,217,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-54-26 PM.png','12-January-2019-9:54:24 PM','PASS',88,197,'15 Jan 2019 Testcase','\0',''),(901,217,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 12, 2019, 9-54-26 PM.png','12-January-2019-9:54:26 PM','PASS',88,197,'15 Jan 2019 Testcase','',''),(902,217,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-54-29 PM.png','12-January-2019-9:54:27 PM','PASS',88,197,'15 Jan 2019 Testcase','\0',''),(903,217,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 12, 2019, 9-54-36 PM.png','12-January-2019-9:54:29 PM','PASS',88,197,'15 Jan 2019 Testcase','',''),(904,217,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 12, 2019, 9-54-38 PM.png','12-January-2019-9:54:36 PM','PASS',88,197,'15 Jan 2019 Testcase','\0',''),(905,217,'Successfully Launched Application. https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','C:AFTReportsLaunch_Jan 12, 2019, 9-54-44 PM.png','12-January-2019-9:54:39 PM','PASS',88,197,'15 Jan 2019 Testcase','\0',''),(906,218,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 14, 2019, 10-20-48 PM.png','14-January-2019-10:20:41 PM','PASS',88,197,'15 Jan 2019 Testcase','',''),(907,219,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 15, 2019, 8-44-03 PM.png','15-January-2019-8:43:56 PM','PASS',88,199,'15 Jan 2019 Testcase','',''),(908,219,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-44-05 PM.png','15-January-2019-8:44:03 PM','PASS',88,199,'15 Jan 2019 Testcase','\0',''),(909,219,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 15, 2019, 8-44-06 PM.png','15-January-2019-8:44:05 PM','PASS',88,199,'15 Jan 2019 Testcase','',''),(910,219,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-44-08 PM.png','15-January-2019-8:44:06 PM','PASS',88,199,'15 Jan 2019 Testcase','\0',''),(911,219,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 15, 2019, 8-44-16 PM.png','15-January-2019-8:44:08 PM','PASS',88,199,'15 Jan 2019 Testcase','',''),(912,219,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-44-18 PM.png','15-January-2019-8:44:16 PM','PASS',88,199,'15 Jan 2019 Testcase','\0',''),(913,219,'Keyword is not defined','C:AFTReportsWriteToFile_Jan 15, 2019, 8-44-19 PM.png','15-January-2019-8:44:19 PM','FAIL',88,199,'15 Jan 2019 Testcase','',''),(914,219,'Successfully waited for 5 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-44-24 PM.png','15-January-2019-8:44:19 PM','PASS',88,199,'15 Jan 2019 Testcase','',''),(915,219,'Successfully Launched Application. https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','C:AFTReportsLaunch_Jan 15, 2019, 8-44-29 PM.png','15-January-2019-8:44:24 PM','PASS',88,199,'15 Jan 2019 Testcase','\0',''),(916,220,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 15, 2019, 8-47-13 PM.png','15-January-2019-8:47:08 PM','PASS',88,200,'15 Jan 2019 Testcase','',''),(917,220,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-47-16 PM.png','15-January-2019-8:47:14 PM','PASS',88,200,'15 Jan 2019 Testcase','\0',''),(918,220,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 15, 2019, 8-47-16 PM.png','15-January-2019-8:47:16 PM','PASS',88,200,'15 Jan 2019 Testcase','',''),(919,220,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-47-18 PM.png','15-January-2019-8:47:16 PM','PASS',88,200,'15 Jan 2019 Testcase','\0',''),(920,220,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 15, 2019, 8-47-26 PM.png','15-January-2019-8:47:19 PM','PASS',88,200,'15 Jan 2019 Testcase','',''),(921,220,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-47-29 PM.png','15-January-2019-8:47:27 PM','PASS',88,200,'15 Jan 2019 Testcase','\0',''),(922,220,'Keyword is not defined','C:AFTReportsSaveExcelDocument_Jan 15, 2019, 8-47-29 PM.png','15-January-2019-8:47:29 PM','FAIL',88,200,'15 Jan 2019 Testcase','',''),(923,220,'Successfully waited for 5 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-47-34 PM.png','15-January-2019-8:47:29 PM','PASS',88,200,'15 Jan 2019 Testcase','',''),(924,220,'Successfully Launched Application. https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','C:AFTReportsLaunch_Jan 15, 2019, 8-47-40 PM.png','15-January-2019-8:47:35 PM','PASS',88,200,'15 Jan 2019 Testcase','\0',''),(925,221,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 15, 2019, 8-50-08 PM.png','15-January-2019-8:50:02 PM','PASS',88,201,'15 Jan 2019 Testcase','',''),(926,221,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-50-11 PM.png','15-January-2019-8:50:09 PM','PASS',88,201,'15 Jan 2019 Testcase','\0',''),(927,221,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 15, 2019, 8-50-11 PM.png','15-January-2019-8:50:11 PM','PASS',88,201,'15 Jan 2019 Testcase','',''),(928,221,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-50-13 PM.png','15-January-2019-8:50:11 PM','PASS',88,201,'15 Jan 2019 Testcase','\0',''),(929,221,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 15, 2019, 8-50-20 PM.png','15-January-2019-8:50:14 PM','PASS',88,201,'15 Jan 2019 Testcase','',''),(930,221,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-50-23 PM.png','15-January-2019-8:50:21 PM','PASS',88,201,'15 Jan 2019 Testcase','\0',''),(931,221,'Keyword is not defined','C:AFTReportsScrollDown_Jan 15, 2019, 8-50-23 PM.png','15-January-2019-8:50:23 PM','FAIL',88,201,'15 Jan 2019 Testcase','',''),(932,221,'Successfully waited for 5 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 8-50-29 PM.png','15-January-2019-8:50:24 PM','PASS',88,201,'15 Jan 2019 Testcase','',''),(933,221,'Successfully Launched Application. https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','C:AFTReportsLaunch_Jan 15, 2019, 8-50-34 PM.png','15-January-2019-8:50:29 PM','PASS',88,201,'15 Jan 2019 Testcase','\0',''),(934,222,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 15, 2019, 9-23-31 PM.png','15-January-2019-9:23:23 PM','PASS',88,202,'15 Jan 2019 Testcase','',''),(935,222,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 9-23-33 PM.png','15-January-2019-9:23:31 PM','PASS',88,202,'15 Jan 2019 Testcase','\0',''),(936,222,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 15, 2019, 9-23-33 PM.png','15-January-2019-9:23:33 PM','PASS',88,202,'15 Jan 2019 Testcase','',''),(937,222,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 9-23-36 PM.png','15-January-2019-9:23:34 PM','PASS',88,202,'15 Jan 2019 Testcase','\0',''),(938,222,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 15, 2019, 9-23-43 PM.png','15-January-2019-9:23:36 PM','PASS',88,202,'15 Jan 2019 Testcase','',''),(939,222,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 9-23-45 PM.png','15-January-2019-9:23:43 PM','PASS',88,202,'15 Jan 2019 Testcase','\0',''),(940,222,'Substring \"\" is present in string \"asp\"','C:AFTReportsStringContains_Jan 15, 2019, 9-23-45 PM.png','15-January-2019-9:23:45 PM','PASS',88,202,'15 Jan 2019 Testcase','',''),(941,222,'Successfully waited for 5 Sec.','C:AFTReportsWait_Sec_Jan 15, 2019, 9-23-51 PM.png','15-January-2019-9:23:46 PM','PASS',88,202,'15 Jan 2019 Testcase','',''),(942,222,'Successfully Launched Application. https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','C:AFTReportsLaunch_Jan 15, 2019, 9-23-55 PM.png','15-January-2019-9:23:51 PM','PASS',88,202,'15 Jan 2019 Testcase','\0',''),(943,225,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 21, 2019, 8-55-01 PM.png','21-January-2019-8:54:51 PM','PASS',88,205,'15 Jan 2019 Testcase','',''),(944,225,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-55-04 PM.png','21-January-2019-8:55:02 PM','PASS',88,205,'15 Jan 2019 Testcase','\0',''),(945,225,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 21, 2019, 8-55-04 PM.png','21-January-2019-8:55:04 PM','PASS',88,205,'15 Jan 2019 Testcase','',''),(946,225,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-55-06 PM.png','21-January-2019-8:55:04 PM','PASS',88,205,'15 Jan 2019 Testcase','\0',''),(947,225,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 21, 2019, 8-55-15 PM.png','21-January-2019-8:55:07 PM','PASS',88,205,'15 Jan 2019 Testcase','',''),(948,225,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-55-17 PM.png','21-January-2019-8:55:15 PM','PASS',88,205,'15 Jan 2019 Testcase','\0',''),(949,225,'Substring \"\" is present in string \"asp\"','C:AFTReportsStringContains_Jan 21, 2019, 8-55-17 PM.png','21-January-2019-8:55:17 PM','PASS',88,205,'15 Jan 2019 Testcase','',''),(950,225,'Successfully waited for 5 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-55-23 PM.png','21-January-2019-8:55:18 PM','PASS',88,205,'15 Jan 2019 Testcase','',''),(951,225,'Successfully Launched Application. https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','C:AFTReportsLaunch_Jan 21, 2019, 8-55-29 PM.png','21-January-2019-8:55:23 PM','PASS',88,205,'15 Jan 2019 Testcase','\0',''),(952,227,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Jan 21, 2019, 8-56-00 PM.png','21-January-2019-8:55:54 PM','PASS',88,207,'15 Jan 2019 Testcase','',''),(953,227,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-56-02 PM.png','21-January-2019-8:56:00 PM','PASS',88,207,'15 Jan 2019 Testcase','\0',''),(954,227,'asp .net book value has been set at Search Box','C:AFTReportsSetValue_Jan 21, 2019, 8-56-03 PM.png','21-January-2019-8:56:03 PM','PASS',88,207,'15 Jan 2019 Testcase','',''),(955,227,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-56-05 PM.png','21-January-2019-8:56:03 PM','PASS',88,207,'15 Jan 2019 Testcase','\0',''),(956,227,'Successfully Clicked on Search Button','C:AFTReportsClick_Jan 21, 2019, 8-56-12 PM.png','21-January-2019-8:56:05 PM','PASS',88,207,'15 Jan 2019 Testcase','',''),(957,227,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-56-15 PM.png','21-January-2019-8:56:13 PM','PASS',88,207,'15 Jan 2019 Testcase','\0',''),(958,227,'Substring \"\" is present in string \"asp\"','C:AFTReportsStringContains_Jan 21, 2019, 8-56-15 PM.png','21-January-2019-8:56:15 PM','PASS',88,207,'15 Jan 2019 Testcase','',''),(959,227,'Successfully waited for 5 Sec.','C:AFTReportsWait_Sec_Jan 21, 2019, 8-56-21 PM.png','21-January-2019-8:56:16 PM','PASS',88,207,'15 Jan 2019 Testcase','',''),(960,227,'Successfully Launched Application. https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','C:AFTReportsLaunch_Jan 21, 2019, 8-56-25 PM.png','21-January-2019-8:56:21 PM','PASS',88,207,'15 Jan 2019 Testcase','\0',''),(978,232,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Feb 04, 2019, 4-02-17 AM.png','04-February-2019-4:02:09 AM','PASS',96,213,'14 Jan 2019 Testcase','\0',''),(979,232,' value has been set at Search Box','C:AFTReportsSetValue_Feb 04, 2019, 4-02-17 AM.png','04-February-2019-4:02:17 AM','PASS',96,213,'14 Jan 2019 Testcase','\0',''),(980,233,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Feb 04, 2019, 4-03-02 AM.png','04-February-2019-4:02:56 AM','PASS',96,214,'14 Jan 2019 Testcase','\0',''),(981,233,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Feb 04, 2019, 4-03-04 AM.png','04-February-2019-4:03:02 AM','PASS',96,214,'14 Jan 2019 Testcase','\0',''),(982,233,' value has been set at Search Box','C:AFTReportsSetValue_Feb 04, 2019, 4-03-04 AM.png','04-February-2019-4:03:04 AM','PASS',96,214,'14 Jan 2019 Testcase','\0',''),(983,234,'Successfully Launched Application. http://www.google.com','C:AFTReportsLaunch_Feb 04, 2019, 4-05-41 AM.png','04-February-2019-4:05:35 AM','PASS',96,215,'14 Jan 2019 Testcase','\0',''),(984,234,'Successfully waited for 2 Sec.','C:AFTReportsWait_Sec_Feb 04, 2019, 4-05-44 AM.png','04-February-2019-4:05:42 AM','PASS',96,215,'14 Jan 2019 Testcase','\0',''),(985,234,'latest book value has been set at Search Box','C:AFTReportsSetValue_Feb 04, 2019, 4-05-44 AM.png','04-February-2019-4:05:44 AM','PASS',96,215,'14 Jan 2019 Testcase','\0',''),(986,234,'Successfully Clicked on Search Button','C:AFTReportsClick_Feb 04, 2019, 4-05-51 AM.png','04-February-2019-4:05:44 AM','PASS',96,215,'14 Jan 2019 Testcase','\0','');
/*!40000 ALTER TABLE `execution_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_master`
--

DROP TABLE IF EXISTS `execution_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_master` (
  `executionID` int(11) NOT NULL AUTO_INCREMENT,
  `scenarioID` int(11) NOT NULL,
  `loggedInUser` varchar(45) NOT NULL,
  `tcID` int(11) NOT NULL,
  `scenarioName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`executionID`),
  KEY `fk_user_idx` (`loggedInUser`),
  CONSTRAINT `fk_user` FOREIGN KEY (`loggedInUser`) REFERENCES `user_master` (`lanID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_master`
--

LOCK TABLES `execution_master` WRITE;
/*!40000 ALTER TABLE `execution_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_runmaster`
--

DROP TABLE IF EXISTS `execution_runmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_runmaster` (
  `executionRunID` int(64) NOT NULL AUTO_INCREMENT,
  `userID` varchar(45) DEFAULT NULL,
  `projectID` int(11) DEFAULT NULL,
  `executionStatus` varchar(45) DEFAULT NULL,
  `execution_startTime` varchar(45) DEFAULT NULL,
  `execution_EndTime` varchar(45) DEFAULT NULL,
  `scrshotupdate` bit(1) DEFAULT b'0',
  PRIMARY KEY (`executionRunID`),
  KEY `fk_ProjectID_idx` (`projectID`),
  KEY `fk_UserID_idx` (`userID`),
  CONSTRAINT `fk_ProjectID` FOREIGN KEY (`projectID`) REFERENCES `project_master` (`projectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserID` FOREIGN KEY (`userID`) REFERENCES `user_master` (`lanID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_runmaster`
--

LOCK TABLES `execution_runmaster` WRITE;
/*!40000 ALTER TABLE `execution_runmaster` DISABLE KEYS */;
INSERT INTO `execution_runmaster` VALUES (213,'s123',23,'PASS','12_January_2019_9:28:12 PM','12_January_2019_9:28:33 PM','\0'),(214,'s123',23,'PASS','12_January_2019_9:33:29 PM','12_January_2019_9:33:49 PM','\0'),(215,'s123',23,'PASS','12_January_2019_9:35:17 PM','12_January_2019_9:35:37 PM','\0'),(216,'s123',23,'PASS','12_January_2019_9:47:06 PM','12_January_2019_9:47:28 PM','\0'),(217,'s123',23,'PASS','12_January_2019_9:54:18 PM','12_January_2019_9:54:44 PM','\0'),(218,'s123',23,NULL,'14_January_2019_10:20:41 PM',NULL,'\0'),(219,'s123',23,'PASS','15_January_2019_8:43:55 PM','15_January_2019_8:44:30 PM','\0'),(220,'s123',23,'PASS','15_January_2019_8:47:08 PM','15_January_2019_8:47:40 PM','\0'),(221,'s123',23,'PASS','15_January_2019_8:50:02 PM','15_January_2019_8:50:34 PM','\0'),(222,'s123',23,'PASS','15_January_2019_9:23:23 PM','15_January_2019_9:23:55 PM','\0'),(223,'s123',23,'PASS','21_January_2019_8:54:40 PM','21_January_2019_8:54:40 PM','\0'),(224,'s123',23,'PASS','21_January_2019_8:54:46 PM','21_January_2019_8:54:46 PM','\0'),(225,'s123',23,'PASS','21_January_2019_8:54:51 PM','21_January_2019_8:55:29 PM','\0'),(226,'s123',23,'PASS','21_January_2019_8:55:34 PM','21_January_2019_8:55:34 PM','\0'),(227,'s123',23,'PASS','21_January_2019_8:55:54 PM','21_January_2019_8:56:26 PM','\0'),(231,'s123',25,'PASS','30_January_2019_9:08:25 PM','30_January_2019_9:08:25 PM','\0'),(232,'s123',26,'FAIL','04_February_2019_4:02:09 AM','04_February_2019_4:02:23 AM','\0'),(233,'s123',26,'FAIL','04_February_2019_4:02:56 AM','04_February_2019_4:03:10 AM','\0'),(234,'s123',26,'PASS','04_February_2019_4:05:35 AM','04_February_2019_4:05:52 AM','\0');
/*!40000 ALTER TABLE `execution_runmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_step_details`
--

DROP TABLE IF EXISTS `execution_step_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_step_details` (
  `ID` int(11) NOT NULL,
  `executiontestID` int(11) DEFAULT NULL,
  `stepid` varchar(11) DEFAULT NULL,
  `step_event` varchar(255) DEFAULT NULL,
  `step_object` varchar(255) DEFAULT NULL,
  `step_data` varchar(255) DEFAULT NULL,
  `step_component_name` varchar(255) DEFAULT NULL,
  `step_status` varchar(255) DEFAULT NULL,
  `step_screenshots` varchar(45) DEFAULT NULL,
  `testParameter1` varchar(255) DEFAULT NULL,
  `testParameter2` varchar(255) DEFAULT NULL,
  `testParameter3` varchar(255) DEFAULT NULL,
  `testParameter4` varchar(255) DEFAULT NULL,
  `testParameter5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_step_details`
--

LOCK TABLES `execution_step_details` WRITE;
/*!40000 ALTER TABLE `execution_step_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_step_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_test_details`
--

DROP TABLE IF EXISTS `execution_test_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_test_details` (
  `executiontestID` int(11) NOT NULL,
  `executionID` int(11) DEFAULT NULL,
  `testcaseID` int(11) DEFAULT NULL,
  `testObjective` varchar(45) DEFAULT NULL,
  `ProjectName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`executiontestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_test_details`
--

LOCK TABLES `execution_test_details` WRITE;
/*!40000 ALTER TABLE `execution_test_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_test_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `itemmaster`
--

DROP TABLE IF EXISTS `itemmaster`;
/*!50001 DROP VIEW IF EXISTS `itemmaster`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `itemmaster` AS SELECT 
 1 AS `ItemName`,
 1 AS `ItemID`,
 1 AS `ItemDescription`,
 1 AS `ItemType`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `names_detail`
--

DROP TABLE IF EXISTS `names_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `names_detail` (
  `namesID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `refersTo` varchar(255) DEFAULT NULL,
  `nameRefValue` varchar(255) DEFAULT NULL,
  `nameRefFormula` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`namesID`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `refersTo_UNIQUE` (`refersTo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `names_detail`
--

LOCK TABLES `names_detail` WRITE;
/*!40000 ALTER TABLE `names_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `names_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_master`
--

DROP TABLE IF EXISTS `object_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_master` (
  `objectID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) DEFAULT NULL,
  `objectLogicalName` varchar(255) DEFAULT NULL,
  `objectType` varchar(50) DEFAULT NULL,
  `propertyName` varchar(100) DEFAULT NULL,
  `propertyValue` varchar(250) DEFAULT NULL,
  `index` int(11) DEFAULT '0',
  `property2Name` varchar(100) DEFAULT NULL,
  `property2Value` varchar(250) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `property3Name` varchar(100) DEFAULT NULL,
  `property3Value` varchar(250) DEFAULT NULL,
  `property4Value` varchar(250) DEFAULT NULL,
  `property5Name` varchar(100) DEFAULT NULL,
  `property5Value` varchar(250) DEFAULT NULL,
  `property6Name` varchar(100) DEFAULT NULL,
  `property6Value` varchar(250) DEFAULT NULL,
  `property7Name` varchar(100) DEFAULT NULL,
  `property7Value` varchar(250) DEFAULT NULL,
  `property8Name` varchar(100) DEFAULT NULL,
  `property8Value` varchar(250) DEFAULT NULL,
  `property4Name` varchar(100) DEFAULT NULL,
  `objecttypeID` int(11) DEFAULT NULL,
  `propertyIsValid` varchar(3) DEFAULT NULL,
  `property2IsValid` varchar(3) DEFAULT NULL,
  `property3IsValid` varchar(3) DEFAULT NULL,
  `property4IsValid` varchar(3) DEFAULT NULL,
  `property5IsValid` varchar(3) DEFAULT NULL,
  `property6IsValid` varchar(3) DEFAULT NULL,
  `property7IsValid` varchar(3) DEFAULT NULL,
  `property8IsValid` varchar(3) DEFAULT NULL,
  `framePath` varchar(45) DEFAULT NULL,
  `frameIndex` varchar(45) DEFAULT NULL,
  `property9Name` varchar(45) DEFAULT NULL,
  `property9Value` varchar(45) DEFAULT NULL,
  `property10Name` varchar(45) DEFAULT NULL,
  `property10Value` varchar(45) DEFAULT NULL,
  `property11Name` varchar(45) DEFAULT NULL,
  `property11Value` varchar(45) DEFAULT NULL,
  `property12Name` varchar(45) DEFAULT NULL,
  `property12Value` varchar(45) DEFAULT NULL,
  `property13Name` varchar(45) DEFAULT NULL,
  `property13Value` varchar(45) DEFAULT NULL,
  `property14Name` varchar(45) DEFAULT NULL,
  `property14Value` varchar(45) DEFAULT NULL,
  `property15Name` varchar(45) DEFAULT NULL,
  `property15Value` varchar(45) DEFAULT NULL,
  `property16Name` varchar(45) DEFAULT NULL,
  `property16Value` varchar(45) DEFAULT NULL,
  `property17Name` varchar(45) DEFAULT NULL,
  `property17Value` varchar(45) DEFAULT NULL,
  `property18Name` varchar(45) DEFAULT NULL,
  `property18Value` varchar(45) DEFAULT NULL,
  `property19Name` varchar(45) DEFAULT NULL,
  `property19Value` varchar(45) DEFAULT NULL,
  `property20Name` varchar(45) DEFAULT NULL,
  `property20Value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`objectID`),
  KEY `fk_objectReository_object_master` (`pageID`),
  KEY `fk_objectRepository_object_master` (`pageID`),
  CONSTRAINT `fk_objectRepository_object_master` FOREIGN KEY (`pageID`) REFERENCES `object_repository` (`pageID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_master`
--

LOCK TABLES `object_master` WRITE;
/*!40000 ALTER TABLE `object_master` DISABLE KEYS */;
INSERT INTO `object_master` VALUES (160,98,'Search Box','textbox','name','q',0,'','','','','','','','','','','','','','',NULL,'','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,98,'Search Button','button','name','btnK',0,'','','','','','','','','','','','','','',NULL,'','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,100,'Search','input','class','gLFyf gsfi',0,'maxlength','2048','name','q','text','jsaction','paste:puy29d','aria-autocomplete','both','aria-haspopup','false','autocapitalize','off','type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,100,'input','input','class','gLFyf gsfi',0,'maxlength','2048','name','q','text','jsaction','paste:puy29d','aria-autocomplete','both','aria-haspopup','false','autocapitalize','off','type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,100,NULL,'span',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,119,'Search Button','input','name','btnK',0,'','','','','','','','','','','','','','',NULL,'','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,119,'Search Box','input','name','q',0,'','','','','','','','','','','','','','',NULL,'','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,121,'Search','input','class','gLFyf gsfi',0,'maxlength','2048','name','q','text','jsaction','paste:puy29d','aria-autocomplete','both','aria-haspopup','false','autocapitalize','off','type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,122,'Search','input','class','gLFyf gsfi',0,'maxlength','2048','name','q','text','jsaction','paste:puy29d','aria-autocomplete','both','aria-haspopup','false','autocapitalize','off','type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,122,'input','input','class','gLFyf gsfi',0,'maxlength','2048','name','q','text','jsaction','paste:puy29d','aria-autocomplete','both','aria-haspopup','false','autocapitalize','off','type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,122,'Google Search','input','value','Google Search',0,'aria-label','Google Search','name','btnK','submit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,123,'Search','input','class','gLFyf gsfi',0,'maxlength','2048','name','q','text','jsaction','paste:puy29d','aria-autocomplete','both','aria-haspopup','false','autocapitalize','off','type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,121,'input','input','class','gLFyf gsfi',0,'maxlength','2048','name','q','text','jsaction','paste:puy29d','aria-autocomplete','both','aria-haspopup','false','autocapitalize','off','type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,121,'Google Search','input','value','Google Search',0,'aria-label','Google Search','name','btnK','submit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'type',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `object_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_repository`
--

DROP TABLE IF EXISTS `object_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_repository` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(100) DEFAULT NULL,
  `projectID` int(32) DEFAULT NULL,
  `pageTitle` varchar(100) DEFAULT NULL,
  `pageDescription` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pageID`),
  KEY `fk_Page_Project_ProjectID_idx` (`projectID`),
  CONSTRAINT `fk_Page_Project_ProjectID` FOREIGN KEY (`projectID`) REFERENCES `project_master` (`projectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_repository`
--

LOCK TABLES `object_repository` WRITE;
/*!40000 ALTER TABLE `object_repository` DISABLE KEYS */;
INSERT INTO `object_repository` VALUES (98,'12 jan 2019 OBJ',23,'Obj','Test'),(100,'Google',18,'Google',''),(119,'12 jan 2019 OBJ',26,'test','test'),(121,'Google',25,'Google',''),(122,'Google',23,'Google',''),(123,'Google',26,'Google','');
/*!40000 ALTER TABLE `object_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objecttype`
--

DROP TABLE IF EXISTS `objecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objecttype` (
  `objecttypeID` int(32) NOT NULL AUTO_INCREMENT,
  `objecttypeName` varchar(45) DEFAULT NULL,
  `eventID` int(32) NOT NULL,
  PRIMARY KEY (`objecttypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objecttype`
--

LOCK TABLES `objecttype` WRITE;
/*!40000 ALTER TABLE `objecttype` DISABLE KEYS */;
INSERT INTO `objecttype` VALUES (1,'textbox',1),(2,'button',1),(3,'password',1),(4,'link',1),(5,'span',1),(6,'cssselector',1),(7,'checkbox',1),(8,'combobox',1),(9,'div',1),(10,'radiobutton',1),(11,'table',1),(12,'textarea',1),(13,'input',1),(14,'a',1),(15,'b',1),(16,'h3',1);
/*!40000 ALTER TABLE `objecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_master`
--

DROP TABLE IF EXISTS `project_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_master` (
  `projectID` int(32) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(45) DEFAULT NULL,
  `Lan_ID` varchar(45) NOT NULL,
  `projectSummary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`projectID`),
  KEY `fk_lanid.Lan_ID` (`Lan_ID`),
  CONSTRAINT `fk_lan_id.LanID` FOREIGN KEY (`Lan_ID`) REFERENCES `user_master` (`lanID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_master`
--

LOCK TABLES `project_master` WRITE;
/*!40000 ALTER TABLE `project_master` DISABLE KEYS */;
INSERT INTO `project_master` VALUES (18,'TEST google','tester',NULL),(23,'12 JAN 2019','s123','DEMO'),(25,'test','s123',NULL),(26,'4 feb 2019','s123','');
/*!40000 ALTER TABLE `project_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_userrelationship`
--

DROP TABLE IF EXISTS `project_userrelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_userrelationship` (
  `projectuserID` int(32) NOT NULL AUTO_INCREMENT,
  `lanID` int(32) NOT NULL,
  `projectID` int(32) DEFAULT NULL,
  PRIMARY KEY (`projectuserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_userrelationship`
--

LOCK TABLES `project_userrelationship` WRITE;
/*!40000 ALTER TABLE `project_userrelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_userrelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runmaster`
--

DROP TABLE IF EXISTS `runmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runmaster` (
  `executionRunID` int(64) NOT NULL AUTO_INCREMENT,
  `userID` varchar(45) NOT NULL,
  `clientID` varchar(45) NOT NULL,
  `timeStamp` varchar(45) NOT NULL,
  PRIMARY KEY (`executionRunID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runmaster`
--

LOCK TABLES `runmaster` WRITE;
/*!40000 ALTER TABLE `runmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `runmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario`
--

DROP TABLE IF EXISTS `scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario` (
  `scenarioID` int(11) NOT NULL AUTO_INCREMENT,
  `scenarioName` varchar(45) DEFAULT NULL,
  `projectID` int(11) DEFAULT NULL,
  `scenarioDescription` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`scenarioID`),
  KEY `fk_project_scenario` (`projectID`),
  CONSTRAINT `fk_project_scenario` FOREIGN KEY (`projectID`) REFERENCES `project_master` (`projectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario`
--

LOCK TABLES `scenario` WRITE;
/*!40000 ALTER TABLE `scenario` DISABLE KEYS */;
INSERT INTO `scenario` VALUES (88,'12 JAN 2019 test suite',23,'Demo'),(92,'test',25,''),(95,'123',25,''),(96,'123',26,'');
/*!40000 ALTER TABLE `scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenariorunmaster`
--

DROP TABLE IF EXISTS `scenariorunmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenariorunmaster` (
  `scnRUNID` int(11) NOT NULL AUTO_INCREMENT,
  `scenarioID` int(11) NOT NULL,
  `suiteID` int(11) DEFAULT NULL,
  `lanID` varchar(45) NOT NULL,
  `aftID` varchar(45) DEFAULT NULL,
  `scnStatus` varchar(45) DEFAULT NULL,
  `scnExecutionTimeStamp` varchar(45) DEFAULT NULL,
  `clientID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`scnRUNID`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenariorunmaster`
--

LOCK TABLES `scenariorunmaster` WRITE;
/*!40000 ALTER TABLE `scenariorunmaster` DISABLE KEYS */;
INSERT INTO `scenariorunmaster` VALUES (74,40,NULL,'sathikali','s123','FAIL','26_September_2018_10:55:27 PM',NULL),(75,40,NULL,'sathikali','s123','FAIL','26_September_2018_10:56:08 PM',NULL),(76,40,NULL,'sathikali','s123','FAIL','26_September_2018_10:56:14 PM',NULL),(77,40,NULL,'sathikali','s123','FAIL','26_September_2018_10:58:00 PM',NULL),(78,40,NULL,'sathikali','s123','PASS','02_October_2018_11:31:33 PM',NULL),(79,40,NULL,'sathikali','s123','PASS','08_October_2018_5:29:46 AM',NULL),(80,40,NULL,'sathikali','s123','FAIL','08_October_2018_5:30:00 AM',NULL),(81,41,NULL,'sathikali','s123','PASS','15_November_2018_11:12:05 AM',NULL),(82,41,NULL,'sathikali','s123','PASS','17_November_2018_9:29:30 AM',NULL),(83,41,NULL,'sathikali','s123','FAIL','27_November_2018_10:31:34 AM',NULL),(84,41,NULL,'sathikali','s123','FAIL','27_November_2018_11:44:08 AM',NULL),(85,42,NULL,'sathikali','s123','FAIL','30_November_2018_11:51:04 AM',NULL),(86,42,NULL,'sathikali','s123','FAIL','30_November_2018_11:52:11 AM',NULL),(87,41,NULL,'sathikali','s123','FAIL','30_November_2018_11:52:52 AM',NULL),(88,42,NULL,'sathikali','s123','FAIL','11_December_2018_8:29:13 PM',NULL),(89,42,NULL,'sathikali','s123','FAIL','11_December_2018_8:30:50 PM',NULL),(90,40,NULL,'sathikali','s123','FAIL','11_December_2018_9:12:58 PM',NULL),(91,44,NULL,'sathikali','s123',NULL,'11_December_2018_9:58:19 PM',NULL),(92,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:02:44 PM',NULL),(93,44,NULL,'sathikali','s123',NULL,'11_December_2018_10:05:54 PM',NULL),(94,44,NULL,'sathikali','s123',NULL,'11_December_2018_10:05:54 PM',NULL),(95,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:07:05 PM',NULL),(96,44,NULL,'sathikali','s123','PASS','11_December_2018_10:07:05 PM',NULL),(97,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:07:57 PM',NULL),(98,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:13:44 PM',NULL),(99,44,NULL,'sathikali','s123','PASS','11_December_2018_10:14:25 PM',NULL),(100,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:15:00 PM',NULL),(101,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:16:14 PM',NULL),(102,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:20:52 PM',NULL),(103,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:27:30 PM',NULL),(104,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:28:49 PM',NULL),(105,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:30:59 PM',NULL),(106,44,NULL,'sathikali','s123',NULL,'11_December_2018_10:31:57 PM',NULL),(107,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:32:48 PM',NULL),(108,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:42:54 PM',NULL),(109,44,NULL,'sathikali','s123','FAIL','11_December_2018_10:43:48 PM',NULL),(110,45,NULL,'sathikali','s123','FAIL','11_December_2018_10:45:51 PM',NULL),(111,45,NULL,'sathikali','s123','FAIL','11_December_2018_10:56:10 PM',NULL),(112,45,NULL,'sathikali','s123','PASS','11_December_2018_11:01:43 PM',NULL),(113,45,NULL,'sathikali','s123','PASS','11_December_2018_11:01:57 PM',NULL),(114,45,NULL,'sathikali','s123','PASS','11_December_2018_11:02:12 PM',NULL),(115,46,NULL,'sathikali','s123','PASS','11_December_2018_11:03:03 PM',NULL),(116,47,NULL,'sathikali','s123','PASS','11_December_2018_11:50:17 PM',NULL),(117,47,NULL,'sathikali','s123','PASS','12_December_2018_5:37:05 AM',NULL),(118,47,NULL,'sathikali','s123','PASS','12_December_2018_5:40:28 AM',NULL),(119,47,NULL,'sathikali','s123','PASS','12_December_2018_5:42:28 AM',NULL),(120,48,NULL,'sathikali','s123','PASS','12_December_2018_5:50:10 AM',NULL),(121,48,NULL,'sathikali','s123','PASS','12_December_2018_5:52:39 AM',NULL),(122,48,NULL,'sathikali','s123','PASS','12_December_2018_6:00:18 AM',NULL),(123,47,NULL,'sathikali','s123','PASS','12_December_2018_6:02:11 AM',NULL),(124,47,NULL,'sathikali','s123','PASS','12_December_2018_6:03:06 AM',NULL),(125,48,NULL,'sathikali','s123','PASS','12_December_2018_6:07:44 AM',NULL),(126,48,NULL,'sathikali','s123','PASS','12_December_2018_6:10:27 AM',NULL),(127,48,NULL,'sathikali','s123','PASS','12_December_2018_6:11:38 AM',NULL),(128,48,NULL,'sathikali','s123','PASS','12_December_2018_6:15:39 AM',NULL),(129,48,NULL,'sathikali','s123','PASS','12_December_2018_6:20:01 AM',NULL),(130,48,NULL,'sathikali','s123',NULL,'12_December_2018_6:21:53 AM',NULL),(131,48,NULL,'sathikali','s123',NULL,'12_December_2018_6:22:31 AM',NULL),(132,48,NULL,'sathikali','s123',NULL,'12_December_2018_6:22:32 AM',NULL),(133,48,NULL,'sathikali','s123','PASS','12_December_2018_6:23:15 AM',NULL),(134,48,NULL,'sathikali','s123','PASS','12_December_2018_6:24:37 AM',NULL),(135,48,NULL,'sathikali','s123','FAIL','12_December_2018_6:49:44 AM',NULL),(136,48,NULL,'sathikali','s123','FAIL','12_December_2018_6:52:02 AM',NULL),(137,48,NULL,'sathikali','s123','FAIL','12_December_2018_6:52:58 AM',NULL),(138,48,NULL,'sathikali','s123','FAIL','12_December_2018_6:56:06 AM',NULL),(139,48,NULL,'sathikali','s123','FAIL','12_December_2018_8:59:56 AM',NULL),(140,48,NULL,'sathikali','s123','FAIL','12_December_2018_10:27:43 AM',NULL),(141,48,NULL,'sathikali','s123','PASS','12_December_2018_10:46:06 AM',NULL),(142,49,NULL,'sathikali','s123','PASS','12_December_2018_10:48:16 AM',NULL),(143,50,NULL,'sathikali','s123','PASS','12_December_2018_10:51:44 AM',NULL),(144,50,NULL,'sathikali','s123','PASS','12_December_2018_10:55:09 AM',NULL),(145,51,NULL,'sathikali','s123','PASS','12_December_2018_10:57:55 AM',NULL),(146,52,NULL,'sathikali','s123','PASS','12_December_2018_11:06:57 AM',NULL),(147,46,NULL,'sathikali','s123','PASS','13_December_2018_9:01:46 PM',NULL),(148,46,NULL,'sathikali','s123','PASS','13_December_2018_9:04:22 PM',NULL),(149,53,NULL,'sathikali','s123','PASS','13_December_2018_9:05:34 PM',NULL),(150,53,NULL,'sathikali','s123','PASS','13_December_2018_9:12:30 PM',NULL),(151,53,NULL,'sathikali','s123','FAIL','13_December_2018_9:13:38 PM',NULL),(152,53,NULL,'sathikali','s123','FAIL','13_December_2018_9:15:42 PM',NULL),(153,53,NULL,'sathikali','s123','PASS','13_December_2018_9:16:25 PM',NULL),(154,54,NULL,'sathikali','s123','PASS','14_December_2018_9:48:13 PM',NULL),(155,54,NULL,'sathikali','s123','PASS','14_December_2018_9:50:06 PM',NULL),(156,55,NULL,'sathikali','s123','PASS','17_December_2018_4:17:13 AM',NULL),(157,43,NULL,'sathikali','s123','PASS','20_December_2018_3:53:59 AM',NULL),(158,67,NULL,'sathikali','s123','PASS','20_December_2018_4:13:39 AM',NULL),(159,67,NULL,'sathikali','s123','PASS','20_December_2018_4:15:24 AM',NULL),(160,68,NULL,'sathikali','s123','PASS','20_December_2018_4:25:49 AM',NULL),(161,68,NULL,'sathikali','s123','PASS','20_December_2018_4:27:43 AM',NULL),(162,68,NULL,'sathikali','s123','PASS','20_December_2018_4:27:48 AM',NULL),(163,68,NULL,'sathikali','s123','PASS','20_December_2018_4:27:54 AM',NULL),(164,68,NULL,'sathikali','s123','PASS','20_December_2018_4:27:56 AM',NULL),(165,68,NULL,'sathikali','s123','PASS','20_December_2018_4:27:59 AM',NULL),(166,68,NULL,'sathikali','s123','PASS','20_December_2018_4:28:19 AM',NULL),(167,71,NULL,'sathikali','s123','PASS','20_December_2018_5:05:55 AM',NULL),(168,71,NULL,'sathikali','s123','PASS','20_December_2018_5:07:57 AM',NULL),(169,71,NULL,'sathikali','s123','PASS','20_December_2018_5:11:25 AM',NULL),(170,71,NULL,'sathikali','s123','PASS','20_December_2018_5:15:14 AM',NULL),(171,72,NULL,'sathikali','s123','PASS','20_December_2018_7:01:04 AM',NULL),(172,75,NULL,'sathikali','s123','PASS','20_December_2018_8:18:14 PM',NULL),(173,75,NULL,'sathikali','s123','PASS','20_December_2018_8:18:24 PM',NULL),(174,76,NULL,'sathikali','s123','PASS','20_December_2018_8:40:07 PM',NULL),(175,77,NULL,'sathikali','s123','PASS','21_December_2018_9:40:25 AM',NULL),(176,77,NULL,'sathikali','s123','PASS','21_December_2018_9:40:40 AM',NULL),(177,77,NULL,'sathikali','s123','PASS','21_December_2018_9:40:43 AM',NULL),(178,77,NULL,'sathikali','s123','FAIL','21_December_2018_9:42:04 AM',NULL),(179,77,NULL,'sathikali','s123','PASS','21_December_2018_9:42:45 AM',NULL),(180,77,NULL,'sathikali','s123','PASS','21_December_2018_9:42:49 AM',NULL),(181,77,NULL,'sathikali','s123','PASS','21_December_2018_9:45:00 AM',NULL),(182,77,NULL,'sathikali','s123','PASS','21_December_2018_9:50:07 AM',NULL),(183,77,NULL,'sathikali','s123','PASS','21_December_2018_9:50:27 AM',NULL),(184,77,NULL,'sathikali','s123','PASS','21_December_2018_9:51:24 AM',NULL),(185,77,NULL,'sathikali','s123','PASS','21_December_2018_9:52:37 AM',NULL),(186,77,NULL,'sathikali','s123','PASS','21_December_2018_9:55:36 AM',NULL),(187,77,NULL,'sathikali','s123','PASS','21_December_2018_9:56:25 AM',NULL),(188,77,NULL,'sathikali','s123','PASS','21_December_2018_9:56:45 AM',NULL),(189,77,NULL,'sathikali','s123','PASS','21_December_2018_9:56:49 AM',NULL),(190,77,NULL,'sathikali','s123','PASS','21_December_2018_9:56:51 AM',NULL),(191,77,NULL,'sathikali','s123','PASS','21_December_2018_9:56:54 AM',NULL),(192,77,NULL,'sathikali','s123','PASS','21_December_2018_9:56:58 AM',NULL),(193,77,NULL,'sathikali','s123','PASS','21_December_2018_9:57:01 AM',NULL),(194,77,NULL,'sathikali','s123','PASS','21_December_2018_9:17:50 PM',NULL),(195,77,NULL,'sathikali','s123','PASS','21_December_2018_9:18:12 PM',NULL),(196,78,NULL,'sathikali','s123',NULL,'22_December_2018_1:13:57 AM',NULL),(197,78,NULL,'sathikali','s123','PASS','22_December_2018_1:14:57 AM',NULL),(198,79,NULL,'sathikali','s123','PASS','22_December_2018_2:44:31 AM',NULL),(199,80,NULL,'sathikali','s123','PASS','22_December_2018_3:42:22 AM',NULL),(200,80,NULL,'sathikali','s123','PASS','22_December_2018_3:44:52 AM',NULL),(201,80,NULL,'sathikali','s123','PASS','22_December_2018_6:51:17 AM',NULL),(202,80,NULL,'sathikali','s123','PASS','22_December_2018_6:51:47 AM',NULL),(203,80,NULL,'sathikali','s123','PASS','22_December_2018_6:52:26 AM',NULL),(204,80,NULL,'sathikali','s123','PASS','22_December_2018_6:52:56 AM',NULL),(205,80,NULL,'sathikali','s123','PASS','22_December_2018_7:13:49 AM',NULL),(206,80,NULL,'sathikali','s123','PASS','22_December_2018_7:13:57 AM',NULL),(207,80,NULL,'sathikali','s123','PASS','22_December_2018_7:15:05 AM',NULL),(208,80,NULL,'sathikali','s123','PASS','24_December_2018_11:08:46 PM',NULL),(209,80,NULL,'sathikali','s123','PASS','24_December_2018_11:17:27 PM',NULL),(210,80,NULL,'sathikali','s123','PASS','24_December_2018_11:17:51 PM',NULL),(211,80,NULL,'sathikali','s123','PASS','26_December_2018_8:58:22 PM',NULL),(212,80,NULL,'sathikali','s123','PASS','26_December_2018_8:58:48 PM',NULL),(213,80,NULL,'sathikali','s123','PASS','27_December_2018_1:16:01 AM',NULL),(214,80,NULL,'sathikali','s123','PASS','27_December_2018_1:47:40 AM',NULL),(215,80,NULL,'sathikali','s123',NULL,'27_December_2018_1:48:34 AM',NULL),(216,80,NULL,'sathikali','s123','PASS','27_December_2018_1:49:08 AM',NULL),(217,85,NULL,'sathikali','s123','PASS','28_December_2018_8:35:24 PM',NULL),(218,85,NULL,'sathikali','s123','PASS','29_December_2018_4:27:02 AM',NULL),(219,85,NULL,'sathikali','s123','FAIL','29_December_2018_5:03:43 AM',NULL),(220,85,NULL,'sathikali','s123','FAIL','29_December_2018_5:04:20 AM',NULL),(221,85,NULL,'sathikali','s123','FAIL','29_December_2018_5:05:43 AM',NULL),(222,85,NULL,'sathikali','s123','PASS','29_December_2018_5:10:17 AM',NULL),(223,85,NULL,'sathikali','s123','PASS','01_January_2019_8:42:39 PM',NULL),(224,85,NULL,'sathikali','s123','PASS','01_January_2019_8:44:37 PM',NULL),(225,85,NULL,'sathikali','s123','PASS','01_January_2019_8:45:56 PM',NULL),(226,85,NULL,'sathikali','s123','PASS','01_January_2019_8:49:08 PM',NULL),(227,85,NULL,'sathikali','s123','PASS','01_January_2019_10:31:26 PM',NULL),(228,85,NULL,'sathikali','s123','PASS','01_January_2019_11:25:38 PM',NULL),(229,85,NULL,'sathikali','s123','PASS','01_January_2019_11:26:56 PM',NULL),(230,85,NULL,'sathikali','s123','PASS','01_January_2019_11:27:49 PM',NULL),(231,85,NULL,'sathikali','s123','PASS','01_January_2019_11:28:26 PM',NULL),(232,85,NULL,'sathikali','s123','PASS','03_January_2019_5:51:27 AM',NULL),(233,87,NULL,'sathikali','s123','PASS','03_January_2019_9:16:13 PM',NULL),(234,87,NULL,'sathikali','s123','FAIL','08_January_2019_12:57:50 AM',NULL),(235,87,NULL,'sathikali','s123','FAIL','08_January_2019_1:46:57 AM',NULL),(236,87,NULL,'sathikali','s123','PASS','08_January_2019_1:48:27 AM',NULL),(237,87,NULL,'sathikali','s123','FAIL','08_January_2019_2:03:09 AM',NULL),(238,87,NULL,'sathikali','s123','PASS','08_January_2019_2:04:28 AM',NULL),(239,88,NULL,'sathikali','s123','PASS','12_January_2019_9:28:12 PM',NULL),(240,88,NULL,'sathikali','s123','PASS','12_January_2019_9:33:29 PM',NULL),(241,88,NULL,'sathikali','s123','PASS','12_January_2019_9:35:17 PM',NULL),(242,88,NULL,'sathikali','s123','PASS','12_January_2019_9:47:06 PM',NULL),(243,88,NULL,'sathikali','s123','PASS','12_January_2019_9:54:18 PM',NULL),(244,88,NULL,'sathikali','s123',NULL,'14_January_2019_10:20:41 PM',NULL),(245,88,NULL,'sathikali','s123','PASS','15_January_2019_8:43:55 PM',NULL),(246,88,NULL,'sathikali','s123','PASS','15_January_2019_8:47:08 PM',NULL),(247,88,NULL,'sathikali','s123','PASS','15_January_2019_8:50:02 PM',NULL),(248,88,NULL,'sathikali','s123','PASS','15_January_2019_9:23:23 PM',NULL),(249,89,NULL,'sathikali','s123','PASS','21_January_2019_8:54:40 PM',NULL),(250,89,NULL,'sathikali','s123','PASS','21_January_2019_8:54:46 PM',NULL),(251,88,NULL,'sathikali','s123','PASS','21_January_2019_8:54:51 PM',NULL),(252,89,NULL,'sathikali','s123','PASS','21_January_2019_8:55:34 PM',NULL),(253,88,NULL,'sathikali','s123','PASS','21_January_2019_8:55:54 PM',NULL),(254,90,NULL,'sathikali','s123','PASS','27_January_2019_10:35:28 PM',NULL),(255,90,NULL,'sathikali','s123','PASS','27_January_2019_10:36:32 PM',NULL),(256,90,NULL,'sathikali','s123','PASS','27_January_2019_10:40:09 PM',NULL),(257,91,NULL,'sathikali','s123','PASS','30_January_2019_9:08:25 PM',NULL),(258,96,NULL,'sathikali','s123','FAIL','04_February_2019_4:02:09 AM',NULL),(259,96,NULL,'sathikali','s123','FAIL','04_February_2019_4:02:56 AM',NULL),(260,96,NULL,'sathikali','s123','PASS','04_February_2019_4:05:35 AM',NULL);
/*!40000 ALTER TABLE `scenariorunmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_project`
--

DROP TABLE IF EXISTS `selected_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selected_project` (
  `idselected_project` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) DEFAULT NULL,
  `projectName` varchar(45) DEFAULT NULL,
  `Lan_ID` varchar(45) DEFAULT NULL,
  `projectSummary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idselected_project`),
  KEY `selected_projectfk_idx` (`projectID`),
  CONSTRAINT `selected_projectfk` FOREIGN KEY (`projectID`) REFERENCES `project_master` (`projectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_project`
--

LOCK TABLES `selected_project` WRITE;
/*!40000 ALTER TABLE `selected_project` DISABLE KEYS */;
INSERT INTO `selected_project` VALUES (53,25,'test','s123',' ');
/*!40000 ALTER TABLE `selected_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steprunmaster`
--

DROP TABLE IF EXISTS `steprunmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `steprunmaster` (
  `stepRUNID` int(11) NOT NULL AUTO_INCREMENT,
  `tcRUNID` int(11) DEFAULT NULL,
  `stepID` int(11) DEFAULT NULL,
  `stepStatus` varchar(45) DEFAULT NULL,
  `stExecutionTimeStamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stepRUNID`),
  KEY `fk_testcaseRUNMaster_stepRUNMaster` (`tcRUNID`),
  KEY `fk_step_stepRUNMaster` (`stepID`),
  CONSTRAINT `fk_testcaseRUNMaster_stepRUNMaster` FOREIGN KEY (`tcRUNID`) REFERENCES `testcaserunmaster` (`tcRUNID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steprunmaster`
--

LOCK TABLES `steprunmaster` WRITE;
/*!40000 ALTER TABLE `steprunmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `steprunmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suite_details`
--

DROP TABLE IF EXISTS `suite_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suite_details` (
  `suitedetailsID` int(11) NOT NULL,
  `suiteID` int(11) DEFAULT NULL,
  `testcaseID` int(11) DEFAULT NULL,
  `testSequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`suitedetailsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suite_details`
--

LOCK TABLES `suite_details` WRITE;
/*!40000 ALTER TABLE `suite_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `suite_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suite_master`
--

DROP TABLE IF EXISTS `suite_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suite_master` (
  `suiteID` int(11) NOT NULL AUTO_INCREMENT,
  `suiteName` varchar(45) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`suiteID`),
  KEY `fk_suite_project_projID_idx` (`ProjectID`),
  CONSTRAINT `fk_suite_project_projID` FOREIGN KEY (`ProjectID`) REFERENCES `project_master` (`projectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suite_master`
--

LOCK TABLES `suite_master` WRITE;
/*!40000 ALTER TABLE `suite_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `suite_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suite_testcase`
--

DROP TABLE IF EXISTS `suite_testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suite_testcase` (
  `suitecontentID` int(11) NOT NULL AUTO_INCREMENT,
  `testcaseID` int(11) NOT NULL,
  `suiteID` int(11) NOT NULL,
  `testSequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`suitecontentID`),
  KEY `fk_suiteID_idx` (`suiteID`),
  KEY `fk_testcaseID_idx` (`testcaseID`),
  CONSTRAINT `fk_suiteID` FOREIGN KEY (`suiteID`) REFERENCES `suite_master` (`suiteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_testcaseID` FOREIGN KEY (`testcaseID`) REFERENCES `testcase` (`testcaseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suite_testcase`
--

LOCK TABLES `suite_testcase` WRITE;
/*!40000 ALTER TABLE `suite_testcase` DISABLE KEYS */;
/*!40000 ALTER TABLE `suite_testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase`
--

DROP TABLE IF EXISTS `testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase` (
  `testcaseID` int(11) NOT NULL AUTO_INCREMENT,
  `testcaseName` varchar(255) NOT NULL,
  `testcaseDescription` varchar(5000) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `prerequisites` varchar(500) DEFAULT NULL,
  `scenarioID` int(11) DEFAULT NULL,
  `testcaseDeveloper` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`testcaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase`
--

LOCK TABLES `testcase` WRITE;
/*!40000 ALTER TABLE `testcase` DISABLE KEYS */;
INSERT INTO `testcase` VALUES (112,'14th Dec Testcase','','','',55,'s123'),(114,'14th Dec Testcase','','','',61,'s123'),(115,'20 Dec','','','',43,'s123'),(117,'20 Dec','','','',67,'s123'),(121,'20 Dec','','','',68,'s123'),(122,'20 Dec','','','',69,'s123'),(131,'20 Dec','','','',74,'s123'),(207,'15 Jan 2019 Testcase','','','',88,'s123'),(215,'14 Jan 2019 Testcase','','','',96,'s123');
/*!40000 ALTER TABLE `testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_detail`
--

DROP TABLE IF EXISTS `testcase_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_detail` (
  `testcase_detailID` int(11) NOT NULL AUTO_INCREMENT,
  `testcase_MasterID` int(11) DEFAULT NULL,
  `testcase_Steps` int(11) DEFAULT NULL,
  `testcase_Event` int(11) DEFAULT NULL,
  `testcase_Object` int(11) DEFAULT NULL,
  `testcase_Data` varchar(500) DEFAULT NULL,
  `testcase_Component` int(11) DEFAULT NULL,
  `testParameter1` varchar(255) DEFAULT NULL,
  `testParameter2` varchar(255) DEFAULT NULL,
  `testParameter3` varchar(255) DEFAULT NULL,
  `testParameter4` varchar(255) DEFAULT NULL,
  `testParameter5` varchar(255) DEFAULT NULL,
  `scrshot` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`testcase_detailID`),
  KEY `Testcase_Master_Detail_idx` (`testcase_MasterID`),
  KEY `Testcase_Event_Detail_idx` (`testcase_Event`),
  KEY `Testcase_Object_Detail_idx` (`testcase_Object`),
  CONSTRAINT `Testcase_Event_Detail` FOREIGN KEY (`testcase_Event`) REFERENCES `event_master` (`eventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Testcase_Master_Detail` FOREIGN KEY (`testcase_MasterID`) REFERENCES `testcase_master` (`testcase_masterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Testcase_Object_Detail` FOREIGN KEY (`testcase_Object`) REFERENCES `object_master` (`objectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_detail`
--

LOCK TABLES `testcase_detail` WRITE;
/*!40000 ALTER TABLE `testcase_detail` DISABLE KEYS */;
INSERT INTO `testcase_detail` VALUES (505,67,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,0),(506,67,2,236,NULL,'https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk',0,NULL,NULL,NULL,NULL,NULL,0),(512,79,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,0),(513,68,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `testcase_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_master`
--

DROP TABLE IF EXISTS `testcase_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_master` (
  `testcase_masterID` int(11) NOT NULL AUTO_INCREMENT,
  `testcase_Name` varchar(200) NOT NULL,
  `testcase_Objective` varchar(200) DEFAULT NULL,
  `testcase_Precondition` varchar(200) DEFAULT NULL,
  `testcase_Summary` varchar(500) DEFAULT NULL,
  `projectID` int(11) DEFAULT '0',
  PRIMARY KEY (`testcase_masterID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_master`
--

LOCK TABLES `testcase_master` WRITE;
/*!40000 ALTER TABLE `testcase_master` DISABLE KEYS */;
INSERT INTO `testcase_master` VALUES (67,'15 Jan 2019 Testcase','test','','google search',23),(68,'14 Jan 2019 Testcase','t','','t',23),(78,'14 Jan 2019 Testcase','t','','t',25),(79,'14 Jan 2019 Testcase','tc','','tc',26);
/*!40000 ALTER TABLE `testcase_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcasecontent`
--

DROP TABLE IF EXISTS `testcasecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcasecontent` (
  `testcaseContentID` int(11) NOT NULL AUTO_INCREMENT,
  `testcaseID` int(11) DEFAULT NULL,
  `objectID` int(11) DEFAULT NULL,
  `eventID` int(11) NOT NULL,
  `seqNum` int(11) DEFAULT NULL,
  `compoccurrence` int(11) DEFAULT NULL,
  `param1` varchar(500) DEFAULT NULL,
  `param2` varchar(255) DEFAULT NULL,
  `param3` varchar(255) DEFAULT NULL,
  `param4` varchar(255) DEFAULT NULL,
  `param5` varchar(255) DEFAULT NULL,
  `scrshot` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`testcaseContentID`),
  KEY `objectID` (`objectID`),
  KEY `eventID` (`eventID`),
  KEY `fk_step_testcaseContent_idx` (`testcaseID`),
  CONSTRAINT `fk_eventm_master_testcasecontent` FOREIGN KEY (`eventID`) REFERENCES `event_master` (`eventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_master_testcaseContent` FOREIGN KEY (`objectID`) REFERENCES `object_master` (`objectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_step_testcaseContent` FOREIGN KEY (`testcaseID`) REFERENCES `testcase` (`testcaseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=847 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcasecontent`
--

LOCK TABLES `testcasecontent` WRITE;
/*!40000 ALTER TABLE `testcasecontent` DISABLE KEYS */;
INSERT INTO `testcasecontent` VALUES (338,112,NULL,236,1,NULL,'https://google.com','','','','',''),(339,112,NULL,561,2,NULL,'3','','','','',''),(342,112,NULL,561,5,NULL,'3','','','','',''),(344,112,NULL,561,7,NULL,'50','','','','',''),(345,115,NULL,236,1,NULL,'https://www.amazon.com','','','','',''),(346,115,NULL,561,2,NULL,'4','','','','',''),(348,115,NULL,393,4,NULL,'Mobile Phone','','','','',''),(349,115,NULL,561,5,NULL,'3','','','','',''),(351,115,NULL,561,7,NULL,'3','','','','',''),(359,117,NULL,236,1,NULL,'https://www.amazon.com','','','','',''),(360,117,NULL,561,2,NULL,'4','','','','',''),(362,117,NULL,393,4,NULL,'Mobile Phone','','','','',''),(363,117,NULL,561,5,NULL,'3','','','','',''),(365,117,NULL,561,7,NULL,'3','','','','',''),(387,121,NULL,236,1,NULL,'https://www.amazon.com','','','','',''),(388,121,NULL,561,2,NULL,'10','','','','',''),(390,121,NULL,393,4,NULL,'Mobile Phone','','','','',''),(391,121,NULL,561,5,NULL,'10','','','','',''),(393,121,NULL,561,7,NULL,'10','','','','',''),(394,122,NULL,236,1,NULL,'https://www.amazon.com','','','','',''),(395,122,NULL,561,2,NULL,'10','','','','',''),(397,122,NULL,393,4,NULL,'Mobile Phone','','','','',''),(398,122,NULL,561,5,NULL,'10','','','','',''),(400,122,NULL,561,7,NULL,'10','','','','',''),(443,131,NULL,236,1,NULL,'https://www.amazon.com','','','','',''),(444,131,NULL,561,2,NULL,'15','','','','',''),(447,131,NULL,561,5,NULL,'10','','','','',''),(449,131,NULL,561,7,NULL,'10','','','','',''),(809,207,NULL,236,1,NULL,'http://www.google.com','','','','',''),(810,207,NULL,561,2,NULL,'2','','','','','\0'),(811,207,160,393,3,NULL,'asp .net book','','','','',''),(812,207,NULL,561,4,NULL,'2','','','','','\0'),(813,207,161,38,5,NULL,'','','','','',''),(814,207,NULL,561,6,NULL,'2','','','','','\0'),(815,207,160,417,7,NULL,'asp','','','','',''),(816,207,NULL,561,8,NULL,'5','','','','',''),(817,207,NULL,236,9,NULL,'https://www.google.com/search?source=hp&ei=JOE6XMDBJOea0gLZ8ZFg&q=asp.net+core+2.0+pdf+download&oq=asp.net&gs_l=psy-ab.1.0.35i39l2j0l8.3595.6139..9040...1.0..0.120.550.7j1......0....1..gws-wiz.....6..0i131.fZ8mSeTO0Gk','','','','','\0'),(843,215,NULL,236,1,NULL,'http://www.google.com','','','','','\0'),(844,215,NULL,561,2,NULL,'2','','','','','\0'),(845,215,217,393,3,NULL,'latest book','','','','','\0'),(846,215,216,38,4,NULL,'','','','','','\0');
/*!40000 ALTER TABLE `testcasecontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcasecontentrun`
--

DROP TABLE IF EXISTS `testcasecontentrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcasecontentrun` (
  `tccRunID` int(11) NOT NULL AUTO_INCREMENT,
  `StepRUNID` int(11) DEFAULT NULL,
  `tccID` int(11) DEFAULT NULL,
  `tccStatus` varchar(3500) DEFAULT NULL,
  `ExecutionTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tccRunID`),
  KEY `fk_stepRUNMaster)testcaseContentRUN` (`StepRUNID`),
  KEY `fk_testcasecontent_testcaseRUNMaster` (`tccID`),
  CONSTRAINT `fk_stepRUNMaster)testcaseContentRUN` FOREIGN KEY (`StepRUNID`) REFERENCES `steprunmaster` (`stepRUNID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcasecontentrun`
--

LOCK TABLES `testcasecontentrun` WRITE;
/*!40000 ALTER TABLE `testcasecontentrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcasecontentrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcaserunmaster`
--

DROP TABLE IF EXISTS `testcaserunmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcaserunmaster` (
  `tcRUNID` int(11) NOT NULL AUTO_INCREMENT,
  `scRUNID` int(11) DEFAULT NULL,
  `tcID` int(11) DEFAULT NULL,
  `tcStatus` varchar(45) DEFAULT NULL,
  `tcExecutionTimeStamp` varchar(45) DEFAULT NULL,
  `aftID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tcRUNID`),
  KEY `fk_scenarioRUNMaster_testcaseRUNMaster` (`scRUNID`),
  KEY `fk_testcase_testcaseRUNMaster` (`tcID`),
  CONSTRAINT `fk_scenarioRUNMaster_testcaseRUNMaster` FOREIGN KEY (`scRUNID`) REFERENCES `scenariorunmaster` (`scnRUNID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcaserunmaster`
--

LOCK TABLES `testcaserunmaster` WRITE;
/*!40000 ALTER TABLE `testcaserunmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcaserunmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata` (
  `testDataID` int(11) NOT NULL AUTO_INCREMENT,
  `testcaseContentID` int(11) DEFAULT NULL,
  `eventParaID` int(11) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `formula` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`testDataID`),
  KEY `eventParaID` (`eventParaID`),
  KEY `testcaseContentID` (`testcaseContentID`),
  CONSTRAINT `fk_eventPara_testData` FOREIGN KEY (`eventParaID`) REFERENCES `event_parameter` (`eventParaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_testcaseContent_testData` FOREIGN KEY (`testcaseContentID`) REFERENCES `testcasecontent` (`testcaseContentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata`
--

LOCK TABLES `testdata` WRITE;
/*!40000 ALTER TABLE `testdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `testdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdatarun`
--

DROP TABLE IF EXISTS `testdatarun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdatarun` (
  `testDataRunID` int(11) NOT NULL AUTO_INCREMENT,
  `iterationNumber` int(11) DEFAULT NULL,
  `EventID` int(11) DEFAULT NULL,
  `ObjectID` int(11) DEFAULT NULL,
  `param1` varchar(1000) DEFAULT NULL,
  `param2` varchar(1000) DEFAULT NULL,
  `param3` varchar(1000) DEFAULT NULL,
  `param4` varchar(1000) DEFAULT NULL,
  `param5` varchar(1000) DEFAULT NULL,
  `param6` varchar(1000) DEFAULT NULL,
  `actualResult` varchar(255) DEFAULT NULL,
  `expectedResult` varchar(255) DEFAULT NULL,
  `executionTime` varchar(45) DEFAULT NULL,
  `testdataRunStatus` char(15) DEFAULT NULL,
  `linkPath` varchar(255) DEFAULT NULL,
  `tccRunID` int(11) DEFAULT NULL,
  PRIMARY KEY (`testDataRunID`),
  KEY `fk_tccRunId_testcasecontentrun.tccRunID` (`tccRunID`),
  CONSTRAINT `fk_tccRunId_testcasecontentrun.tccRunID` FOREIGN KEY (`tccRunID`) REFERENCES `testcasecontentrun` (`tccRunID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdatarun`
--

LOCK TABLES `testdatarun` WRITE;
/*!40000 ALTER TABLE `testdatarun` DISABLE KEYS */;
/*!40000 ALTER TABLE `testdatarun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_master` (
  `lanID` varchar(45) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `UserType` varchar(45) DEFAULT NULL,
  `projectID` int(32) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES ('s123','123','sathik','Admin',1,NULL),('sudip','sd123','sudip','Developer',0,'deb.sudipta04@gmail.com'),('tester','kditsolutions','sudipta ','Tester',0,'deb_sudip@hotmail.com');
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `variableID` int(11) NOT NULL AUTO_INCREMENT,
  `variableType` varchar(45) DEFAULT NULL,
  `variableName` varchar(45) DEFAULT NULL,
  `variableValue` varchar(1000) DEFAULT NULL,
  `iterationNumber` int(11) DEFAULT NULL,
  `scenarioID` int(11) DEFAULT NULL,
  PRIMARY KEY (`variableID`),
  KEY `fk_scenario_variable` (`scenarioID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'aft'
--

--
-- Dumping routines for database 'aft'
--
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
BEGIN 
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Authenticate_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Authenticate_User`( 
        IN chvlanID VARCHAR(15), 
        IN chvpassword VARCHAR(50),
        out o_resultStat INT
    )
BEGIN
        IF EXISTS(SELECT lanID FROM user_master  
                  WHERE binary lanID = chvlanID AND binary Password = chvpassword)
        Then
        SELECT lanID FROM user_master  
                  WHERE binary lanID = chvlanID AND binary Password = chvpassword;
            SELECT 1 into o_resultStat ;
        ELse
            SELECT 0 into o_resultStat ;
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `compResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `compResults`(
 IN i_tccRunID INT
)
BEGIN
SELECT * FROM complib_result_blockcontent where  tccRunID  = i_tccRunID;

SELECT td.value FROM complib_result_blockcontent bc  inner join testcasecontentrun tcc on bc.tccRunID=tcc.tccRunID
inner join testdata td On td.testcaseContentID = tcc.tccID where bc.tccRunID = i_tccRunID  Group By td.value ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCompData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCompData`()
BEGIN
Delete From  aft.complib_blockparamvalue;

Delete From  aft.complib_blockparameter;

Delete From  aft.complib_blockdata;


Delete From  aft.complib_blockcontent;

Delete From  aft.complib_block;


Delete From  aft.complib_page;


Delete From aft.variable;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteScenarioRUN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteScenarioRUN`(
                                                    IN i_keyIDforDeletion INT,
                                                    IN i_flag_DeleteALLRun CHAR(10)     -- Takes either TRUE or FALSE
                                                    )
BEGIN

-- ---------------------------------- Description of Proc --------------------------
-- Delete All Data from Run masters. 
-- Input would be either scenarioRUNID or scenarioID,in case of scenarioID- all run Data for that scenario gets deleted
-- in case of scenarioRUNID all data belongs to that RUN only gets deleted.
-- -----------------------------------------------------------------------------------

DECLARE scnRUN_NOT_FOUND INT DEFAULT 0;
DECLARE scenarioRUNID INT;

DECLARE scnCursor CURSOR
FOR
Select scnRUNID from `scenariorunmaster` where scenarioID = i_keyIDforDeletion;

DECLARE Continue HANDLER FOR NOT FOUND SET scnRUN_NOT_FOUND = 1 ;

    If Ucase(i_flag_DeleteALLRun) = "TRUE" then
        OPEN scnCursor;
            theLoop : LOOP
                FETCH from scnCursor INTO scenarioRUNID;
                    IF scnRUN_NOT_FOUND = 1 then
                        LEAVE theLoop;
                    END IF;
                        Call DeleteTestcaseRUN(scenarioRUNID,0);
            END LOOP;
        Close scnCursor;
        DELETE from scenariorunmaster where scenarioID = i_keyIDforDeletion ;
    ELSE
        Call DeleteTestcaseRUN(i_keyIDforDeletion,0);
        DELETE from scenariorunmaster where scnRUNID = i_keyIDforDeletion ;
    End IF ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteStepRUN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteStepRUN`(
                                                    IN i_testcaseRUNID INT
                                                        )
BEGIN

-- ---------------------------------- Description of Proc --------------------------
-- Delete All Data from StepRunmaster and other dependent RUN tables. 
-- Input would be testcaseRUNID, ALL the steps and contents of given testcaseContent gets Deleted
-- -----------------------------------------------------------------------------------

DECLARE stepRUN_NOT_FOUND INT DEFAULT 0;
DECLARE stRUNID INT;

DECLARE stepRUNCursor CURSOR
FOR
Select stepRUNID from steprunmaster  where tcRUNID = i_testcaseRUNID;

DECLARE Continue HANDLER for NOT FOUND SET stepRUN_NOT_FOUND = 1;

OPEN stepRUNCursor;
    theLOOP : LOOP
        FETCH from stepRUNCursor INTO stRUNID ;
            IF stepRUN_NOT_FOUND = 1 then
                LEAVE theLOOP;
            END IF;
            Call DeleteTestcaseContentRUN(stRUNID);
    End LOOP;
Close stepRUNCursor;

Delete from steprunmaster where tcRUNID = i_testcaseRUNID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteTestcaseContentRUN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteTestcaseContentRUN`(
                                                            IN i_stepRUNID INT
                                                            )
BEGIN

-- ---------------------------------- Description of Proc --------------------------
-- Delete All Data from testcasecontentRUN and other dependent RUN tables(testdatarun). 
-- Input would be stepRUN, ALL the Contents and Data given stepRUNID gets Deleted
-- -----------------------------------------------------------------------------------

DECLARE tccRUN_NOT_FOUND INT DEFAULT 0;
DECLARE testcaseContentRUNID INT;

DECLARE tccRUNCursor CURSOR
FOR
Select tccRUNID from testcasecontentrun where StepRUNID = i_stepRUNID;

DECLARE Continue HANDLER for NOT FOUND SET tccRUN_NOT_FOUND = 1;

OPEN tccRUNCursor;
    theLOOP : LOOP
        FETCH from tccRUNCursor INTO testcaseContentRUNID ;
            IF tccRUN_NOT_FOUND = 1 then
                LEAVE theLOOP;
            END IF;
            Call DeleteTestDataRUN(testcaseContentRUNID);
    END LOOP;
CLOSE tccRUNCursor;

Delete from testcasecontentrun where StepRUNID = i_stepRUNID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteTestcaseRUN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteTestcaseRUN`(
                                                    IN i_keyIDforDeletion INT,
                                                    IN i_flagForGivenID CHAR        -- 0: ScenarioRUNID, 1: TestcaseID, 2: TestcaseRUNID     
                                                    )
BEGIN

-- ---------------------------------- Description of Proc --------------------------
-- Delete All Data from TestcaseRun masters and other Dependent tables. 
-- Input would be either scenarioRUNID,tescaseID or testcaseRUNID,in case of scenarioRUNID- all testcaserun Data for that scenarioRUN gets deleted
-- in case of testcaseID all RUNdata belongs to that testcase  gets deleted.
-- In case of testcaseRUNID run Data belongs to that testcaseRUN ges deleted.
-- Second Parameter is flag for decision of which id has been given in i/p. 0 = ScenaioID,1 = Testcase ID, 2 = Testcase RUNID
-- -----------------------------------------------------------------------------------

DECLARE tcRUN_NOT_FOUND INT DEFAULT 0;
DECLARE testcaseRUNID INT;

DECLARE tcRUNCursor_INtcID CURSOR
FOR
Select tcRUNID from testcaserunmaster where tcID = i_keyIDforDeletion ;

DECLARE tcRUNCursor_INscnRUNID CURSOR
FOR
Select tcRUNID from testcaserunmaster where scRUNID = i_keyIDforDeletion ;

DECLARE Continue HANDLER for NOT FOUND SET tcRUN_NOT_FOUND = 1;

Set tcRUN_NOT_FOUND = 0 ;

CASE Ucase(i_flagForGivenID)
    WHEN "SCENARIORUNID" OR "SCNRUNID" OR 0 then        -- Delete ALL Runs belongs to given ScenarioRUNID
        OPEN tcRUNCursor_INscnRUNID ;
            theLOOP : LOOP
                FETCH from tcRUNCursor_INscnRUNID INTO testcaseRUNID;
                    If tcRUN_NOT_FOUND = 1 then
                        LEAVE theLOOP;
                    END If;
                    Call DeleteStepRUN(testcaseRUNID);
            END LOOP ;
        Close tcRUNCursor_INscnRUNID;
        
        Delete from testcaserunmaster where scRUNID = i_keyIDforDeletion;
        
    WHEN "TESTCASEID" OR "TCID" OR 1 then         -- Delete ALL Runs belongs to given TestcaseID
        OPEN tcRUNCursor_INtcID ;
            theLOOP : LOOP
                FETCH from tcRUNCursor_INtcID INTO testcaseRUNID;
                    If tcRUN_NOT_FOUND = 1 then
                        LEAVE theLOOP;
                    END If;
                    Call DeleteStepRUN(testcaseRUNID);
            END LOOP ;
        Close tcRUNCursor_INtcID;
        
        Delete from testcaserunmaster where tcID = i_keyIDforDeletion;
    ELSE
        Call DeleteStepRUN(i_keyIDforDeletion);          -- Delete given RUN
        Delete from testcaserunmaster where tcRUNID = i_keyIDforDeletion;
END CASE ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteTestDataRUN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteTestDataRUN`(
                                                    IN i_testcaseContentRUNID INT
                                                    )
BEGIN

-- ---------------------------------- Description of Proc --------------------------
-- Delete Data from testDataTUN table . 
-- Input would be testcaseContentRUNID, All data run gets Deleted of i/n contentRUNID.
-- -----------------------------------------------------------------------------------

Delete from testdatarun where tccRUNID = i_testcaseContentRUNID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_complib_blockparamvalue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_complib_blockparamvalue`(
                                                     IN i_testcaseID INT
                                                  )
BEGIN

  DELETE FROM `aft`.`complib_blockparamvalue` 
  WHERE TESTCASE_ID = i_testcaseID; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_ComponentDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_ComponentDetail`(
IN i_componentID INT
)
BEGIN
	IF EXISTS (SELECT * FROM aft.componentdetail WHERE componentID = i_componentID) THEN
    /*    delete from  testcase_detail  where testcase_detailID <> 0 and testcase_Component = i_componentID;
         */                
		DELETE FROM `aft`.`componentdetail` WHERE `componentID` = i_componentID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_ComponentDetailID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_ComponentDetailID`(
IN i_componentDetailID INT
)
BEGIN
	IF EXISTS (SELECT * FROM aft.componentdetail WHERE componentDetailID = i_componentDetailID) THEN
	
    delete from  testcase_detail  where testcase_detailID <> 0 and testcase_Component IN ( select componentID from componentdetail WHERE `componentDetailID` = i_componentDetailID) ;

     
        DELETE FROM `aft`.`componentdetail` WHERE `componentDetailID` = i_componentDetailID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_ComponentMaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_ComponentMaster`(
IN i_componentID INT
)
BEGIN
	IF EXISTS (SELECT * FROM aft.componentmaster WHERE componentID = i_componentID) THEN
		DELETE FROM `aft`.`componentmaster` WHERE `componentID` = i_componentID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Object` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Object`(
IN i_objID INT
)
BEGIN
	IF EXISTS (SELECT `objectID` FROM `aft`.`object_master` WHERE `objectID` = i_objID) THEN
		 
		delete from  testcase_detail  where testcase_detailID <> 0 and testcase_Object = i_objID;
        delete from  componentdetail  where componentDetailID <> 0 and  objectID = i_objID;
        delete from testcasecontent where testcaseContentID <>0 and objectID = i_objID;
        
        DELETE FROM object_master  where   objectID  =   i_objID;          
                          
		
 
        DELETE FROM `aft`.`object_master` WHERE `objectID` = i_objID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_ObjectType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_ObjectType`(
IN i_objecttypeID INT
)
BEGIN
IF EXISTS (SELECT * FROM aft.objecttype WHERE objecttypeID = i_objecttypeID) THEN
		DELETE FROM `aft`.`objecttype` WHERE `objecttypeID` = i_objecttypeID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_ORPageName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_ORPageName`(
IN i_pagID INT
)
BEGIN
	IF EXISTS (SELECT pageID FROM aft.object_repository WHERE pageId = i_pagID) THEN
        
    delete from  testcase_detail  where testcase_detailID <> 0 and testcase_Object in 
                          ( select objectID from  object_master where pageID = i_pagID);
        delete from  componentdetail  where componentDetailID <> 0 and  objectID in  
					      ( select objectID from  object_master where pageID = i_pagID);
        delete from testcasecontent where testcaseContentID <>0 and objectID in ( select objectID from  object_master where pageID = i_pagID);                
                     
        DELETE FROM `aft`.`object_master`  where   objectID<> 0 and    `pageId` = i_pagID;               
                          
		DELETE FROM `aft`.`object_repository` WHERE `pageId` = i_pagID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Scenario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Scenario`(
                                                        IN i_scenarioID INT
                                                     )
BEGIN

   DECLARE done INT DEFAULT 0; 
   DECLARE tcID,rowCount,v_Loop INT; 

   
   -- testcase Cursor
   DECLARE tcCursor CURSOR 
   FOR 
   SELECT testcaseID FROM `aft`.`testcase` WHERE scenarioID = i_scenarioID;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
   
   
      OPEN tcCursor;
      SET v_Loop = 1;
        
        TheLoop: LOOP

            FETCH FROM tcCursor INTO tcID;
            
                IF done THEN
                
                    LEAVE TheLoop;
                
                END IF;
           
            CALL Delete_Testcase(tcID);
    
           
         END LOOP;
   
      CLOSE tcCursor;
      
    
      -- Delete Variable corresponding to this scenario from variable Table
        DELETE FROM `aft`.`variable`
           WHERE scenarioID = i_scenarioID;
    -- Delete Entry from Execution master table
        DELETE FROM `aft`.`execution_master`
            WHERE scenarioID = i_scenarioID;
      -- Delete scenario from scenario table
        DELETE FROM `aft`.`scenario`
           WHERE scenarioID = i_scenarioID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Step` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Step`(
                                                 IN i_testcaseID INT
                                              )
BEGIN

  DECLARE done INT DEFAULT 0;
  DECLARE stID INT;  
  -- step Cursor
  DECLARE stepCursor CURSOR 
  FOR 
  SELECT stepID FROM `aft`.`step` WHERE testcaseID = i_testcaseID;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  
  Select i_testcaseID;
    OPEN stepCursor;
        
        TheLoop:LOOP
            
            FETCH stepCursor INTO stID;
            
                IF done THEN
            
                    LEAVE TheLoop;
                
                END IF;
            
           
            CALL Delete_testcaseContent(stID);
            
            DELETE FROM `aft`.`step`
            WHERE stepID = stID;
                       
        END LOOP;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Testcase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Testcase`(
                                                        #IN i_scenarioID INT
                                                        IN tcID INT
                                                     )
BEGIN

/*
   DECLARE done INT DEFAULT 0; 
   DECLARE tcID,rowCount,v_Loop INT; 

   
   -- testcase Cursor
   DECLARE tcCursor CURSOR 
   FOR 
   SELECT testcaseID FROM `aft`.`testcase` WHERE scenarioID = i_scenarioID;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
   
   
      OPEN tcCursor;
      SET v_Loop = 1;
        
          TheLoop: LOOP

        
          FETCH FROM tcCursor INTO tcID;
          
           CALL Delete_Step(tcID);
          
           DELETE FROM `aft`.`testcase`
           WHERE testcaseID = tcID;
        

       
           IF done THEN
                
               LEAVE TheLoop;
                
           END IF;
           
         END LOOP;
   
      CLOSE tcCursor;
    
    */
    
   
   
   CALL Delete_Step(tcID);
   

   DELETE FROM `aft`.`or_testcaserelationship` WHERE testcaseID = tcID ;
   
   DELETE FROM `aft`.`testcase`
           WHERE testcaseID = tcID;
   call Delete_complib_blockparamvalue(tcID);
 
    
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_testcaseContent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_testcaseContent`(
                                                            #IN i_tccID INT
                                                            IN i_stepID INT
                                                         )
BEGIN


  DECLARE done INT DEFAULT 0; 
  DECLARE tccID INT;
  
  
  -- testcaseContent Cursor
  DECLARE tccCursor  CURSOR
  FOR
  SELECT testcaseContentID FROM `aft`.`testcaseContent` WHERE stepID = i_stepID;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  
    OPEN tccCursor;
        
        TheLoop:LOOP
            
            FETCH tccCursor INTO tccID;
                
                IF done THEN
            
                    LEAVE TheLoop;
            
                END IF;
            
                CALL Delete_TestData(tccID);
            
                DELETE FROM `aft`.`testcaseContent`
                WHERE testcaseContentID = tccID; 
            
        END LOOP;
  
 
  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_TestcaseDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_TestcaseDetail`(
IN i_masterID INT,
IN i_projectID INT
)
BEGIN
	IF EXISTS (SELECT * FROM aft.testcase_detail WHERE testcase_MasterID = i_masterID) THEN
		
        DELETE FROM `aft`.`testcase_detail` WHERE `testcase_detailID` <> 0 and `testcase_MasterID` = i_masterID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_TestCaseDetailID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_TestCaseDetailID`(
IN i_componentDetailID INT
)
BEGIN
	IF EXISTS (SELECT * FROM aft.testcase_detail WHERE testcase_detailID = i_componentDetailID) THEN
		DELETE FROM `aft`.`testcase_detail` WHERE `testcase_detailID` = i_componentDetailID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_TestcaseMaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_TestcaseMaster`(
IN i_masterID INT,
IN i_projectID INT
)
BEGIN
	IF EXISTS (SELECT * FROM aft.testcase_master WHERE testcase_masterID = i_masterID) THEN
		delete from testcasecontent where testcasecontentID <> 0 and  testcaseID in ( select testcaseID from testcase where testcaseName IN (select testcase_Name from testcase_master where `testcase_MasterID` = i_masterID) and scenarioID in 
         ( select scenarioID  from scenario where `projectID` = i_projectID)) ;
        
        Delete from testcase where testcaseID <> 0 and testcaseName in (select testcase_Name from testcase_master where `testcase_MasterID` = i_masterID) and scenarioID in 
         ( select scenarioID  from scenario where `projectID` = i_projectID) ;
        DELETE FROM `aft`.`testcase_master` WHERE `testcase_masterID` = i_masterID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_TestData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_TestData`(
                                                     IN i_testcaseContentID INT
                                                  )
BEGIN

  DELETE FROM `aft`.`testdata` 
  WHERE testcaseContentID = i_testcaseContentID; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Variable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Delete_Variable`(
                                                    IN i_varType VARCHAR(45),
                                                    IN i_varName VARCHAR(1000),
                                                    IN i_iterNumber INT(11),
                                                    IN i_scenarioID INT
                                                        )
BEGIN

    Delete from variable where variableType = i_varType And variableName = i_varName And iterationNumber = i_iterNumber And scenarioID =i_scenarioID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FetchEventID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FetchEventID`()
BEGIN
    select eventID
    from event_master;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Fetch_Events` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Fetch_Events`(
                                                IN i_eventID INT,
                                                OUT o_eventName VARCHAR(255),
                                                OUT o_eventType VARCHAR(50),
                                                OUT o_qflName VARCHAR(50),
                                                OUT o_projectID INT, 
                                                OUT o_ParentObject VARCHAR(50), 
                                                OUT o_ChildObject VARCHAR(50),
                                                OUT o_Param1 VARCHAR(50),
                                                OUT o_Param2 VARCHAR(50), 
                                                OUT o_Param3 VARCHAR(50),
                                                OUT o_Param4 VARCHAR(50),
                                                OUT o_Param5 VARCHAR(50),
                                                OUT o_Param6 VARCHAR(50),
                                                OUT o_freeText VARCHAR(255)
                                                )
BEGIN
     DECLARE cnt INT;
     select eventName INTO o_eventName
     from event_master
     where eventID=i_eventID;
     select qflName INTO o_qflName
     from event_master
     where eventID=i_eventID;
     select projectID INTO o_projectID
     from event_master
     where eventID=i_eventID;
     select eventType INTO o_eventType
     from event_master
     where eventID=i_eventID;
     select freeText INTO o_freeText
     from event_freeText
     where eventID=i_eventID;
     SELECT COUNT(*) INTO cnt
     FROM event_parameter
     WHERE eventID=i_eventID;
     if cnt>=1 then
        select paraName into o_ParentObject
        from event_parameter
        where eventID=i_eventID and paraSeq=1;
        if cnt>=2 then
            select paraName into o_ChildObject
            from event_parameter
            where eventID=i_eventID and paraSeq=2;
            if cnt>=3 then
                select paraName into o_Param1
                from event_parameter
                where eventID=i_eventID and paraSeq=3;
                if cnt>=4 then
                    select paraName into o_Param2
                    from event_parameter
                    where eventID=i_eventID and paraSeq=4;
                    if cnt>=5 then
                        select paraName into o_Param3
                        from event_parameter
                        where eventID=i_eventID and paraSeq=5;
                        if cnt>=6 then
                            select paraName into o_Param4
                            from event_parameter
                            where eventID=i_eventID and paraSeq=6;
                            if cnt>=7 then
                                select paraName into o_Param5
                                from event_parameter
                                where eventID=i_eventID and paraSeq=7;
                                if cnt>=8 then
                                    select paraName into o_Param6
                                    from event_parameter
                                    where eventID=i_eventID and paraSeq=8;
                                else
                                    Set o_Param6="Null"; 
                                end if;
                                else
                                    Set o_Param5="Null";
                                    Set o_Param6="Null";                                 
                            end if;
                            else
                                Set o_Param4="Null";
                                Set o_Param5="Null";
                                Set o_Param6="Null"; 
                        end if;
                        else
                            Set o_Param3="Null";
                            Set o_Param4="Null";
                            Set o_Param5="Null";
                            Set o_Param6="Null"; 
                    end if;
                    else
                        Set o_Param2="Null";
                        Set o_Param3="Null";
                        Set o_Param4="Null";
                        Set o_Param5="Null";
                        Set o_Param6="Null"; 
                end if;
                else
                    Set o_Param1="Null";
                    Set o_Param2="Null";
                    Set o_Param3="Null";
                    Set o_Param4="Null";
                    Set o_Param5="Null";
                    Set o_Param6="Null"; 
            end if;
            else
                Set o_ChildObject="Null";
                Set o_Param1="Null";
                Set o_Param2="Null";
                Set o_Param3="Null";
                Set o_Param4="Null";
                Set o_Param5="Null";
                Set o_Param6="Null"; 
        end if;
     else        
        Set o_ParentObject="Null";
        Set o_ChildObject="Null";
        Set o_Param1="Null";
        Set o_Param2="Null";
        Set o_Param3="Null";
        Set o_Param4="Null";
        Set o_Param5="Null";
        Set o_Param6="Null";        
     end if;
       
       
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExecutionResult_InRUNID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getExecutionResult_InRUNID`(
                                                            IN i_runID INT,
                                                            IN i_flag_forExecutionResults CHAR(10)
                                                                )
BEGIN

CASE UCASE(i_flag_forExecutionResults)
    WHEN "SCENARIO" OR "SCN" OR 0 THEN
        Select * from finalresultview where scnRUNID = i_runID;
        Select Distinct tccRUNID from finalresultview where scnRUNID = i_runID And iterationNumber IS NOT NULL;
    WHEN "TESTCASE" OR "TC" OR 1 THEN
        Select * from finalresultview where tcRUNID = i_runID order by testDataRunID ASC;
        Select Distinct tccRUNID from finalresultview where tcRUNID = i_runID And iterationNumber IS NOT NULL;
    ELSE
        Select * from finalresultview where stepRUNID = i_runID;
        Select Distinct tccRUNID from finalresultview where stepRUNID = i_runID And iterationNumber IS NOT NULL;
END CASE ;

/*
IF Ucase(i_flag_getTCResult) = "TRUE" then
    Select * from finalresultview where tcRUNID = i_runID;
Else
    Select * from finalresultview where stepRUNID = i_runID;
END IF;
*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getProjects`(
                                            IN i_managerID VARCHAR(45),
                                            IN i_routeToGetUser CHAR(15)        -- If value of this variable is "TRUE" then getUser storedProc will call otherwise getScenario storedProc will call
                                            )
BEGIN


-- ***************** Declaration of variable and cursor ***************
    DECLARE projectID_NOT_FOUND INT DEFAULT 0;
    DECLARE projID INT;
 

    DECLARE projIDCursor CURSOR 
    FOR 
    Select projectID from `project_master` where managerLANID = i_managerID;
    
-- ***************** Declaration of Handelar ***************
    
    DECLARE Continue HANDLER FOR NOT FOUND SET projectID_NOT_FOUND = 1;
    
    
    If Ucase(i_routeToGetUser) <> "TRUE" then       -- routing towards getScenario proc

        DROP TABLE IF EXISTS temp_scenarioTbl_detail;   -- Drop temporary Scenario table and temporary Testcase table if already exist********

        DROP TABLE IF EXISTS temp_testcaseTbl_detail;
    End If ;
        
-- ***************** Create Temporary Scenario table to merge multiple resultset into one *********************
/*
        CREATE TEMPORARY TABLE IF NOT EXISTS temp_scenarioTbl_detail(
        `projectID` INT(11) DEFAULT NULL,
        `scenarioID` int(11) DEFAULT NULL,
        `scenarioName` varchar(45) DEFAULT NULL
        );
*/
-- *********************** Programming logic *********************************
    
    OPEN projIDCursor ;         -- Open cursor
        
        TheLoop : LOOP
        
            FETCH from projIDCursor INTO projID;
     
              IF projectID_NOT_FOUND = 1 THEN
                        LEAVE TheLoop;
              END IF;
            
            If Ucase(i_routeToGetUser) <> "TRUE" then
               Call getScenario(projID,"TRUE");
            Else
                Call getUsers_InProjectID(projID);
            End If ;
                   
        END LOOP;
        
     CLOSE projIDCursor;
-- ********************* Retrive Project data and Scenario Data resultset **********************
    If Ucase(i_routeToGetUser) <> "TRUE" then
        Select projectName,projectID from `project_master` where managerLANID = i_managerID;
        select * from temp_scenarioTbl_detail;
        select * from temp_testcaseTbl_detail ;
    End If;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getScenario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getScenario`(
                                            IN i_projectID INT,
                                            IN i_flag_CallFromBoss CHAR(10),
                                            IN i_fromDate VARCHAR(45),
                                            IN i_toDate VARCHAR(45)
                                            )
BEGIN

-- *********************** Declaration of cursor an its variable *************************

    DECLARE scnName VARCHAR(45);
    DECLARE scenario_NOT_FOUND INT DEFAULT 0;
    DECLARE req_scenario_NOT_FOUND INT ;
    DECLARE scnID INT;
    DECLARE scenarioRUNID INT;
    DECLARE scnExecStatus VARCHAR(45);
    DECLARE scnExecutionTmStamp VARCHAR(45);
    

    DECLARE scnCursor CURSOR 
    FOR
    Select scenarioID,scenarioName from `scenario` where projectID = i_projectID ;

-- **************************** Declare Handler ************************

    DECLARE Continue HANDLER FOR NOT FOUND SET scenario_NOT_FOUND = 1;
    
-- ***************************** Convert from and to date to DATE format ***********
        If i_fromDate IS NULL then      -- Set dummy val to from and start date if it has passed as Null to get all dtails
            Set i_fromDate = "01/01/2000";     
        End If;
        
         If i_toDate IS NULL then
            Set i_toDate = "12/30/2020";     
        End If;
        
        Set i_fromDate = str_to_date(i_fromDate,"%m/%d/%Y");
        Set i_toDate = str_to_date(i_toDate,"%m/%d/%Y");
        -- Now change mm/dd/yyyy format to my sql format
        Set i_fromDate = Date_Format(i_fromDate,"%Y-%m-%d %H:%i:%S");
        Set i_toDate = Date_Format(i_toDate,"%Y-%m-%d %H:%i:%S");
    
-- **************** Drop temporary table if already exist TO BE COMMENTED********
    If UCASE(i_flag_CallFromBoss) <> "TRUE" then
        DROP TABLE IF EXISTS temp_testcaseTbl_detail;
        DROP TABLE IF EXISTS temp_scenarioTbl_detail;
    End IF ;

-- ***************** Create Temporary Scenario table to merge multiple resultset into one(For testing - TO BE DELETED *********************

        CREATE TEMPORARY TABLE IF NOT EXISTS temp_scenarioTbl_detail(
        `projectID` INT(11) DEFAULT NULL,
        `scenarioID` int(11) DEFAULT NULL,
        `scenarioRUNID` INT(11) DEFAULT NULL,
        `scenarioName` varchar(45) DEFAULT NULL,
        `scenarioExecStatus` varchar(45) DEFAULT NULL,
        `scenarioExecTimeStamp` varchar(45) DEFAULT NULL
        );
        
  Delete  from temp_scenarioTbl_detail;
-- *********************** Programming logic *********************************

        OPEN scnCursor ;

            theLOOP : LOOP
                FETCH from scnCursor INTO scnID,scnName;
                    Set req_scenario_NOT_FOUND = scenario_NOT_FOUND;
                        IF scenario_NOT_FOUND = 1 THEN
                            LEAVE TheLoop;
                        END IF;
                
         
                Select scnStatus,scnRUNID,scnExecutionTimeStamp INTO scnExecStatus,scenarioRUNID,scnExecutionTmStamp from `scenariorunmaster` where `scenariorunmaster`.scenarioID = scnID AND TimeDiff(str_to_date(scnExecutionTimeStamp,"%d_%M_%Y_%r"),i_fromDate) > 0 AND TimeDiff(str_to_date(scnExecutionTimeStamp,"%d_%M_%Y_%r"),i_toDate) < 0 Order By scnRUNID DESC LIMIT 1;
                        IF scenarioRUNID IS NOT NULL then    -- Get Run Details for those scenario's only whose execution is between from and to date
                            INSERT INTO temp_scenarioTbl_detail(projectID,scenarioID,scenarioRUNID,scenarioName,scenarioExecStatus,scenarioExecTimeStamp) Values(i_projectID,scnID,scenarioRUNID,scnName,scnExecStatus,scnExecutionTmStamp);
                            Call getTestcases(scnID);
                        End If;
                
                Set scnExecStatus = NULL;
                Set scenarioRUNID = NULL;
                Set scenarioRUNID = NULL;
                
                If req_scenario_NOT_FOUND <> scenario_NOT_FOUND then    -- If scenario_NOT_FOUND flag set 1 from any other query rather than cusor then this will reset it to original value
                    Set scenario_NOT_FOUND = req_scenario_NOT_FOUND;
                End IF ;

             END LOOP;

        Close scnCursor ;

    If UCASE(i_flag_CallFromBoss) <> "TRUE" then

        Select * from temp_scenarioTbl_detail;

       -- select * from temp_testcaseTbl_detail ;
    End If ;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getScenarioRUNDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getScenarioRUNDetail`(
                                                        IN i_scenarioID INT,
                                                        IN i_userID varchar(45),
                                                        IN i_fromDate VARCHAR(45),
                                                        IN i_toDate VARCHAR(45)
                                                              )
BEGIN

-- ***************************** Convert from and to date to DATE format ***********
        If i_fromDate IS NULL then      -- Set dummy val to from and start date if it has passed as Null to get all dtails
            Set i_fromDate = "01/01/2000";     
        End If;
        
         If i_toDate IS NULL then
            Set i_toDate = "12/30/2020";     
        End If;
        
        Set i_fromDate = str_to_date(i_fromDate,"%m/%d/%Y");
        Set i_toDate = str_to_date(i_toDate,"%m/%d/%Y");
        -- Now change mm/dd/yyyy format to my sql format
        Set i_fromDate = Date_Format(i_fromDate,"%Y-%m-%d %H:%i:%S");
        Set i_toDate = Date_Format(i_toDate,"%Y-%m-%d %H:%i:%S");
-- *************************************************************************

    IF i_userID IS NULL then
        Select scnRUNID,scnStatus,scnExecutionTimeStamp,lanID As ExecutedBy from `scenariorunmaster` where scenarioID = i_scenarioID AND TimeDiff(str_to_date(scnExecutionTimeStamp,"%d_%M_%Y_%r"),i_fromDate) > 0 AND TimeDiff(str_to_date(scnExecutionTimeStamp,"%d_%M_%Y_%r"),i_toDate) < 0;
    ELSE
        Select scnRUNID,scnStatus,scnExecutionTimeStamp,lanID As ExecutedBy from `scenariorunmaster` where scenarioID = i_scenarioID AND lanID =i_userID AND TimeDiff(str_to_date(scnExecutionTimeStamp,"%d_%M_%Y_%r"),i_fromDate) > 0 AND TimeDiff(str_to_date(scnExecutionTimeStamp,"%d_%M_%Y_%r"),i_toDate) < 0 ;
    END IF ;
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStepRUNDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getStepRUNDetail`(
                                                   IN i_testcaseRUNID INT 
                                                    )
BEGIN

Select * from steprunmaster where tcRUNID = i_testcaseRUNID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTestcaseContentByTCCID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTestcaseContentByTCCID`(
												IN i_testCaseContentID int(32),                                               
                                                IN i_eventID int(32),
                                                IN i_objectID int(32)
)
BEGIN

declare page_ID int;
Select param1,param2,param3,param4,param5 from 
testcasecontent where testcaseContentID = i_testCaseContentID;

SELECT 
    eventName 
FROM
    aft.event_master
WHERE
    eventID = i_eventID ; 
   
   
  SELECT 
    pageID
FROM
    aft.object_master
WHERE
    objectID = i_objectID INTO page_ID; 
    SELECT 
    pageName
FROM
    aft.object_repository
WHERE
    pageID = page_ID ; 
    
        
    SELECT 
    objectLogicalName
FROM
    aft.object_master
WHERE
    objectID = i_objectID ; 
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTestcaseContentByTCID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTestcaseContentByTCID`(
												IN i_testCaseContentID int(32),                                               
                                                IN i_eventID int(32),
                                                IN i_pageID int(32),
                                                IN i_objectID int(32),
                                                out eventName int(50),
                                                out parentName int(50),
                                                out childName int(50)

)
BEGIN

    
    
Select param1,param2,param3,param4,param5 from 
testcasecontent where i_testCaseContentID = i_testCaseContentID;

SELECT 
    eventName 
FROM
    aft.event_master
WHERE
    eventID = i_eventID INTO eventName; 
    
    SELECT 
    pageName
FROM
    aft.object_repository
WHERE
    pageID = i_pageID INTO parentName; 
    
        
    SELECT 
    objectLogicalName
FROM
    aft.object_master
WHERE
    objectID = i_objectID INTO childName; 
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTestcaseRUNDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getTestcaseRUNDetail`(
                                                        IN i_testcaseID INT,
                                                         IN i_userID varchar(45)    
                                                              )
BEGIN

    IF i_userID IS NULL then
        Select tcRUNID,scRUNID,tcStatus,tcExecutionTimeStamp,lanID As ExecutedBy from `testcaserunmaster` where tcID = i_testcaseID;
    ELSE
        Select tcRUNID,scRUNID,tcStatus,tcExecutionTimeStamp,lanID As ExecutedBy from `testcaserunmaster` where tcID = i_testcaseID AND lanID =i_userID ;
    END IF ;
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTestcases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getTestcases`(
                                            IN i_scnID INT 
                                                )
BEGIN

-- Declaration of cursor an its variable
    DECLARE temptcName VARCHAR(255);
    DECLARE tc_NOT_FOUND INT DEFAULT 0;
    DECLARE temptcID INT;
    DECLARE temptcStatus VARCHAR(45);
    DECLARE tcExecStatus VARCHAR(45);
    DECLARE tcDevelopedBy VARCHAR(45);
    DECLARE tcExecutedBy VARCHAR(45);
    DECLARE testCaseRUNID int(11);
-- **************************** Declare Cursor for filling Temorary table ************************
    DECLARE tcCursor CURSOR 
    FOR
    Select testcaseID,testcaseName,status,testcaseDeveloper from testcase where scenarioID = i_scnID ;

-- **************************** Declare Handler ************************

    DECLARE Continue HANDLER FOR NOT FOUND SET tc_NOT_FOUND = 1;
    
-- ***************** Create Temporary Testcase table to merge multiple resultset into one *********************

        CREATE TEMPORARY TABLE IF NOT EXISTS temp_testcaseTbl_detail(
        `scenarioID` INT(11) DEFAULT NULL,
        `testcaseID` int(11) DEFAULT NULL,
        `testcaseRUNID` int(11) DEFAULT NULL,
        `testcaseName` varchar(255) DEFAULT NULL,
        `testcaseDevStatus` varchar(45) DEFAULT NULL,
        `developedBy` varchar(45) DEFAULT NULL,
        `testcaseExecStatus` varchar(45) DEFAULT NULL,
        `executedBy` varchar(45) DEFAULT NULL
        
        );
    
OPEN tcCursor ;

theLOOP : LOOP

FETCH from tcCursor INTO temptcID,temptcName,temptcStatus,tcDevelopedBy;
     
              IF tc_NOT_FOUND = 1 THEN
                        LEAVE TheLoop;
              END IF;
-- Get Latest testcase execution status from testcase run master
  Select tcStatus,aftID,tcRUNID INTO tcExecStatus,tcExecutedBy,testCaseRUNID from testcaserunmaster where `testcaserunmaster`.tcID = temptcID Order By tcRUNID DESC LIMIT 1 ;
    
-- Insert all relevent details into temporary testcase table
    INSERT INTO temp_testcaseTbl_detail(scenarioID,testcaseID,testcaseRUNID,testcaseName,testcaseDevStatus,developedBy,testcaseExecStatus,executedBy) Values(i_scnID,temptcID,testCaseRUNID,temptcName,temptcStatus,tcDevelopedBy,tcExecStatus,tcExecutedBy);

END LOOP;

Close tcCursor ;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserDetails_InUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getUserDetails_InUserID`(
                                                        IN i_userID VARCHAR(45)
                                                            )
BEGIN

DECLARE tempScnID INT;
DECLARE tempTcID INT;
DECLARE tempScnName VARCHAR(45);
DECLARE tempTcName VARCHAR(500);
DECLARE tempTcDevStatus VARCHAR(45);
DECLARE tempTcExeStatus VARCHAR(45);
DECLARE cursorVarTCID INT;
DECLARE tc_NOT_FOUND INT DEFAULT 0;
DECLARE p_tc_NOT_FOUND INT;


DECLARE retriveTCIDCursor CURSOR 
FOR
Select DISTINCT TCID from `aft`.`finalresultview` where ExecutedBy = i_userID ;

-- Declaration of Handelar *************************
DECLARE Continue HANDLER for NOT FOUND SET tc_NOT_FOUND = 1 ;

-- Create Temporary table to hold Details of each user **************
Create TEMPORARY TABLE IF NOT EXISTS tempTbl_UserDetails(
`userID` VARCHAR(45) DEFAULT NULL,
`scenarioID` INT(11) DEFAULT NULL,
`ScenarioName` VARCHAR(45) DEFAULT NULL,
`testcaseID` INT(11) DEFAULT NULL,
`testcaseName` VARCHAR(500) DEFAULT NULL,
`testcaseDevStatus` VARCHAR(45) DEFAULT NULL,
`testcaseExeStatus` VARCHAR(45) DEFAULT NULL
);

OPEN retriveTCIDCursor ;
    theLOOP : LOOP
        FETCH from retriveTCIDCursor INTO cursorVarTCID;
            Set p_tc_NOT_FOUND = tc_NOT_FOUND ;
                If tc_NOT_FOUND = 1 then
                    LEAVE theLOOP   ;
                End If;

          Select ScenarioID,TCID,ScenarioName,TCName,TCDevlopmentStatus,tcStatus 
          INTO tempScnID,tempTcID,tempScnName,tempTcName,tempTcDevStatus,tempTcExeStatus 
          from `finalresultview` Where TCID = cursorVarTCID ORDER By tcRUNID DESC LIMIT 1;
          Insert Into tempTbl_UserDetails 
          (userID,scenarioID,ScenarioName,testcaseID,testcaseName,testcaseDevStatus,testcaseExeStatus) 
          VALUES(i_userID,tempScnID,tempScnName,tempTcID,tempTcName,tempTcDevStatus,tempTcExeStatus) ;
        
        Set tempScnID = NULL;
        Set tempTcName = NULL;
        Set tempScnName = NULL;
        Set tempTcName = NULL;
        Set tempTcDevStatus = NULL;
        Set tempTcExeStatus = NULL;
        
         If tc_NOT_FOUND <> p_tc_NOT_FOUND then
            Set tc_NOT_FOUND = p_tc_NOT_FOUND;
        End If;
    End LOOP;
CLOSE retriveTCIDCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsers_InProjectID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getUsers_InProjectID`(
                                                     IN i_projectID INT 
                                                        )
BEGIN

DECLARE User_NOT_FOUND INT DEFAULT 0;
DECLARE userID VARCHAR(45);

-- Declaration of cursor to get users for a particular project ***********
DECLARE retriveUserCursor CURSOR
For
Select lanID from project_userrelationship where projectID = i_projectID;

-- ***************** Declaration of Handelar ***************
DECLARE Continue HANDLER FOR NOT FOUND SET User_NOT_FOUND = 1;

-- **************** Drop temporary table if already exist ********
    DROP TABLE IF EXISTS tempTbl_UserDetails;
    

-- Programming logic ***************************

OPEN retriveUserCursor;
    theLoop : LOOP
        FETCH retriveUserCursor INTO userID;
            If User_NOT_FOUND = 1 then
                LEAVE theLoop;
            End If;
            
            Call getUserDetails_InUserID(userID);
    End LOOP;
CLOSE retriveUserCursor;

Select * from tempTbl_UserDetails;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_ORPageName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_ORPageName`(
IN i_pagID INT
)
BEGIN
	IF EXISTS (SELECT pageID FROM aft.object_repository WHERE pageId = i_pagID) THEN
		SELECT pageID, pageName, projectID, pageTitle, pageDescription FROM `aft`.`object_repository`
        WHERE pageId = i_pagID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertTCForExecution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTCForExecution`(
    IN i_suiteID int(32),  
	IN i_testCaseID int(32),   
	IN i_userID varchar(255),
    IN i_deleteFlag int

)
BEGIN

if(i_deleteFlag = 1) Then

Delete from execution_master where loggedInUser = i_userID;

INSERT INTO `aft`.`execution_master`
                    (
                        scenarioID,tcID,loggedInUser)
                     VALUES
                    (
                        i_suiteID,i_testCaseID,i_userID
                    );

Else

INSERT INTO `aft`.`execution_master`
                    (
                        scenarioID,tcID,loggedInUser)
                     VALUES
                    (
                        i_suiteID,i_testCaseID,i_userID
                    );
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertTestCase_Updated` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTestCase_Updated`(
                                                            IN i_tc_flag CHAR,
                                                            IN i_tcName VARCHAR(45),
                                                            IN i_tcDescription VARCHAR(45),
                                                            IN i_tcComments VARCHAR(45),
                                                            IN i_tcStatus VARCHAR(45),
                                                            IN i_tcPrerequisites VARCHAR(45),
                                                            IN i_lockStatus VARCHAR(45),
                                                            IN i_scenarioID INT,
                                                            OUT o_tcID INT
                                                        )
BEGIN

        INSERT INTO `aft`.`testcase`
                 (
                    flag,
                    testcaseName,
                    testcaseDescription,
                    comments,
                    status,
                    prerequisites,
                    lockstatus,
                    scenarioID
                 )   
                                                
        VALUES
                 (
                    i_tc_flag,
                    i_tcName,
                    i_tcDescription,
                    i_tcComments,
                    i_tcStatus,
                    i_tcPrerequisites,
                    i_lockStatus,
                    i_scenarioID
                 );
                 
     SET o_tcID = LAST_INSERT_ID();            
                 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_CompLib_BlockContent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Insert_CompLib_BlockContent`(

                      IN i_blockID INT(11),

                      IN i_objectID INT(11),

                      IN i_eventID INT(11),

                      IN i_seqNum INT(11)



                )
BEGIN



        INSERT INTO `aft`.`complib_blockcontent`

                    (

                        blockID,

                        objectID,

                        eventID,

                        seqNum

                    )

            VALUES 

                    (

                        i_blockID,

                        i_objectID,

                        i_eventID,

                        i_seqNum

                        

                    );

                    

                    

         Select LAST_INSERT_ID();







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Complib_BlockContentData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Insert_Complib_BlockContentData`(                                 
                                  IN i_blockcontentID INT(11),
                                  IN i_eventParamID INT(11),
                                  IN i_value VARCHAR(1000),
                                  IN i_formula VARCHAR(1000)
)
BEGIN
INSERT INTO `aft`.`complib_blockdata`
                    (

                        blockcontentID,
                        eventParamID,
                        value,
                        formula
                    )

            VALUES 

                    (
                        i_blockcontentID,
                        i_eventParamID,
                        i_value,
                        i_formula
                    );

         Select LAST_INSERT_ID();

        Set @blockDataID = LAST_INSERT_ID();
        
        SET @blockID = (SELECT blockID FROM complib_blockcontent where blockcontentID = i_blockcontentID LIMIT 1);

          
      
    
         If Instr(i_value,'<')  Then
            Call Insert_CompLib_BlockParameter(@blockDataID,i_blockcontentID,@blockID,i_value,'test');
         End IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_CompLib_BlockData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Insert_CompLib_BlockData`(
                            IN i_pageID INT(11),
                            IN i_blockName VARCHAR(55),
                            IN i_blockDescription VARCHAR(255)

                        )
BEGIN

    INSERT INTO `aft`.`complib_block`
                (
                    pageID,
                    blockName,
                    blockDescription
                )
        VALUES 
                (
                    i_pageID,
                    i_blockName,
                    i_blockDescription
                );
                
                
     Select LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_CompLib_BlockParameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_CompLib_BlockParameter`(
                        IN i_blockDataID INT(11),
                      IN i_blockcontentID INT(11),
                      IN i_blockID INT(11),
                      IN i_blockParameterName Varchar(45),
                      IN i_blockParameterDesc Varchar(200)
)
BEGIN

        INSERT INTO `aft`.`complib_blockparameter`

                    (
                        BD_ID,
                        BC_ID,
                        BLOCK_ID,
                        BLOCK_PRM_NAME,
                        BLOCK_PRM_DESC
                    )

            VALUES 

                    (

                        i_blockDataID,
                        i_blockcontentID,
                        i_blockID,
                        i_blockParameterName,
                        i_blockParameterDesc

                    );

                    

                    

         Select LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_CompLib_BlockParameterValues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_CompLib_BlockParameterValues`(
                      IN i_iteration INT(11),
                      IN i_occurance INT(11),
                      IN i_testcaseName VARCHAR(45),
                      IN i_blockParameterID Varchar(45),
                      IN i_blockParameterValue Text)
BEGIN

-- SET @testCaseID = (SELECT testcaseID FROM testcase where testcaseName = i_testcaseID LIMIT 1);

 -- IF Exists (Select testcaseID From testcase Where scenarioID = i_scenarioID) Then
If exists (  Select testcaseID From testcase Where testcaseName = i_testcaseName) Then
            -- If @testCaseID Is Not Null then

           /*Set @testCaseID = '1';*/
	
           SET @testCaseID =  (SELECT testcaseID FROM testcase where testcaseName = i_testcaseName LIMIT 1);
           SET @ScenarioID =  (SELECT scenarioID FROM testcase where testcaseName = i_testcaseName LIMIT 1);
           
			If Not exists (  Select BLOCK_PRM_VAL_ID From complib_blockparamvalue Where TESTCASE_ID = @testCaseID and BLOCK_PRM_ID = i_blockParameterID and OCCURANCE = i_occurance and ITERATION = i_iteration) Then
                INSERT INTO `aft`.`complib_blockparamvalue`

                            (
                                ITERATION,
                                OCCURANCE,
                                TESTCASE_ID,
                                BLOCK_PRM_ID,
                                BLOCK_PRM_VALUE
                            )

                    VALUES 

                            (

                                i_iteration,
                                i_occurance,
                                @testCaseID,
                                i_blockParameterID,
                                i_blockParameterValue

                            );
			End if;
               
               -- SET @testCaseID = (SELECT scenarioID FROM testcase where testcaseName = i_testcaseID LIMIT 1);
                 
           -- Else
            --     Set @testCaseID = 0;
            -- End If;
    
     Else
     Set @ScenarioID = 0; 
     End IF;

         
         Select @ScenarioID;  
         
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_CompLib_PageData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Insert_CompLib_PageData`(
                        IN i_pageName VARCHAR(55),
                        IN i_pageDescription VARCHAR(255)

                    )
BEGIN

INSERT INTO `aft`.`complib_page`
            (
                pageName,
                pageDescription
            )
    VALUES 
            (
                i_pageName,
                i_pageDescription
            );
            
            
 Select LAST_INSERT_ID();



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_ComponentDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_ComponentDetail`(
IN 	i_componentID 		INT,
IN 	i_objectID 			INT,
IN 	i_eventID 			INT,
IN 	i_sequence 			INT,
IN 	i_componentData 	VARCHAR(200),
IN 	i_additionalData	VARCHAR(250),
IN  i_scrshot           Bit
)
BEGIN
		INSERT INTO `aft`.`componentdetail`
		( componentID, objectID, eventID, sequence, componentData, additionalData,scrshot)
		VALUES
		( i_componentID, i_objectID, i_eventID, i_sequence, i_componentData, i_additionalData,i_scrshot);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_ComponentMaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_ComponentMaster`(
IN 	i_pageID 				INT,
IN 	i_componentName 		VARCHAR(100),
IN 	i_componentDescription	VARCHAR(100),
IN   i_projectID            INT,
OUT o_componentID 			INT
)
BEGIN
	IF NOT EXISTS (SELECT componentID FROM `aft`.`componentmaster` WHERE pageID=i_pageID and componentName = i_componentName and projectID = i_projectID)
	THEN
		INSERT INTO `aft`.`componentmaster`
		( pageID, componentName, componentDescription,projectID )
		VALUES
		( i_pageID, i_componentName, i_componentDescription,i_projectID );
		
        SELECT componentID FROM `aft`.`componentmaster` 
        WHERE pageID=i_pageID and componentName = i_componentName and projectID = i_projectID INTO o_componentID; 
	ELSE
		SELECT -1 into o_componentID ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_EntutyRelationship_Mapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_EntutyRelationship_Mapping`(
                                                                                        IN i_EntityDataID INT,
                                                                                        IN i_FirstLevelID INT,
                                                                                        IN i_SecondLevelID INT,
                                                                                        IN i_ThirdLevelID INT
                                                                                    )
BEGIN
    
        Insert into `aft`.`entityfieldsdata_relationship`
                    (
                        dataID,
                        firstLevel,
                        secondLevel,
                        thirdLevel
                    )  
                        Values
                    (
                        i_EntityDataID,
                        i_FirstLevelID,
                        i_SecondLevelID,
                        i_ThirdLevelID
                    );
                    
        Select LAST_Insert_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Event`(
                                                IN eventName VARCHAR(255),
                                                IN eventType VARCHAR(50),
                                                IN qflName VARCHAR(50),
                                                IN projectID INT, 
                                                IN ParentObject VARCHAR(50), 
                                                IN ChildObject VARCHAR(50),
                                                IN Param1 VARCHAR(50),
                                                IN Param2 VARCHAR(50), 
                                                IN Param3 VARCHAR(50),
                                                IN Param4 VARCHAR(50),
                                                IN Param5 VARCHAR(50),
                                                IN Param6 VARCHAR(50),
                                                IN freeText VARCHAR(255),
                                                out o_eventID INT
)
BEGIN

 DECLARE vareventID INT;
 DECLARE cnt INT;
 SELECT COUNT(*) INTO cnt
 FROM event_master
 WHERE eventName=eventName;
 IF cnt=0 THEN
    INSERT INTO `aft`.`event_master` 
        ( 
        eventName,
        eventType,
        qflName ,
        projectID 
        )
    VALUES ( 
        eventName ,
        eventType,
        qflName ,
        projectID 
        );
    SET vareventID = LAST_INSERT_ID();
 else
    SELECT eventID INTO vareventID
    FROM event_master
    WHERE eventName=eventName;
 end if;
 set cnt=0;
 SELECT COUNT(*) INTO cnt
 FROM event_freetext
 WHERE eventID=vareventID;
 IF cnt=0 THEN
    INSERT INTO `aft`.`event_freetext`
            (
            freeText ,
            eventID
            )
    VALUES (
            freeText,
            vareventID
            );
 end if;
 set cnt=0;
 SELECT COUNT(*) INTO cnt
 FROM event_parameter
 WHERE eventID=vareventID and paraSeq=1;  
 IF cnt=0 THEN
    INSERT INTO `aft`.`event_parameter`
        (
        eventID ,
        paraName ,
        paraSeq ,
        paraType 
        )
    VALUES
        (
        vareventID ,
        ParentObject ,
        1 ,
        'a'
        );
 else 
    UPDATE `aft`.`event_parameter`
    SET paraName=ParentObject
    where  eventID=vareventID and paraSeq=1; 
 end if;
 set cnt=0;
 SELECT COUNT(*) INTO cnt
 FROM event_parameter
 WHERE eventID=vareventID and paraSeq=2;  
 IF cnt=0 THEN
    INSERT INTO `aft`.`event_parameter`
        (
        eventID ,
        paraName ,
        paraSeq ,
        paraType 
        )
    VALUES
        (
        vareventID ,
        ChildObject ,
        2 ,
        'a'
        );
 else 
    UPDATE `aft`.`event_parameter`
    SET paraName=ChildObject
    where  eventID=vareventID and paraSeq=2; 
 end if;    
 
  IF Param1<>'' THEN 
    set cnt=0;
    SELECT COUNT(*) INTO cnt
    FROM event_parameter
    WHERE eventID=vareventID and paraSeq=3;  
    IF cnt=0 THEN
        INSERT INTO `aft`.`event_parameter`
            (
            eventID ,
            paraName ,
            paraSeq ,
            paraType 
            )
        VALUES
            (
            vareventID ,
            Param1 ,
            3 ,
            'a'
            );
    else 
        UPDATE `aft`.`event_parameter`
        SET paraName=Param1
        where eventID=vareventID and paraSeq=3; 
    end if;      
      IF Param2<>'' THEN 
        set cnt=0;
        SELECT COUNT(*) INTO cnt
        FROM event_parameter
        WHERE eventID=vareventID and paraSeq=4;  
        IF cnt=0 THEN
            INSERT INTO `aft`.`event_parameter`
                (
                eventID ,
                paraName ,
                paraSeq ,
                paraType 
                )
            VALUES
                (
                vareventID ,
                Param2 ,
                4 ,
                'a'
                );
        else 
            UPDATE `aft`.`event_parameter`
            SET paraName=Param2
            where eventID=vareventID and paraSeq=4; 
        end if;  
        IF Param3<>'' THEN     
            set cnt=0;
            SELECT COUNT(*) INTO cnt
            FROM event_parameter
            WHERE eventID=vareventID and paraSeq=5;  
            IF cnt=0 THEN
                INSERT INTO `aft`.`event_parameter`
                    (
                    eventID ,
                    paraName ,
                    paraSeq ,
                    paraType 
                    )
                VALUES
                    (
                    vareventID ,
                    Param3 ,
                    5 ,
                    'a'
                    );
            else 
                UPDATE `aft`.`event_parameter`
                SET paraName=Param3
                where eventID=vareventID and paraSeq=5; 
            end if;             
            IF Param4<>'' THEN 
                set cnt=0;
                SELECT COUNT(*) INTO cnt
                FROM event_parameter
                WHERE eventID=vareventID and paraSeq=6;  
                IF cnt=0 THEN
                    INSERT INTO `aft`.`event_parameter`
                        (
                        eventID ,
                        paraName ,
                        paraSeq ,
                        paraType 
                        )
                    VALUES
                        (
                        vareventID ,
                        Param4 ,
                        6 ,   
                        'a'
                        );
                else 
                    UPDATE `aft`.`event_parameter`
                    SET paraName=Param4
                    where eventID=vareventID and paraSeq=6; 
                end if;                
                IF Param5<>'' THEN  
                    set cnt=0;
                    SELECT COUNT(*) INTO cnt
                    FROM event_parameter
                    WHERE eventID=vareventID and paraSeq=7;  
                    IF cnt=0 THEN
                        INSERT INTO `aft`.`event_parameter`
                            (
                            eventID ,
                            paraName ,
                            paraSeq ,
                            paraType 
                            )
                        VALUES
                            (
                            vareventID ,
                            Param5 ,
                            7 ,   
                            'a'
                            );
                    else 
                        UPDATE `aft`.`event_parameter`
                        SET paraName=Param5
                        where eventID=vareventID and paraSeq=7; 
                    end if;  
                    
                    IF Param6<>'' THEN 
                        set cnt=0;
                        SELECT COUNT(*) INTO cnt
                        FROM event_parameter
                        WHERE eventID=vareventID and paraSeq=8;  
                        IF cnt=0 THEN
                            INSERT INTO `aft`.`event_parameter`
                                (
                                eventID ,
                                paraName ,
                                paraSeq ,
                                paraType 
                                )
                            VALUES
                                (
                                vareventID ,
                                Param6 ,
                                8 ,   
                                'a'
                                );
                        else 
                            UPDATE `aft`.`event_parameter`
                            SET paraName=Param6
                            where eventID=vareventID and paraSeq=8; 
                        end if;  
                                           
                    END IF;                    
                END IF;  
            END IF;  
        END IF;    
    END IF;  
  END IF; 
  set o_eventID=vareventID;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_ExecutionData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Insert_ExecutionData`(  
						  IN i_testcaseID INT(11),
						  IN i_aftUser Varchar(45)
					)
BEGIN

 SET @ScenarioID =  (SELECT scenarioID FROM testcase where testcaseID = i_testcaseID LIMIT 1);
 Set @ScenarioName = (Select scenarioName From scenario where scenarioID = @ScenarioID Limit 1);


If Not exists ( SELECT tcID FROM execution_master where scenarioID=@ScenarioID and loggedInUser=i_aftUser) Then
               INSERT INTO execution_master
 
                            (
                                scenarioID,
                                tcID,
                                scenarioName,
                                loggedInUser
                            )

                    VALUES 

                            (
                                @ScenarioID,
                                i_testcaseID,
                                @ScenarioName,
                                i_aftUser

                            );
			else
			Set @alltcID = (SELECT tcID FROM execution_master where scenarioID=@ScenarioID and loggedInUser=i_aftUser);
			SET @tcID = CONCAT(i_testcaseID,",",@alltcID);


			Update execution_master Set tcID = @tcID where scenarioID=@ScenarioID and loggedInUser=i_aftUser;

			End if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_fieldProperty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_fieldProperty`(
                                                                                  i_fieldName VARCHAR(315),
                                                                                  i_fieldVAName VARCHAR(315),
                                                                                  i_panelID INT
                                                                                        )
BEGIN

DECLARE cnt INT;

SELECT Count(*) INTO cnt
    FROM `aft`.`fieldProperty`
    WHERE fieldName = i_fieldName And panelID = i_panelID;
    
    IF cnt = 0 Then
        
        INSERT INTO `aft`.`fieldProperty`
                    (
                        fieldName,
                        fieldVAName,
                        panelID
                    )
        VALUES
                    (
                        i_fieldName,
                        i_fieldVAName,
                        i_panelID
                    );
                    
        Select LAST_INSERT_ID(); 
        
    Else
    
        SELECT fieldID from `aft`.`fieldProperty`
            WHERE fieldName = i_fieldName And panelID = i_panelID; 
    End If ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_fieldValues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_fieldValues`(
                                                                                IN i_fieldExpectedValue VARCHAR(315),
                                                                                IN i_fieldActualValue VARCHAR(315),
                                                                                IN i_fieldID INT,
                                                                                IN i_tcSSNID INT
                                                                                    )
BEGIN

    DECLARE cnt INT;
    
    SELECT Count(*) INTO cnt From `aft`.`fieldValue`
        WHERE fieldID = i_fieldID And tcSSNID = i_tcSSNID ;
        
        IF cnt = 0 Then
            
            INSERT INTO `aft`.`fieldValue`
                    (
                        fieldExpectedValue,
                        fieldActualValue,
                        fieldID,
                        tcSSNID
                    )
            VALUES
                    (
                        i_fieldExpectedValue,
                        i_fieldExpectedValue,
                        i_fieldID,
                        i_tcSSNID
                    );
                    
            Select LAST_INSERT_ID();
        ELSE
            
            UPDATE `aft`.`fieldValue`
                SET fieldExpectedValue = i_fieldExpectedValue,fieldActualValue = i_fieldActualValue WHERE  fieldID = i_fieldID AND tcSSNID =i_tcSSNID;
        
        END IF ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Keywords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Keywords`(
                                                IN i_eventName VARCHAR(255),
                                                IN i_eventType VARCHAR(50),
                                                IN i_qflName VARCHAR(50),
                                                IN i_projectID INT,                                                
                                                IN i_freeText VARCHAR(255),
                                                IN i_Param VARCHAR(50),
                                                IN i_ParamSeq INT
                                               
)
BEGIN

 DECLARE vareventID INT;
 DECLARE cnt INT;
 SELECT COUNT(*) INTO cnt
 FROM event_master
 WHERE eventName=i_eventName;
 IF cnt=0 THEN
    INSERT INTO `aft`.`event_master` 
        ( 
        eventName,
        eventType,
        qflName ,
        projectID 
        )
    VALUES ( 
        i_eventName ,
        i_eventType,
        i_qflName ,
        i_projectID 
        );
    SET vareventID = LAST_INSERT_ID();
 else
    SELECT eventID INTO vareventID
    FROM event_master
    WHERE eventName=i_eventName;
 end if;
  set cnt=0;
 SELECT COUNT(*) INTO cnt
 FROM event_freetext
 WHERE eventID=vareventID;
 IF cnt=0 THEN
    INSERT INTO `aft`.`event_freetext`
            (
            freeText ,
            eventID
            )
    VALUES (
            i_freeText,
            vareventID
            );
 else
    update event_freetext
    set freeText=i_freeText
    where eventID=vareventID;
 end if;
 set cnt=0;
 SELECT COUNT(*) INTO cnt
 FROM event_parameter
 WHERE eventID=vareventID and paraSeq=i_ParamSeq;  
 IF cnt=0 THEN
    INSERT INTO `aft`.`event_parameter`
        (
        eventID ,
        paraName ,
        paraSeq 
        )
    VALUES
        (
        vareventID ,
        i_Param ,
        i_ParamSeq        
        );
 else 
    UPDATE `aft`.`event_parameter`
    SET paraName=i_Param
    where  eventID=vareventID and paraSeq=i_ParamSeq; 
 end if;  
 
  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_NewScenario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_NewScenario`(  
                                                           
                                                           IN i_scenarioName VARCHAR(45),
                                                           IN i_scenarioDescrition VARCHAR(5000),
                                                           IN i_projectID INT,
                                                           out scnID int(50)
                                                           #OUT o_err VARCHAR(45)
                                                        )
BEGIN

     
    
    IF !EXISTS(SELECT scenarioID FROM aft.Scenario WHERE  scenarioName = i_scenarioName and projectID = i_projectID)
            Then
                  INSERT INTO `aft`.`Scenario`
                    (
                        scenarioName,
                        scenarioDescription,
                        projectID
                    )
            VALUES
                    (
                        i_scenarioName,
						i_scenarioDescrition,
                        i_projectID
                    );
SELECT 
    scenarioID
FROM
    aft.Scenario
WHERE
    scenarioName = i_scenarioName and projectID = i_projectID and projectID = i_projectID INTO scnID; 
	  ELse
                SELECT -1 into scnID ;
    END IF;
   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_NewTestcase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_NewTestcase`(
                                                            
                                                            IN i_tcName VARCHAR(255),
                                                            IN i_tcDescription VARCHAR(5000),
                                                            IN i_tcComments VARCHAR(500),
															IN i_tcPrerequisites VARCHAR(500),
															IN i_scenarioID INT,
                                                            IN i_tcDeveloper VARCHAR(45),
                                                            out tcID int(50)
                                                            
                                                        )
BEGIN


 INSERT INTO `aft`.`testcase`
                 (
					testcaseName,
                    testcaseDescription,
                    comments,
					prerequisites,
                    scenarioID,
                    testcaseDeveloper
                 )   
                                                
        VALUES
                 (
                    i_tcName,
                    i_tcDescription,
                    i_tcComments,
                    i_tcPrerequisites,
                    i_scenarioID,
                    i_tcDeveloper
                 );
                 
SELECT 
    testcaseID
FROM
    aft.testcase
WHERE
    testcaseName = i_tcName and scenarioID=i_scenarioID INTO tcID; 	 
   
                 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_NewTestcaseContent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_NewTestcaseContent`(
                                                                        IN i_stepID INT,
                                                                        IN i_objectID INT,
                                                                        IN i_eventID INT,
                                                                        #IN i_eventName VARCHAR(255),
                                                                        IN i_seqNum INT,
																		IN i_compCallOcr INT				
                                                                        # OUT o_testcaseContentID INT,
                                                                        # OUT o_paramCount INT
                                                                   )
BEGIN

/*
Declare spEventID INT default 0;

Select event_master.eventID into spEventID from event_master where event_master.eventName = i_eventName ;
*/
If i_objectID = 0 then
    INSERT INTO `aft`.`testcaseContent`
            (
                stepID,
                eventID,
                seqNum,
				compoccurrence
            )
    VALUES
            (
                i_stepID,
                i_eventID,
                i_seqNum,
				i_compCallOcr
            );
Else
    INSERT INTO `aft`.`testcaseContent`
            (
                stepID,
                objectID,
                eventID,
                seqNum,
				compoccurrence	
            )
    VALUES
            (
                i_stepID,
                i_objectID,
                i_eventID,
                i_seqNum,
				i_compCallOcr
            );
End If ;
  #  SET o_testcaseContentID = LAST_INSERT_ID();
  
  select LAST_INSERT_ID();
  
    
/*
    SELECT COUNT(*)
    INTO o_paramCount
    FROM `aft`.`event_parameter`
    WHERE eventID = i_eventID;
    
*/
       
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Objects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Objects`(                                                
IN i_pageID INT,
IN i_objLogicalName varchar(255),
IN i_objType varchar(50),
IN i_obj1Name varchar(100),
IN i_obj1Value varchar(250),
IN i_obj2Name varchar(100),
IN i_obj2Value varchar(250),
IN i_obj3Name varchar(100),
IN i_obj3Value varchar(250),
IN i_obj4Name varchar(100),
IN i_obj4Value varchar(250),
IN i_obj5Name varchar(100),
IN i_obj5Value varchar(250),
IN i_obj6Name varchar(100),
IN i_obj6Value varchar(250),
IN i_obj7Name varchar(100),
IN i_obj7Value varchar(250),
IN i_obj8Name varchar(100),
IN i_obj8Value varchar(250),
IN i_objIndex INT,
OUT o_objectID INT
)
BEGIN

	IF NOT EXISTS (SELECT pageID FROM aft.object_master WHERE pageID = i_pageID AND objectLogicalName = i_objLogicalName )
	THEN
    
            INSERT INTO `aft`.`object_master`
		(
			pageID, 
            objectLogicalName, 
            objectType, 
            `index`,
            propertyName, 
            propertyValue, 
            property2Name, 
            property2Value, 
            property3Name, 
            property3Value, 
            property4Name, 
            property4Value, 
            property5Name, 
            property5Value, 
            property6Name,
			property6Value, 
            property7Name, 
            property7Value, 
            property8Name, 
            property8Value
		)
		VALUES
		(
			i_pageID, 
            i_objLogicalName, 
            i_objType, 
            i_objIndex,
            i_obj1Name, 
            i_obj1Value,
            i_obj2Name, 
            i_obj2Value, 
            i_obj3Name, 
            i_obj3Value, 
            i_obj4Name, 
            i_obj4Value, 
            i_obj5Name, 
            i_obj5Value, 
            i_obj6Name, 
            i_obj6Value, 
            i_obj7Name, 
            i_obj7Value, 
            i_obj8Name, 
            i_obj8Value 
		);
		
		SELECT objectID FROM aft.object_master
		WHERE pageID = i_pageID AND objectLogicalName = i_objLogicalName 
        INTO o_objectID; 
        
	ELSE
    
		SELECT -1 INTO o_objectID;
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_ObjectType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_ObjectType`(
                                                    IN i_ObjectType VARCHAR(255),
                                                    OUT o_ObjectTypeID INT                                                   
                                                    )
BEGIN
    DECLARE cnt INT;
    SELECT COUNT(*) INTO cnt
    FROM objecttype
    WHERE objecttypeName=i_ObjectType;
    IF cnt=0 THEN
        INSERT INTO objecttype
            (
                objecttypeName,
                eventID
            )
        VALUES
            (
                i_ObjectType,
                1
            );
        SET o_ObjectTypeID=LAST_INSERT_ID();  
    
        
    ELSE
        SELECT ObjectTypeID INTO o_ObjectTypeID
        FROM objecttype
        WHERE objectType=i_ObjectType;
    END IF;
   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_ObjecttypeEventRelationship` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_ObjecttypeEventRelationship`( 
                                                            IN i_eventName VARCHAR(50) ,
                                                            IN i_Object VARCHAR(50)
                                                        )
BEGIN
    Declare v_eventID , v_ObjectID,v_Loop INT;
    declare rowCount,cnt INT DEFAULT 0;
    Declare Objecttype_cursor CURSOR FOR
    select objectTypeID
    from objecttype;
    
    select eventID into v_eventID
    from event_master    
    where eventName=i_eventName;
    set v_Loop=1;
    
    if LCASE(i_Object)="all" then
        OPEN Objecttype_cursor;
        select FOUND_ROWS() into rowCount;
        while rowCount+1>v_Loop do        
            Fetch Next From Objecttype_cursor INTO v_ObjectID;
            set v_Loop=v_Loop+1;
            select count(*) into cnt
            from objecttype_eventrelationship
            where objectTypeID=v_ObjectID and eventID=v_eventID;
            if cnt=0 then
                Insert Into objecttype_eventrelationship
                    (
                        objectTypeID,
                        eventID
                    )
                    Values
                    (
                        v_ObjectID,
                        v_eventID
                        
                    );
             end if;
          end while;  
     else
        select objectTypeID into v_ObjectID
        from objecttype
        where objectType= i_Object;
        select count(*) into cnt
        from objecttype_eventrelationship
        where objectTypeID=v_ObjectID and eventID=v_eventID;
        if cnt=0 then
                Insert Into objecttype_eventrelationship
                    (
                        objectTypeID,
                        eventID
                    )
                    Values
                    (
                        v_ObjectID,
                        v_eventID
                        
                    );   
        
        end if;  
     end if;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_OR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_OR`(
                                           IN i_orID INT,
                                           IN i_orName VARCHAR(45),
                                           IN i_orFlag CHAR(4),
                                           IN i_orPath VARCHAR(1500),
                                           IN i_UserID VARCHAR(45) 

                                        )
BEGIN
INSERT INTO `aft`.object_repository 
            (
                objectRepositoryID,
                objectRepositoryName,
                objectRepositoryFlag,
                objectRepositoryPath,
                userID
            )
    VALUES 
            (
                i_orID,
                i_orName,
                i_orFlag,
                i_orPath,
                i_UserID 
            );
            
            
 Select LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_ORPageName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_ORPageName`(
IN 	i_pageName 			VARCHAR(100),
IN 	i_pageTitle 		VARCHAR(100),
IN 	i_pageDescription 	VARCHAR(250),
IN 	i_projectID 		INT,
OUT pagID 				INT
)
BEGIN
	IF NOT EXISTS (SELECT pageID FROM aft.object_repository WHERE  pageName = i_pageName and projectID = i_projectID )
	THEN
		INSERT INTO `aft`.`object_repository`
		( pageName, projectID, PageTitle, pageDescription )
		VALUES
		( i_pageName, i_projectID, i_pageTitle, i_pageDescription );
		
        SELECT pageID FROM aft.object_repository
		WHERE pageName = i_pageName and projectID = i_projectID  INTO pagID; 
	ELSE
		SELECT -1 into pagID ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_selected_Project` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_selected_Project`(

IN chvlanID VARCHAR(45),
IN projectID INT,
IN projectName VARCHAR(45),
IN ProjectSummary VARCHAR(255)
)
BEGIN
delete from `selected_project` where idselected_project<>0;
	Insert into `selected_project` (
	          Lan_ID,
			  projectID,
			  projectName,
			  projectSummary
	)values(
	    chvlanID ,
		projectID ,
        projectName ,
		ProjectSummary
	);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_TCCData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_TCCData`( 
												IN i_testCaseID int(32),                                               
                                                IN i_eventID int(32),
                                                IN i_pageID int(32),
                                                IN i_objectID int(32),
                                                IN i_seqNum int(32),
                                                IN i_param1 varchar(500),
                                                IN i_param2 varchar(255),
                                                IN i_param3 varchar(255),
                                                IN i_param4 varchar(255),
                                                IN i_param5 varchar(255),
                                                IN i_scrshot Bit
                                                )
BEGIN


                  INSERT INTO `aft`.`testcasecontent`
                    (
                        testcaseID,eventID,objectID,seqNum,param1,param2,param3,param4,param5,scrshot
                    )
                     VALUES
                    (
                        i_testCaseID,i_eventID,i_objectID,i_seqNum,i_param1,i_param2,i_param3,i_param4,i_param5,i_scrshot
                    );


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_tc_SSNMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_tc_SSNMapping`(
                                                                                  IN i_tcID INT,
                                                                                  IN i_SSN VARCHAR(315)
                                                                                    )
BEGIN

    DECLARE cnt INT;
    
    SELECT count(*) INTO cnt FROM `aft`.`testcase_ssnmapping`
        WHERE SSNID = i_SSN AND tcID = i_tcID ;
        
    IF cnt = 0 Then
        
        INSERT INTO `aft`.`testcase_ssnmapping`
                (
                    SSNID,
                    tcID
                )
        VALUES
                (
                    i_SSN,
                    i_tcID
                );
                
        Select LAST_INSERT_ID(); 
        
    ELSE
    
        Select tcSSNID from `aft`.`testcase_ssnmapping`
            WHERE SSNID = i_SSN AND tcID = i_tcID ;
            
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_TestCaseSuite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_TestCaseSuite`(
IN 	i_suiteName 	VARCHAR(100),
IN 	i_projectID		INT,
OUT o_suiteID		INT
)
BEGIN
IF NOT EXISTS (SELECT suiteID FROM `aft`.`suite_master` WHERE suiteName = i_suiteName AND projectID = i_projectID)
	THEN
		INSERT INTO `aft`.`suite_master`
		( suiteName, projectID )
		VALUES
		( i_suiteName, i_projectID);
		
        SELECT suiteID FROM `aft`.`suite_master` 
        WHERE suiteName = i_suiteName AND projectID=i_projectID into o_suiteID; 
	ELSE
		SELECT -1 into o_suiteID ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_TestCaseSuiteDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_TestCaseSuiteDetails`(
IN 	i_suiteID 	    	INT,
IN 	i_testcaseID		INT,
OUT o_suitecontentID	INT
)
BEGIN
IF NOT EXISTS (SELECT suitecontentID FROM `aft`.`suite_testcase` WHERE testcaseID = i_testcaseID AND suiteID = i_suiteID)
	THEN
		INSERT INTO `aft`.`suite_testcase`
		( testcaseID, suiteID )
		VALUES
		( i_testcaseID, i_suiteID);
		
        SELECT suitecontentID FROM `aft`.`suite_testcase` 
        WHERE testcaseID = i_testcaseID AND suiteID=i_suiteID into o_suitecontentID; 
	ELSE
		SELECT -1 into o_suitecontentID ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_TestCase_ByClientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_TestCase_ByClientID`(
                                          IN intClientID VARCHAR(45)
                                        )
BEGIN
DECLARE clienttestcaseID_NOT_FOUND INT DEFAULT 0;
DECLARE inttestcaseID INT;

DECLARE testcaseIDCursor CURSOR
FOR
Select testcaseID from testcase;

DECLARE Continue HANDLER for NOT FOUND SET clienttestcaseID_NOT_FOUND = 1;

OPEN testcaseIDCursor;
    theLOOP : LOOP
        FETCH from testcaseIDCursor INTO inttestcaseID ;
            IF clienttestcaseID_NOT_FOUND = 1 then
                LEAVE theLOOP;
            END IF;
            Insert Into client_testcaserelationship
                    (
                        clientID,
                        testcaseID
                    )
                    Values
                    (
                        intClientID,
                        inttestcaseID
                        
                    );
            
    End LOOP;
Close testcaseIDCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Testcase_Detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Testcase_Detail`(
IN 	i_masterID 		INT,
IN 	i_testStep 		INT,
IN 	i_testEvent 	INT,
IN 	i_testObject	INT,
IN  i_testComponent INT,
IN 	i_testData 		VARCHAR(500),
IN   i_scrshot     Bit
)
BEGIN
		INSERT INTO `aft`.`testcase_Detail`
		( testcase_MasterID, testcase_Steps, testcase_Event, testcase_Object, testcase_Component, testcase_Data,scrshot )
		VALUES
		( i_masterID, i_testStep, i_testEvent, i_testObject, i_testComponent, i_testData ,i_scrshot);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Testcase_Master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Testcase_Master`(
IN 	i_testName 			VARCHAR(100),
IN 	i_testObjective		VARCHAR(200),
IN 	i_testPrecondition	VARCHAR(200),
IN 	i_testSummary		VARCHAR(500),
IN 	i_projectID		INT,
OUT o_masterID			INT
)
BEGIN
	IF NOT EXISTS (SELECT testcase_masterID FROM `aft`.`testcase_master` WHERE testcase_Name = i_testName AND projectID = i_projectID)
	THEN
		INSERT INTO `aft`.`testcase_master`
		( testcase_Name, testcase_Objective, testcase_Precondition, testcase_Summary, projectID )
		VALUES
		( i_testName, i_testObjective, i_testPrecondition, i_testSummary, i_projectID);
		
        SELECT testcase_masterID FROM `aft`.`testcase_master` 
        WHERE testcase_Name = i_testName AND projectID = i_projectID INTO o_masterID; 
	ELSE
		SELECT -1 into o_masterID ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_TestData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_TestData`(
                                                    IN i_tccID INT,
                                                    #IN i_seqNum INT,
                                                    IN i_eventParaID INT,
                                                    IN i_paramValue VARCHAR(1000)                                                        
                                                  )
BEGIN

  /*  DECLARE epID INT;
    
    SELECT eventParaID 
    INTO epID
    FROM `aft`.`event_parameter`
    WHERE eventID = i_eventID
    AND paraSeq = i_seqNum;
    
*/

Declare cellFormula VARCHAR(500);
DECLARE cellValue VARCHAR(500);


If INSTR(i_paramValue,"_FORMULA") then
    
    SELECT SUBSTRING_INDEX(i_paramValue,"_FORMULA_",1) into cellFormula;
    SELECT SUBSTRING_INDEX(i_paramValue,"_FORMULA_",-1) into cellValue;
    
    INSERT INTO `aft`.`testData`
            (
                testcaseContentID,
                eventParaID,
                value,
                formula
            )
    VALUES
            (
                i_tccID,
                i_eventParaID,
                cellValue,
                cellFormula
            );
            
Else
    
    INSERT INTO `aft`.`testData`
            (
                testcaseContentID,
                eventParaID,
                value
            )
    VALUES
            (
                i_tccID,
                i_eventParaID,
                i_paramValue
            );  
End If ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Variables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Variables`(
                                                        IN i_varType VARCHAR(45),
                                                        IN i_varName VARCHAR(1000),
                                                        IN i_varValue VARCHAR(15000),
                                                        IN i_iterNumber INT(11),
                                                        -- IN i_projectID INT,
                                                        IN i_scenarioID INT(11),
                                                        IN i_entity_client_relationID INT(11),
                                                        IN i_clientID VARCHAR(45),
                                                        IN i_credentialID INT(11)
                                                   )
BEGIN

           Declare varCount INT;
           Declare varID INT;          
            
      
           SELECT COUNT(*) INTO varCount FROM `aft`.`variable`WHERE variableType = i_varType And variableName = i_varName And iterationNumber = i_iterNumber And scenarioID = i_scenarioID  And entity_client_relationshipID = i_entity_client_relationID And clientID = i_clientID And credentialID = i_credentialID;

           IF varCount = 0 THEN 
           
                   INSERT INTO `aft`.`variable`
                            (
                                variableType,
                                variableName,
                                variableValue,
                                iterationNumber,
                                scenarioID,
                                entity_client_relationshipID,
                                clientID,
                                credentialID
                                
                            )
                   VALUES
                            (
                                i_varType,
                                i_varName,
                                i_varValue,
                                i_iterNumber,
                                i_scenarioID,
                                i_entity_client_relationID,
                                i_clientID,
                                i_credentialID                                
                            );   
                    Select LAST_INSERT_ID();
           ELSE
            
                SELECT variableID INTO varID FROM `aft`.`variable`WHERE variableType = i_varType And variableName = i_varName And iterationNumber = i_iterNumber And scenarioID = i_scenarioID  And entity_client_relationshipID = i_entity_client_relationID And clientID = i_clientID And credentialID = i_credentialID;

             -- Select variableID into varID from `aft`.`variable` where variableType = i_varType And variableName = i_varName And iterationNumber = i_iterNumber And scenarioID = i_scenarioID AND clientID = i_clientID;
              
              Update `aft`.`variable` 
                    set variableType = i_varType,variableName=i_varName,
                    variableValue=i_varValue,iterationNumber=i_iterNumber,scenarioID=i_scenarioID,entity_client_relationshipID=i_entity_client_relationID,credentialID=i_credentialID
                    Where variableID = varID And scenarioID = i_scenarioID AND entity_client_relationshipID = i_entity_client_relationID And clientID = i_clientID And credentialID = i_credentialID;
                      
                Select varID;
              
           END IF;        
                    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Variables_ByClientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Insert_Variables_ByClientID`(
 IN intClientID VARCHAR(45)
)
BEGIN
DECLARE variableID_NOT_FOUND INT DEFAULT 0;
DECLARE varcharvariableType varchar(45);
DECLARE varcharvariableName varchar(45);
DECLARE varcharvariableValue varchar(1000);
DECLARE intiterationNumber INT;
DECLARE intscenarioID INT;


DECLARE variableCursor CURSOR
FOR
Select variableType,variableName,variableValue,iterationNumber,scenarioID from variable_master;

DECLARE Continue HANDLER for NOT FOUND SET variableID_NOT_FOUND = 1;

OPEN variableCursor;
    theLOOP : LOOP
        FETCH from variableCursor INTO varcharvariableType,varcharvariableName,varcharvariableValue,intiterationNumber,intscenarioID ;
            IF variableID_NOT_FOUND = 1 then
                LEAVE theLOOP;
            END IF;
            Insert Into variable
                    (
                        variableType,
						variableName,
						variableValue,
						iterationNumber,
						scenarioID,
						clientID
                    )
                    Values
                    (
						varcharvariableType,
						varcharvariableName,
						varcharvariableValue,
						intiterationNumber,
						intscenarioID,
                        intClientID
                    );
            
    End LOOP;
Close variableCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Admin_Delete_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Admin_Delete_User`(
									   IN i_lanID VARCHAR(45),
									 
									   out o_resultStat int(50)
)
BEGIN

IF EXISTS(SELECT lanID FROM aft.user_master WHERE  lanID=i_lanID)
            Then
     
     delete from testcasecontent where testcaseContentID <> 0 and testcaseID in (SELECT testcaseID FROM testcase where scenarioID  in (select scenarioID from  scenario where projectID IN (select projectID from project_master where `Lan_ID` = i_lanID)) );
	 delete FROM testcase where testcaseID<>0 and scenarioID in (select scenarioID from  scenario where projectID IN (select projectID from project_master where `Lan_ID` = i_lanID));
	 delete from testcase_detail where testcase_detailID <> 0 and testcase_MasterID in (SELECT testcase_masterID FROM testcase_master where projectID IN (select projectID from project_master where `Lan_ID` = i_lanID));
	 delete FROM testcase_master where testcase_masterID <>0 and  projectID IN (select projectID from project_master where `Lan_ID` = i_lanID);
     delete  from scenario where scenarioID <> 0 and projectID IN (select projectID from project_master where `Lan_ID` = i_lanID);
	 delete from testcasecontent where testcaseContentID <> 0 and objectID in (select objectID from  object_master where pageID in (SELECT projectID FROM object_repository where projectID  IN (select projectID from project_master where `Lan_ID` = i_lanID) ));
	 delete from componentdetail where componentDetailID <> 0 and  componentID in (select componentID from componentmaster where projectID  IN (select projectID from project_master where `Lan_ID` = i_lanID));
	 delete from componentmaster where componentID <> 0 and projectID   IN (select projectID from project_master where `Lan_ID` = i_lanID);
     delete from object_master where objectID <> 0 and pageID in (SELECT pageID  FROM object_repository where projectID  IN (select projectID from project_master where `Lan_ID` = i_lanID));
     delete FROM object_repository where pageID <>0 and projectID IN (select projectID from project_master where `Lan_ID` = i_lanID);
     delete from execution_details where tccRUnID <> 0 and executionRunID in (select executionRunID from execution_runmaster where projectID  IN (select projectID from project_master where `Lan_ID` = i_lanID));
	 delete FROM execution_runmaster where executionRunID <> 0 and projectID IN (select projectID from project_master where `Lan_ID` = i_lanID);
     delete FROM project_master where projectID  IN (select projectID from project_master where `Lan_ID` = i_lanID);
     delete FROM user_master where  `lanID` = i_lanID;
            
                SELECT 1 into o_resultStat ;
    
    ELse
                SELECT -1 into o_resultStat ;
    End if;         
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Admin_Insert_NewProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Admin_Insert_NewProject`(

								IN i_projectName VARCHAR(45),
                                IN i_Lan_ID VARCHAR(45),
                                IN i_ProjectSummary VARCHAR(100),
								out projID int(50)
)
BEGIN
 IF !EXISTS(SELECT projectID FROM aft.project_master WHERE  projectName = i_projectName and Lan_ID = i_Lan_ID  )
            Then
                  INSERT INTO `aft`.`project_master`
                    (
                        projectName , Lan_ID , projectSummary
                    )
            VALUES
                    (
                        i_projectName , i_Lan_ID , i_ProjectSummary
                    );
SELECT 
    projectID
FROM
    aft.project_master
WHERE
    projectName = i_projectName INTO projID; 
	  ELse
                SELECT -1 into projID ;
    END IF;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Admin_Insert_NewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Admin_Insert_NewUser`(
									   IN i_lanID VARCHAR(45),
									   IN i_Username VARCHAR(45),
									   IN i_UserType VARCHAR(45),
                                       IN i_email VARCHAR(45),
                                       IN i_Password VARCHAR(45),
									   IN i_projectID INT,
									   out o_resultStat int(50)
)
BEGIN

IF !EXISTS(SELECT lanID FROM aft.user_master WHERE  Username = i_Username or lanID=i_lanID or email=i_email)
            Then
 INSERT INTO `aft`.`user_master`
                 (
					lanID,
                    Password,
                    Username,
					UserType,
                    projectID,
                    email
                 )   
                                                
        VALUES
                 (
                    i_lanID,
                    i_Password,
                    i_Username,
                    i_UserType,
                    i_projectID,
                    i_email
                 );
                 
SELECT 
    lanID
FROM
    aft.user_master
WHERE
   Username = i_Username INTO o_resultStat; 
	  ELse
                SELECT -1 into o_resultStat ;
    END IF;
   
              
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Admin_Select_AllKeywords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Admin_Select_AllKeywords`()
BEGIN
SELECT * FROM event_master ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Admin_Select_AllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Admin_Select_AllUsers`()
BEGIN
SELECT lanID As UserID,Username AS UserName,UserType FROM aft.user_master;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Admin_Update_NewProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Admin_Update_NewProject`(
								IN i_projectName VARCHAR(45),
								IN i_projID int(50),
                                IN i_Lan_ID VARCHAR(45),
                                IN i_ProjectSummary VARCHAR(100)
)
BEGIN
 IF !EXISTS(SELECT projectID FROM aft.project_master WHERE  projectName = i_projectName and Lan_ID = i_Lan_ID and projectID<>i_projID)
            Then
                  UPDATE project_master SET projectName=i_projectName , projectSummary = i_ProjectSummary
                  where projectID=i_projID;
end if;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Admin_Update_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Admin_Update_User`(
									   IN i_lanID VARCHAR(45),
									   IN i_Username VARCHAR(45),
									   IN i_UserType VARCHAR(45),
                                       IN i_email VARCHAR(45),
                                       IN i_Password VARCHAR(45),
									   IN i_projectID INT,
									   out o_resultStat int(50)
)
BEGIN

IF EXISTS(SELECT lanID FROM aft.user_master WHERE  lanID=i_lanID)
            Then
IF Not EXISTS(SELECT lanID FROM aft.user_master WHERE  lanID<>i_lanID and email = i_email )
             Then
 Update  `aft`.`user_master` set
                    Password=i_Password,
                    Username=i_Username,
					UserType=i_UserType,
                    projectID=i_projectID,
                    email=i_email
                    where lanID=i_lanID;
              
           
SELECT 
    lanID
FROM
    aft.user_master
WHERE
   Username = i_Username INTO o_resultStat; 
	  ELse
                SELECT -1 into o_resultStat ;
    END IF;
    ELse
                SELECT -1 into o_resultStat ;
    End if;         
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_AllProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Select_AllProjects`(IN chvlanID VARCHAR(45) )
BEGIN
Select * From project_master where Lan_ID = chvlanID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_DashBoard_EcecutionData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_Select_DashBoard_EcecutionData`(
                                          
                                       )
BEGIN


-- Select * from runmaster where clientID = i_clientID Order by executionRunID Desc;

	-- *********************** Declaration of cursor an its variable *************************
    DECLARE execution_NOT_FOUND INT DEFAULT 0;
    DECLARE req_execution_NOT_FOUND INT ;
    DECLARE varexecutionRunID INT;
	DECLARE varuserID VARCHAR(45);
    DECLARE varclientName Varchar(45);
    DECLARE vartimeStamp Varchar(45);
  --  DECLARE varpassCount INT;
  --  DECLARE varfailCount INT;

	-- Start  of Cursor for getting all the execution results

    DECLARE scnCursor CURSOR 
    FOR
    Select executionRunID from runmaster  Order by executionRunID Desc;
	-- **************************** Declare Handler ************************

	DECLARE Continue HANDLER FOR NOT FOUND SET execution_NOT_FOUND = 1;
	DROP TABLE IF EXISTS temp_scenarioTbl_detail;
	-- *************************************************************
 CREATE TEMPORARY TABLE IF NOT EXISTS temp_scenarioTbl_detail(
        `executionRunID` INT(64) DEFAULT NULL,
        `userID` varchar(45) DEFAULT NULL,
        `clientID` varchar(45) DEFAULT NULL,
        `timeStamp` varchar(45) DEFAULT NULL,
        `passCount` INT(11) DEFAULT NULL,
        `failCount` INT(11) DEFAULT NULL
        );

     OPEN scnCursor ;

		theLOOP : LOOP
				
		FETCH from scnCursor INTO varexecutionRunID;
			Set req_execution_NOT_FOUND = execution_NOT_FOUND;
			IF execution_NOT_FOUND = 1 THEN
				LEAVE TheLoop;
			END IF;
               
		Set @varPassCount = (SELECT Count(*) As PassCount FROM runmaster rm join configrunmaster crm on rm.executionRunID = crm.exeRunID
        join portaldatarun pdr on crm.configDataID = pdr.configDataID where pdr.status = 'Pass' and rm.executionRunID=varexecutionRunID);
        Set @varFailCount = (SELECT Count(*) As PassCount FROM runmaster rm join configrunmaster crm on rm.executionRunID = crm.exeRunID
		join portaldatarun pdr on crm.configDataID = pdr.configDataID where pdr.status = 'Fail' and rm.executionRunID=varexecutionRunID);

		  Select executionRunID,userID,clientID,timestamp into 
		  varexecutionRunID,varuserID,varclientName,vartimeStamp
		  from runmaster where executionRunID=varexecutionRunID ;

		IF varexecutionRunID IS NOT NULL then    -- Get Run Details for those scenario's only whose execution is between from and to date
			INSERT INTO temp_scenarioTbl_detail(executionRunID,userID,clientID,timeStamp,passCount,failCount) 
			Values(varexecutionRunID,varuserID,varclientName,vartimeStamp,@varPassCount,@varFailCount);
		End If;
	END LOOP;

	Close scnCursor ;

 -- End of Cursor for getting all the execution results

Select * from temp_scenarioTbl_detail;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_DashBoard_EcecutionData_by_RunID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_Select_DashBoard_EcecutionData_by_RunID`(
                                           IN i_executionRunID INT(64),
										   IN i_entityName Varchar(64)
                                       )
BEGIN

  SELECT pdr.dataRunID,  crm.entity,crm.entityfieldValue,pdr.status,pdr.attributName,pdr.actualValue,pdr.expectedValue
  FROM runmaster rm join configrunmaster crm on rm.executionRunID = crm.exeRunID
  join portaldatarun pdr on crm.configDataID = pdr.configDataID 
  where rm.executionRunID=i_executionRunID and crm.entity = i_entityName;

/*
    DECLARE scenario_NOT_FOUND INT DEFAULT 0;
    DECLARE req_scenario_NOT_FOUND INT ;
    DECLARE vardataRunID INT;
	DECLARE varentity VARCHAR(45);
    DECLARE varentityfieldValue Varchar(45);
    DECLARE varstatus VARCHAR(45);
    DECLARE varattributName VARCHAR(45);
    DECLARE varactualValue VARCHAR(4000);
    DECLARE varexpectedValue VARCHAR(4000);

   Declare preventityName Varchar(45) Default null;
  --  Declare currentityName Varchar(45);




    DECLARE scnCursor CURSOR 
    FOR
    SELECT pdr.dataRunID, crm.entity FROM runmaster rm join configrunmaster crm on rm.executionRunID = crm.exeRunID
    join portaldatarun pdr on crm.configDataID = pdr.configDataID where rm.executionRunID = i_executionRunID ;

-- **************************** Declare Handler ************************

    DECLARE Continue HANDLER FOR NOT FOUND SET scenario_NOT_FOUND = 1;
 DROP TABLE IF EXISTS temp_testcaseTbl_detail;
-- *************************************************************
 CREATE TEMPORARY TABLE IF NOT EXISTS temp_scenarioTbl_detail(
        `dataRunID` INT(64) DEFAULT NULL,
        `entity` varchar(45) DEFAULT NULL,
        `entityfieldValue` varchar(45) DEFAULT NULL,
        `status` varchar(45) DEFAULT NULL,
        `attributName` varchar(45) DEFAULT NULL,
        `actualValue` varchar(4000) DEFAULT NULL,
		`expectedValue` varchar(40000) DEFAULT NULL
        );
		Set @currentityName = "";

        OPEN scnCursor ;

            theLOOP : LOOP
				
				
                FETCH from scnCursor INTO vardataRunID,varentity;
						Set req_scenario_NOT_FOUND = scenario_NOT_FOUND;
						IF scenario_NOT_FOUND = 1 THEN
                            LEAVE TheLoop;
                        END IF;
					-- Set currentityName = varentity;
				 If (varentity = @currentityName) then
					 INSERT INTO temp_scenarioTbl_detail(dataRunID,entity,entityfieldValue,status,attributName,actualValue,expectedValue) 
								 Values(vardataRunID,varentity,Null,Null,Null,Null,Null);
				 End If; 
                   
                
			    SELECT pdr.dataRunID,  crm.entity,crm.entityfieldValue,pdr.status,pdr.attributName,pdr.actualValue,pdr.expectedValue
                Into vardataRunID,varentity,varentityfieldValue,varstatus,varattributName,varactualValue,varexpectedValue
                FROM runmaster rm join configrunmaster crm on rm.executionRunID = crm.exeRunID
                join portaldatarun pdr on crm.configDataID = pdr.configDataID where pdr.dataRunID = vardataRunID;
               
                        IF vardataRunID IS NOT NULL then    -- Get Run Details for those scenario's only whose execution is between from and to date
                                     INSERT INTO temp_scenarioTbl_detail(dataRunID,entity,entityfieldValue,status,attributName,actualValue,expectedValue) 
                                          Values(vardataRunID,varentity,varentityfieldValue,varstatus,varattributName,varactualValue,varexpectedValue);
                            
                        End If;
                Set @currentityName = varentity;

             END LOOP;

        Close scnCursor ;

        Select * from temp_scenarioTbl_detail;
*/


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_ProjectbyID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Select_ProjectbyID`(
in i_ProjectID int(32)
)
BEGIN
Select * From project_master where projectID=i_ProjectID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_StepData_ByTCID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_Select_StepData_ByTCID`(IN testcaseID INT(32))
BEGIN
/*
SELECT ScenarioID,TCID,StepID,EVENT,Parent,Child,Param1,Param2,Param3 FROM scenarioview WHERE TCID= testcaseID;
*/
               Select 
scn.scenarioID,tc.testcaseID,stp.stepID,tcc.testcaseContentID,td.testDataID,em.eventName AS EVENT,om.parentName AS Parent,om.objectLogicalName AS Child,
  /* group_concat(if((ep.paraSeq = 1),
                td.value,
                NULL)
            separator ',') AS Parent,
        group_concat(if((ep.paraSeq = 2),
                td.value,
                NULL)
            separator ',') AS Child, */
        group_concat(if((ep.paraSeq = 3),
                td.value,
                NULL)
            separator ',') AS Param1,
        group_concat(if((ep.paraSeq = 4),
                td.value,
                NULL)
            separator ',') AS Param2,
        group_concat(if((ep.paraSeq = 5),
                td.value,
                NULL)
            separator ',') AS Param3,
        group_concat(if((ep.paraSeq = 6),
                td.value,
                NULL)
            separator ',') AS Param4,
        group_concat(if((ep.paraSeq = 7),
                td.value,
                NULL)
            separator ',') AS Param5,
        group_concat(if((ep.paraSeq = 8),
                td.value,
                NULL)
            separator ',') AS Param6,
        group_concat(if((ep.paraSeq = 3),
                td.formula,
                NULL)
            separator ',') AS formulaP1,
        group_concat(if((ep.paraSeq = 4),
                td.formula,
                NULL)
            separator ',') AS formulaP2,
        group_concat(if((ep.paraSeq = 5),
                td.formula,
                NULL)
            separator ',') AS formulaP3,
        group_concat(if((ep.paraSeq = 6),
                td.formula,
                NULL)
            separator ',') AS formulaP4,
        group_concat(if((ep.paraSeq = 7),
                td.formula,
                NULL)
            separator ',') AS formulaP5,
        group_concat(if((ep.paraSeq = 8),
                td.formula,
                NULL)
            separator ',') AS formulaP6
from scenario scn 
join testcase tc on  scn.scenarioID = tc.scenarioID
join step stp on tc.testcaseID  = stp.testcaseID
join testcasecontent tcc on stp.stepID = tcc.stepID 
join testdata td on tcc.testcaseContentID  = td.testcaseContentID
join object_master om on om.objectID=tcc.ObjectID
join event_master em on em.eventID = tcc.eventID
join event_parameter ep on em.eventID = ep.eventID
Group By tcc.testcaseContentID having tc.testcaseID = testcaseID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_TestCaseExecutionTIme_ByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_Select_TestCaseExecutionTIme_ByID`(
IN testcaseID INT(11)
)
BEGIN

SELECT  tcRUNID,tcExecutionTimeStamp FROM testcaserunmaster WHERE tcID = testcaseID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_TestCaseRun_By_UserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_Select_TestCaseRun_By_UserID`(IN i_userID VARCHAR(45))
BEGIN
        Select  tc.testcaseName,tc.testcaseDescription,
                sc.scenarioName,tcrm.tcStatus,tcrm.tcDeveloperID,
                tcrm.tcRUNID,
               
               scrm.scnRUNID 
        FROM `aft`.testcaserunmaster tcrm 
        
        INNER JOIN `aft`.testcase tc ON tcrm.tcID = tc.testcaseID
        
        INNER JOIN `aft`.scenariorunmaster scrm ON tcrm.scRUNID = scrm.scnRUNID
        
        INNER JOIN `aft`.scenario sc ON scrm.scenarioID = sc.scenarioID
        
        WHERE scrm.lanID = i_userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prc_Select_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_Select_user`(
in chvlanID VARCHAR(45)
)
BEGIN
Select * From `aft`.`user_master` where `LanID` = chvlanID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_OR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `select_OR`(
                                            i_UserID varchar(45)
                                        )
BEGIN
SELECT objectRepositoryID,objectRepositoryName,objectRepositoryFlag,objectRepositoryPath
FROM `aft`.object_repository WHERE userID = i_UserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_ComponentMaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_ComponentMaster`(
IN 	i_pageID 				INT,
IN 	i_componentName 		VARCHAR(100),
IN 	i_componentDescription	VARCHAR(100),
IN  i_componentID 			INT,
IN  i_projectID             INT
)
BEGIN
	IF NOT EXISTS (SELECT componentID FROM `aft`.`componentmaster` WHERE `componentName` = i_componentName AND `projectID` = i_projectID AND 
		`pageID` = i_pageID AND  `componentID` <> i_componentID )
	THEN
		UPDATE `aft`.`componentmaster` SET
			`componentName` = i_componentName, 
            `componentDescription` = i_componentDescription
		WHERE
			`componentID` = i_componentID AND `pageID` = i_pageID ; 

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_NewScenario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_NewScenario`(  
                                                           
                                                           IN i_scenarioName VARCHAR(45),
                                                           IN i_scenarioDescrition VARCHAR(5000),
                                                           IN i_projectID INT,
                                                           IN i_scenarioID INT
                                                         
                                                           #OUT o_err VARCHAR(45)
                                                          )
BEGIN

     
    
    IF NOT EXISTS(SELECT scenarioID FROM aft.Scenario WHERE  scenarioName = i_scenarioName and projectID = i_projectID and scenarioID <> i_scenarioID )
            Then
                  UPDATE  `aft`.`Scenario` SET 
                  scenarioName = i_scenarioName ,
				  scenarioDescription = i_scenarioDescrition where scenarioID = i_scenarioID ;
                        
    END IF;
   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Object` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Object`(                                                
IN i_pageID INT,
IN i_objID INT,
IN i_objLogicalName varchar(255),
IN i_objType varchar(50),
IN i_obj1Name varchar(100),
IN i_obj1Value varchar(250),
IN i_obj2Name varchar(100),
IN i_obj2Value varchar(250),
IN i_obj3Name varchar(100),
IN i_obj3Value varchar(250),
IN i_obj4Name varchar(100),
IN i_obj4Value varchar(250),
IN i_obj5Name varchar(100),
IN i_obj5Value varchar(250),
IN i_obj6Name varchar(100),
IN i_obj6Value varchar(250),
IN i_obj7Name varchar(100),
IN i_obj7Value varchar(250),
IN i_obj8Name varchar(100),
IN i_obj8Value varchar(250),
IN i_propertyIsValid varchar(3),
IN i_property2IsValid varchar(3),
IN i_property3IsValid varchar(3),
IN i_property4IsValid varchar(3),
IN i_property5IsValid varchar(3),
IN i_property6IsValid varchar(3),
IN i_property7IsValid varchar(3),
IN i_property8IsValid varchar(3),
IN i_framePath varchar(45),
IN i_frameIndex varchar(45),
IN i_objIndex INT
)
BEGIN

	IF NOT EXISTS (SELECT pageID FROM aft.object_master WHERE pageID = i_pageID AND objectLogicalName = i_objLogicalName AND objectID <> i_objID)
	THEN
    
            UPDATE `aft`.`object_master` SET
				objectType = i_objType, 
				`index` = i_objIndex,
				propertyName = i_obj1Name, 
				propertyValue = i_obj1Value, 
				property2Name = i_obj2Name, 
				property2Value = i_obj2Value, 
				property3Name = i_obj3Name, 
				property3Value = i_obj3Value, 
				property4Name = i_obj4Name, 
				property4Value = i_obj4Value, 
				property5Name = i_obj5Name, 
				property5Value = i_obj5Value, 
				property6Name = i_obj6Name,
				property6Value = i_obj6Value, 
				property7Name = i_obj7Name, 
				property7Value = i_obj7Value, 
				property8Name = i_obj8Name, 
				property8Value = i_obj8Value,
                objectLogicalName = i_objLogicalName,
                propertyIsValid=i_propertyIsValid,
                property2IsValid=i_property2IsValid, 
                property3IsValid=i_property3IsValid, 
                property4IsValid=i_property4IsValid, 
                property5IsValid=i_property5IsValid, 
                property6IsValid=i_property6IsValid, 
                property7IsValid=i_property7IsValid, 
                property8IsValid=i_property8IsValid, 
                framePath=i_framePath, 
                frameIndex=i_frameIndex
			WHERE objectID = i_objID;
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_ObjectType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_ObjectType`(
IN i_ObjectTypeID INT,
IN i_ObjectTypeName varchar(255)
)
BEGIN
IF NOT EXISTS (SELECT objecttypeID FROM aft.objecttype 
WHERE objecttypeName = i_ObjectTypeName 
AND objecttypeID <> i_ObjectTypeID)
	THEN
    
            UPDATE `aft`.`objecttype` SET
				objecttypeName = i_ObjectTypeName
			WHERE objecttypeID = i_ObjectTypeID;
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_ORPageName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_ORPageName`(
IN i_pagID 				INT,
IN i_pageName 			VARCHAR(100),
IN i_pageTitle 			VARCHAR(100),
IN i_pageDescription 	VARCHAR(250),
IN i_projectID 			INT
)
BEGIN
	IF NOT EXISTS (SELECT pageName FROM aft.object_repository WHERE pageId <> i_pagID and projectID = i_projectID and  pageName = i_pageName) THEN
		UPDATE `aft`.`object_repository` SET `pageName`= i_pageName, `projectID` = i_projectID,
        `pageTitle` = i_pageTitle, `pageDescription` = i_pageDescription
        WHERE `pageId` = i_pagID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Row`(IN i_tccID INT,
IN i_eventID INT,
IN i_objectID INT



/*
IN sParam1 varchar(50),
IN sParam2 varchar(50),
IN sParam3 varchar(50),
IN sParam4 varchar(50),
IN sParam5 varchar(50),
IN sParam6 varchar(50),
IN sParam7 varchar(50),
IN sParam8 varchar(50)
*/
)
BEGIN
#DECLARE sParamString varchar(50);

/*
DECLARE iEvntID INT;
DECLARE iobjID INT;
#DECLARE iParamCount INT;
#DECLARE i INT;
#DECLARE iValue VARCHAR(50);
#DECLARE iparaSeq INT;
#DECLARE strPara VARCHAR(500);

#SELECT objectID into iobjID from object_master where object_master.parentName = s_ParentName And object_master.objectLogicalName = s_objectLogicalName;
SELECT objectID into iobjID from object_master where object_master.objectMapEntry=i_objectMapEntry And object_master.parentName=i_ParentName And object_master.objectLogicalName=i_objectLogicalName;
SELECT event_master.eventID into iEvntid from event_master where event_master.eventName = i_EventName;

*/

#SELECT max(event_parameter.paraSeq)into iparaSeq from event_parameter where event_parameter.eventID = iEvntid;

DECLARE cnt INT;

SELECT COUNT(*) INTO cnt
 FROM testcasecontent
WHERE  testcasecontentID = i_tccID ;
 IF cnt != 0 THEN 
 update testcasecontent join testdata on (testcasecontent.testcaseContentID = testdata.testcaseContentID) set testcaseContent.eventID = i_eventID,testcasecontent.objectID = i_objectID where testcaseContent.testcaseContentID = i_tccID;
 end if;
 
/*
SELECT max(event_parameter.paraSeq)as iparaSeq from event_parameter where event_parameter.eventID = iEvntid;
SET i = 0;
WHILE (i < iparaSeq) Do
CALL Delete_parameters(i_tccID);
SET i = i + 1;
END WHILE;
*/

Call Delete_TestData(i_tccID);
#Select iEvntid;


/*
SET strPara = CONCAT(sParam1,'-',sParam2,'-',sParam3,'-',sParam4,'-',sParam5,'-',sParam6,'-',sParam7,'-',sParam8);
SET i = 1;
WHILE (i <= iparaSeq) Do
set iValue = SUBSTRING(SUBSTRING_INDEX(strPara,'-',i), LENGTH(SUBSTRING_INDEX(strPara, '-',i - 1)) + LENGTH('-') + (i > 1));
call Insert_TestData(i_tccID,i,iEvntid,iValue);
Set iValue = "";
SET i = i + 1;
END WHILE;
*/

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_TestcaseMaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_TestcaseMaster`(
IN 	i_testName 			VARCHAR(100),
IN 	i_testObjective		VARCHAR(200),
IN 	i_testPrecondition	VARCHAR(200),
IN 	i_testSummary		VARCHAR(500),
IN 	i_masterID			INT,
IN 	i_projectID			INT
)
BEGIN
	IF NOT EXISTS (SELECT testcase_masterID FROM `aft`.`testcase_master` WHERE testcase_Name = i_testName AND 
		projectID = i_projectID AND  testcase_masterID <> i_masterID )
	THEN
    Update testcase set testcaseName= i_testName where scenarioID in ( select scenarioID from scenario where projectID = i_projectID ) and testcaseName in  (SELECT testcase_Name FROM `aft`.`testcase_master` WHERE 
		projectID = i_projectID AND  testcase_masterID = i_masterID );
    
     Update execution_details set testcaseName= i_testName where suiteID in ( select scenarioID from scenario where projectID = i_projectID ) and testcaseName in  (SELECT testcase_Name FROM `aft`.`testcase_master` WHERE 
		projectID = i_projectID AND  testcase_masterID = i_masterID );
    
		UPDATE `aft`.`testcase_master` SET
			testcase_Name = i_testName, 
			testcase_Objective = i_testObjective, 
			testcase_Precondition = i_testPrecondition, 
			testcase_Summary = i_testSummary, 
			projectID = i_projectID 
		WHERE testcase_masterID = i_masterID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view reports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_BACKSLASH_ESCAPES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `view reports`(
    startdate varchar(50) ,
    enddate varchar(50),
    teststatus varchar(10)

   )
BEGIN

SELECT * FROM `aft`.resultview
WHERE ExecutionTime Between startdate and enddate 
AND tccStatus = teststatus;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `itemmaster`
--

/*!50001 DROP VIEW IF EXISTS `itemmaster`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `itemmaster` AS select `user_master`.`Username` AS `ItemName`,`user_master`.`lanID` AS `ItemID`,`user_master`.`UserType` AS `ItemDescription`,'users' AS `ItemType` from `user_master` union all select `project_master`.`projectName` AS `ItemName`,`project_master`.`projectID` AS `ItemID`,'' AS `ItemDescription`,'projects' AS `ItemType` from `project_master` union all select `event_master`.`eventName` AS `ItemName`,`event_master`.`eventID` AS `ItemID`,`event_master`.`freeText` AS `ItemDescription`,'events' AS `ItemType` from `event_master` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-14 20:30:04
