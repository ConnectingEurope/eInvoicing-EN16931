<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->
<!-- Abstract rules for syntax -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="syntax">
  <rule context="$AddressLine">
    <assert test="$UBL-SR-51" flag="fatal" id="UBL-SR-51">[UBL-SR-51]-An address can only have one third line.</assert>
  </rule>
  <rule context="$Accounting_supplier_party">
    <assert test="$UBL-SR-42" flag="fatal" id="UBL-SR-42">[UBL-SR-42]-Party tax scheme shall occur maximum twice in accounting supplier party</assert>
  </rule>
  <rule context="$Additional_supporting_documents">
    <assert test="$UBL-SR-33" flag="fatal" id="UBL-SR-33">[UBL-SR-33]-Supporting document description shall occur maximum once</assert>
    <assert test="$UBL-SR-43" flag="fatal" id="UBL-SR-43">[UBL-SR-43]-Scheme identifier shall only be used for invoiced object (document type code with value 130 or 50)</assert>
  </rule>
  <rule context="$Amount_data_type">
    <assert test="$UBL-DT-01" flag="fatal" id="UBL-DT-01">[UBL-DT-01]-Amounts shall be decimal up to two fraction digits</assert>
  </rule>
  <rule context="$Binary_object_data_type">
    <assert test="$UBL-DT-06" flag="fatal" id="UBL-DT-06">[UBL-DT-06]-Binary object elements shall contain the mime code attribute</assert>
    <assert test="$UBL-DT-07" flag="fatal" id="UBL-DT-07">[UBL-DT-07]-Binary object elements shall contain the file name attribute</assert>
  </rule>
  <rule context="$Deliver_to">
    <assert test="$UBL-SR-25" flag="fatal" id="UBL-SR-25">[UBL-SR-25]-Deliver to party name shall occur maximum once</assert>
  </rule>
  <rule context="$Document_level_allowances">
    <assert test="$UBL-SR-30" flag="fatal" id="UBL-SR-30">[UBL-SR-30]-Document level allowance reason shall occur maximum once</assert>
  </rule>
  <rule context="$Document_level_charges">
    <assert test="$UBL-SR-31" flag="fatal" id="UBL-SR-31">[UBL-SR-31]-Document level charge reason shall occur maximum once</assert>
  </rule>
  <rule context="$PartyTaxScheme">
    <assert test="$UBL-SR-53" flag="fatal" id="UBL-SR-53">[UBL-SR-53]- CompanyID (VAT Identifier) must be stated when providing the PartyTaxScheme/TaxScheme/ID.</assert>
  </rule>
  <rule context="$Invoice">
    <assert test="$UBL-CR-001" flag="warning" id="UBL-CR-001">[UBL-CR-001]-A UBL invoice should not include extensions</assert>
    <assert test="$UBL-CR-002" flag="warning" id="UBL-CR-002">[UBL-CR-002]-A UBL invoice should not include the UBLVersionID or it should be 2.1</assert>
    <assert test="$UBL-CR-003" flag="warning" id="UBL-CR-003">[UBL-CR-003]-A UBL invoice should not include the ProfileExecutionID </assert>
    <assert test="$UBL-CR-004" flag="warning" id="UBL-CR-004">[UBL-CR-004]-A UBL invoice should not include the CopyIndicator </assert>
    <assert test="$UBL-CR-005" flag="warning" id="UBL-CR-005">[UBL-CR-005]-A UBL invoice should not include the UUID </assert>
    <assert test="$UBL-CR-006" flag="warning" id="UBL-CR-006">[UBL-CR-006]-A UBL invoice should not include the IssueTime </assert>
    <assert test="$UBL-CR-007" flag="warning" id="UBL-CR-007">[UBL-CR-007]-A UBL invoice should not include the PricingCurrencyCode</assert>
    <assert test="$UBL-CR-008" flag="warning" id="UBL-CR-008">[UBL-CR-008]-A UBL invoice should not include the PaymentCurrencyCode</assert>
    <assert test="$UBL-CR-009" flag="warning" id="UBL-CR-009">[UBL-CR-009]-A UBL invoice should not include the PaymentAlternativeCurrencyCode</assert>
    <assert test="$UBL-CR-010" flag="warning" id="UBL-CR-010">[UBL-CR-010]-A UBL invoice should not include the AccountingCostCode</assert>
    <assert test="$UBL-CR-011" flag="warning" id="UBL-CR-011">[UBL-CR-011]-A UBL invoice should not include the LineCountNumeric</assert>
    <assert test="$UBL-CR-012" flag="warning" id="UBL-CR-012">[UBL-CR-012]-A UBL invoice should not include the InvoicePeriod StartTime</assert>
    <assert test="$UBL-CR-013" flag="warning" id="UBL-CR-013">[UBL-CR-013]-A UBL invoice should not include the InvoicePeriod EndTime</assert>
    <assert test="$UBL-CR-014" flag="warning" id="UBL-CR-014">[UBL-CR-014]-A UBL invoice should not include the InvoicePeriod DurationMeasure</assert>
    <assert test="$UBL-CR-015" flag="warning" id="UBL-CR-015">[UBL-CR-015]-A UBL invoice should not include the InvoicePeriod Description</assert>
    <assert test="$UBL-CR-016" flag="warning" id="UBL-CR-016">[UBL-CR-016]-A UBL invoice should not include the OrderReference CopyIndicator</assert>
    <assert test="$UBL-CR-017" flag="warning" id="UBL-CR-017">[UBL-CR-017]-A UBL invoice should not include the OrderReference UUID</assert>
    <assert test="$UBL-CR-018" flag="warning" id="UBL-CR-018">[UBL-CR-018]-A UBL invoice should not include the OrderReference IssueDate</assert>
    <assert test="$UBL-CR-019" flag="warning" id="UBL-CR-019">[UBL-CR-019]-A UBL invoice should not include the OrderReference IssueTime</assert>
    <assert test="$UBL-CR-020" flag="warning" id="UBL-CR-020">[UBL-CR-020]-A UBL invoice should not include the OrderReference CustomerReference</assert>
    <assert test="$UBL-CR-021" flag="warning" id="UBL-CR-021">[UBL-CR-021]-A UBL invoice should not include the OrderReference OrderTypeCode</assert>
    <assert test="$UBL-CR-022" flag="warning" id="UBL-CR-022">[UBL-CR-022]-A UBL invoice should not include the OrderReference DocumentReference</assert>
    <assert test="$UBL-CR-023" flag="warning" id="UBL-CR-023">[UBL-CR-023]-A UBL invoice should not include the BillingReference CopyIndicator</assert>
    <assert test="$UBL-CR-024" flag="warning" id="UBL-CR-024">[UBL-CR-024]-A UBL invoice should not include the BillingReference UUID</assert>
    <assert test="$UBL-CR-025" flag="warning" id="UBL-CR-025">[UBL-CR-025]-A UBL invoice should not include the BillingReference IssueTime</assert>
    <assert test="$UBL-CR-026" flag="warning" id="UBL-CR-026">[UBL-CR-026]-A UBL invoice should not include the BillingReference DocumentTypeCode</assert>
    <assert test="$UBL-CR-027" flag="warning" id="UBL-CR-027">[UBL-CR-027]-A UBL invoice should not include the BillingReference DocumentType</assert>
    <assert test="$UBL-CR-028" flag="warning" id="UBL-CR-028">[UBL-CR-028]-A UBL invoice should not include the BillingReference Xpath</assert>
    <assert test="$UBL-CR-029" flag="warning" id="UBL-CR-029">[UBL-CR-029]-A UBL invoice should not include the BillingReference LanguageID</assert>
    <assert test="$UBL-CR-030" flag="warning" id="UBL-CR-030">[UBL-CR-030]-A UBL invoice should not include the BillingReference LocaleCode</assert>
    <assert test="$UBL-CR-031" flag="warning" id="UBL-CR-031">[UBL-CR-031]-A UBL invoice should not include the BillingReference VersionID</assert>
    <assert test="$UBL-CR-032" flag="warning" id="UBL-CR-032">[UBL-CR-032]-A UBL invoice should not include the BillingReference DocumentStatusCode</assert>
    <assert test="$UBL-CR-033" flag="warning" id="UBL-CR-033">[UBL-CR-033]-A UBL invoice should not include the BillingReference DocumenDescription</assert>
    <assert test="$UBL-CR-034" flag="warning" id="UBL-CR-034">[UBL-CR-034]-A UBL invoice should not include the BillingReference Attachment</assert>
    <assert test="$UBL-CR-035" flag="warning" id="UBL-CR-035">[UBL-CR-035]-A UBL invoice should not include the BillingReference ValidityPeriod</assert>
    <assert test="$UBL-CR-036" flag="warning" id="UBL-CR-036">[UBL-CR-036]-A UBL invoice should not include the BillingReference IssuerParty</assert>
    <assert test="$UBL-CR-037" flag="warning" id="UBL-CR-037">[UBL-CR-037]-A UBL invoice should not include the BillingReference ResultOfVerification</assert>
    <assert test="$UBL-CR-038" flag="warning" id="UBL-CR-038">[UBL-CR-038]-A UBL invoice should not include the BillingReference SelfBilledInvoiceDocumentReference</assert>
    <assert test="$UBL-CR-039" flag="warning" id="UBL-CR-039">[UBL-CR-039]-A UBL invoice should not include the BillingReference CreditNoteDocumentReference</assert>
    <assert test="$UBL-CR-040" flag="warning" id="UBL-CR-040">[UBL-CR-040]-A UBL invoice should not include the BillingReference SelfBilledCreditNoteDocumentReference</assert>
    <assert test="$UBL-CR-041" flag="warning" id="UBL-CR-041">[UBL-CR-041]-A UBL invoice should not include the BillingReference DebitNoteDocumentReference</assert>
    <assert test="$UBL-CR-042" flag="warning" id="UBL-CR-042">[UBL-CR-042]-A UBL invoice should not include the BillingReference ReminderDocumentReference</assert>
    <assert test="$UBL-CR-043" flag="warning" id="UBL-CR-043">[UBL-CR-043]-A UBL invoice should not include the BillingReference AdditionalDocumentReference</assert>
    <assert test="$UBL-CR-044" flag="warning" id="UBL-CR-044">[UBL-CR-044]-A UBL invoice should not include the BillingReference BillingReferenceLine</assert>
    <assert test="$UBL-CR-045" flag="warning" id="UBL-CR-045">[UBL-CR-045]-A UBL invoice should not include the DespatchDocumentReference CopyIndicator</assert>
    <assert test="$UBL-CR-046" flag="warning" id="UBL-CR-046">[UBL-CR-046]-A UBL invoice should not include the DespatchDocumentReference UUID</assert>
    <assert test="$UBL-CR-047" flag="warning" id="UBL-CR-047">[UBL-CR-047]-A UBL invoice should not include the DespatchDocumentReference IssueDate</assert>
    <assert test="$UBL-CR-048" flag="warning" id="UBL-CR-048">[UBL-CR-048]-A UBL invoice should not include the DespatchDocumentReference IssueTime</assert>
    <assert test="$UBL-CR-049" flag="warning" id="UBL-CR-049">[UBL-CR-049]-A UBL invoice should not include the DespatchDocumentReference DocumentTypeCode</assert>
    <assert test="$UBL-CR-050" flag="warning" id="UBL-CR-050">[UBL-CR-050]-A UBL invoice should not include the DespatchDocumentReference DocumentType</assert>
    <assert test="$UBL-CR-051" flag="warning" id="UBL-CR-051">[UBL-CR-051]-A UBL invoice should not include the DespatchDocumentReference Xpath</assert>
    <assert test="$UBL-CR-052" flag="warning" id="UBL-CR-052">[UBL-CR-052]-A UBL invoice should not include the DespatchDocumentReference LanguageID</assert>
    <assert test="$UBL-CR-053" flag="warning" id="UBL-CR-053">[UBL-CR-053]-A UBL invoice should not include the DespatchDocumentReference LocaleCode</assert>
    <assert test="$UBL-CR-054" flag="warning" id="UBL-CR-054">[UBL-CR-054]-A UBL invoice should not include the DespatchDocumentReference VersionID</assert>
    <assert test="$UBL-CR-055" flag="warning" id="UBL-CR-055">[UBL-CR-055]-A UBL invoice should not include the DespatchDocumentReference DocumentStatusCode</assert>
    <assert test="$UBL-CR-056" flag="warning" id="UBL-CR-056">[UBL-CR-056]-A UBL invoice should not include the DespatchDocumentReference DocumentDescription</assert>
    <assert test="$UBL-CR-057" flag="warning" id="UBL-CR-057">[UBL-CR-057]-A UBL invoice should not include the DespatchDocumentReference Attachment</assert>
    <assert test="$UBL-CR-058" flag="warning" id="UBL-CR-058">[UBL-CR-058]-A UBL invoice should not include the DespatchDocumentReference ValidityPeriod</assert>
    <assert test="$UBL-CR-059" flag="warning" id="UBL-CR-059">[UBL-CR-059]-A UBL invoice should not include the DespatchDocumentReference IssuerParty</assert>
    <assert test="$UBL-CR-060" flag="warning" id="UBL-CR-060">[UBL-CR-060]-A UBL invoice should not include the DespatchDocumentReference ResultOfVerification</assert>
    <assert test="$UBL-CR-061" flag="warning" id="UBL-CR-061">[UBL-CR-061]-A UBL invoice should not include the ReceiptDocumentReference CopyIndicator</assert>
    <assert test="$UBL-CR-062" flag="warning" id="UBL-CR-062">[UBL-CR-062]-A UBL invoice should not include the ReceiptDocumentReference UUID</assert>
    <assert test="$UBL-CR-063" flag="warning" id="UBL-CR-063">[UBL-CR-063]-A UBL invoice should not include the ReceiptDocumentReference IssueDate</assert>
    <assert test="$UBL-CR-064" flag="warning" id="UBL-CR-064">[UBL-CR-064]-A UBL invoice should not include the ReceiptDocumentReference IssueTime</assert>
    <assert test="$UBL-CR-065" flag="warning" id="UBL-CR-065">[UBL-CR-065]-A UBL invoice should not include the ReceiptDocumentReference DocumentTypeCode</assert>
    <assert test="$UBL-CR-066" flag="warning" id="UBL-CR-066">[UBL-CR-066]-A UBL invoice should not include the ReceiptDocumentReference DocumentType</assert>
    <assert test="$UBL-CR-067" flag="warning" id="UBL-CR-067">[UBL-CR-067]-A UBL invoice should not include the ReceiptDocumentReference Xpath</assert>
    <assert test="$UBL-CR-068" flag="warning" id="UBL-CR-068">[UBL-CR-068]-A UBL invoice should not include the ReceiptDocumentReference LanguageID</assert>
    <assert test="$UBL-CR-069" flag="warning" id="UBL-CR-069">[UBL-CR-069]-A UBL invoice should not include the ReceiptDocumentReference LocaleCode</assert>
    <assert test="$UBL-CR-070" flag="warning" id="UBL-CR-070">[UBL-CR-070]-A UBL invoice should not include the ReceiptDocumentReference VersionID</assert>
    <assert test="$UBL-CR-071" flag="warning" id="UBL-CR-071">[UBL-CR-071]-A UBL invoice should not include the ReceiptDocumentReference DocumentStatusCode</assert>
    <assert test="$UBL-CR-072" flag="warning" id="UBL-CR-072">[UBL-CR-072]-A UBL invoice should not include the ReceiptDocumentReference DocumentDescription</assert>
    <assert test="$UBL-CR-073" flag="warning" id="UBL-CR-073">[UBL-CR-073]-A UBL invoice should not include the ReceiptDocumentReference Attachment</assert>
    <assert test="$UBL-CR-074" flag="warning" id="UBL-CR-074">[UBL-CR-074]-A UBL invoice should not include the ReceiptDocumentReference ValidityPeriod</assert>
    <assert test="$UBL-CR-075" flag="warning" id="UBL-CR-075">[UBL-CR-075]-A UBL invoice should not include the ReceiptDocumentReference IssuerParty</assert>
    <assert test="$UBL-CR-076" flag="warning" id="UBL-CR-076">[UBL-CR-076]-A UBL invoice should not include the ReceiptDocumentReference ResultOfVerification</assert>
    <assert test="$UBL-CR-077" flag="warning" id="UBL-CR-077">[UBL-CR-077]-A UBL invoice should not include the StatementDocumentReference</assert>
    <assert test="$UBL-CR-078" flag="warning" id="UBL-CR-078">[UBL-CR-078]-A UBL invoice should not include the OriginatorDocumentReference CopyIndicator</assert>
    <assert test="$UBL-CR-079" flag="warning" id="UBL-CR-079">[UBL-CR-079]-A UBL invoice should not include the OriginatorDocumentReference UUID</assert>
    <assert test="$UBL-CR-080" flag="warning" id="UBL-CR-080">[UBL-CR-080]-A UBL invoice should not include the OriginatorDocumentReference IssueDate</assert>
    <assert test="$UBL-CR-081" flag="warning" id="UBL-CR-081">[UBL-CR-081]-A UBL invoice should not include the OriginatorDocumentReference IssueTime</assert>
    <assert test="$UBL-CR-082" flag="warning" id="UBL-CR-082">[UBL-CR-082]-A UBL invoice should not include the OriginatorDocumentReference DocumentTypeCode</assert>
    <assert test="$UBL-CR-083" flag="warning" id="UBL-CR-083">[UBL-CR-083]-A UBL invoice should not include the OriginatorDocumentReference DocumentType</assert>
    <assert test="$UBL-CR-084" flag="warning" id="UBL-CR-084">[UBL-CR-084]-A UBL invoice should not include the OriginatorDocumentReference Xpath</assert>
    <assert test="$UBL-CR-085" flag="warning" id="UBL-CR-085">[UBL-CR-085]-A UBL invoice should not include the OriginatorDocumentReference LanguageID</assert>
    <assert test="$UBL-CR-086" flag="warning" id="UBL-CR-086">[UBL-CR-086]-A UBL invoice should not include the OriginatorDocumentReference LocaleCode</assert>
    <assert test="$UBL-CR-087" flag="warning" id="UBL-CR-087">[UBL-CR-087]-A UBL invoice should not include the OriginatorDocumentReference VersionID</assert>
    <assert test="$UBL-CR-088" flag="warning" id="UBL-CR-088">[UBL-CR-088]-A UBL invoice should not include the OriginatorDocumentReference DocumentStatusCode</assert>
    <assert test="$UBL-CR-089" flag="warning" id="UBL-CR-089">[UBL-CR-089]-A UBL invoice should not include the OriginatorDocumentReference DocumentDescription</assert>
    <assert test="$UBL-CR-090" flag="warning" id="UBL-CR-090">[UBL-CR-090]-A UBL invoice should not include the OriginatorDocumentReference Attachment</assert>
    <assert test="$UBL-CR-091" flag="warning" id="UBL-CR-091">[UBL-CR-091]-A UBL invoice should not include the OriginatorDocumentReference ValidityPeriod</assert>
    <assert test="$UBL-CR-092" flag="warning" id="UBL-CR-092">[UBL-CR-092]-A UBL invoice should not include the OriginatorDocumentReference IssuerParty</assert>
    <assert test="$UBL-CR-093" flag="warning" id="UBL-CR-093">[UBL-CR-093]-A UBL invoice should not include the OriginatorDocumentReference ResultOfVerification</assert>
    <assert test="$UBL-CR-094" flag="warning" id="UBL-CR-094">[UBL-CR-094]-A UBL invoice should not include the ContractDocumentReference CopyIndicator</assert>
    <assert test="$UBL-CR-095" flag="warning" id="UBL-CR-095">[UBL-CR-095]-A UBL invoice should not include the ContractDocumentReference UUID</assert>
    <assert test="$UBL-CR-096" flag="warning" id="UBL-CR-096">[UBL-CR-096]-A UBL invoice should not include the ContractDocumentReference IssueDate</assert>
    <assert test="$UBL-CR-097" flag="warning" id="UBL-CR-097">[UBL-CR-097]-A UBL invoice should not include the ContractDocumentReference IssueTime</assert>
    <assert test="$UBL-CR-098" flag="warning" id="UBL-CR-098">[UBL-CR-098]-A UBL invoice should not include the ContractDocumentReference DocumentTypeCode</assert>
    <assert test="$UBL-CR-099" flag="warning" id="UBL-CR-099">[UBL-CR-099]-A UBL invoice should not include the ContractDocumentReference DocumentType</assert>
    <assert test="$UBL-CR-100" flag="warning" id="UBL-CR-100">[UBL-CR-100]-A UBL invoice should not include the ContractDocumentReference Xpath</assert>
    <assert test="$UBL-CR-101" flag="warning" id="UBL-CR-101">[UBL-CR-101]-A UBL invoice should not include the ContractDocumentReference LanguageID</assert>
    <assert test="$UBL-CR-102" flag="warning" id="UBL-CR-102">[UBL-CR-102]-A UBL invoice should not include the ContractDocumentReference LocaleCode</assert>
    <assert test="$UBL-CR-103" flag="warning" id="UBL-CR-103">[UBL-CR-103]-A UBL invoice should not include the ContractDocumentReference VersionID</assert>
    <assert test="$UBL-CR-104" flag="warning" id="UBL-CR-104">[UBL-CR-104]-A UBL invoice should not include the ContractDocumentReference DocumentStatusCode</assert>
    <assert test="$UBL-CR-105" flag="warning" id="UBL-CR-105">[UBL-CR-105]-A UBL invoice should not include the ContractDocumentReference DocumentDescription</assert>
    <assert test="$UBL-CR-106" flag="warning" id="UBL-CR-106">[UBL-CR-106]-A UBL invoice should not include the ContractDocumentReference Attachment</assert>
    <assert test="$UBL-CR-107" flag="warning" id="UBL-CR-107">[UBL-CR-107]-A UBL invoice should not include the ContractDocumentReference ValidityPeriod</assert>
    <assert test="$UBL-CR-108" flag="warning" id="UBL-CR-108">[UBL-CR-108]-A UBL invoice should not include the ContractDocumentReference IssuerParty</assert>
    <assert test="$UBL-CR-109" flag="warning" id="UBL-CR-109">[UBL-CR-109]-A UBL invoice should not include the ContractDocumentReference ResultOfVerification</assert>
    <assert test="$UBL-CR-110" flag="warning" id="UBL-CR-110">[UBL-CR-110]-A UBL invoice should not include the AdditionalDocumentReference CopyIndicator</assert>
    <assert test="$UBL-CR-111" flag="warning" id="UBL-CR-111">[UBL-CR-111]-A UBL invoice should not include the AdditionalDocumentReference UUID</assert>
    <assert test="$UBL-CR-112" flag="warning" id="UBL-CR-112">[UBL-CR-112]-A UBL invoice should not include the AdditionalDocumentReference IssueDate</assert>
    <assert test="$UBL-CR-113" flag="warning" id="UBL-CR-113">[UBL-CR-113]-A UBL invoice should not include the AdditionalDocumentReference IssueTime</assert>
    <assert test="$UBL-CR-114" flag="warning" id="UBL-CR-114">[UBL-CR-114]-A UBL invoice should not include the AdditionalDocumentReference DocumentType</assert>
    <assert test="$UBL-CR-115" flag="warning" id="UBL-CR-115">[UBL-CR-115]-A UBL invoice should not include the AdditionalDocumentReference Xpath</assert>
    <assert test="$UBL-CR-116" flag="warning" id="UBL-CR-116">[UBL-CR-116]-A UBL invoice should not include the AdditionalDocumentReference LanguageID</assert>
    <assert test="$UBL-CR-117" flag="warning" id="UBL-CR-117">[UBL-CR-117]-A UBL invoice should not include the AdditionalDocumentReference LocaleCode</assert>
    <assert test="$UBL-CR-118" flag="warning" id="UBL-CR-118">[UBL-CR-118]-A UBL invoice should not include the AdditionalDocumentReference VersionID</assert>
    <assert test="$UBL-CR-119" flag="warning" id="UBL-CR-119">[UBL-CR-119]-A UBL invoice should not include the AdditionalDocumentReference DocumentStatusCode</assert>
    <assert test="$UBL-CR-121" flag="warning" id="UBL-CR-121">[UBL-CR-121]-A UBL invoice should not include the AdditionalDocumentReference Attachment External DocumentHash</assert>
    <assert test="$UBL-CR-122" flag="warning" id="UBL-CR-122">[UBL-CR-122]-A UBL invoice should not include the AdditionalDocumentReference Attachment External HashAlgorithmMethod</assert>
    <assert test="$UBL-CR-123" flag="warning" id="UBL-CR-123">[UBL-CR-123]-A UBL invoice should not include the AdditionalDocumentReference Attachment External ExpiryDate</assert>
    <assert test="$UBL-CR-124" flag="warning" id="UBL-CR-124">[UBL-CR-124]-A UBL invoice should not include the AdditionalDocumentReference Attachment External ExpiryTime</assert>
    <assert test="$UBL-CR-125" flag="warning" id="UBL-CR-125">[UBL-CR-125]-A UBL invoice should not include the AdditionalDocumentReference Attachment External MimeCode</assert>
    <assert test="$UBL-CR-126" flag="warning" id="UBL-CR-126">[UBL-CR-126]-A UBL invoice should not include the AdditionalDocumentReference Attachment External FormatCode</assert>
    <assert test="$UBL-CR-127" flag="warning" id="UBL-CR-127">[UBL-CR-127]-A UBL invoice should not include the AdditionalDocumentReference Attachment External EncodingCode</assert>
    <assert test="$UBL-CR-128" flag="warning" id="UBL-CR-128">[UBL-CR-128]-A UBL invoice should not include the AdditionalDocumentReference Attachment External CharacterSetCode</assert>
    <assert test="$UBL-CR-129" flag="warning" id="UBL-CR-129">[UBL-CR-129]-A UBL invoice should not include the AdditionalDocumentReference Attachment External FileName</assert>
    <assert test="$UBL-CR-130" flag="warning" id="UBL-CR-130">[UBL-CR-130]-A UBL invoice should not include the AdditionalDocumentReference Attachment External Descriprion</assert>
    <assert test="$UBL-CR-131" flag="warning" id="UBL-CR-131">[UBL-CR-131]-A UBL invoice should not include the AdditionalDocumentReference ValidityPeriod</assert>
    <assert test="$UBL-CR-132" flag="warning" id="UBL-CR-132">[UBL-CR-132]-A UBL invoice should not include the AdditionalDocumentReference IssuerParty</assert>
    <assert test="$UBL-CR-133" flag="warning" id="UBL-CR-133">[UBL-CR-133]-A UBL invoice should not include the AdditionalDocumentReference ResultOfVerification</assert>
    <assert test="$UBL-CR-134" flag="warning" id="UBL-CR-134">[UBL-CR-134]-A UBL invoice should not include the ProjectReference UUID</assert>
    <assert test="$UBL-CR-135" flag="warning" id="UBL-CR-135">[UBL-CR-135]-A UBL invoice should not include the ProjectReference IssueDate</assert>
    <assert test="$UBL-CR-136" flag="warning" id="UBL-CR-136">[UBL-CR-136]-A UBL invoice should not include the ProjectReference WorkPhaseReference</assert>
    <assert test="$UBL-CR-137" flag="warning" id="UBL-CR-137">[UBL-CR-137]-A UBL invoice should not include the Signature</assert>
    <assert test="$UBL-CR-138" flag="warning" id="UBL-CR-138">[UBL-CR-138]-A UBL invoice should not include the AccountingSupplierParty CustomerAssignedAccountID</assert>
    <assert test="$UBL-CR-139" flag="warning" id="UBL-CR-139">[UBL-CR-139]-A UBL invoice should not include the AccountingSupplierParty AdditionalAccountID</assert>
    <assert test="$UBL-CR-140" flag="warning" id="UBL-CR-140">[UBL-CR-140]-A UBL invoice should not include the AccountingSupplierParty DataSendingCapability</assert>
    <assert test="$UBL-CR-141" flag="warning" id="UBL-CR-141">[UBL-CR-141]-A UBL invoice should not include the AccountingSupplierParty Party MarkCareIndicator</assert>
    <assert test="$UBL-CR-142" flag="warning" id="UBL-CR-142">[UBL-CR-142]-A UBL invoice should not include the AccountingSupplierParty Party MarkAttentionIndicator</assert>
    <assert test="$UBL-CR-143" flag="warning" id="UBL-CR-143">[UBL-CR-143]-A UBL invoice should not include the AccountingSupplierParty Party WebsiteURI</assert>
    <assert test="$UBL-CR-144" flag="warning" id="UBL-CR-144">[UBL-CR-144]-A UBL invoice should not include the AccountingSupplierParty Party LogoReferenceID</assert>
    <assert test="$UBL-CR-145" flag="warning" id="UBL-CR-145">[UBL-CR-145]-A UBL invoice should not include the AccountingSupplierParty Party IndustryClassificationCode</assert>
    <assert test="$UBL-CR-146" flag="warning" id="UBL-CR-146">[UBL-CR-146]-A UBL invoice should not include the AccountingSupplierParty Party Language</assert>
    <assert test="$UBL-CR-147" flag="warning" id="UBL-CR-147">[UBL-CR-147]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress ID</assert>
    <assert test="$UBL-CR-148" flag="warning" id="UBL-CR-148">[UBL-CR-148]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress AddressTypeCode</assert>
    <assert test="$UBL-CR-149" flag="warning" id="UBL-CR-149">[UBL-CR-149]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress AddressFormatCode</assert>
    <assert test="$UBL-CR-150" flag="warning" id="UBL-CR-150">[UBL-CR-150]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Postbox</assert>
    <assert test="$UBL-CR-151" flag="warning" id="UBL-CR-151">[UBL-CR-151]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Floor</assert>
    <assert test="$UBL-CR-152" flag="warning" id="UBL-CR-152">[UBL-CR-152]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Room</assert>
    <assert test="$UBL-CR-153" flag="warning" id="UBL-CR-153">[UBL-CR-153]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress BlockName</assert>
    <assert test="$UBL-CR-154" flag="warning" id="UBL-CR-154">[UBL-CR-154]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress BuildingName</assert>
    <assert test="$UBL-CR-155" flag="warning" id="UBL-CR-155">[UBL-CR-155]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress BuildingNumber</assert>
    <assert test="$UBL-CR-156" flag="warning" id="UBL-CR-156">[UBL-CR-156]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress InhouseMail</assert>
    <assert test="$UBL-CR-157" flag="warning" id="UBL-CR-157">[UBL-CR-157]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Department</assert>
    <assert test="$UBL-CR-158" flag="warning" id="UBL-CR-158">[UBL-CR-158]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress MarkAttention</assert>
    <assert test="$UBL-CR-159" flag="warning" id="UBL-CR-159">[UBL-CR-159]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress MarkCare</assert>
    <assert test="$UBL-CR-160" flag="warning" id="UBL-CR-160">[UBL-CR-160]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress PlotIdentification</assert>
    <assert test="$UBL-CR-161" flag="warning" id="UBL-CR-161">[UBL-CR-161]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress CitySubdivisionName</assert>
    <assert test="$UBL-CR-162" flag="warning" id="UBL-CR-162">[UBL-CR-162]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress CountrySubentityCode</assert>
    <assert test="$UBL-CR-163" flag="warning" id="UBL-CR-163">[UBL-CR-163]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Region</assert>
    <assert test="$UBL-CR-164" flag="warning" id="UBL-CR-164">[UBL-CR-164]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress District</assert>
    <assert test="$UBL-CR-165" flag="warning" id="UBL-CR-165">[UBL-CR-165]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress TimezoneOffset</assert>
    <assert test="$UBL-CR-166" flag="warning" id="UBL-CR-166">[UBL-CR-166]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Country Name</assert>
    <assert test="$UBL-CR-167" flag="warning" id="UBL-CR-167">[UBL-CR-167]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress LocationCoordinate</assert>
    <assert test="$UBL-CR-168" flag="warning" id="UBL-CR-168">[UBL-CR-168]-A UBL invoice should not include the AccountingSupplierParty Party PhysicalLocation</assert>
    <assert test="$UBL-CR-169" flag="warning" id="UBL-CR-169">[UBL-CR-169]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme RegistrationName</assert>
    <assert test="$UBL-CR-170" flag="warning" id="UBL-CR-170">[UBL-CR-170]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxLevelCode</assert>
    <assert test="$UBL-CR-171" flag="warning" id="UBL-CR-171">[UBL-CR-171]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme ExemptionReasonCode</assert>
    <assert test="$UBL-CR-172" flag="warning" id="UBL-CR-172">[UBL-CR-172]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme ExemptionReason</assert>
    <assert test="$UBL-CR-173" flag="warning" id="UBL-CR-173">[UBL-CR-173]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme RegistrationAddress</assert>
    <assert test="$UBL-CR-174" flag="warning" id="UBL-CR-174">[UBL-CR-174]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme Name</assert>
    <assert test="$UBL-CR-175" flag="warning" id="UBL-CR-175">[UBL-CR-175]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme TaxTypeCode</assert>
    <assert test="$UBL-CR-176" flag="warning" id="UBL-CR-176">[UBL-CR-176]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme CurrencyCode</assert>
    <assert test="$UBL-CR-177" flag="warning" id="UBL-CR-177">[UBL-CR-177]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme JurisdictionRegionAddress</assert>
    <assert test="$UBL-CR-178" flag="warning" id="UBL-CR-178">[UBL-CR-178]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationDate</assert>
    <assert test="$UBL-CR-179" flag="warning" id="UBL-CR-179">[UBL-CR-179]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationExpirationDate</assert>
    <assert test="$UBL-CR-180" flag="warning" id="UBL-CR-180">[UBL-CR-180]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CompanyLegalFormCode</assert>
    <assert test="$UBL-CR-181" flag="warning" id="UBL-CR-181">[UBL-CR-181]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity SoleProprietorshipIndicator</assert>
    <assert test="$UBL-CR-182" flag="warning" id="UBL-CR-182">[UBL-CR-182]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CompanyLiquidationStatusCode</assert>
    <assert test="$UBL-CR-183" flag="warning" id="UBL-CR-183">[UBL-CR-183]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CorporateStockAmount</assert>
    <assert test="$UBL-CR-184" flag="warning" id="UBL-CR-184">[UBL-CR-184]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity FullyPaidSharesIndicator</assert>
    <assert test="$UBL-CR-185" flag="warning" id="UBL-CR-185">[UBL-CR-185]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationAddress</assert>
    <assert test="$UBL-CR-186" flag="warning" id="UBL-CR-186">[UBL-CR-186]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CorporateRegistrationScheme</assert>
    <assert test="$UBL-CR-187" flag="warning" id="UBL-CR-187">[UBL-CR-187]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity HeadOfficeParty</assert>
    <assert test="$UBL-CR-188" flag="warning" id="UBL-CR-188">[UBL-CR-188]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity ShareholderParty</assert>
    <assert test="$UBL-CR-189" flag="warning" id="UBL-CR-189">[UBL-CR-189]-A UBL invoice should not include the AccountingSupplierParty Party Contact ID</assert>
    <assert test="$UBL-CR-190" flag="warning" id="UBL-CR-190">[UBL-CR-190]-A UBL invoice should not include the AccountingSupplierParty Party Contact Telefax</assert>
    <assert test="$UBL-CR-191" flag="warning" id="UBL-CR-191">[UBL-CR-191]-A UBL invoice should not include the AccountingSupplierParty Party Contact Note</assert>
    <assert test="$UBL-CR-192" flag="warning" id="UBL-CR-192">[UBL-CR-192]-A UBL invoice should not include the AccountingSupplierParty Party Contact OtherCommunication</assert>
    <assert test="$UBL-CR-193" flag="warning" id="UBL-CR-193">[UBL-CR-193]-A UBL invoice should not include the AccountingSupplierParty Party Person</assert>
    <assert test="$UBL-CR-194" flag="warning" id="UBL-CR-194">[UBL-CR-194]-A UBL invoice should not include the AccountingSupplierParty Party AgentParty</assert>
    <assert test="$UBL-CR-195" flag="warning" id="UBL-CR-195">[UBL-CR-195]-A UBL invoice should not include the AccountingSupplierParty Party ServiceProviderParty</assert>
    <assert test="$UBL-CR-196" flag="warning" id="UBL-CR-196">[UBL-CR-196]-A UBL invoice should not include the AccountingSupplierParty Party PowerOfAttorney</assert>
    <assert test="$UBL-CR-197" flag="warning" id="UBL-CR-197">[UBL-CR-197]-A UBL invoice should not include the AccountingSupplierParty Party FinancialAccount</assert>
    <assert test="$UBL-CR-198" flag="warning" id="UBL-CR-198">[UBL-CR-198]-A UBL invoice should not include the AccountingSupplierParty DespatchContact</assert>
    <assert test="$UBL-CR-199" flag="warning" id="UBL-CR-199">[UBL-CR-199]-A UBL invoice should not include the AccountingSupplierParty AccountingContact</assert>
    <assert test="$UBL-CR-200" flag="warning" id="UBL-CR-200">[UBL-CR-200]-A UBL invoice should not include the AccountingSupplierParty SellerContact</assert>
    <assert test="$UBL-CR-201" flag="warning" id="UBL-CR-201">[UBL-CR-201]-A UBL invoice should not include the AccountingCustomerParty CustomerAssignedAccountID</assert>
    <assert test="$UBL-CR-202" flag="warning" id="UBL-CR-202">[UBL-CR-202]-A UBL invoice should not include the AccountingCustomerParty SupplierAssignedAccountID</assert>
    <assert test="$UBL-CR-203" flag="warning" id="UBL-CR-203">[UBL-CR-203]-A UBL invoice should not include the AccountingCustomerParty AdditionalAccountID</assert>
    <assert test="$UBL-CR-204" flag="warning" id="UBL-CR-204">[UBL-CR-204]-A UBL invoice should not include the AccountingCustomerParty Party MarkCareIndicator</assert>
    <assert test="$UBL-CR-205" flag="warning" id="UBL-CR-205">[UBL-CR-205]-A UBL invoice should not include the AccountingCustomerParty Party MarkAttentionIndicator</assert>
    <assert test="$UBL-CR-206" flag="warning" id="UBL-CR-206">[UBL-CR-206]-A UBL invoice should not include the AccountingCustomerParty Party WebsiteURI</assert>
    <assert test="$UBL-CR-207" flag="warning" id="UBL-CR-207">[UBL-CR-207]-A UBL invoice should not include the AccountingCustomerParty Party LogoReferenceID</assert>
    <assert test="$UBL-CR-208" flag="warning" id="UBL-CR-208">[UBL-CR-208]-A UBL invoice should not include the AccountingCustomerParty Party IndustryClassificationCode</assert>
    <assert test="$UBL-CR-209" flag="warning" id="UBL-CR-209">[UBL-CR-209]-A UBL invoice should not include the AccountingCustomerParty Party Language</assert>
    <assert test="$UBL-CR-210" flag="warning" id="UBL-CR-210">[UBL-CR-210]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress ID</assert>
    <assert test="$UBL-CR-211" flag="warning" id="UBL-CR-211">[UBL-CR-211]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress AddressTypeCode</assert>
    <assert test="$UBL-CR-212" flag="warning" id="UBL-CR-212">[UBL-CR-212]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress AddressFormatCode</assert>
    <assert test="$UBL-CR-213" flag="warning" id="UBL-CR-213">[UBL-CR-213]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Postbox</assert>
    <assert test="$UBL-CR-214" flag="warning" id="UBL-CR-214">[UBL-CR-214]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Floor</assert>
    <assert test="$UBL-CR-215" flag="warning" id="UBL-CR-215">[UBL-CR-215]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Room</assert>
    <assert test="$UBL-CR-216" flag="warning" id="UBL-CR-216">[UBL-CR-216]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress BlockName</assert>
    <assert test="$UBL-CR-217" flag="warning" id="UBL-CR-217">[UBL-CR-217]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress BuildingName</assert>
    <assert test="$UBL-CR-218" flag="warning" id="UBL-CR-218">[UBL-CR-218]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress BuildingNumber</assert>
    <assert test="$UBL-CR-219" flag="warning" id="UBL-CR-219">[UBL-CR-219]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress InhouseMail</assert>
    <assert test="$UBL-CR-220" flag="warning" id="UBL-CR-220">[UBL-CR-220]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Department</assert>
    <assert test="$UBL-CR-221" flag="warning" id="UBL-CR-221">[UBL-CR-221]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress MarkAttention</assert>
    <assert test="$UBL-CR-222" flag="warning" id="UBL-CR-222">[UBL-CR-222]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress MarkCare</assert>
    <assert test="$UBL-CR-223" flag="warning" id="UBL-CR-223">[UBL-CR-223]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress PlotIdentification</assert>
    <assert test="$UBL-CR-224" flag="warning" id="UBL-CR-224">[UBL-CR-224]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress CitySubdivisionName</assert>
    <assert test="$UBL-CR-225" flag="warning" id="UBL-CR-225">[UBL-CR-225]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress CountrySubentityCode</assert>
    <assert test="$UBL-CR-226" flag="warning" id="UBL-CR-226">[UBL-CR-226]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Region</assert>
    <assert test="$UBL-CR-227" flag="warning" id="UBL-CR-227">[UBL-CR-227]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress District</assert>
    <assert test="$UBL-CR-228" flag="warning" id="UBL-CR-228">[UBL-CR-228]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress TimezoneOffset</assert>
    <assert test="$UBL-CR-229" flag="warning" id="UBL-CR-229">[UBL-CR-229]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Country Name</assert>
    <assert test="$UBL-CR-230" flag="warning" id="UBL-CR-230">[UBL-CR-230]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress LocationCoordinate</assert>
    <assert test="$UBL-CR-231" flag="warning" id="UBL-CR-231">[UBL-CR-231]-A UBL invoice should not include the AccountingCustomerParty Party PhysicalLocation</assert>
    <assert test="$UBL-CR-232" flag="warning" id="UBL-CR-232">[UBL-CR-232]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme RegistrationName</assert>
    <assert test="$UBL-CR-233" flag="warning" id="UBL-CR-233">[UBL-CR-233]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxLevelCode</assert>
    <assert test="$UBL-CR-234" flag="warning" id="UBL-CR-234">[UBL-CR-234]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme ExemptionReasonCode</assert>
    <assert test="$UBL-CR-235" flag="warning" id="UBL-CR-235">[UBL-CR-235]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme ExemptionReason</assert>
    <assert test="$UBL-CR-236" flag="warning" id="UBL-CR-236">[UBL-CR-236]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme RegistrationAddress</assert>
    <assert test="$UBL-CR-237" flag="warning" id="UBL-CR-237">[UBL-CR-237]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme Name</assert>
    <assert test="$UBL-CR-238" flag="warning" id="UBL-CR-238">[UBL-CR-238]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme TaxTypeCode</assert>
    <assert test="$UBL-CR-239" flag="warning" id="UBL-CR-239">[UBL-CR-239]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme CurrencyCode</assert>
    <assert test="$UBL-CR-240" flag="warning" id="UBL-CR-240">[UBL-CR-240]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme JurisdictionRegionAddress</assert>
    <assert test="$UBL-CR-241" flag="warning" id="UBL-CR-241">[UBL-CR-241]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationDate</assert>
    <assert test="$UBL-CR-242" flag="warning" id="UBL-CR-242">[UBL-CR-242]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationExpirationDate</assert>
    <assert test="$UBL-CR-243" flag="warning" id="UBL-CR-243">[UBL-CR-243]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLegalFormCode</assert>
    <assert test="$UBL-CR-244" flag="warning" id="UBL-CR-244">[UBL-CR-244]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLegalForm</assert>
    <assert test="$UBL-CR-245" flag="warning" id="UBL-CR-245">[UBL-CR-245]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity SoleProprietorshipIndicator</assert>
    <assert test="$UBL-CR-246" flag="warning" id="UBL-CR-246">[UBL-CR-246]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLiquidationStatusCode</assert>
    <assert test="$UBL-CR-247" flag="warning" id="UBL-CR-247">[UBL-CR-247]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CorporateStockAmount</assert>
    <assert test="$UBL-CR-248" flag="warning" id="UBL-CR-248">[UBL-CR-248]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity FullyPaidSharesIndicator</assert>
    <assert test="$UBL-CR-249" flag="warning" id="UBL-CR-249">[UBL-CR-249]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationAddress</assert>
    <assert test="$UBL-CR-250" flag="warning" id="UBL-CR-250">[UBL-CR-250]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CorporateRegistrationScheme</assert>
    <assert test="$UBL-CR-251" flag="warning" id="UBL-CR-251">[UBL-CR-251]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity HeadOfficeParty</assert>
    <assert test="$UBL-CR-252" flag="warning" id="UBL-CR-252">[UBL-CR-252]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity ShareholderParty</assert>
    <assert test="$UBL-CR-253" flag="warning" id="UBL-CR-253">[UBL-CR-253]-A UBL invoice should not include the AccountingCustomerParty Party Contact ID</assert>
    <assert test="$UBL-CR-254" flag="warning" id="UBL-CR-254">[UBL-CR-254]-A UBL invoice should not include the AccountingCustomerParty Party Contact Telefax</assert>
    <assert test="$UBL-CR-255" flag="warning" id="UBL-CR-255">[UBL-CR-255]-A UBL invoice should not include the AccountingCustomerParty Party Contact Note</assert>
    <assert test="$UBL-CR-256" flag="warning" id="UBL-CR-256">[UBL-CR-256]-A UBL invoice should not include the AccountingCustomerParty Party Contact OtherCommunication</assert>
    <assert test="$UBL-CR-257" flag="warning" id="UBL-CR-257">[UBL-CR-257]-A UBL invoice should not include the AccountingCustomerParty Party Person</assert>
    <assert test="$UBL-CR-258" flag="warning" id="UBL-CR-258">[UBL-CR-258]-A UBL invoice should not include the AccountingCustomerParty Party AgentParty</assert>
    <assert test="$UBL-CR-259" flag="warning" id="UBL-CR-259">[UBL-CR-259]-A UBL invoice should not include the AccountingCustomerParty Party ServiceProviderParty</assert>
    <assert test="$UBL-CR-260" flag="warning" id="UBL-CR-260">[UBL-CR-260]-A UBL invoice should not include the AccountingCustomerParty Party PowerOfAttorney</assert>
    <assert test="$UBL-CR-261" flag="warning" id="UBL-CR-261">[UBL-CR-261]-A UBL invoice should not include the AccountingCustomerParty Party FinancialAccount</assert>
    <assert test="$UBL-CR-262" flag="warning" id="UBL-CR-262">[UBL-CR-262]-A UBL invoice should not include the AccountingCustomerParty DeliveryContact</assert>
    <assert test="$UBL-CR-263" flag="warning" id="UBL-CR-263">[UBL-CR-263]-A UBL invoice should not include the AccountingCustomerParty AccountingContact</assert>
    <assert test="$UBL-CR-264" flag="warning" id="UBL-CR-264">[UBL-CR-264]-A UBL invoice should not include the AccountingCustomerParty BuyerContact</assert>
    <assert test="$UBL-CR-265" flag="warning" id="UBL-CR-265">[UBL-CR-265]-A UBL invoice should not include the PayeeParty MarkCareIndicator</assert>
    <assert test="$UBL-CR-266" flag="warning" id="UBL-CR-266">[UBL-CR-266]-A UBL invoice should not include the PayeeParty MarkAttentionIndicator</assert>
    <assert test="$UBL-CR-267" flag="warning" id="UBL-CR-267">[UBL-CR-267]-A UBL invoice should not include the PayeeParty WebsiteURI</assert>
    <assert test="$UBL-CR-268" flag="warning" id="UBL-CR-268">[UBL-CR-268]-A UBL invoice should not include the PayeeParty LogoReferenceID</assert>
    <assert test="$UBL-CR-269" flag="warning" id="UBL-CR-269">[UBL-CR-269]-A UBL invoice should not include the PayeeParty EndpointID</assert>
    <assert test="$UBL-CR-270" flag="warning" id="UBL-CR-270">[UBL-CR-270]-A UBL invoice should not include the PayeeParty IndustryClassificationCode</assert>
    <assert test="$UBL-CR-271" flag="warning" id="UBL-CR-271">[UBL-CR-271]-A UBL invoice should not include the PayeeParty Language</assert>
    <assert test="$UBL-CR-272" flag="warning" id="UBL-CR-272">[UBL-CR-272]-A UBL invoice should not include the PayeeParty PostalAddress</assert>
    <assert test="$UBL-CR-273" flag="warning" id="UBL-CR-273">[UBL-CR-273]-A UBL invoice should not include the PayeeParty PhysicalLocation</assert>
    <assert test="$UBL-CR-274" flag="warning" id="UBL-CR-274">[UBL-CR-274]-A UBL invoice should not include the PayeeParty PartyTaxScheme</assert>
    <assert test="$UBL-CR-275" flag="warning" id="UBL-CR-275">[UBL-CR-275]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationName</assert>
    <assert test="$UBL-CR-276" flag="warning" id="UBL-CR-276">[UBL-CR-276]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationDate</assert>
    <assert test="$UBL-CR-277" flag="warning" id="UBL-CR-277">[UBL-CR-277]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationExpirationDate</assert>
    <assert test="$UBL-CR-278" flag="warning" id="UBL-CR-278">[UBL-CR-278]-A UBL invoice should not include the PayeeParty PartyLegalEntity CompanyLegalFormCode</assert>
    <assert test="$UBL-CR-279" flag="warning" id="UBL-CR-279">[UBL-CR-279]-A UBL invoice should not include the PayeeParty PartyLegalEntity CompanyLegalForm</assert>
    <assert test="$UBL-CR-280" flag="warning" id="UBL-CR-280">[UBL-CR-280]-A UBL invoice should not include the PayeeParty PartyLegalEntity SoleProprietorshipIndicator</assert>
    <assert test="$UBL-CR-281" flag="warning" id="UBL-CR-281">[UBL-CR-281]-A UBL invoice should not include the PayeeParty PartyLegalEntity CompanyLiquidationStatusCode</assert>
    <assert test="$UBL-CR-282" flag="warning" id="UBL-CR-282">[UBL-CR-282]-A UBL invoice should not include the PayeeParty PartyLegalEntity CorporateStockAmount</assert>
    <assert test="$UBL-CR-283" flag="warning" id="UBL-CR-283">[UBL-CR-283]-A UBL invoice should not include the PayeeParty PartyLegalEntity FullyPaidSharesIndicator</assert>
    <assert test="$UBL-CR-284" flag="warning" id="UBL-CR-284">[UBL-CR-284]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationAddress</assert>
    <assert test="$UBL-CR-285" flag="warning" id="UBL-CR-285">[UBL-CR-285]-A UBL invoice should not include the PayeeParty PartyLegalEntity CorporateRegistrationScheme</assert>
    <assert test="$UBL-CR-286" flag="warning" id="UBL-CR-286">[UBL-CR-286]-A UBL invoice should not include the PayeeParty PartyLegalEntity HeadOfficeParty</assert>
    <assert test="$UBL-CR-287" flag="warning" id="UBL-CR-287">[UBL-CR-287]-A UBL invoice should not include the PayeeParty PartyLegalEntity ShareholderParty</assert>
    <assert test="$UBL-CR-288" flag="warning" id="UBL-CR-288">[UBL-CR-288]-A UBL invoice should not include the PayeeParty Contact</assert>
    <assert test="$UBL-CR-289" flag="warning" id="UBL-CR-289">[UBL-CR-289]-A UBL invoice should not include the PayeeParty Person</assert>
    <assert test="$UBL-CR-290" flag="warning" id="UBL-CR-290">[UBL-CR-290]-A UBL invoice should not include the PayeeParty AgentParty</assert>
    <assert test="$UBL-CR-291" flag="warning" id="UBL-CR-291">[UBL-CR-291]-A UBL invoice should not include the PayeeParty ServiceProviderParty</assert>
    <assert test="$UBL-CR-292" flag="warning" id="UBL-CR-292">[UBL-CR-292]-A UBL invoice should not include the PayeeParty PowerOfAttorney</assert>
    <assert test="$UBL-CR-293" flag="warning" id="UBL-CR-293">[UBL-CR-293]-A UBL invoice should not include the PayeeParty FinancialAccount</assert>
    <assert test="$UBL-CR-294" flag="warning" id="UBL-CR-294">[UBL-CR-294]-A UBL invoice should not include the BuyerCustomerParty</assert>
    <assert test="$UBL-CR-295" flag="warning" id="UBL-CR-295">[UBL-CR-295]-A UBL invoice should not include the SellerSupplierParty</assert>
    <assert test="$UBL-CR-296" flag="warning" id="UBL-CR-296">[UBL-CR-296]-A UBL invoice should not include the TaxRepresentativeParty MarkCareIndicator</assert>
    <assert test="$UBL-CR-297" flag="warning" id="UBL-CR-297">[UBL-CR-297]-A UBL invoice should not include the TaxRepresentativeParty MarkAttentionIndicator</assert>
    <assert test="$UBL-CR-298" flag="warning" id="UBL-CR-298">[UBL-CR-298]-A UBL invoice should not include the TaxRepresentativeParty WebsiteURI</assert>
    <assert test="$UBL-CR-299" flag="warning" id="UBL-CR-299">[UBL-CR-299]-A UBL invoice should not include the TaxRepresentativeParty LogoReferenceID</assert>
    <assert test="$UBL-CR-300" flag="warning" id="UBL-CR-300">[UBL-CR-300]-A UBL invoice should not include the TaxRepresentativeParty EndpointID</assert>
    <assert test="$UBL-CR-301" flag="warning" id="UBL-CR-301">[UBL-CR-301]-A UBL invoice should not include the TaxRepresentativeParty IndustryClassificationCode</assert>
    <assert test="$UBL-CR-302" flag="warning" id="UBL-CR-302">[UBL-CR-302]-A UBL invoice should not include the TaxRepresentativeParty PartyIdentification</assert>
    <assert test="$UBL-CR-303" flag="warning" id="UBL-CR-303">[UBL-CR-303]-A UBL invoice should not include the TaxRepresentativeParty Language</assert>
    <assert test="$UBL-CR-304" flag="warning" id="UBL-CR-304">[UBL-CR-304]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress ID</assert>
    <assert test="$UBL-CR-305" flag="warning" id="UBL-CR-305">[UBL-CR-305]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress AddressTypeCode</assert>
    <assert test="$UBL-CR-306" flag="warning" id="UBL-CR-306">[UBL-CR-306]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress AddressFormatCode</assert>
    <assert test="$UBL-CR-307" flag="warning" id="UBL-CR-307">[UBL-CR-307]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Postbox</assert>
    <assert test="$UBL-CR-308" flag="warning" id="UBL-CR-308">[UBL-CR-308]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Floor</assert>
    <assert test="$UBL-CR-309" flag="warning" id="UBL-CR-309">[UBL-CR-309]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Room</assert>
    <assert test="$UBL-CR-310" flag="warning" id="UBL-CR-310">[UBL-CR-310]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress BlockName</assert>
    <assert test="$UBL-CR-311" flag="warning" id="UBL-CR-311">[UBL-CR-311]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress BuildingName</assert>
    <assert test="$UBL-CR-312" flag="warning" id="UBL-CR-312">[UBL-CR-312]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress BuildingNumber</assert>
    <assert test="$UBL-CR-313" flag="warning" id="UBL-CR-313">[UBL-CR-313]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress InhouseMail</assert>
    <assert test="$UBL-CR-314" flag="warning" id="UBL-CR-314">[UBL-CR-314]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Department</assert>
    <assert test="$UBL-CR-315" flag="warning" id="UBL-CR-315">[UBL-CR-315]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress MarkAttention</assert>
    <assert test="$UBL-CR-316" flag="warning" id="UBL-CR-316">[UBL-CR-316]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress MarkCare</assert>
    <assert test="$UBL-CR-317" flag="warning" id="UBL-CR-317">[UBL-CR-317]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress PlotIdentification</assert>
    <assert test="$UBL-CR-318" flag="warning" id="UBL-CR-318">[UBL-CR-318]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress CitySubdivisionName</assert>
    <assert test="$UBL-CR-319" flag="warning" id="UBL-CR-319">[UBL-CR-319]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress CountrySubentityCode</assert>
    <assert test="$UBL-CR-320" flag="warning" id="UBL-CR-320">[UBL-CR-320]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Region</assert>
    <assert test="$UBL-CR-321" flag="warning" id="UBL-CR-321">[UBL-CR-321]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress District</assert>
    <assert test="$UBL-CR-322" flag="warning" id="UBL-CR-322">[UBL-CR-322]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress TimezoneOffset</assert>
    <assert test="$UBL-CR-323" flag="warning" id="UBL-CR-323">[UBL-CR-323]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Country Name</assert>
    <assert test="$UBL-CR-324" flag="warning" id="UBL-CR-324">[UBL-CR-324]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress LocationCoordinate</assert>
    <assert test="$UBL-CR-325" flag="warning" id="UBL-CR-325">[UBL-CR-325]-A UBL invoice should not include the TaxRepresentativeParty PhysicalLocation</assert>
    <assert test="$UBL-CR-326" flag="warning" id="UBL-CR-326">[UBL-CR-326]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme RegistrationName</assert>
    <assert test="$UBL-CR-327" flag="warning" id="UBL-CR-327">[UBL-CR-327]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxLevelCode</assert>
    <assert test="$UBL-CR-328" flag="warning" id="UBL-CR-328">[UBL-CR-328]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme ExemptionReasonCode</assert>
    <assert test="$UBL-CR-329" flag="warning" id="UBL-CR-329">[UBL-CR-329]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme ExemptionReason</assert>
    <assert test="$UBL-CR-330" flag="warning" id="UBL-CR-330">[UBL-CR-330]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme RegistrationAddress</assert>
    <assert test="$UBL-CR-331" flag="warning" id="UBL-CR-331">[UBL-CR-331]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme Name</assert>
    <assert test="$UBL-CR-332" flag="warning" id="UBL-CR-332">[UBL-CR-332]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme TaxTypeCode</assert>
    <assert test="$UBL-CR-333" flag="warning" id="UBL-CR-333">[UBL-CR-333]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme CurrencyCode</assert>
    <assert test="$UBL-CR-334" flag="warning" id="UBL-CR-334">[UBL-CR-334]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme JurisdictionRegionAddress</assert>
    <assert test="$UBL-CR-335" flag="warning" id="UBL-CR-335">[UBL-CR-335]-A UBL invoice should not include the TaxRepresentativeParty PartyLegalEntity</assert>
    <assert test="$UBL-CR-336" flag="warning" id="UBL-CR-336">[UBL-CR-336]-A UBL invoice should not include the TaxRepresentativeParty Contact</assert>
    <assert test="$UBL-CR-337" flag="warning" id="UBL-CR-337">[UBL-CR-337]-A UBL invoice should not include the TaxRepresentativeParty Person</assert>
    <assert test="$UBL-CR-338" flag="warning" id="UBL-CR-338">[UBL-CR-338]-A UBL invoice should not include the TaxRepresentativeParty AgentParty</assert>
    <assert test="$UBL-CR-339" flag="warning" id="UBL-CR-339">[UBL-CR-339]-A UBL invoice should not include the TaxRepresentativeParty ServiceProviderParty</assert>
    <assert test="$UBL-CR-340" flag="warning" id="UBL-CR-340">[UBL-CR-340]-A UBL invoice should not include the TaxRepresentativeParty PowerOfAttorney</assert>
    <assert test="$UBL-CR-341" flag="warning" id="UBL-CR-341">[UBL-CR-341]-A UBL invoice should not include the TaxRepresentativeParty FinancialAccount</assert>
    <assert test="$UBL-CR-342" flag="warning" id="UBL-CR-342">[UBL-CR-342]-A UBL invoice should not include the Delivery ID</assert>
    <assert test="$UBL-CR-343" flag="warning" id="UBL-CR-343">[UBL-CR-343]-A UBL invoice should not include the Delivery Quantity</assert>
    <assert test="$UBL-CR-344" flag="warning" id="UBL-CR-344">[UBL-CR-344]-A UBL invoice should not include the Delivery MinimumQuantity</assert>
    <assert test="$UBL-CR-345" flag="warning" id="UBL-CR-345">[UBL-CR-345]-A UBL invoice should not include the Delivery MaximumQuantity</assert>
    <assert test="$UBL-CR-346" flag="warning" id="UBL-CR-346">[UBL-CR-346]-A UBL invoice should not include the Delivery ActualDeliveryTime</assert>
    <assert test="$UBL-CR-347" flag="warning" id="UBL-CR-347">[UBL-CR-347]-A UBL invoice should not include the Delivery LatestDeliveryDate</assert>
    <assert test="$UBL-CR-348" flag="warning" id="UBL-CR-348">[UBL-CR-348]-A UBL invoice should not include the Delivery LatestDeliveryTime</assert>
    <assert test="$UBL-CR-349" flag="warning" id="UBL-CR-349">[UBL-CR-349]-A UBL invoice should not include the Delivery ReleaseID</assert>
    <assert test="$UBL-CR-350" flag="warning" id="UBL-CR-350">[UBL-CR-350]-A UBL invoice should not include the Delivery TrackingID</assert>
    <assert test="$UBL-CR-351" flag="warning" id="UBL-CR-351">[UBL-CR-351]-A UBL invoice should not include the Delivery DeliveryLocation Description</assert>
    <assert test="$UBL-CR-352" flag="warning" id="UBL-CR-352">[UBL-CR-352]-A UBL invoice should not include the Delivery DeliveryLocation Conditions</assert>
    <assert test="$UBL-CR-353" flag="warning" id="UBL-CR-353">[UBL-CR-353]-A UBL invoice should not include the Delivery DeliveryLocation CountrySubentity</assert>
    <assert test="$UBL-CR-354" flag="warning" id="UBL-CR-354">[UBL-CR-354]-A UBL invoice should not include the Delivery DeliveryLocation CountrySubentityCode</assert>
    <assert test="$UBL-CR-355" flag="warning" id="UBL-CR-355">[UBL-CR-355]-A UBL invoice should not include the Delivery DeliveryLocation LocationTypeCode</assert>
    <assert test="$UBL-CR-356" flag="warning" id="UBL-CR-356">[UBL-CR-356]-A UBL invoice should not include the Delivery DeliveryLocation InformationURI</assert>
    <assert test="$UBL-CR-357" flag="warning" id="UBL-CR-357">[UBL-CR-357]-A UBL invoice should not include the Delivery DeliveryLocation Name</assert>
    <assert test="$UBL-CR-358" flag="warning" id="UBL-CR-358">[UBL-CR-358]-A UBL invoice should not include the Delivery DeliveryLocation ValidityPeriod</assert>
    <assert test="$UBL-CR-359" flag="warning" id="UBL-CR-359">[UBL-CR-359]-A UBL invoice should not include the Delivery DeliveryLocation Address ID</assert>
    <assert test="$UBL-CR-360" flag="warning" id="UBL-CR-360">[UBL-CR-360]-A UBL invoice should not include the Delivery DeliveryLocation Address AddressTypeCode</assert>
    <assert test="$UBL-CR-361" flag="warning" id="UBL-CR-361">[UBL-CR-361]-A UBL invoice should not include the Delivery DeliveryLocation Address AddressFormatCode</assert>
    <assert test="$UBL-CR-362" flag="warning" id="UBL-CR-362">[UBL-CR-362]-A UBL invoice should not include the Delivery DeliveryLocation Address Postbox</assert>
    <assert test="$UBL-CR-363" flag="warning" id="UBL-CR-363">[UBL-CR-363]-A UBL invoice should not include the Delivery DeliveryLocation Address Floor</assert>
    <assert test="$UBL-CR-364" flag="warning" id="UBL-CR-364">[UBL-CR-364]-A UBL invoice should not include the Delivery DeliveryLocation Address Room</assert>
    <assert test="$UBL-CR-365" flag="warning" id="UBL-CR-365">[UBL-CR-365]-A UBL invoice should not include the Delivery DeliveryLocation Address BlockName</assert>
    <assert test="$UBL-CR-366" flag="warning" id="UBL-CR-366">[UBL-CR-366]-A UBL invoice should not include the Delivery DeliveryLocation Address BuildingName</assert>
    <assert test="$UBL-CR-367" flag="warning" id="UBL-CR-367">[UBL-CR-367]-A UBL invoice should not include the Delivery DeliveryLocation Address BuildingNumber</assert>
    <assert test="$UBL-CR-368" flag="warning" id="UBL-CR-368">[UBL-CR-368]-A UBL invoice should not include the Delivery DeliveryLocation Address InhouseMail</assert>
    <assert test="$UBL-CR-369" flag="warning" id="UBL-CR-369">[UBL-CR-369]-A UBL invoice should not include the Delivery DeliveryLocation Address Department</assert>
    <assert test="$UBL-CR-370" flag="warning" id="UBL-CR-370">[UBL-CR-370]-A UBL invoice should not include the Delivery DeliveryLocation Address MarkAttention</assert>
    <assert test="$UBL-CR-371" flag="warning" id="UBL-CR-371">[UBL-CR-371]-A UBL invoice should not include the Delivery DeliveryLocation Address MarkCare</assert>
    <assert test="$UBL-CR-372" flag="warning" id="UBL-CR-372">[UBL-CR-372]-A UBL invoice should not include the Delivery DeliveryLocation Address PlotIdentification</assert>
    <assert test="$UBL-CR-373" flag="warning" id="UBL-CR-373">[UBL-CR-373]-A UBL invoice should not include the Delivery DeliveryLocation Address CitySubdivisionName</assert>
    <assert test="$UBL-CR-374" flag="warning" id="UBL-CR-374">[UBL-CR-374]-A UBL invoice should not include the Delivery DeliveryLocation Address CountrySubentityCode</assert>
    <assert test="$UBL-CR-375" flag="warning" id="UBL-CR-375">[UBL-CR-375]-A UBL invoice should not include the Delivery DeliveryLocation Address Region</assert>
    <assert test="$UBL-CR-376" flag="warning" id="UBL-CR-376">[UBL-CR-376]-A UBL invoice should not include the Delivery DeliveryLocation Address District</assert>
    <assert test="$UBL-CR-377" flag="warning" id="UBL-CR-377">[UBL-CR-377]-A UBL invoice should not include the Delivery DeliveryLocation Address TimezoneOffset</assert>
    <assert test="$UBL-CR-378" flag="warning" id="UBL-CR-378">[UBL-CR-378]-A UBL invoice should not include the Delivery DeliveryLocation Address Country Name</assert>
    <assert test="$UBL-CR-379" flag="warning" id="UBL-CR-379">[UBL-CR-379]-A UBL invoice should not include the Delivery DeliveryLocation Address LocationCoordinate</assert>
    <assert test="$UBL-CR-380" flag="warning" id="UBL-CR-380">[UBL-CR-380]-A UBL invoice should not include the Delivery DeliveryLocation SubsidiaryLocation</assert>
    <assert test="$UBL-CR-381" flag="warning" id="UBL-CR-381">[UBL-CR-381]-A UBL invoice should not include the Delivery DeliveryLocation LocationCoordinate</assert>
    <assert test="$UBL-CR-382" flag="warning" id="UBL-CR-382">[UBL-CR-382]-A UBL invoice should not include the Delivery AlternativeDeliveryLocation</assert>
    <assert test="$UBL-CR-383" flag="warning" id="UBL-CR-383">[UBL-CR-383]-A UBL invoice should not include the Delivery RequestedDeliveryPeriod</assert>
    <assert test="$UBL-CR-384" flag="warning" id="UBL-CR-384">[UBL-CR-384]-A UBL invoice should not include the Delivery EstimatedDeliveryPeriod</assert>
    <assert test="$UBL-CR-385" flag="warning" id="UBL-CR-385">[UBL-CR-385]-A UBL invoice should not include the Delivery CarrierParty</assert>
    <assert test="$UBL-CR-386" flag="warning" id="UBL-CR-386">[UBL-CR-386]-A UBL invoice should not include the DeliveryParty MarkCareIndicator</assert>
    <assert test="$UBL-CR-387" flag="warning" id="UBL-CR-387">[UBL-CR-387]-A UBL invoice should not include the DeliveryParty MarkAttentionIndicator</assert>
    <assert test="$UBL-CR-388" flag="warning" id="UBL-CR-388">[UBL-CR-388]-A UBL invoice should not include the DeliveryParty WebsiteURI</assert>
    <assert test="$UBL-CR-389" flag="warning" id="UBL-CR-389">[UBL-CR-389]-A UBL invoice should not include the DeliveryParty LogoReferenceID</assert>
    <assert test="$UBL-CR-390" flag="warning" id="UBL-CR-390">[UBL-CR-390]-A UBL invoice should not include the DeliveryParty EndpointID</assert>
    <assert test="$UBL-CR-391" flag="warning" id="UBL-CR-391">[UBL-CR-391]-A UBL invoice should not include the DeliveryParty IndustryClassificationCode</assert>
    <assert test="$UBL-CR-392" flag="warning" id="UBL-CR-392">[UBL-CR-392]-A UBL invoice should not include the DeliveryParty PartyIdentification</assert>
    <assert test="$UBL-CR-393" flag="warning" id="UBL-CR-393">[UBL-CR-393]-A UBL invoice should not include the DeliveryParty Language</assert>
    <assert test="$UBL-CR-394" flag="warning" id="UBL-CR-394">[UBL-CR-394]-A UBL invoice should not include the DeliveryParty PostalAddress</assert>
    <assert test="$UBL-CR-395" flag="warning" id="UBL-CR-395">[UBL-CR-395]-A UBL invoice should not include the DeliveryParty PhysicalLocation</assert>
    <assert test="$UBL-CR-396" flag="warning" id="UBL-CR-396">[UBL-CR-396]-A UBL invoice should not include the DeliveryParty PartyTaxScheme</assert>
    <assert test="$UBL-CR-397" flag="warning" id="UBL-CR-397">[UBL-CR-397]-A UBL invoice should not include the DeliveryParty PartyLegalEntity</assert>
    <assert test="$UBL-CR-398" flag="warning" id="UBL-CR-398">[UBL-CR-398]-A UBL invoice should not include the DeliveryParty Contact</assert>
    <assert test="$UBL-CR-399" flag="warning" id="UBL-CR-399">[UBL-CR-399]-A UBL invoice should not include the DeliveryParty Person</assert>
    <assert test="$UBL-CR-400" flag="warning" id="UBL-CR-400">[UBL-CR-400]-A UBL invoice should not include the DeliveryParty AgentParty</assert>
    <assert test="$UBL-CR-401" flag="warning" id="UBL-CR-401">[UBL-CR-401]-A UBL invoice should not include the DeliveryParty ServiceProviderParty</assert>
    <assert test="$UBL-CR-402" flag="warning" id="UBL-CR-402">[UBL-CR-402]-A UBL invoice should not include the DeliveryParty PowerOfAttorney</assert>
    <assert test="$UBL-CR-403" flag="warning" id="UBL-CR-403">[UBL-CR-403]-A UBL invoice should not include the DeliveryParty FinancialAccount</assert>
    <assert test="$UBL-CR-404" flag="warning" id="UBL-CR-404">[UBL-CR-404]-A UBL invoice should not include the Delivery NotifyParty</assert>
    <assert test="$UBL-CR-405" flag="warning" id="UBL-CR-405">[UBL-CR-405]-A UBL invoice should not include the Delivery Despatch</assert>
    <assert test="$UBL-CR-406" flag="warning" id="UBL-CR-406">[UBL-CR-406]-A UBL invoice should not include the Delivery DeliveryTerms</assert>
    <assert test="$UBL-CR-407" flag="warning" id="UBL-CR-407">[UBL-CR-407]-A UBL invoice should not include the Delivery MinimumDeliveryUnit</assert>
    <assert test="$UBL-CR-408" flag="warning" id="UBL-CR-408">[UBL-CR-408]-A UBL invoice should not include the Delivery MaximumDeliveryUnit</assert>
    <assert test="$UBL-CR-409" flag="warning" id="UBL-CR-409">[UBL-CR-409]-A UBL invoice should not include the Delivery Shipment</assert>
    <assert test="$UBL-CR-410" flag="warning" id="UBL-CR-410">[UBL-CR-410]-A UBL invoice should not include the DeliveryTerms</assert>
    <assert test="$UBL-CR-411" flag="warning" id="UBL-CR-411">[UBL-CR-411]-A UBL invoice should not include the PaymentMeans ID</assert>
    <assert test="$UBL-CR-412" flag="warning" id="UBL-CR-412">[UBL-CR-412]-A UBL invoice should not include the PaymentMeans PaymentDueDate</assert>
    <assert test="$UBL-CR-413" flag="warning" id="UBL-CR-413">[UBL-CR-413]-A UBL invoice should not include the PaymentMeans PaymentChannelCode</assert>
    <assert test="$UBL-CR-414" flag="warning" id="UBL-CR-414">[UBL-CR-414]-A UBL invoice should not include the PaymentMeans InstructionID</assert>
    <assert test="$UBL-CR-415" flag="warning" id="UBL-CR-415">[UBL-CR-415]-A UBL invoice should not include the PaymentMeans CardAccount CardTypeCode</assert>
    <assert test="$UBL-CR-416" flag="warning" id="UBL-CR-416">[UBL-CR-416]-A UBL invoice should not include the PaymentMeans CardAccount ValidityStartDate</assert>
    <assert test="$UBL-CR-417" flag="warning" id="UBL-CR-417">[UBL-CR-417]-A UBL invoice should not include the PaymentMeans CardAccount ExpiryDate</assert>
    <assert test="$UBL-CR-418" flag="warning" id="UBL-CR-418">[UBL-CR-418]-A UBL invoice should not include the PaymentMeans CardAccount IssuerID</assert>
    <assert test="$UBL-CR-419" flag="warning" id="UBL-CR-419">[UBL-CR-419]-A UBL invoice should not include the PaymentMeans CardAccount IssueNumberID</assert>
    <assert test="$UBL-CR-420" flag="warning" id="UBL-CR-420">[UBL-CR-420]-A UBL invoice should not include the PaymentMeans CardAccount CV2ID</assert>
    <assert test="$UBL-CR-421" flag="warning" id="UBL-CR-421">[UBL-CR-421]-A UBL invoice should not include the PaymentMeans CardAccount CardChipCode</assert>
    <assert test="$UBL-CR-422" flag="warning" id="UBL-CR-422">[UBL-CR-422]-A UBL invoice should not include the PaymentMeans CardAccount ChipApplicationID</assert>
    <assert test="$UBL-CR-424" flag="warning" id="UBL-CR-424">[UBL-CR-424]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount AliasName</assert>
    <assert test="$UBL-CR-425" flag="warning" id="UBL-CR-425">[UBL-CR-425]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount AccountTypeCode</assert>
    <assert test="$UBL-CR-426" flag="warning" id="UBL-CR-426">[UBL-CR-426]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount AccountFormatCode</assert>
    <assert test="$UBL-CR-427" flag="warning" id="UBL-CR-427">[UBL-CR-427]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount CurrencyCode</assert>
    <assert test="$UBL-CR-428" flag="warning" id="UBL-CR-428">[UBL-CR-428]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount PaymentNote</assert>
    <assert test="$UBL-CR-429" flag="warning" id="UBL-CR-429">[UBL-CR-429]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch Name</assert>
    <assert test="$UBL-CR-430" flag="warning" id="UBL-CR-430">[UBL-CR-430]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch FinancialInstitution Name</assert>
    <assert test="$UBL-CR-431" flag="warning" id="UBL-CR-431">[UBL-CR-431]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch FinancialInstitution Address</assert>
    <assert test="$UBL-CR-432" flag="warning" id="UBL-CR-432">[UBL-CR-432]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch Address</assert>
    <assert test="$UBL-CR-433" flag="warning" id="UBL-CR-433">[UBL-CR-433]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount Country</assert>
    <assert test="$UBL-CR-434" flag="warning" id="UBL-CR-434">[UBL-CR-434]-A UBL invoice should not include the PaymentMeans CreditAccount</assert>
    <assert test="$UBL-CR-435" flag="warning" id="UBL-CR-435">[UBL-CR-435]-A UBL invoice should not include the PaymentMeans PaymentMandate MandateTypeCode</assert>
    <assert test="$UBL-CR-436" flag="warning" id="UBL-CR-436">[UBL-CR-436]-A UBL invoice should not include the PaymentMeans PaymentMandate MaximumPaymentInstructionsNumeric</assert>
    <assert test="$UBL-CR-437" flag="warning" id="UBL-CR-437">[UBL-CR-437]-A UBL invoice should not include the PaymentMeans PaymentMandate MaximumPaidAmount</assert>
    <assert test="$UBL-CR-438" flag="warning" id="UBL-CR-438">[UBL-CR-438]-A UBL invoice should not include the PaymentMeans PaymentMandate SignatureID</assert>
    <assert test="$UBL-CR-439" flag="warning" id="UBL-CR-439">[UBL-CR-439]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerParty</assert>
    <assert test="$UBL-CR-440" flag="warning" id="UBL-CR-440">[UBL-CR-440]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount Name</assert>
    <assert test="$UBL-CR-441" flag="warning" id="UBL-CR-441">[UBL-CR-441]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AliasName</assert>
    <assert test="$UBL-CR-442" flag="warning" id="UBL-CR-442">[UBL-CR-442]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AccountTypeCode</assert>
    <assert test="$UBL-CR-443" flag="warning" id="UBL-CR-443">[UBL-CR-443]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AccountFormatCode</assert>
    <assert test="$UBL-CR-444" flag="warning" id="UBL-CR-444">[UBL-CR-444]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount CurrencyCode</assert>
    <assert test="$UBL-CR-445" flag="warning" id="UBL-CR-445">[UBL-CR-445]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount PaymentNote</assert>
    <assert test="$UBL-CR-446" flag="warning" id="UBL-CR-446">[UBL-CR-446]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount FinancialInstitutionBranch</assert>
    <assert test="$UBL-CR-447" flag="warning" id="UBL-CR-447">[UBL-CR-447]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount Country</assert>
    <assert test="$UBL-CR-448" flag="warning" id="UBL-CR-448">[UBL-CR-448]-A UBL invoice should not include the PaymentMeans PaymentMandate ValidityPeriod</assert>
    <assert test="$UBL-CR-449" flag="warning" id="UBL-CR-449">[UBL-CR-449]-A UBL invoice should not include the PaymentMeans PaymentMandate PaymentReversalPeriod</assert>
    <assert test="$UBL-CR-450" flag="warning" id="UBL-CR-450">[UBL-CR-450]-A UBL invoice should not include the PaymentMeans PaymentMandate Clause</assert>
    <assert test="$UBL-CR-451" flag="warning" id="UBL-CR-451">[UBL-CR-451]-A UBL invoice should not include the PaymentMeans TradeFinancing</assert>
    <assert test="$UBL-CR-452" flag="warning" id="UBL-CR-452">[UBL-CR-452]-A UBL invoice should not include the PaymentTerms ID</assert>
    <assert test="$UBL-CR-453" flag="warning" id="UBL-CR-453">[UBL-CR-453]-A UBL invoice should not include the PaymentTerms PaymentMeansID</assert>
    <assert test="$UBL-CR-454" flag="warning" id="UBL-CR-454">[UBL-CR-454]-A UBL invoice should not include the PaymentTerms PrepaidPaymentReferenceID</assert>
    <assert test="$UBL-CR-455" flag="warning" id="UBL-CR-455">[UBL-CR-455]-A UBL invoice should not include the PaymentTerms ReferenceEventCode</assert>
    <assert test="$UBL-CR-456" flag="warning" id="UBL-CR-456">[UBL-CR-456]-A UBL invoice should not include the PaymentTerms SettlementDiscountPercent</assert>
    <assert test="$UBL-CR-457" flag="warning" id="UBL-CR-457">[UBL-CR-457]-A UBL invoice should not include the PaymentTerms PenaltySurchargePercent</assert>
    <assert test="$UBL-CR-458" flag="warning" id="UBL-CR-458">[UBL-CR-458]-A UBL invoice should not include the PaymentTerms PaymentPercent</assert>
    <assert test="$UBL-CR-459" flag="warning" id="UBL-CR-459">[UBL-CR-459]-A UBL invoice should not include the PaymentTerms Amount</assert>
    <assert test="$UBL-CR-460" flag="warning" id="UBL-CR-460">[UBL-CR-460]-A UBL invoice should not include the PaymentTerms SettlementDiscountAmount</assert>
    <assert test="$UBL-CR-461" flag="warning" id="UBL-CR-461">[UBL-CR-461]-A UBL invoice should not include the PaymentTerms PenaltyAmount</assert>
    <assert test="$UBL-CR-462" flag="warning" id="UBL-CR-462">[UBL-CR-462]-A UBL invoice should not include the PaymentTerms PaymentTermsDetailsURI</assert>
    <assert test="$UBL-CR-463" flag="warning" id="UBL-CR-463">[UBL-CR-463]-A UBL invoice should not include the PaymentTerms PaymentDueDate</assert>
    <assert test="$UBL-CR-464" flag="warning" id="UBL-CR-464">[UBL-CR-464]-A UBL invoice should not include the PaymentTerms InstallmentDueDate</assert>
    <assert test="$UBL-CR-465" flag="warning" id="UBL-CR-465">[UBL-CR-465]-A UBL invoice should not include the PaymentTerms InvoicingPartyReference</assert>
    <assert test="$UBL-CR-466" flag="warning" id="UBL-CR-466">[UBL-CR-466]-A UBL invoice should not include the PaymentTerms SettlementPeriod</assert>
    <assert test="$UBL-CR-467" flag="warning" id="UBL-CR-467">[UBL-CR-467]-A UBL invoice should not include the PaymentTerms PenaltyPeriod</assert>
    <assert test="$UBL-CR-468" flag="warning" id="UBL-CR-468">[UBL-CR-468]-A UBL invoice should not include the PaymentTerms ExchangeRate</assert>
    <assert test="$UBL-CR-469" flag="warning" id="UBL-CR-469">[UBL-CR-469]-A UBL invoice should not include the PaymentTerms ValidityPeriod</assert>
    <assert test="$UBL-CR-470" flag="warning" id="UBL-CR-470">[UBL-CR-470]-A UBL invoice should not include the PrepaidPayment</assert>
    <assert test="$UBL-CR-471" flag="warning" id="UBL-CR-471">[UBL-CR-471]-A UBL invoice should not include the AllowanceCharge ID</assert>
    <assert test="$UBL-CR-472" flag="warning" id="UBL-CR-472">[UBL-CR-472]-A UBL invoice should not include the AllowanceCharge PrepaidIndicator</assert>
    <assert test="$UBL-CR-473" flag="warning" id="UBL-CR-473">[UBL-CR-473]-A UBL invoice should not include the AllowanceCharge SequenceNumeric</assert>
    <assert test="$UBL-CR-474" flag="warning" id="UBL-CR-474">[UBL-CR-474]-A UBL invoice should not include the AllowanceCharge AccountingCostCode</assert>
    <assert test="$UBL-CR-475" flag="warning" id="UBL-CR-475">[UBL-CR-475]-A UBL invoice should not include the AllowanceCharge AccountingCost</assert>
    <assert test="$UBL-CR-476" flag="warning" id="UBL-CR-476">[UBL-CR-476]-A UBL invoice should not include the AllowanceCharge PerUnitAmount</assert>
    <assert test="$UBL-CR-477" flag="warning" id="UBL-CR-477">[UBL-CR-477]-A UBL invoice should not include the AllowanceCharge TaxCategory Name</assert>
    <assert test="$UBL-CR-478" flag="warning" id="UBL-CR-478">[UBL-CR-478]-A UBL invoice should not include the AllowanceCharge TaxCategory BaseUnitMeasure</assert>
    <assert test="$UBL-CR-479" flag="warning" id="UBL-CR-479">[UBL-CR-479]-A UBL invoice should not include the AllowanceCharge TaxCategory PerUnitAmount</assert>
    <assert test="$UBL-CR-480" flag="warning" id="UBL-CR-480">[UBL-CR-480]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxExemptionReasonCode</assert>
    <assert test="$UBL-CR-481" flag="warning" id="UBL-CR-481">[UBL-CR-481]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxExemptionReason</assert>
    <assert test="$UBL-CR-482" flag="warning" id="UBL-CR-482">[UBL-CR-482]-A UBL invoice should not include the AllowanceCharge TaxCategory TierRange</assert>
    <assert test="$UBL-CR-483" flag="warning" id="UBL-CR-483">[UBL-CR-483]-A UBL invoice should not include the AllowanceCharge TaxCategory TierRatePercent</assert>
    <assert test="$UBL-CR-484" flag="warning" id="UBL-CR-484">[UBL-CR-484]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme Name</assert>
    <assert test="$UBL-CR-485" flag="warning" id="UBL-CR-485">[UBL-CR-485]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme TaxTypeCode</assert>
    <assert test="$UBL-CR-486" flag="warning" id="UBL-CR-486">[UBL-CR-486]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme CurrencyCode</assert>
    <assert test="$UBL-CR-487" flag="warning" id="UBL-CR-487">[UBL-CR-487]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme JurisdictionRegionAddress</assert>
    <assert test="$UBL-CR-488" flag="warning" id="UBL-CR-488">[UBL-CR-488]-A UBL invoice should not include the AllowanceCharge TaxTotal</assert>
    <assert test="$UBL-CR-489" flag="warning" id="UBL-CR-489">[UBL-CR-489]-A UBL invoice should not include the AllowanceCharge PaymentMeans</assert>
    <assert test="$UBL-CR-490" flag="warning" id="UBL-CR-490">[UBL-CR-490]-A UBL invoice should not include the TaxExchangeRate</assert>
    <assert test="$UBL-CR-491" flag="warning" id="UBL-CR-491">[UBL-CR-491]-A UBL invoice should not include the PricingExchangeRate</assert>
    <assert test="$UBL-CR-492" flag="warning" id="UBL-CR-492">[UBL-CR-492]-A UBL invoice should not include the PaymentExchangeRate</assert>
    <assert test="$UBL-CR-493" flag="warning" id="UBL-CR-493">[UBL-CR-493]-A UBL invoice should not include the PaymentAlternativeExchangeRate</assert>
    <assert test="$UBL-CR-494" flag="warning" id="UBL-CR-494">[UBL-CR-494]-A UBL invoice should not include the TaxTotal RoundingAmount</assert>
    <assert test="$UBL-CR-495" flag="warning" id="UBL-CR-495">[UBL-CR-495]-A UBL invoice should not include the TaxTotal TaxEvidenceIndicator</assert>
    <assert test="$UBL-CR-496" flag="warning" id="UBL-CR-496">[UBL-CR-496]-A UBL invoice should not include the TaxTotal TaxIncludedIndicator</assert>
    <assert test="$UBL-CR-497" flag="warning" id="UBL-CR-497">[UBL-CR-497]-A UBL invoice should not include the TaxTotal TaxSubtotal CalulationSequenceNumeric</assert>
    <assert test="$UBL-CR-498" flag="warning" id="UBL-CR-498">[UBL-CR-498]-A UBL invoice should not include the TaxTotal TaxSubtotal TransactionCurrencyTaxAmount</assert>
    <assert test="$UBL-CR-499" flag="warning" id="UBL-CR-499">[UBL-CR-499]-A UBL invoice should not include the TaxTotal TaxSubtotal Percent</assert>
    <assert test="$UBL-CR-500" flag="warning" id="UBL-CR-500">[UBL-CR-500]-A UBL invoice should not include the TaxTotal TaxSubtotal BaseUnitMeasure</assert>
    <assert test="$UBL-CR-501" flag="warning" id="UBL-CR-501">[UBL-CR-501]-A UBL invoice should not include the TaxTotal TaxSubtotal PerUnitAmount</assert>
    <assert test="$UBL-CR-502" flag="warning" id="UBL-CR-502">[UBL-CR-502]-A UBL invoice should not include the TaxTotal TaxSubtotal TierRange</assert>
    <assert test="$UBL-CR-503" flag="warning" id="UBL-CR-503">[UBL-CR-503]-A UBL invoice should not include the TaxTotal TaxSubtotal TierRatePercent</assert>
    <assert test="$UBL-CR-504" flag="warning" id="UBL-CR-504">[UBL-CR-504]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory Name</assert>
    <assert test="$UBL-CR-505" flag="warning" id="UBL-CR-505">[UBL-CR-505]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory BaseUnitMeasure</assert>
    <assert test="$UBL-CR-506" flag="warning" id="UBL-CR-506">[UBL-CR-506]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory PerUnitAmount</assert>
    <assert test="$UBL-CR-507" flag="warning" id="UBL-CR-507">[UBL-CR-507]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TierRange</assert>
    <assert test="$UBL-CR-508" flag="warning" id="UBL-CR-508">[UBL-CR-508]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TierRatePercent</assert>
    <assert test="$UBL-CR-509" flag="warning" id="UBL-CR-509">[UBL-CR-509]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme Name</assert>
    <assert test="$UBL-CR-510" flag="warning" id="UBL-CR-510">[UBL-CR-510]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme TaxTypeCode</assert>
    <assert test="$UBL-CR-511" flag="warning" id="UBL-CR-511">[UBL-CR-511]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme CurrencyCode</assert>
    <assert test="$UBL-CR-512" flag="warning" id="UBL-CR-512">[UBL-CR-512]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme JurisdictionRegionAddress</assert>
    <assert test="$UBL-CR-513" flag="warning" id="UBL-CR-513">[UBL-CR-513]-A UBL invoice should not include the WithholdingTaxTotal</assert>
    <assert test="$UBL-CR-514" flag="warning" id="UBL-CR-514">[UBL-CR-514]-A UBL invoice should not include the LegalMonetaryTotal PayableAlternativeAmount</assert>
    <assert test="$UBL-CR-515" flag="warning" id="UBL-CR-515">[UBL-CR-515]-A UBL invoice should not include the InvoiceLine UUID</assert>
    <assert test="$UBL-CR-516" flag="warning" id="UBL-CR-516">[UBL-CR-516]-A UBL invoice should not include the InvoiceLine TaxPointDate</assert>
    <assert test="$UBL-CR-517" flag="warning" id="UBL-CR-517">[UBL-CR-517]-A UBL invoice should not include the InvoiceLine AccountingCostCode</assert>
    <assert test="$UBL-CR-518" flag="warning" id="UBL-CR-518">[UBL-CR-518]-A UBL invoice should not include the InvoiceLine PaymentPurposeCode</assert>
    <assert test="$UBL-CR-519" flag="warning" id="UBL-CR-519">[UBL-CR-519]-A UBL invoice should not include the InvoiceLine FreeOfChargeIndicator</assert>
    <assert test="$UBL-CR-520" flag="warning" id="UBL-CR-520">[UBL-CR-520]-A UBL invoice should not include the InvoiceLine InvoicePeriod StartTime</assert>
    <assert test="$UBL-CR-521" flag="warning" id="UBL-CR-521">[UBL-CR-521]-A UBL invoice should not include the InvoiceLine InvoicePeriod EndTime</assert>
    <assert test="$UBL-CR-522" flag="warning" id="UBL-CR-522">[UBL-CR-522]-A UBL invoice should not include the InvoiceLine InvoicePeriod DurationMeasure</assert>
    <assert test="$UBL-CR-523" flag="warning" id="UBL-CR-523">[UBL-CR-523]-A UBL invoice should not include the InvoiceLine InvoicePeriod DescriptionCode</assert>
    <assert test="$UBL-CR-524" flag="warning" id="UBL-CR-524">[UBL-CR-524]-A UBL invoice should not include the InvoiceLine InvoicePeriod Description</assert>
    <assert test="$UBL-CR-525" flag="warning" id="UBL-CR-525">[UBL-CR-525]-A UBL invoice should not include the InvoiceLine OrderLineReference SalesOrderLineID</assert>
    <assert test="$UBL-CR-526" flag="warning" id="UBL-CR-526">[UBL-CR-526]-A UBL invoice should not include the InvoiceLine OrderLineReference UUID</assert>
    <assert test="$UBL-CR-527" flag="warning" id="UBL-CR-527">[UBL-CR-527]-A UBL invoice should not include the InvoiceLine OrderLineReference LineStatusCode</assert>
    <assert test="$UBL-CR-528" flag="warning" id="UBL-CR-528">[UBL-CR-528]-A UBL invoice should not include the InvoiceLine OrderLineReference OrderReference</assert>
    <assert test="$UBL-CR-529" flag="warning" id="UBL-CR-529">[UBL-CR-529]-A UBL invoice should not include the InvoiceLine DespatchLineReference</assert>
    <assert test="$UBL-CR-530" flag="warning" id="UBL-CR-530">[UBL-CR-530]-A UBL invoice should not include the InvoiceLine ReceiptLineReference</assert>
    <assert test="$UBL-CR-531" flag="warning" id="UBL-CR-531">[UBL-CR-531]-A UBL invoice should not include the InvoiceLine BillingReference</assert>
    <assert test="$UBL-CR-532" flag="warning" id="UBL-CR-532">[UBL-CR-532]-A UBL invoice should not include the InvoiceLine DocumentReference CopyIndicator</assert>
    <assert test="$UBL-CR-533" flag="warning" id="UBL-CR-533">[UBL-CR-533]-A UBL invoice should not include the InvoiceLine DocumentReference UUID</assert>
    <assert test="$UBL-CR-534" flag="warning" id="UBL-CR-534">[UBL-CR-534]-A UBL invoice should not include the InvoiceLine DocumentReference IssueDate</assert>
    <assert test="$UBL-CR-535" flag="warning" id="UBL-CR-535">[UBL-CR-535]-A UBL invoice should not include the InvoiceLine DocumentReference IssueTime</assert>
    <assert test="$UBL-CR-537" flag="warning" id="UBL-CR-537">[UBL-CR-537]-A UBL invoice should not include the InvoiceLine DocumentReference DocumentType</assert>
    <assert test="$UBL-CR-538" flag="warning" id="UBL-CR-538">[UBL-CR-538]-A UBL invoice should not include the InvoiceLine DocumentReference Xpath</assert>
    <assert test="$UBL-CR-539" flag="warning" id="UBL-CR-539">[UBL-CR-539]-A UBL invoice should not include the InvoiceLine DocumentReference LanguageID</assert>
    <assert test="$UBL-CR-540" flag="warning" id="UBL-CR-540">[UBL-CR-540]-A UBL invoice should not include the InvoiceLine DocumentReference LocaleCode</assert>
    <assert test="$UBL-CR-541" flag="warning" id="UBL-CR-541">[UBL-CR-541]-A UBL invoice should not include the InvoiceLine DocumentReference VersionID</assert>
    <assert test="$UBL-CR-542" flag="warning" id="UBL-CR-542">[UBL-CR-542]-A UBL invoice should not include the InvoiceLine DocumentReference DocumentStatusCode</assert>
    <assert test="$UBL-CR-543" flag="warning" id="UBL-CR-543">[UBL-CR-543]-A UBL invoice should not include the InvoiceLine DocumentReference DocumentDescription</assert>
    <assert test="$UBL-CR-544" flag="warning" id="UBL-CR-544">[UBL-CR-544]-A UBL invoice should not include the InvoiceLine DocumentReference Attachment</assert>
    <assert test="$UBL-CR-545" flag="warning" id="UBL-CR-545">[UBL-CR-545]-A UBL invoice should not include the InvoiceLine DocumentReference ValidityPeriod</assert>
    <assert test="$UBL-CR-546" flag="warning" id="UBL-CR-546">[UBL-CR-546]-A UBL invoice should not include the InvoiceLine DocumentReference IssuerParty</assert>
    <assert test="$UBL-CR-547" flag="warning" id="UBL-CR-547">[UBL-CR-547]-A UBL invoice should not include the InvoiceLine DocumentReference ResultOfVerification</assert>
    <assert test="$UBL-CR-548" flag="warning" id="UBL-CR-548">[UBL-CR-548]-A UBL invoice should not include the InvoiceLine PricingReference</assert>
    <assert test="$UBL-CR-549" flag="warning" id="UBL-CR-549">[UBL-CR-549]-A UBL invoice should not include the InvoiceLine OriginatorParty</assert>
    <assert test="$UBL-CR-550" flag="warning" id="UBL-CR-550">[UBL-CR-550]-A UBL invoice should not include the InvoiceLine Delivery</assert>
    <assert test="$UBL-CR-551" flag="warning" id="UBL-CR-551">[UBL-CR-551]-A UBL invoice should not include the InvoiceLine PaymentTerms</assert>
    <assert test="$UBL-CR-552" flag="warning" id="UBL-CR-552">[UBL-CR-552]-A UBL invoice should not include the InvoiceLine AllowanceCharge ID</assert>
    <assert test="$UBL-CR-553" flag="warning" id="UBL-CR-553">[UBL-CR-553]-A UBL invoice should not include the InvoiceLine AllowanceCharge PrepaidIndicator</assert>
    <assert test="$UBL-CR-554" flag="warning" id="UBL-CR-554">[UBL-CR-554]-A UBL invoice should not include the InvoiceLine AllowanceCharge SequenceNumeric</assert>
    <assert test="$UBL-CR-555" flag="warning" id="UBL-CR-555">[UBL-CR-555]-A UBL invoice should not include the InvoiceLine AllowanceCharge AccountingCostCode</assert>
    <assert test="$UBL-CR-556" flag="warning" id="UBL-CR-556">[UBL-CR-556]-A UBL invoice should not include the InvoiceLine AllowanceCharge AccountingCost</assert>
    <assert test="$UBL-CR-557" flag="warning" id="UBL-CR-557">[UBL-CR-557]-A UBL invoice should not include the InvoiceLine AllowanceCharge PerUnitAmount</assert>
    <assert test="$UBL-CR-558" flag="warning" id="UBL-CR-558">[UBL-CR-558]-A UBL invoice should not include the InvoiceLine AllowanceCharge TaxCategory</assert>
    <assert test="$UBL-CR-559" flag="warning" id="UBL-CR-559">[UBL-CR-559]-A UBL invoice should not include the InvoiceLine AllowanceCharge TaxTotal</assert>
    <assert test="$UBL-CR-560" flag="warning" id="UBL-CR-560">[UBL-CR-560]-A UBL invoice should not include the InvoiceLine AllowanceCharge PaymentMeans</assert>
    <assert test="$UBL-CR-561" flag="warning" id="UBL-CR-561">[UBL-CR-561]-A UBL invoice should not include the InvoiceLine TaxTotal</assert>
    <assert test="$UBL-CR-562" flag="warning" id="UBL-CR-562">[UBL-CR-562]-A UBL invoice should not include the InvoiceLine WithholdingTaxTotal</assert>
    <assert test="$UBL-CR-563" flag="warning" id="UBL-CR-563">[UBL-CR-563]-A UBL invoice should not include the InvoiceLine Item PackQuantity</assert>
    <assert test="$UBL-CR-564" flag="warning" id="UBL-CR-564">[UBL-CR-564]-A UBL invoice should not include the InvoiceLine Item PackSizeNumeric</assert>
    <assert test="$UBL-CR-565" flag="warning" id="UBL-CR-565">[UBL-CR-565]-A UBL invoice should not include the InvoiceLine Item CatalogueIndicator</assert>
    <assert test="$UBL-CR-566" flag="warning" id="UBL-CR-566">[UBL-CR-566]-A UBL invoice should not include the InvoiceLine Item HazardousRiskIndicator</assert>
    <assert test="$UBL-CR-567" flag="warning" id="UBL-CR-567">[UBL-CR-567]-A UBL invoice should not include the InvoiceLine Item AdditionalInformation</assert>
    <assert test="$UBL-CR-568" flag="warning" id="UBL-CR-568">[UBL-CR-568]-A UBL invoice should not include the InvoiceLine Item Keyword</assert>
    <assert test="$UBL-CR-569" flag="warning" id="UBL-CR-569">[UBL-CR-569]-A UBL invoice should not include the InvoiceLine Item BrandName</assert>
    <assert test="$UBL-CR-570" flag="warning" id="UBL-CR-570">[UBL-CR-570]-A UBL invoice should not include the InvoiceLine Item ModelName</assert>
    <assert test="$UBL-CR-571" flag="warning" id="UBL-CR-571">[UBL-CR-571]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification ExtendedID</assert>
    <assert test="$UBL-CR-572" flag="warning" id="UBL-CR-572">[UBL-CR-572]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification BarcodeSymbologyID</assert>
    <assert test="$UBL-CR-573" flag="warning" id="UBL-CR-573">[UBL-CR-573]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification PhysicalAttribute</assert>
    <assert test="$UBL-CR-574" flag="warning" id="UBL-CR-574">[UBL-CR-574]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification MeasurementDimension</assert>
    <assert test="$UBL-CR-575" flag="warning" id="UBL-CR-575">[UBL-CR-575]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification IssuerParty</assert>
    <assert test="$UBL-CR-576" flag="warning" id="UBL-CR-576">[UBL-CR-576]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification ExtendedID</assert>
    <assert test="$UBL-CR-577" flag="warning" id="UBL-CR-577">[UBL-CR-577]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification BarcodeSymbologyID</assert>
    <assert test="$UBL-CR-578" flag="warning" id="UBL-CR-578">[UBL-CR-578]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification PhysicalAttribute</assert>
    <assert test="$UBL-CR-579" flag="warning" id="UBL-CR-579">[UBL-CR-579]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification MeasurementDimension</assert>
    <assert test="$UBL-CR-580" flag="warning" id="UBL-CR-580">[UBL-CR-580]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification IssuerParty</assert>
    <assert test="$UBL-CR-581" flag="warning" id="UBL-CR-581">[UBL-CR-581]-A UBL invoice should not include the InvoiceLine Item ManufacturersItemIdentification</assert>
    <assert test="$UBL-CR-582" flag="warning" id="UBL-CR-582">[UBL-CR-582]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification ExtendedID</assert>
    <assert test="$UBL-CR-583" flag="warning" id="UBL-CR-583">[UBL-CR-583]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification BarcodeSymbologyID</assert>
    <assert test="$UBL-CR-584" flag="warning" id="UBL-CR-584">[UBL-CR-584]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification PhysicalAttribute</assert>
    <assert test="$UBL-CR-585" flag="warning" id="UBL-CR-585">[UBL-CR-585]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification MeasurementDimension</assert>
    <assert test="$UBL-CR-586" flag="warning" id="UBL-CR-586">[UBL-CR-586]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification IssuerParty</assert>
    <assert test="$UBL-CR-587" flag="warning" id="UBL-CR-587">[UBL-CR-587]-A UBL invoice should not include the InvoiceLine Item CatalogueItemIdentification</assert>
    <assert test="$UBL-CR-588" flag="warning" id="UBL-CR-588">[UBL-CR-588]-A UBL invoice should not include the InvoiceLine Item AdditionalItemIdentification</assert>
    <assert test="$UBL-CR-589" flag="warning" id="UBL-CR-589">[UBL-CR-589]-A UBL invoice should not include the InvoiceLine Item CatalogueDocumentReference</assert>
    <assert test="$UBL-CR-590" flag="warning" id="UBL-CR-590">[UBL-CR-590]-A UBL invoice should not include the InvoiceLine Item ItemSpecificationDocumentReference</assert>
    <assert test="$UBL-CR-591" flag="warning" id="UBL-CR-591">[UBL-CR-591]-A UBL invoice should not include the InvoiceLine Item OriginCountry Name</assert>
    <assert test="$UBL-CR-592" flag="warning" id="UBL-CR-592">[UBL-CR-592]-A UBL invoice should not include the InvoiceLine Item CommodityClassification NatureCode</assert>
    <assert test="$UBL-CR-593" flag="warning" id="UBL-CR-593">[UBL-CR-593]-A UBL invoice should not include the InvoiceLine Item CommodityClassification CargoTypeCode</assert>
    <assert test="$UBL-CR-594" flag="warning" id="UBL-CR-594">[UBL-CR-594]-A UBL invoice should not include the InvoiceLine Item CommodityClassification CommodityCode</assert>
    <assert test="$UBL-CR-595" flag="warning" id="UBL-CR-595">[UBL-CR-595]-A UBL invoice should not include the InvoiceLine Item TransactionConditions</assert>
    <assert test="$UBL-CR-596" flag="warning" id="UBL-CR-596">[UBL-CR-596]-A UBL invoice should not include the InvoiceLine Item HazardousItem</assert>
    <assert test="$UBL-CR-597" flag="warning" id="UBL-CR-597">[UBL-CR-597]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory Name</assert>
    <assert test="$UBL-CR-598" flag="warning" id="UBL-CR-598">[UBL-CR-598]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory BaseUnitMeasure</assert>
    <assert test="$UBL-CR-599" flag="warning" id="UBL-CR-599">[UBL-CR-599]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory PerUnitAmount</assert>
    <assert test="$UBL-CR-600" flag="warning" id="UBL-CR-600">[UBL-CR-600]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxExemptionReasonCode</assert>
    <assert test="$UBL-CR-601" flag="warning" id="UBL-CR-601">[UBL-CR-601]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxExemptionReason</assert>
    <assert test="$UBL-CR-602" flag="warning" id="UBL-CR-602">[UBL-CR-602]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TierRange</assert>
    <assert test="$UBL-CR-603" flag="warning" id="UBL-CR-603">[UBL-CR-603]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TierRatePercent</assert>
    <assert test="$UBL-CR-604" flag="warning" id="UBL-CR-604">[UBL-CR-604]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme Name</assert>
    <assert test="$UBL-CR-605" flag="warning" id="UBL-CR-605">[UBL-CR-605]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme TaxTypeCode</assert>
    <assert test="$UBL-CR-606" flag="warning" id="UBL-CR-606">[UBL-CR-606]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme CurrencyCode</assert>
    <assert test="$UBL-CR-607" flag="warning" id="UBL-CR-607">[UBL-CR-607]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme JurisdictionRegionAddress</assert>
    <assert test="$UBL-CR-608" flag="warning" id="UBL-CR-608">[UBL-CR-608]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ID</assert>
    <assert test="$UBL-CR-609" flag="warning" id="UBL-CR-609">[UBL-CR-609]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty NameCode</assert>
    <assert test="$UBL-CR-610" flag="warning" id="UBL-CR-610">[UBL-CR-610]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty TestMethod</assert>
    <assert test="$UBL-CR-611" flag="warning" id="UBL-CR-611">[UBL-CR-611]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ValueQuantity</assert>
    <assert test="$UBL-CR-612" flag="warning" id="UBL-CR-612">[UBL-CR-612]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ValueQualifier</assert>
    <assert test="$UBL-CR-613" flag="warning" id="UBL-CR-613">[UBL-CR-613]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ImportanceCode</assert>
    <assert test="$UBL-CR-614" flag="warning" id="UBL-CR-614">[UBL-CR-614]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ListValue</assert>
    <assert test="$UBL-CR-615" flag="warning" id="UBL-CR-615">[UBL-CR-615]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty UsabilityPeriod</assert>
    <assert test="$UBL-CR-616" flag="warning" id="UBL-CR-616">[UBL-CR-616]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ItemPropertyGroup</assert>
    <assert test="$UBL-CR-617" flag="warning" id="UBL-CR-617">[UBL-CR-617]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty RangeDimension</assert>
    <assert test="$UBL-CR-618" flag="warning" id="UBL-CR-618">[UBL-CR-618]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ItemPropertyRange</assert>
    <assert test="$UBL-CR-619" flag="warning" id="UBL-CR-619">[UBL-CR-619]-A UBL invoice should not include the InvoiceLine Item ManufacturerParty</assert>
    <assert test="$UBL-CR-620" flag="warning" id="UBL-CR-620">[UBL-CR-620]-A UBL invoice should not include the InvoiceLine Item InformationContentProviderParty</assert>
    <assert test="$UBL-CR-621" flag="warning" id="UBL-CR-621">[UBL-CR-621]-A UBL invoice should not include the InvoiceLine Item OriginAddress</assert>
    <assert test="$UBL-CR-622" flag="warning" id="UBL-CR-622">[UBL-CR-622]-A UBL invoice should not include the InvoiceLine Item ItemInstance</assert>
    <assert test="$UBL-CR-623" flag="warning" id="UBL-CR-623">[UBL-CR-623]-A UBL invoice should not include the InvoiceLine Item Certificate</assert>
    <assert test="$UBL-CR-624" flag="warning" id="UBL-CR-624">[UBL-CR-624]-A UBL invoice should not include the InvoiceLine Item Dimension</assert>
    <assert test="$UBL-CR-625" flag="warning" id="UBL-CR-625">[UBL-CR-625]-A UBL invoice should not include the InvoiceLine Item Price PriceChangeReason</assert>
    <assert test="$UBL-CR-626" flag="warning" id="UBL-CR-626">[UBL-CR-626]-A UBL invoice should not include the InvoiceLine Item Price PriceTypeCode</assert>
    <assert test="$UBL-CR-627" flag="warning" id="UBL-CR-627">[UBL-CR-627]-A UBL invoice should not include the InvoiceLine Item Price PriceType</assert>
    <assert test="$UBL-CR-628" flag="warning" id="UBL-CR-628">[UBL-CR-628]-A UBL invoice should not include the InvoiceLine Item Price OrderableUnitFactorRate</assert>
    <assert test="$UBL-CR-629" flag="warning" id="UBL-CR-629">[UBL-CR-629]-A UBL invoice should not include the InvoiceLine Item Price ValidityPeriod</assert>
    <assert test="$UBL-CR-630" flag="warning" id="UBL-CR-630">[UBL-CR-630]-A UBL invoice should not include the InvoiceLine Item Price PriceList</assert>
    <assert test="$UBL-CR-631" flag="warning" id="UBL-CR-631">[UBL-CR-631]-A UBL invoice should not include the InvoiceLine Item Price OrderableUnitFactorRate</assert>
    <assert test="$UBL-CR-632" flag="warning" id="UBL-CR-632">[UBL-CR-632]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge ID</assert>
    <assert test="$UBL-CR-633" flag="warning" id="UBL-CR-633">[UBL-CR-633]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AllowanceChargeReasonCode</assert>
    <assert test="$UBL-CR-634" flag="warning" id="UBL-CR-634">[UBL-CR-634]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AllowanceChargeReason</assert>
    <assert test="$UBL-CR-635" flag="warning" id="UBL-CR-635">[UBL-CR-635]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge MultiplierFactorNumeric</assert>
    <assert test="$UBL-CR-636" flag="warning" id="UBL-CR-636">[UBL-CR-636]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge PrepaidIndicator</assert>
    <assert test="$UBL-CR-637" flag="warning" id="UBL-CR-637">[UBL-CR-637]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge SequenceNumeric</assert>
    <assert test="$UBL-CR-638" flag="warning" id="UBL-CR-638">[UBL-CR-638]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AccountingCostCode</assert>
    <assert test="$UBL-CR-639" flag="warning" id="UBL-CR-639">[UBL-CR-639]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AccountingCost</assert>
    <assert test="$UBL-CR-640" flag="warning" id="UBL-CR-640">[UBL-CR-640]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge PerUnitAmount</assert>
    <assert test="$UBL-CR-641" flag="warning" id="UBL-CR-641">[UBL-CR-641]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge TaxCategory</assert>
    <assert test="$UBL-CR-642" flag="warning" id="UBL-CR-642">[UBL-CR-642]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge TaxTotal</assert>
    <assert test="$UBL-CR-643" flag="warning" id="UBL-CR-643">[UBL-CR-643]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge PaymentMeans</assert>
    <assert test="$UBL-CR-644" flag="warning" id="UBL-CR-644">[UBL-CR-644]-A UBL invoice should not include the InvoiceLine Item Price PricingExchangeRate</assert>
    <assert test="$UBL-CR-645" flag="warning" id="UBL-CR-645">[UBL-CR-645]-A UBL invoice should not include the InvoiceLine DeliveryTerms</assert>
    <assert test="$UBL-CR-646" flag="warning" id="UBL-CR-646">[UBL-CR-646]-A UBL invoice should not include the InvoiceLine SubInvoiceLine</assert>
    <assert test="$UBL-CR-647" flag="warning" id="UBL-CR-647">[UBL-CR-647]-A UBL invoice should not include the InvoiceLine ItemPriceExtension</assert>
    <assert test="$UBL-CR-648" flag="warning" id="UBL-CR-648">[UBL-CR-648]-A UBL invoice should not include the CustomizationID scheme identifier</assert>
    <assert test="$UBL-CR-649" flag="warning" id="UBL-CR-649">[UBL-CR-649]-A UBL invoice should not include the ProfileID scheme identifier</assert>
    <assert test="$UBL-CR-650" flag="warning" id="UBL-CR-650">[UBL-CR-650]-A UBL invoice shall not include the Invoice ID scheme identifier</assert>
    <assert test="$UBL-CR-651" flag="warning" id="UBL-CR-651">[UBL-CR-651]-A UBL invoice should not include the SalesOrderID scheme identifier</assert>
    <assert test="$UBL-CR-652" flag="warning" id="UBL-CR-652">[UBL-CR-652]-A UBL invoice should not include the PartyTaxScheme CompanyID scheme identifier</assert>
    <assert test="$UBL-CR-653" flag="warning" id="UBL-CR-653">[UBL-CR-653]-A UBL invoice should not include the PaymentID scheme identifier</assert>
    <assert test="$UBL-CR-654" flag="warning" id="UBL-CR-654">[UBL-CR-654]-A UBL invoice should not include the PayeeFinancialAccount scheme identifier</assert>
    <assert test="$UBL-CR-655" flag="warning" id="UBL-CR-655">[UBL-CR-655]-A UBL invoice shall not include the FinancialInstitutionBranch ID scheme identifier</assert>
    <assert test="$UBL-CR-656" flag="warning" id="UBL-CR-656">[UBL-CR-656]-A UBL invoice should not include the InvoiceTypeCode listID</assert>
    <assert test="$UBL-CR-657" flag="warning" id="UBL-CR-657">[UBL-CR-657]-A UBL invoice should not include the DocumentCurrencyCode listID</assert>
    <assert test="$UBL-CR-658" flag="warning" id="UBL-CR-658">[UBL-CR-658]-A UBL invoice should not include the TaxCurrencyCode listID</assert>
    <assert test="$UBL-CR-659" flag="warning" id="UBL-CR-659">[UBL-CR-659]-A UBL invoice shall not include the AdditionalDocumentReference DocumentTypeCode listID</assert>
    <assert test="$UBL-CR-660" flag="warning" id="UBL-CR-660">[UBL-CR-660]-A UBL invoice should not include the Country Identification code listID</assert>
    <assert test="$UBL-CR-661" flag="warning" id="UBL-CR-661">[UBL-CR-661]-A UBL invoice should not include the PaymentMeansCode listID</assert>
    <assert test="$UBL-CR-662" flag="warning" id="UBL-CR-662">[UBL-CR-662]-A UBL invoice should not include the AllowanceChargeReasonCode listID</assert>
    <assert test="$UBL-CR-663" flag="warning" id="UBL-CR-663">[UBL-CR-663]-A UBL invoice should not include the unitCodeListID</assert>
    <assert test="$UBL-CR-664" flag="warning" id="UBL-CR-664">[UBL-CR-664]-A UBL invoice should not include the FinancialInstitutionBranch FinancialInstitution</assert>
    <assert test="$UBL-CR-665" flag="warning" id="UBL-CR-665">[UBL-CR-665]-A UBL invoice should not include the AdditionalDocumentReference ID schemeID unless the DocumentTypeCode equals '130'</assert>
    <assert test="$UBL-CR-666" flag="fatal" id="UBL-CR-666">[UBL-CR-666]-A UBL invoice shall not include an AdditionalDocumentReference simultaneously referring an Invoice Object Identifier and an Attachment</assert>
    <assert test="$UBL-CR-667" flag="warning" id="UBL-CR-667">[UBL-CR-667]-A UBL invoice should not include a Buyer Item Identification schemeID</assert>
    <assert test="$UBL-CR-668" flag="warning" id="UBL-CR-668">[UBL-CR-668]-A UBL invoice should not include a Sellers Item Identification schemeID</assert>
    <assert test="$UBL-CR-669" flag="warning" id="UBL-CR-669">[UBL-CR-669]-A UBL invoice should not include a Price Allowance Reason Code</assert>
    <assert test="$UBL-CR-670" flag="warning" id="UBL-CR-670">[UBL-CR-670]-A UBL invoice should not include a Price Allowance Reason</assert>
    <assert test="$UBL-CR-671" flag="warning" id="UBL-CR-671">[UBL-CR-671]-A UBL invoice should not include a Price Allowance Multiplier Factor</assert>
    <assert test="$UBL-CR-672" flag="warning" id="UBL-CR-672">[UBL-CR-672]-A UBL credit note should not include the CreditNoteTypeCode listID</assert>
    <assert test="$UBL-CR-673" flag="fatal" id="UBL-CR-673">[UBL-CR-673]-A UBL invoice shall not include an AdditionalDocumentReference simultaneously referring an Invoice Object Identifier and an Document Description</assert>
    <assert test="$UBL-CR-674" flag="warning" id="UBL-CR-674">[UBL-CR-674]-A UBL invoice should not include the PrimaryAccountNumber schemeID</assert>
    <assert test="$UBL-CR-675" flag="warning" id="UBL-CR-675">[UBL-CR-675]-A UBL invoice should not include the NetworkID schemeID</assert>
    <assert test="$UBL-CR-676" flag="warning" id="UBL-CR-676">[UBL-CR-676]-A UBL invoice should not include the PaymentMandate/ID schemeID</assert>
    <assert test="$UBL-CR-677" flag="warning" id="UBL-CR-677">[UBL-CR-677]-A UBL invoice should not include the PayerFinancialAccount/ID schemeID</assert>
    <assert test="$UBL-CR-678" flag="warning" id="UBL-CR-678">[UBL-CR-678]-A UBL invoice should not include the TaxCategory/ID schemeID</assert>
    <assert test="$UBL-CR-679" flag="warning" id="UBL-CR-679">[UBL-CR-679]-A UBL invoice should not include the ClassifiedTaxCategory/ID schemeID</assert>
    <assert test="$UBL-CR-680" flag="warning" id="UBL-CR-680">[UBL-CR-680]-A UBL invoice should not include the PaymentMeans/PayerFinancialAccount</assert>
    <assert test="$UBL-CR-681" flag="warning" id="UBL-CR-681">[UBL-CR-681]-A UBL invoice should not include the PaymentMeans InstructionNote</assert>
    <assert test="$UBL-CR-682" flag="warning" id="UBL-CR-682">[UBL-CR-682]-A UBL invoice should not include the Delivery DeliveryAddress</assert>
    
    <assert test="$UBL-DT-08" flag="warning" id="UBL-DT-08">[UBL-DT-08]-Scheme name attribute should not be present</assert>
    <assert test="$UBL-DT-09" flag="warning" id="UBL-DT-09">[UBL-DT-09]-Scheme agency name attribute should not be present</assert>
    <assert test="$UBL-DT-10" flag="warning" id="UBL-DT-10">[UBL-DT-10]-Scheme data uri attribute should not be present</assert>
    <assert test="$UBL-DT-11" flag="warning" id="UBL-DT-11">[UBL-DT-11]-Scheme uri attribute should not be present</assert>
    <assert test="$UBL-DT-12" flag="warning" id="UBL-DT-12">[UBL-DT-12]-Format attribute should not be present</assert>
    <assert test="$UBL-DT-13" flag="warning" id="UBL-DT-13">[UBL-DT-13]-Unit code list identifier attribute should not be present</assert>
    <assert test="$UBL-DT-14" flag="warning" id="UBL-DT-14">[UBL-DT-14]-Unit code list agency identifier attribute should not be present</assert>
    <assert test="$UBL-DT-15" flag="warning" id="UBL-DT-15">[UBL-DT-15]-Unit code list agency name attribute should not be present</assert>
    <assert test="$UBL-DT-16" flag="warning" id="UBL-DT-16">[UBL-DT-16]-List agency name attribute should not be present</assert>
    <assert test="$UBL-DT-17" flag="warning" id="UBL-DT-17">[UBL-DT-17]-List name attribute should not be present</assert>
    <assert test="$UBL-DT-18" flag="warning" id="UBL-DT-18">[UBL-DT-18]-Name attribute should not be present</assert>
    <assert test="$UBL-DT-19" flag="warning" id="UBL-DT-19">[UBL-DT-19]-Language identifier attribute should not be present</assert>
    <assert test="$UBL-DT-20" flag="warning" id="UBL-DT-20">[UBL-DT-20]-List uri attribute should not be present</assert>
    <assert test="$UBL-DT-21" flag="warning" id="UBL-DT-21">[UBL-DT-21]-List scheme uri attribute should not be present</assert>
    <assert test="$UBL-DT-22" flag="warning" id="UBL-DT-22">[UBL-DT-22]-Language local identifier attribute should not be present</assert>
    <assert test="$UBL-DT-23" flag="warning" id="UBL-DT-23">[UBL-DT-23]-Uri attribute should not be present</assert>
    <assert test="$UBL-DT-24" flag="warning" id="UBL-DT-24">[UBL-DT-24]-Currency code list version id should not be present</assert>
    <assert test="$UBL-DT-25" flag="warning" id="UBL-DT-25">[UBL-DT-25]-CharacterSetCode attribute should not be present</assert>
    <assert test="$UBL-DT-26" flag="warning" id="UBL-DT-26">[UBL-DT-26]-EncodingCode attribute should not be present</assert>
    <assert test="$UBL-DT-27" flag="warning" id="UBL-DT-27">[UBL-DT-27]-Scheme Agency ID attribute should not be present</assert>
    <assert test="$UBL-DT-28" flag="warning" id="UBL-DT-28">[UBL-DT-28]-List Agency ID attribute should not be present</assert>
    <assert test="$UBL-SR-01" flag="fatal" id="UBL-SR-01">[UBL-SR-01]-Contract identifier shall occur maximum once.</assert>
    <assert test="$UBL-SR-02" flag="fatal" id="UBL-SR-02">[UBL-SR-02]-Receive advice identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-03" flag="fatal" id="UBL-SR-03">[UBL-SR-03]-Despatch advice identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-04" flag="fatal" id="UBL-SR-04">[UBL-SR-04]-Invoice object identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-05" flag="fatal" id="UBL-SR-05">[UBL-SR-05]-Payment terms shall occur maximum once</assert>
    <assert test="$UBL-SR-08" flag="fatal" id="UBL-SR-08">[UBL-SR-08]-Invoice period shall occur maximum once</assert>
    <assert test="$UBL-SR-09" flag="fatal" id="UBL-SR-09">[UBL-SR-09]-Seller name shall occur maximum once</assert>
    <assert test="$UBL-SR-10" flag="fatal" id="UBL-SR-10">[UBL-SR-10]-Seller trader name shall occur maximum once</assert>
    <assert test="$UBL-SR-11" flag="fatal" id="UBL-SR-11">[UBL-SR-11]-Seller legal registration identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-12" flag="fatal" id="UBL-SR-12">[UBL-SR-12]-Seller VAT identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-13" flag="fatal" id="UBL-SR-13">[UBL-SR-13]-Seller tax registration shall occur maximum once</assert>
    <assert test="$UBL-SR-14" flag="fatal" id="UBL-SR-14">[UBL-SR-14]-Seller additional legal information shall occur maximum once</assert>
    <assert test="$UBL-SR-15" flag="fatal" id="UBL-SR-15">[UBL-SR-15]-Buyer name shall occur maximum once</assert>
    <assert test="$UBL-SR-16" flag="fatal" id="UBL-SR-16">[UBL-SR-16]-Buyer identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-17" flag="fatal" id="UBL-SR-17">[UBL-SR-17]-Buyer legal registration identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-18" flag="fatal" id="UBL-SR-18">[UBL-SR-18]-Buyer VAT identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-24" flag="fatal" id="UBL-SR-24">[UBL-SR-24]-Deliver to information shall occur maximum once</assert>
    <assert test="$UBL-SR-29" flag="fatal" id="UBL-SR-29">[UBL-SR-29]-Bank creditor reference shall occur maximum once</assert>
    <assert test="$UBL-SR-39" flag="fatal" id="UBL-SR-39">[UBL-SR-39]-Project reference shall occur maximum once.</assert>
    <assert test="$UBL-SR-40" flag="fatal" id="UBL-SR-40">[UBL-SR-40]-Buyer trade name shall occur maximum once</assert>
    <assert test="$UBL-SR-44" flag="fatal" id="UBL-SR-44">[UBL-SR-44]-An Invoice may only have one unique PaymentID, but the PaymentID may be used for multiple PaymentMeans</assert>
    <assert test="$UBL-SR-45" flag="fatal" id="UBL-SR-45">[UBL-SR-45]-Due Date shall occur maximum once</assert>    
    <assert test="$UBL-SR-46" flag="fatal" id="UBL-SR-46">[UBL-SR-46]-Payment means text shall occur maximum once</assert>
    <assert test="$UBL-SR-47" flag="fatal" id="UBL-SR-47">[UBL-SR-47]-When there are more than one payment means code, they shall be equal</assert>
    <assert test="$UBL-SR-49" flag="fatal" id="UBL-SR-49">[UBL-SR-49]-Value tax point date shall occur maximum once</assert>
  </rule>
  <rule context="$Invoice_line">
    <assert test="$UBL-SR-34" flag="fatal" id="UBL-SR-34">[UBL-SR-34]-Invoice line note shall occur maximum once</assert>
    <assert test="$UBL-SR-35" flag="fatal" id="UBL-SR-35">[UBL-SR-35]-Referenced purchase order line identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-36" flag="fatal" id="UBL-SR-36">[UBL-SR-36]-Invoice line period shall occur maximum once</assert>
    <assert test="$UBL-SR-37" flag="fatal" id="UBL-SR-37">[UBL-SR-37]-Item price discount shall occur maximum once</assert>
    <assert test="$UBL-SR-48" flag="fatal" id="UBL-SR-48">[UBL-SR-48]-Invoice lines shall have one and only one classified tax category.</assert>
    <assert test="$UBL-SR-50" flag="fatal" id="UBL-SR-50">[UBL-SR-50]-Item description shall occur maximum once</assert>
    <assert test="$UBL-SR-52" flag="fatal" id="UBL-SR-52">[UBL-SR-52]-Document reference shall occur maximum once</assert>
  </rule>
  <rule context="$Payee">
    <assert test="$UBL-SR-19" flag="fatal" id="UBL-SR-19">[UBL-SR-19]-Payee name shall occur maximum once, if the Payee is different from the Seller</assert>
    <assert test="$UBL-SR-20" flag="fatal" id="UBL-SR-20">[UBL-SR-20]-Payee identifier shall occur maximum once, if the Payee is different from the Seller</assert>
    <assert test="$UBL-SR-21" flag="fatal" id="UBL-SR-21">[UBL-SR-21]-Payee legal registration identifier shall occur maximum once, if the Payee is different from the Seller</assert>
  </rule>
  <rule context="$Payment_instructions">
    <assert test="$UBL-SR-26" flag="fatal" id="UBL-SR-26">[UBL-SR-26]-Payment reference shall occur maximum once</assert>
    <assert test="$UBL-SR-27" flag="fatal" id="UBL-SR-27">[UBL-SR-27]-Payment means text shall occur maximum once</assert>
    <assert test="$UBL-SR-28" flag="fatal" id="UBL-SR-28">[UBL-SR-28]-Mandate reference identifier shall occur maximum once</assert>
  </rule>
  <rule context="$Preceding_Invoice">
    <assert test="$UBL-SR-06" flag="fatal" id="UBL-SR-06">[UBL-SR-06]-Preceding invoice reference shall occur maximum once</assert>
    <assert test="$UBL-SR-07" flag="fatal" id="UBL-SR-07">[UBL-SR-07]-If there is a preceding invoice reference, the preceding invoice number shall be present</assert>
  </rule>
  <rule context="$Tax_Representative">
    <assert test="$UBL-SR-22" flag="fatal" id="UBL-SR-22">[UBL-SR-22]-Seller tax representative name shall occur maximum once, if the Seller has a tax representative</assert>
    <assert test="$UBL-SR-23" flag="fatal" id="UBL-SR-23">[UBL-SR-23]-Seller tax representative VAT identifier shall occur maximum once, if the Seller has a tax representative</assert>
  </rule>
  <rule context="$Tax_subtotal">
    <assert test="$UBL-SR-32" flag="fatal" id="UBL-SR-32">[UBL-SR-32]-VAT exemption reason text shall occur maximum once</assert>
  </rule>
</pattern>
