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

        	EDIFACT syntax binding to the EN16931   
        	Author: Andreas Pelekies
          Timestamp: 2016-10-31 00:00:00 +0200
 -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>EN16931 model bound to EDIFACT</title>  
  <phase id="EN16931-model-phase">
    <active pattern="EN16931-EDIFACT-Model"/>
  </phase>
  <phase id="codelist_phase">
    <active pattern="EN16931-Codes"/>
  </phase>
  <phase id="syntax_phase">
    <active pattern="EN16931-EDIFACT-Syntax"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/EN16931-EDIFACT-model.sch"/>
  <include href="abstract/EN16931-EDIFACT-syntax.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="EDIFACT/EN16931-EDIFACT-model.sch"/>
  <include href="EDIFACT/EN16931-EDIFACT-syntax.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="codelist/EN16931-EDIFACT-codes.sch"/>
</schema>
