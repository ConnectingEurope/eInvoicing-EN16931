<?xml version="1.0" encoding="UTF-8"?>
<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cn="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt2">
  <title>EN16931  model bound to UBL</title>
  <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="qdt" uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2"/>
  <ns prefix="udt" uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2"/>
  <ns prefix="cn"  uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <ns prefix="xs"  uri="http://www.w3.org/2001/XMLSchema"/>
  <phase id="EN16931model_phase">
    <active pattern="UBL-model"/>
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codesmodel"/>
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
