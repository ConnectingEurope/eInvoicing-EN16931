<?xml version="1.0" encoding="UTF-8"?>
<!--

    Copyright (C) 2016-2019 Oriol Bausà, Andreas Pelekies, Philip Helger
    and contributors.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

            http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

-->
<!-- 

        	CII syntax binding to the TC434   
        	Author: Andreas Pelekies
          Timestamp: 2017-07-30 00:00:00 +0200
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
