<?xml version="1.0" encoding="UTF-8"?>
<!-- 

            UBL syntax binding to the model  
            Created by Validex Schematron Generator. (2015) Midran Ltd.
            Timestamp: 2016-06-13 11:56:05 +0200
     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt2">
  <title>EN16931  model bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
  <ns prefix="cn" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
  <phase id="EN_16931_model">
    <active pattern="UBL-model"/>
  </phase>
  <phase id="EN_16931_codes">
    <active pattern="Codesmodel"/>
  </phase>
  <phase id="Specific_UBL_syntax">
    <active pattern="UBL-syntax"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/EN16931-model.sch"/>
  <include href="abstract/EN16931-syntax.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="UBL/EN16931-UBL-model.sch"/>
  <include href="UBL/EN16931-UBL-syntax.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="codelist/EN16931-UBL-codes.sch"/>
</schema>
