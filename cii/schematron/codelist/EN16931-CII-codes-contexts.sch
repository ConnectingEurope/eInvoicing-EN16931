<?xml version="1.0" encoding="UTF-8"?>
<!--

    Copyright (C) 2016-2019 Oriol Bausà, Andreas Pelekies, Philip Helger

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
  <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="EN16931-Codes-CII" is-a="EN16931-Codes">  
    <param name="BR-CL-01-CONTEXT" value="rsm:ExchangedDocument/ram:TypeCode"/>
    <!--<param name="BR-CL-02-CONTEXT" value=""/>-->
    <param name="BR-CL-03-CONTEXT" value="@currencyID"/>
    <param name="BR-CL-04-CONTEXT" value="ram:InvoiceCurrencyCode"/>
    <param name="BR-CL-05-CONTEXT" value="ram:TaxCurrencyCode"/>
    <param name="BR-CL-06-CONTEXT" value="ram:DueDateTypeCode"/>
    <param name="BR-CL-07-CONTEXT" value="ram:ReferenceTypeCode"/>
    <param name="BR-CL-08-CONTEXT" value="ram:SubjectCode"/>
    <!--<param name="BR-CL-09-CONTEXT" value=""/>-->
    <param name="BR-CL-10-CONTEXT" value="//ram:GlobalID/@schemeID[not(ancestor::ram:SpecifiedTradeProduct)]"/>
    <param name="BR-CL-10-CONTEXT-TEST" value="true()"/> <!-- Only required for UBL -->
    <param name="BR-CL-11-CONTEXT" value="ram:ID/@schemeID[not(ancestor::ram:SpecifiedTaxRegistration)]"/>    
    <!--<param name="BR-CL-12-CONTEXT" value=""/>-->
    <param name="BR-CL-13-CONTEXT" value="ram:ClassCode/@listID"/>
    <param name="BR-CL-14-CONTEXT" value="ram:CountryID"/>
    <param name="BR-CL-15-CONTEXT" value="ram:OriginTradeCountry/ram:ID"/>
    <param name="BR-CL-16-CONTEXT" value="ram:SpecifiedTradeSettlementPaymentMeans/ram:TypeCode"/>
    <param name="BR-CL-17-CONTEXT" value="ram:CategoryTradeTax/ram:CategoryCode"/>
    <param name="BR-CL-18-CONTEXT" value="ram:ApplicableTradeTax/ram:CategoryCode"/>
    <param name="BR-CL-19-CONTEXT" value="ram:SpecifiedTradeAllowanceCharge[ram:ChargeIndicator/udt:Indicator = false()]/ram:ReasonCode"/>
    <param name="BR-CL-20-CONTEXT" value="ram:SpecifiedTradeAllowanceCharge[ram:ChargeIndicator/udt:Indicator = true()]/ram:ReasonCode"/>
    <param name="BR-CL-21-CONTEXT" value="ram:SpecifiedTradeProduct/ram:GlobalID/@schemeID"/>
    <param name="BR-CL-21-CONTEXT-test" value="ram:SpecifiedTradeProduct/ram:GlobalID/@schemeID"/>
    <!-- <param name="BR-CL-22-CONTEXT" value="ram:ExemptionReasonCode"/> -->
    <param name="BR-CL-23-CONTEXT" value="@unitCode"/>
    <param name="BR-CL-24-CONTEXT" value="@mimeCode"/>
</pattern> 