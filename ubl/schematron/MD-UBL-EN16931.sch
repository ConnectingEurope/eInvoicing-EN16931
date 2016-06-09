<?xml version="1.0" encoding="UTF-8"?>
<!-- 

            UBL syntax binding to the EN16931  
            Created by Validex Schematron Generator. (2015) Midran Ltd.
            Timestamp: 2016-06-09 12:05:17 +0200
     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt2">
  <title>MD  EN16931 bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <phase id="MDEN16931_phase">
    <active pattern="UBL-EN16931"/>
  </phase>
  <phase id="codelist_phase">
    <active pattern="CodesEN16931"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/MD-EN16931.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="UBL/MD-UBL-EN16931.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="codelist/MDCodesEN16931-UBL.sch"/>
</schema>
