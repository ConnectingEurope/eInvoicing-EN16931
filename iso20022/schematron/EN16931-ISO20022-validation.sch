<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>EN16931 model bound to ISO20022</title>
  <phase id="EN16931-model-phase">
    <active pattern="EN16931-ISO20022-Model"/>
  </phase>
  <!--<phase id="codelist_phase">
      <active pattern="EN16931-Codes"/>
  </phase>-->
  <phase id="syntax_phase">
    <active pattern="EN16931-ISO20022-Syntax"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/EN16931-ISO20022-model.sch"/>
  <include href="abstract/EN16931-ISO20022-syntax.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="ISO20022/EN16931-ISO20022-model.sch"/>
  <include href="ISO20022/EN16931-ISO20022-syntax.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <!--<include href="codelist/EN16931-ISO20022-codes.sch"/>-->
</schema>
