<?xml version="1.0" encoding="UTF-8"?>
<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->
<!-- 

      Main schematron template
      
        The main validation artefact contains the components used to validate a EN16931 electronic invoice instance for a particular language.   
        
        A timestamp is required in every file, created when generated. E.g.: 2016-05-23 10:47:49 +0200
        
        Title should reflect the name of the norm and to what syntax it is valid for. E.g.: EN16931 business rules bound to OASIS UBL (ISO/IEC 19845)
        
        This file should contain the namespace records required for the specific syntax. The namespace records have a prefix and a URI.
        
        The main schametron can define validation phases to allow for groups of validation artefacts.
        It is suggested to have three different phases, one containing the EN16931 Business Rules, a second phase to cover the code business rules.

        Each phase is defined through an identifier and has an active pattern where the identifier for the pattern shall be referred. (Patterns are created in separate files) 
 
        After the phases, the main schematron file shall contain includes of the files with the patterns. There shall be at least four files:
        1) The abstract rules file (see abstract-template.sch)
        2) The syntax binding rules file (see syntax-binding-template.sch)
        3) The code list rules file (see code-template.sch)
          
        The main file is the one used for validation purposes.
        
     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
        xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
        xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
        xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
        queryBinding="xslt2">
  <title>EN16931 bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <phase id="BR_phase">
    <active pattern="{pattern id for the syntax binding file}"/>
  </phase>
  <phase id="CL_phase">
    <active pattern="{pattern id for the code file}"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="{path to the abstract file location}"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="{path to the syntax binding file location}"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="{path to the code list location}"/>
</schema>
