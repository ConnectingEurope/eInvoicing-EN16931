<?xml version="1.0" encoding="UTF-8"?>
<!-- 

        	CII syntax binding to the TC434   
        	Author: Andreas Pelekies
          Timestamp: 2016-10-31 00:00:00 +0200
 -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
  xmlns:rsm="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100"
  xmlns:ccts="urn:un:unece:uncefact:documentation:standard:CoreComponentsTechnicalSpecification:2"
  xmlns:udt="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:100"
  xmlns:qdt="urn:un:unece:uncefact:data:standard:QualifiedDataType:100"
  xmlns:ram="urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:100"
  queryBinding="xslt2">
  <title>EN16931 model bound to CII</title>
  <ns prefix="rsm" uri="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100"/>
  <ns prefix="ccts"
    uri="urn:un:unece:uncefact:documentation:standard:CoreComponentsTechnicalSpecification:2"/>
  <ns prefix="udt" uri="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:100"/>
  <ns prefix="qdt" uri="urn:un:unece:uncefact:data:standard:QualifiedDataType:100"/>
  <ns prefix="ram"
    uri="urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:100"/>
  <phase id="EN16931-model-phase">
    <active pattern="EN16931-CII-Model"/>
  </phase>
  <phase id="codelist_phase">
    <active pattern="EN16931-Codes"/>
  </phase>
  <phase id="syntax_phase">
    <active pattern="EN16931-CII-Syntax"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/EN16931-CII-model.sch"/>
  <include href="abstract/EN16931-CII-syntax.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="CII/EN16931-CII-model.sch"/>
  <include href="CII/EN16931-CII-syntax.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="codelist/EN16931-CII-codes.sch"/>
</schema>
