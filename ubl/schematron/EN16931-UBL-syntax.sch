<?xml version="1.0" encoding="UTF-8"?>
<!-- 

            UBL syntax binding to the syntax  
            Created by Validex Schematron Generator. (2015) Midran Ltd.
            Timestamp: 2016-12-01 22:33:30 +0100
     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt2">
  <title>EN16931  syntax bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
  <phase id="EN16931syntax_phase">
    <active pattern="UBL-syntax"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/EN16931-syntax.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="UBL/EN16931-UBL-syntax.sch"/>
</schema>
