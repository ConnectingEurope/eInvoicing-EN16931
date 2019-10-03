<?xml version="1.0" encoding="UTF-8"?>
<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->
<!-- 
        Abstract template 
    
        Timestamp: 2016-05-23 10:47:37 +0200 
        
        
        The abstract file contains a pattern with and identifier and abstract = true.
        
        The pattern contains the set of business rules as defined in the EN16931 in plain English.
        
        Every rule has a context of use that is described using a variable that will have to be bound to each syntax XPATH expression (see syntax-binding-template.sch). 
        For instance: 
            $Account_information is the location within the XML instance where the Account information can be found.
            
        Every rule has a collection of one or more assertions. Each assertion contains:
            A test: containing a variable that will point to the XPATH expression. The XPATH expression will be in the syntax-binding-template.sch file.
            A flag: describing whether it is an error ("fatal") or a notice ("warning"). 
            An identifier: of the assertion used for automation purposes.
            A message: with the explanation of the error.
    
    -->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="TC434">
    <rule context="$Account_information ">
        <assert test="$BR-53" flag="fatal" id="BR-53">[BR-53]-A Financial account identifier shall be present if Account identification information is provided in the Invoice. </assert>
    </rule>
    <rule context="$Additional_supporting_documents ">
        <assert test="$BR-55" flag="fatal" id="BR-55">[BR-55]-Each additional supporting document shall contain a Supporting document identifier. </assert>
        <assert test="$BR-56" flag="fatal" id="BR-56">[BR-56]-Each additional supporting document shall contain a Supporting document description. </assert>
    </rule>
    <rule context="$Card_information ">
        <assert test="$BR-54" flag="fatal" id="BR-54">[BR-54]-The last 4 to 6 digit of the Payment card primary account number shall be present if card information is provided in the Invoice. </assert>
    </rule>
    <rule context="$Document_level_allowances ">
        <assert test="$BR-32" flag="fatal" id="BR-32">[BR-32]-Each document level allowance shall have a Document level allowance amount. </assert>
        <assert test="$BR-33" flag="fatal" id="BR-33">[BR-33]-Each document level allowance shall have a Document level allowance VAT category code. </assert>
        <assert test="$BR-35" flag="fatal" id="BR-35">[BR-35]-Each document level allowance shall have a Document level allowance reason. </assert>
        <assert test="$BR-36" flag="fatal" id="BR-36">[BR-36]-Document level allowance amounts shall not be negative. </assert>
        <assert test="$BR-CO-05" flag="fatal" id="BR-CO-05">[BR-CO-05]-Document level allowance reason code and Document level allowance reason shall indicate the same type of allowance. </assert>
    </rule>
    
    <!-- ... -->
    
</pattern>

