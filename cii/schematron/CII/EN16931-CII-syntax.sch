<?xml version="1.0" encoding="ISO-8859-1"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="EN16931-CII" id="EN16931-CII-Syntax">
    <!-- Invoice -->
    <param name="CII-SR-001" value="not(ram:SpecifiedTransactionID)"/>
    <param name="CII-SR-002" value="not(ram:TestIndicator)"/>
    <param name="CII-SR-003" value="(count(ram:BusinessProcessSpecifiedDocumentContextParameter) &lt;= 1)"/>
    <param name="CII-SR-004" value="not(ram:Value)"/>
    <param name="CII-SR-007" value="not(ram:ScenarioSpecifiedDocumentContextParameter)"/>
    <param name="CII-SR-008" value="not(ram:ApplicationSpecifiedDocumentContextParameter)"/>
    <param name="CII-SR-009" value="count(ram:GuidelineSpecifiedDocumentContextParameter) = 1"/>
    <param name="CII-SR-010" value="count(ram:GuidelineSpecifiedDocumentContextParameter/ram:ID) = 1"/>
    <param name="CII-SR-011" value="not(ram:SubsetSpecifiedDocumentContextParameter)"/>
    <param name="CII-SR-012" value="not(ram:MessageStandardSpecifiedDocumentContextParameter)"/>
    <param name="CII-SR-013" value="not(ram:Name)"/>
    <param name="CII-SR-014" value="count(ram:TypeCode) = 1"/>
    <param name="CII-SR-015" value="not(ram:IssueDateTime/udt:DateTime)"/>
    <param name="CII-SR-016" value="not(ram:CopyIndicator)"/>
    <param name="CII-SR-017" value="not(ram:Purpose)"/>
    <param name="CII-SR-018" value="not(ram:ControlRequirementIndicator)"/>
    <param name="CII-SR-019" value="count(ram:LanguageID) &lt;= 1"/>
    <param name="CII-SR-020" value="not(ram:PurposeCode)"/>
    <param name="CII-SR-021" value="not(ram:RevisionDateTime)"/>
    <param name="CII-SR-022" value="not(ram:VersionID)"/>
    <param name="CII-SR-023" value="not(ram:GlobalID)"/>
    <param name="CII-SR-024" value="not(ram:RevisionID)"/>
    <param name="CII-SR-025" value="not(ram:PreviousRevisionID)"/>
    <param name="CII-SR-026" value="not(ram:CategoryCode)"/>
    <param name="CII-SR-027" value="not(ram:IncludedNote/ram:Subject)"/>
    <param name="CII-SR-028" value="not(ram:IncludedNote/ram:ContentCode)"/>
    <param name="CII-SR-029" value="count(ram:IncludedNote) &lt;= 1"/>
    <param name="CII-SR-030" value="count(ram:IncludedNote/ram:Content) &lt;= 1"/>
    <param name="CII-SR-031" value="not(ram:IncludedNote/ram:SubjectCode)"/>
    <param name="CII-SR-032" value="not(ram:IncludedNote/ram:ID)"/>
    <param name="CII-SR-033" value="not(ram:EffectiveSpecifiedPeriod)"/>
    <param name="CII-SR-034" value="not(ram:IssuerTradeParty)"/>
    <!-- Document context -->
    <param name="CII-SR-005" value="not(ram:SpecifiedDocumentVersion)"/>
    <param name="CII-SR-006" value="not(ram:BIMSpecifiedDocumentContextParameter)"/>
    <!-- Invoice line -->
    <param name="CII-SR-035" value="not(ram:DescriptionCode)"/>
    <param name="CII-SR-036" value="not(ram:ParentLineID)"/>
    <param name="CII-SR-037" value="not(ram:LineStatusCode)"/>
    <param name="CII-SR-038" value="not(ram:LineStatusReasonCode)"/>
    <param name="CII-SR-039" value="count(ram:IncludedNote) &lt;= 1"/>
    <param name="CII-SR-040" value="count(ram:IncludedNote/ram:Content) &lt;= 1"/>
    <param name="CII-SR-041" value="not(ram:IncludedNote/ram:SubjectCode)"/>
    <param name="CII-SR-042" value="not(ram:IncludedNote/ram:ID)"/>
    <param name="CII-SR-043" value="not(ram:IncludedNote/ram:Subject)"/>
    <param name="CII-SR-044" value="not(ram:IncludedNote/ram:ContentCode)"/>
    <!-- Product information -->
    <param name="CII-SR-045" value="not(ram:ID)"/>
    <param name="CII-SR-046" value="not(ram:GlobalID) or (ram:GlobalID/@schemeID)"/>
    <param name="CII-SR-047" value="not(ram:BuyerAssignedID)"/>
    <param name="CII-SR-048" value="not(ram:ManufacturerAssignedID)"/>
    <param name="CII-SR-049" value="not(ram:TradeName)"/>
    <param name="CII-SR-050" value="not(ram:TypeCode)"/>
    <param name="CII-SR-051" value="not(ram:NetWeightMeasure)"/>
    <param name="CII-SR-052" value="not(ram:GrossWeightMeasure)"/>
    <param name="CII-SR-053" value="not(ram:ProductGroupID)"/>
    <param name="CII-SR-054" value="not(ram:EndItemTypeCode)"/>
    <param name="CII-SR-055" value="not(ram:EndItemName)"/>
    <param name="CII-SR-056" value="not(ram:AreaDensityMeasure)"/>
    <param name="CII-SR-057" value="not(ram:UseDescription)"/>
    <param name="CII-SR-058" value="not(ram:BrandName)"/>
    <param name="CII-SR-059" value="not(ram:SubBrandName)"/>
    <param name="CII-SR-060" value="not(ram:DrainedNetWeightMeasure)"/>
    <param name="CII-SR-061" value="not(ram:VariableMeasureIndicator)"/>
    <param name="CII-SR-062" value="not(ram:ColourCode)"/>
    <param name="CII-SR-063" value="not(ram:ColourDescription)"/>
    <param name="CII-SR-064" value="not(ram:Designation)"/>
    <param name="CII-SR-065" value="not(ram:FormattedCancellationAnnouncedLaunchDateTime)"/>
    <param name="CII-SR-066" value="not(ram:FormattedLatestProductDataChangeDateTime)"/>
    <param name="CII-SR-067" value="not(ram:ApplicableProductCharacteristic/ram:ID)"/>
    <param name="CII-SR-068" value="not(ram:ApplicableProductCharacteristic/ram:TypeCode)"/>
    <param name="CII-SR-069" value="not (ram:ApplicableProductCharacteristic) or (count(ram:ApplicableProductCharacteristic/ram:Description) =1)"/>
    <param name="CII-SR-070" value="not(ram:ApplicableProductCharacteristic/ram:ValueMeasure)"/>
    <param name="CII-SR-071" value="not(ram:ApplicableProductCharacteristic/ram:MeasurementMethodCode)"/>
    <param name="CII-SR-072" value="not (ram:ApplicableProductCharacteristic) or (count(ram:ApplicableProductCharacteristic/ram:Value) =1)"/>
    <param name="CII-SR-073" value="not(ram:ApplicableProductCharacteristic/ram:ValueCode)"/>
    <param name="CII-SR-074" value="not(ram:ApplicableProductCharacteristic/ram:ValueDateTime)"/>
    <param name="CII-SR-075" value="not(ram:ApplicableProductCharacteristic/ram:ValueIndicator)"/>
    <param name="CII-SR-076" value="not(ram:ApplicableProductCharacteristic/ram:ContentTypeCode)"/>
    <param name="CII-SR-077" value="not(ram:ApplicableProductCharacteristic/ram:ValueSpecifiedBinaryFile)"/>
    <param name="CII-SR-078" value="not(ram:ApplicableProductCharacteristic/ram:ApplicableProductCharacteristicCondition)"/>
    <param name="CII-SR-079" value="not(ram:ApplicableProductCharacteristic/ram:ApplicableReferencedStandard)"/>
    <param name="CII-SR-080" value="not(ram:ApplicableMaterialGoodsCharacteristic)"/>
    
    <param name="CII-SR-081" value="not(ram:DesignatedProductClassification/ram:SystemID)"/>
    <param name="CII-SR-082" value="not(ram:DesignatedProductClassification/ram:SystemName)"/>
    <param name="CII-SR-083" value="not(ram:DesignatedProductClassification/ram:ClassName)"/>
    <param name="CII-SR-084" value="not(ram:DesignatedProductClassification/ram:SubClassCode)"/>
    <param name="CII-SR-085" value="not(ram:DesignatedProductClassification/ram:ClassProductCharacteristic)"/>
    <param name="CII-SR-086" value="not(ram:DesignatedProductClassification/ram:ApplicableReferencedStandard)"/>
    
    <param name="CII-SR-087" value="not(ram:IndividualTradeProductInstance)"/>
    <param name="CII-SR-088" value="not(ram:CertificationEvidenceReferenceReferencedDocument)"/>
    <param name="CII-SR-089" value="not(ram:InspectionReferenceReferencedDocument)"/>
    
    <param name="CII-SR-090" value="not (ram:OriginTradeCountry) or (count(ram:OriginTradeCountry/ram:ID) =1)"/>
    <param name="CII-SR-091" value="not(ram:OriginTradeCountry/ram:Name)"/>
    <param name="CII-SR-092" value="not(ram:OriginTradeCountry/ram:SubordinateTradeCountrySubDivision)"/>
    
    <!-- ID Type -->
    <param name="CII-DT-01" value="not(@schemeName)"/>
    <param name="CII-DT-02" value="not(@schemeAgencyName)"/>
    <param name="CII-DT-03" value="not(@schemeDataURI)"/>
    <param name="CII-DT-04" value="not(@schemeURI)"/>
    <!-- ID Type without attributes -->
    <param name="CII-DT-05" value="not(@schemeID)"/>
    <param name="CII-DT-06" value="not(@schemeAgencyID)"/>
    <param name="CII-DT-07" value="not(@schemeVersionID)"/>
    <!-- TypeCode -->
    <param name="CII-DT-08" value="not(@name)"/>
    <param name="CII-DT-09" value="not(@listURI)"/>
    <!-- Type Code without attributey -->
    <param name="CII-DT-10" value="not(@listID)"/>
    <param name="CII-DT-11" value="not(@listAgencyID)"/>
    <param name="CII-DT-12" value="not(@listVersionID)"/>
    <param name="CII-DT-13" value="not(@languageID)"/>
    <param name="CII-DT-14" value="not(@languageLocaleID)"/>
    <param name="Invoice_line" value="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem"/>
    <param name="Invoice" value="/rsm:CrossIndustryInvoice"/>
    <param name="Document_Context" value="/rsm:CrossIndustryInvoice/rsm:ExchangedDocumentContext"/>
    <param name="DocumentContextParameter" value="//*[ends-with(name(), 'DocumentContextParameter')]"/>
    <param name="Exchanged_Document" value="/rsm:CrossIndustryInvoice/rsm:ExchangedDocument"/>
    <param name="IDType" value="//ram:*[ends-with(name(), 'ID')]"/>
    <param name="IDTypeNoAttributes" value="(/rsm:CrossIndustryInvoice/rsm:ExchangedDocumentContext/ram:GuidelineSpecifiedDocumentContextParameter/ram:ID) or
        (/rsm:CrossIndustryInvoice/rsm:ExchangedDocument/ram:ID) or 
        (/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem/ram:AssociatedDocumentLineDocument/ram:LineID) or
        (/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct/ram:SellerAssignedID)"/>
    <param name="TypeCodeType" value="//ram:TypeCode"/>
    <param name="TypeCodeTypeNoAttributes" value="(/rsm:CrossIndustryInvoice/rsm:ExchangedDocument/ram:TypeCode)"/>
    <param name="SpecifiedTradeProduct" value="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct"/>
</pattern>