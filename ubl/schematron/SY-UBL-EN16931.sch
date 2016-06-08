<?xml version="1.0" encoding="UTF-8"?>
<!-- 

            UBL syntax binding to the EN16931  
            Created by Validex Schematron Generator. (2015) Midran Ltd.
            Timestamp: 2016-06-08 16:45:51 +0200
     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt2">
  <title>SY  EN16931 bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <phase id="SYEN16931_phase">
    <active pattern="UBL-EN16931"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/SY-EN16931.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="UBL/SY-UBL-EN16931.sch"/>
</schema>
