<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->
<!-- 
        Syntax binding template 
    
        A file containing the XPATH expressions for the test assertions 

        A timestamp is required in every file, created when generated. E.g.: 2016-05-23 10:47:49 +0200

        This file contains a pattern that refers to:
        
          is-a: refers to the identifier of the abstract rules file.
          id: contains the identifier for the pattern.
          
        The pattern contains a set of params. Every variable defined in the abstract file shall have an assigned XPATH expression. 
        The parameters for the param are:
          name: The identifier of the business rule as described in the abstract file
          value: The XPATH expression that makes this rule true.
            
    -->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="TC434" id="UBL-TC434">
  <param name="BR-01" value="(cbc:CustomizationID)"/>
  <param name="BR-02" value="(cbc:ID)"/>
  <param name="BR-03" value="(cbc:IssueDate)"/>
  <param name="BR-04" value="(cbc:InvoiceTypeCode)"/>
  <param name="BR-05" value="(cbc:DocumentCurrencyCode)"/>
  <param name="BR-06" value="(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName)"/>

  <!-- ... -->
  
</pattern>
