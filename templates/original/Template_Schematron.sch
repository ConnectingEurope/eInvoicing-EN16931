<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
<!--Using xslt2 for transformation-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:ns2="http://www.schematron-quickfix.com/validator/process" schemaVersion="iso"
    queryBinding="xslt2">

    <!--
        
        Title should reflect name of the norm, what kind of rules (codelists in separate file?), and to what syntax it is valid for.
        Example for syntax specific rules:  "EN16931 Syntax rules CII Validation"
        Example for codelists:              "EN16931 Code list rules ISO Validation"
    
    -->

    <title>EN16931 Business rules UBL Validation</title>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Tender-2" prefix="ubl"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
    <pattern>

        <!--Example from eSens/EHF PreAward-->
        
        <rule context="/ubl:Tender">
            <assert test="not(count(//*[not(node()[not(self::comment())])]) &gt; 0)" flag="fatal"
                id="ESENS-T45-R001">A tender receipt notification MUST not contain empty
                elements.</assert>
            <assert test="(cbc:UBLVersionID)" flag="fatal" id="ESENS-T45-R003">A tender receipt
                notification MUST have a syntax identifier.</assert>
        </rule>


        <rule context="/ubl:Invoice">
            <!--
                
                Using assert, not report to check validity. 
                
                @flag can have value either "fatal" or "warning" (if any) 
                
                @id to be set equal to corresponding business rule in norm draft
                    - for syntax specific rules, suggest following legend for rule ids:
                        Syntax-'SR'-sequence
                        (SR=Syntax rule)
                        
                        Example:    UBL-SR-14
                                    EDIFACT-SR-12
                                    CII-SR-02
                                    ISO-SR-07
                Error text also identical to norm description of business rules, if new rules (/sytax specific) use wording "shall" and "shall not" to express rules.
                -->
            
            <assert test="(cbc:ID)" flag="fatal" id="BR-2">An Invoice shall have an Invoice
                number</assert>
        </rule>

    </pattern>
</schema>
