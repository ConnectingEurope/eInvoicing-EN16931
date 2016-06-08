<?xml version="1.0" encoding="ISO-8859-1"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="EN16931-CII-Syntax">
    <rule context="//ram:SpecifiedTradeSettlementHeaderMonetarySummation">
        <assert test="ram:TaxTotalAmount/@currencyID" flag="fatal" id="BR-SY-1">[BR-SY-1]The TaxTotalAmound must have the @currencyID specified.</assert>
    </rule>
</pattern>