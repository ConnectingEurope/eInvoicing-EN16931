<?xml version="1.0" encoding="UTF-8"?>
<!-- 

        	UBL syntax binding to the TC434   
        	Author: Oriol Bausà
            Timestamp: 2016-05-11 10:47:49 +0200
     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt2">
  <title>TC434  TC434 bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <phase id="TC434TC434_phase">
    <active pattern="UBL-TC434"/>
  </phase>
  <phase id="codelist_phase">
    <active pattern="CodesTC434"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/TC434-TC434.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="UBL/TC434-UBL-TC434.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="codelist/TC434CodesTC434-UBL.sch"/>
</schema>
