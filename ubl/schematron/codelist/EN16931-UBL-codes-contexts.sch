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
    <param name="BR-CL-01-CONTEXT" value="cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode"/>
    <!--<param name="BR-CL-02-CONTEXT" value=""/>-->
    <param name="BR-CL-03-CONTEXT" value="*[cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount]/@currencyID"/>
    <param name="BR-CL-04-CONTEXT" value="cbc:DocumentCurrencyCode"/>
    <param name="BR-CL-05-CONTEXT" value="cbc:TaxCurrencyCode"/>
    <param name="BR-CL-06-CONTEXT" value="cac:InvoicePeriod/cbc:DescriptionCode"/>
    <param name="BR-CL-07-CONTEXT" value="cac:AdditionalDocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID]/@schemeID | cac:DocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID]/@schemeID"/>
    <!--<param name="BR-CL-08-CONTEXT" value=""/>-->
    <!--<param name="BR-CL-09-CONTEXT" value=""/>-->
    <param name="BR-CL-10-CONTEXT" value="cac:PartyIdentification/cbc:ID[@schemeID]/@schemeID"/>
    <param name="BR-CL-10-CONTEXT-TEST" value="((not(contains(normalize-space(.), ' ')) and contains(' SEPA ', concat(' ', normalize-space(.), ' '))) and ((ancestor::cac:AccountingSupplierParty) or (ancestor::cac:PayeeParty)))"/>
    <param name="BR-CL-11-CONTEXT" value="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]/@schemeID"/>    
    <!--<param name="BR-CL-12-CONTEXT" value=""/>-->
    <param name="BR-CL-13-CONTEXT" value="cac:CommodityClassification/cbc:ItemClassificationCode[@listID]/@listID"/>
    <param name="BR-CL-14-CONTEXT" value="cac:Country/cbc:IdentificationCode"/>
    <param name="BR-CL-15-CONTEXT" value="cac:OriginCountry/cbc:IdentificationCode"/>
    <param name="BR-CL-16-CONTEXT" value="cac:PaymentMeans/cbc:PaymentMeansCode"/>
    <param name="BR-CL-17-CONTEXT" value="cac:TaxCategory/cbc:ID"/>
    <param name="BR-CL-18-CONTEXT" value="cac:ClassifiedTaxCategory/cbc:ID"/>
    <param name="BR-CL-19-CONTEXT" value="cac:AllowanceCharge[cbc:ChargeIndicator = false()]/cbc:AllowanceChargeReasonCode"/>
    <param name="BR-CL-20-CONTEXT" value="cac:AllowanceCharge[cbc:ChargeIndicator = true()]/cbc:AllowanceChargeReasonCode"/>
    <param name="BR-CL-21-CONTEXT" value="cac:StandardItemIdentification/cbc:ID[@schemeID]/@schemeID"/>
    <!-- <param name="BR-CL-22-CONTEXT" value="ram:ExemptionReasonCode"/> -->
    <param name="BR-CL-23-CONTEXT" value="cbc:InvoicedQuantity[@unitCode]/@unitCode | cbc:BaseQuantity[@unitCode]/@unitCode"/>
    <param name="BR-CL-24-CONTEXT" value="cbc:EmbeddedDocumentBinaryObject[@mimeCode]/@mimeCode"/>
</pattern> 