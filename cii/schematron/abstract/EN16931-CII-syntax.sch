<!-- Abstract rules for EN16931 -->
<!-- Timestamp: 2016-06-10 08:16:02 +0200 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="EN16931-CII">
    <rule context="$Document_Context">
        <assert test="$CII-SR-001" flag="warning" id="CII-SR-001">[CII-SR-001] - SpecifiedTransactionID should not be present</assert>
        <assert test="$CII-SR-002" flag="warning" id="CII-SR-002">[CII-SR-002] - TestIndicator should not be present</assert>
        <assert test="$CII-SR-003" flag="warning" id="CII-SR-003">[CII-SR-003] - BusinessProcessSpecifiedDocumentContextParameter should exist maximum once</assert>
        <assert test="$CII-SR-006" flag="warning" id="CII-SR-006">[CII-SR-006] - BIMSpecifiedDocumentContextParameter should not be present</assert>
        <assert test="$CII-SR-007" flag="warning" id="CII-SR-007">[CII-SR-007] - ScenarioSpecifiedDocumentContextParameter should not be present</assert>
        <assert test="$CII-SR-008" flag="warning" id="CII-SR-008">[CII-SR-008] - ApplicationSpecifiedDocumentContextParameter should not be present</assert>
        <assert test="$CII-SR-009" flag="fatal" id="CII-SR-009">[CII-SR-009] - GuidelineSpecifiedDocumentContextParameter must exist exactly once</assert>
        <assert test="$CII-SR-010" flag="fatal" id="CII-SR-010">[CII-SR-010] - ID must exist exactly once</assert>
        <assert test="$CII-SR-011" flag="warning" id="CII-SR-011">[CII-SR-011] - SubsetSpecifiedDocumentContextParameter should not be present</assert>
        <assert test="$CII-SR-012" flag="warning" id="CII-SR-012">[CII-SR-012] - MessageStandardSpecifiedDocumentContextParameter should not be present</assert>
    </rule>
    <rule context="$Exchanged_Document">
        <assert test="$CII-SR-013" flag="warning" id="CII-SR-013">[CII-SR-013] - Name should not be present</assert>
        <assert test="$CII-SR-014" flag="fatal" id="CII-SR-014">[CII-SR-014] - TypeCode must exist exactly once</assert>
        <assert test="$CII-SR-015" flag="warning" id="CII-SR-015">[CII-SR-015] - DateTime should not be present</assert>
        <assert test="$CII-SR-016" flag="warning" id="CII-SR-016">[CII-SR-016] - CopyIndicator should not be present</assert>
        <assert test="$CII-SR-017" flag="warning" id="CII-SR-017">[CII-SR-017] - Purpose should not be present</assert>
        <assert test="$CII-SR-018" flag="warning" id="CII-SR-018">[CII-SR-018] - ControlRequirementIndicator should not be present</assert>
        <assert test="$CII-SR-019" flag="warning" id="CII-SR-019">[CII-SR-019] - LanguageID should exist maximum once</assert>
        <assert test="$CII-SR-020" flag="warning" id="CII-SR-020">[CII-SR-020] - PurposeCode should not be present</assert>
        <assert test="$CII-SR-021" flag="warning" id="CII-SR-021">[CII-SR-021] - RevisionDateTime should not be present</assert>
        <assert test="$CII-SR-022" flag="warning" id="CII-SR-022">[CII-SR-022] - VersionID should not be present</assert>
        <assert test="$CII-SR-023" flag="warning" id="CII-SR-023">[CII-SR-023] - GlobalID should not be present</assert>
        <assert test="$CII-SR-024" flag="warning" id="CII-SR-024">[CII-SR-024] - RevisionID should not be present</assert>
        <assert test="$CII-SR-025" flag="warning" id="CII-SR-025">[CII-SR-025] - PreviousRevisionID should not be present</assert>
        <assert test="$CII-SR-026" flag="warning" id="CII-SR-026">[CII-SR-026] - CategoryCode should not be present</assert>
        <assert test="$CII-SR-027" flag="warning" id="CII-SR-027">[CII-SR-027] - Subject should not be present</assert>
        <assert test="$CII-SR-028" flag="warning" id="CII-SR-028">[CII-SR-028] - ContentCode should not be present</assert>
        <assert test="$CII-SR-029" flag="warning" id="CII-SR-029">[CII-SR-029] - IncludedNote should exist maximum once</assert>
        <assert test="$CII-SR-030" flag="warning" id="CII-SR-030">[CII-SR-030] - Content should exist maximum once</assert>
        <assert test="$CII-SR-031" flag="warning" id="CII-SR-031">[CII-SR-031] - SubjectCode should not be present</assert>
        <assert test="$CII-SR-032" flag="warning" id="CII-SR-032">[CII-SR-032] - ID should not be present</assert>
        <assert test="$CII-SR-033" flag="warning" id="CII-SR-033">[CII-SR-033] - EffectiveSpecifiedPeriod should not be present</assert>
        <assert test="$CII-SR-034" flag="warning" id="CII-SR-034">[CII-SR-034] - IssuerTradeParty should not be present</assert>
    </rule>
    <rule context="$Invoice_line">
        <assert test="$CII-SR-035" flag="warning" id="CII-SR-035">[CII-SR-035] - DescriptionCode should not be present</assert>
        <assert test="$CII-SR-036" flag="warning" id="CII-SR-036">[CII-SR-036] - ParentLineID should not be present</assert>
        <assert test="$CII-SR-037" flag="warning" id="CII-SR-037">[CII-SR-037] - LineStatusCode should not be present</assert>
        <assert test="$CII-SR-038" flag="warning" id="CII-SR-038">[CII-SR-038] - LineStatusReasonCode should not be present</assert>
        <assert test="$CII-SR-039" flag="warning" id="CII-SR-039">[CII-SR-039] - IncludedNote should exist maximum once</assert>
        <assert test="$CII-SR-040" flag="warning" id="CII-SR-040">[CII-SR-040] - Content should exist maximum once</assert>
        <assert test="$CII-SR-041" flag="warning" id="CII-SR-041">[CII-SR-041] - SubjectCode should not be present</assert>
        <assert test="$CII-SR-042" flag="warning" id="CII-SR-042">[CII-SR-042] - ID should not be present</assert>
        <assert test="$CII-SR-043" flag="warning" id="CII-SR-043">[CII-SR-043] - CategoryCode should not be present</assert>
        <assert test="$CII-SR-044" flag="warning" id="CII-SR-044">[CII-SR-044] - Subject should not be present</assert>
    </rule>
    <rule context="$SpecifiedTradeProduct">
        <assert test="$CII-SR-045" flag="warning" id="CII-SR-045">[CII-SR-045] - ID should not be present</assert>
        <assert test="$CII-SR-046" flag="fatal" id="CII-SR-046">[CII-SR-046] - schemeID must be present if GlobalID is present</assert>
        <assert test="$CII-SR-047" flag="warning" id="CII-SR-047">[CII-SR-047] - BuyerAssignedID should not be present</assert>
        <assert test="$CII-SR-048" flag="warning" id="CII-SR-048">[CII-SR-048] - ManufacturerAssignedID should not be present</assert>
        <assert test="$CII-SR-049" flag="warning" id="CII-SR-049">[CII-SR-049] - TradeName should not be present</assert>
        <assert test="$CII-SR-050" flag="warning" id="CII-SR-050">[CII-SR-050] - TypeCode should not be present</assert>
        <assert test="$CII-SR-051" flag="warning" id="CII-SR-051">[CII-SR-051] - NetWeightMeasure should not be present</assert>
        <assert test="$CII-SR-052" flag="warning" id="CII-SR-052">[CII-SR-052] - GrossWeightMeasure should not be present</assert>
        <assert test="$CII-SR-053" flag="warning" id="CII-SR-053">[CII-SR-053] - ProductGroupID should not be present</assert>
        <assert test="$CII-SR-054" flag="warning" id="CII-SR-054">[CII-SR-054] - EndItemTypeCode should not be present</assert>
        <assert test="$CII-SR-055" flag="warning" id="CII-SR-055">[CII-SR-055] - EndItemName should not be present</assert>
        <assert test="$CII-SR-056" flag="warning" id="CII-SR-056">[CII-SR-056] - AreaDensityMeasure should not be present</assert>
        <assert test="$CII-SR-057" flag="warning" id="CII-SR-057">[CII-SR-057] - UseDescription should not be present</assert>
        <assert test="$CII-SR-058" flag="warning" id="CII-SR-058">[CII-SR-058] - BrandName should not be present</assert>
        <assert test="$CII-SR-059" flag="warning" id="CII-SR-059">[CII-SR-059] - SubBrandName should not be present</assert>
        <assert test="$CII-SR-060" flag="warning" id="CII-SR-060">[CII-SR-060] - DrainedNetWeightMeasure should not be present</assert>
        <assert test="$CII-SR-061" flag="warning" id="CII-SR-061">[CII-SR-061] - VariableMeasureIndicator should not be present</assert>
        <assert test="$CII-SR-062" flag="warning" id="CII-SR-062">[CII-SR-062] - ColourCode should not be present</assert>
        <assert test="$CII-SR-063" flag="warning" id="CII-SR-063">[CII-SR-063] - ColourDescription should not be present</assert>
        <assert test="$CII-SR-064" flag="warning" id="CII-SR-064">[CII-SR-064] - Designation should not be present</assert>
        <assert test="$CII-SR-065" flag="warning" id="CII-SR-065">[CII-SR-065] - FormattedCancellationAnnouncedLaunchDateTime should not be present</assert>
        <assert test="$CII-SR-066" flag="warning" id="CII-SR-066">[CII-SR-066] - FormattedLatestProductDataChangeDateTime should not be present</assert>
        <assert test="$CII-SR-067" flag="warning" id="CII-SR-067">[CII-SR-067] - ID should not be present</assert>
        <assert test="$CII-SR-068" flag="warning" id="CII-SR-068">[CII-SR-068] - TypeCode should not be present</assert>
        <assert test="$CII-SR-069" flag="fatal" id="CII-SR-069">[CII-SR-069] - Description should exist maximum once.</assert>
        <assert test="$CII-SR-070" flag="warning" id="CII-SR-070">[CII-SR-070] - ValueMeasure should not be present</assert>
        <assert test="$CII-SR-071" flag="warning" id="CII-SR-071">[CII-SR-071] - MeasurementMethodCode should not be present</assert>
        <assert test="$CII-SR-072" flag="fatal" id="CII-SR-072">[CII-SR-072] - Value should exist maximum once.</assert>
        <assert test="$CII-SR-073" flag="warning" id="CII-SR-073">[CII-SR-073] - ValueCode should not be present</assert>
        <assert test="$CII-SR-074" flag="warning" id="CII-SR-074">[CII-SR-074] - ValueDateTime should not be present</assert>
        <assert test="$CII-SR-075" flag="warning" id="CII-SR-075">[CII-SR-075] - ValueIndicator should not be present</assert>
        <assert test="$CII-SR-076" flag="warning" id="CII-SR-076">[CII-SR-076] - ContentTypeCode should not be present</assert>
        <assert test="$CII-SR-077" flag="warning" id="CII-SR-077">[CII-SR-077] - ValueSpecifiedBinaryFile should not be present</assert>
        <assert test="$CII-SR-078" flag="warning" id="CII-SR-078">[CII-SR-078] - ApplicableProductCharacteristicCondition should not be present</assert>
        <assert test="$CII-SR-079" flag="warning" id="CII-SR-079">[CII-SR-079] - ApplicableReferencedStandard should not be present</assert>
        <assert test="$CII-SR-080" flag="warning" id="CII-SR-080">[CII-SR-080] - ApplicableMaterialGoodsCharacteristic should not be present</assert>
        
        <assert test="$CII-SR-081" flag="warning" id="CII-SR-081">[CII-SR-081] - SystemID should not be present</assert>
        <assert test="$CII-SR-082" flag="warning" id="CII-SR-082">[CII-SR-082] - SystemName should not be present</assert>
        <assert test="$CII-SR-083" flag="warning" id="CII-SR-083">[CII-SR-083] - ClassName should not be present</assert>
        <assert test="$CII-SR-084" flag="warning" id="CII-SR-084">[CII-SR-084] - SubClassCode should not be present</assert>
        <assert test="$CII-SR-085" flag="warning" id="CII-SR-085">[CII-SR-085] - ClassProductCharacteristic should not be present</assert>
        <assert test="$CII-SR-086" flag="warning" id="CII-SR-086">[CII-SR-086] - ApplicableReferencedStandard should not be present</assert>
        
        <assert test="$CII-SR-087" flag="warning" id="CII-SR-087">[CII-SR-087] - IndividualTradeProductInstance should not be present</assert>
        <assert test="$CII-SR-088" flag="warning" id="CII-SR-088">[CII-SR-088] - CertificationEvidenceReferenceReferencedDocument should not be present</assert>
        <assert test="$CII-SR-089" flag="warning" id="CII-SR-089">[CII-SR-089] - InspectionReferenceReferencedDocument should not be present</assert>
        
        <assert test="$CII-SR-090" flag="fatal" id="CII-SR-090">[CII-SR-090] - ID should exist maximum once.</assert>
        <assert test="$CII-SR-091" flag="warning" id="CII-SR-091">[CII-SR-091] - Name should not be present</assert>
        <assert test="$CII-SR-092" flag="warning" id="CII-SR-092">[CII-SR-092] - SubordinateTradeCountrySubDivision should not be present</assert>
        
    </rule>
    <rule context="$Invoice">
        <assert test="$CII-DT-13" flag="fatal" id="CII-DT-13">[CII-DT-13] - languageID should not be present</assert>
        <assert test="$CII-DT-14" flag="fatal" id="CII-DT-14">[CII-DT-14] - languageLocaleID should not be present</assert>
    </rule>
    <rule context="$DocumentContextParameter">
        <assert test="$CII-SR-004" flag="warning" id="CII-SR-04">[CII-SR-004] - Value should not be present</assert>
        <assert test="$CII-SR-005" flag="warning" id="CII-SR-05">[CII-SR-005] - SpecifiedDocumentVersion should not be present</assert>
    </rule>
    <rule context="$IDType">
        <assert test="$CII-DT-01" flag="fatal" id="CII-DT-01">[CII-DT-01] - schemeName should not be present</assert>
        <assert test="$CII-DT-02" flag="fatal" id="CII-DT-02">[CII-DT-02] - schemeAgencyName should not be present</assert>
        <assert test="$CII-DT-03" flag="fatal" id="CII-DT-03">[CII-DT-03] - schemeDataURI should not be present</assert>
        <assert test="$CII-DT-04" flag="fatal" id="CII-DT-04">[CII-DT-04] - schemeURI should not be present</assert>
    </rule>
    <rule context="$IDTypeNoAttributes1">
        <assert test="$CII-DT-05" flag="fatal" id="CII-DT-05">[CII-DT-05] - schemeID should not be present</assert>
        <assert test="$CII-DT-06" flag="fatal" id="CII-DT-06">[CII-DT-06] - schemeAgencyID should not be present</assert>
        <assert test="$CII-DT-07" flag="fatal" id="CII-DT-07">[CII-DT-07] - schemeVersionID should not be present</assert>
    </rule>
	<rule context="$IDTypeNoAttributes2">
        <assert test="$CII-DT-05" flag="fatal" id="CII-DT-05">[CII-DT-05] - schemeID should not be present</assert>
        <assert test="$CII-DT-06" flag="fatal" id="CII-DT-06">[CII-DT-06] - schemeAgencyID should not be present</assert>
        <assert test="$CII-DT-07" flag="fatal" id="CII-DT-07">[CII-DT-07] - schemeVersionID should not be present</assert>
    </rule>
	<rule context="$IDTypeNoAttributes3">
        <assert test="$CII-DT-05" flag="fatal" id="CII-DT-05">[CII-DT-05] - schemeID should not be present</assert>
        <assert test="$CII-DT-06" flag="fatal" id="CII-DT-06">[CII-DT-06] - schemeAgencyID should not be present</assert>
        <assert test="$CII-DT-07" flag="fatal" id="CII-DT-07">[CII-DT-07] - schemeVersionID should not be present</assert>
    </rule>
	<rule context="$IDTypeNoAttributes4">
        <assert test="$CII-DT-05" flag="fatal" id="CII-DT-05">[CII-DT-05] - schemeID should not be present</assert>
        <assert test="$CII-DT-06" flag="fatal" id="CII-DT-06">[CII-DT-06] - schemeAgencyID should not be present</assert>
        <assert test="$CII-DT-07" flag="fatal" id="CII-DT-07">[CII-DT-07] - schemeVersionID should not be present</assert>
    </rule>
    <rule context="$TypeCodeType">
        <assert test="$CII-DT-08" flag="fatal" id="CII-DT-08">[CII-DT-08] - name should not be present</assert>
        <assert test="$CII-DT-09" flag="fatal" id="CII-DT-09">[CII-DT-09] - listURI should not be present</assert>
    </rule>
    <rule context="$TypeCodeTypeNoAttributes">
        <assert test="$CII-DT-10" flag="fatal" id="CII-DT-10">[CII-DT-10] - listID should not be present</assert>
        <assert test="$CII-DT-11" flag="fatal" id="CII-DT-11">[CII-DT-11] - listAgencyID should not be present</assert>
        <assert test="$CII-DT-12" flag="fatal" id="CII-DT-12">[CII-DT-12] - listVersionID should not be present</assert>
    </rule>
</pattern>
