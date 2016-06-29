<!-- Abstract rules for EN16931 -->
<!-- Timestamp: 2016-06-10 08:16:02 +0200 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="EN16931-SYNTAX">
    <rule context="$UNH">
		<assert test="$EDIFACT-SR-001" flag="warning" id="EDIFACT-SR-001">[EDIFACT-SR-001] - Common access reference should not be used</assert>
		<assert test="$EDIFACT-SR-002" flag="warning" id="EDIFACT-SR-002">[EDIFACT-SR-002] - Status of the transfer should not be used</assert>
    </rule>
<rule context="$BGM">
		<assert test="$EDIFACT-SR-003" flag="warning" id="EDIFACT-SR-003">[EDIFACT-SR-003] - Code list identification code should not be used</assert>
		<assert test="$EDIFACT-SR-004" flag="warning" id="EDIFACT-SR-004">[EDIFACT-SR-004] - Code list responsible agency code should not be used</assert>
		<assert test="$EDIFACT-SR-005" flag="warning" id="EDIFACT-SR-005">[EDIFACT-SR-005] - Document name should not be used</assert>
		<assert test="$EDIFACT-SR-006" flag="warning" id="EDIFACT-SR-006">[EDIFACT-SR-006] - Version identifier should not be used</assert>
		<assert test="$EDIFACT-SR-007" flag="warning" id="EDIFACT-SR-007">[EDIFACT-SR-007] - Revision identifier should not be used</assert>
		<assert test="$EDIFACT-SR-008" flag="warning" id="EDIFACT-SR-008">[EDIFACT-SR-008] - Message function code should be 9 (Original)</assert>
		<assert test="$EDIFACT-SR-009" flag="warning" id="EDIFACT-SR-009">[EDIFACT-SR-009] - Response type code should not be used</assert>
		<assert test="$EDIFACT-SR-010" flag="warning" id="EDIFACT-SR-010">[EDIFACT-SR-010] - Document status code should not be used</assert>
		<assert test="$EDIFACT-SR-011" flag="warning" id="EDIFACT-SR-011">[EDIFACT-SR-011] - Language name code should not be used</assert>
    </rule>
    <rule context="$DTM">
    <assert test="$EDIFACT-SR-012" flag="warning" id="EDIFACT-SR-012">[EDIFACT-SR-012] - Only values 35, 131, 137, 167 or 168 should be used</assert>
    <assert test="$EDIFACT-SR-013" flag="fatal" id="EDIFACT-SR-013">[EDIFACT-SR-013] - The actual delivery date may only be stated once</assert>
    <assert test="$EDIFACT-SR-014" flag="fatal" id="EDIFACT-SR-014">[EDIFACT-SR-014] - The value added tax point date may only be stated once</assert>
    <assert test="$EDIFACT-SR-015" flag="fatal" id="EDIFACT-SR-015">[EDIFACT-SR-015] - The invoice issue date must be stated once</assert>
    <assert test="$EDIFACT-SR-016" flag="fatal" id="EDIFACT-SR-016">[EDIFACT-SR-016] - The invoice period start date may only be stated once</assert>
    <assert test="$EDIFACT-SR-017" flag="fatal" id="EDIFACT-SR-017">[EDIFACT-SR-017] - The invoice period end date may only be stated once</assert>
    </rule>
        <rule context="$Invoice">
    <assert test="$EDIFACT-SR-018" flag="warning" id="EDIFACT-SR-018">[EDIFACT-SR-018] - The PAI segment should not be used</assert>
    <assert test="$EDIFACT-SR-019" flag="warning" id="EDIFACT-SR-019">[EDIFACT-SR-019] - The ALI segment should not be used</assert>
    <assert test="$EDIFACT-SR-020" flag="warning" id="EDIFACT-SR-020">[EDIFACT-SR-020] - The IMD segment should not be used</assert>
    <assert test="$EDIFACT-SR-021" flag="warning" id="EDIFACT-SR-021">[EDIFACT-SR-021] - The LOC segment should not be used</assert>
    <assert test="$EDIFACT-SR-022" flag="warning" id="EDIFACT-SR-022">[EDIFACT-SR-022] - The GEI segment should not be used</assert>
    <assert test="$EDIFACT-SR-023" flag="warning" id="EDIFACT-SR-023">[EDIFACT-SR-023] - The DGS segment should not be used</assert>
    <assert test="$EDIFACT-SR-024" flag="warning" id="EDIFACT-SR-024">[EDIFACT-SR-024] - The GIR segment should not be used</assert>
    <assert test="$EDIFACT-SR-025" flag="warning" id="EDIFACT-SR-025">[EDIFACT-SR-025] - The SG6 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-026" flag="warning" id="EDIFACT-SR-026">[EDIFACT-SR-026] - The SG9 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-027" flag="warning" id="EDIFACT-SR-027">[EDIFACT-SR-027] - The SG12 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-028" flag="warning" id="EDIFACT-SR-028">[EDIFACT-SR-028] - The SG13 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-029" flag="warning" id="EDIFACT-SR-029">[EDIFACT-SR-029] - The SG14 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-030" flag="warning" id="EDIFACT-SR-030">[EDIFACT-SR-030] - The SG23 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-031" flag="warning" id="EDIFACT-SR-031">[EDIFACT-SR-031] - The SG24 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-032" flag="warning" id="EDIFACT-SR-032">[EDIFACT-SR-032] - The SG25 segment group should not be used</assert>
    <assert test="$EDIFACT-SR-033" flag="warning" id="EDIFACT-SR-033">[EDIFACT-SR-033] - The CNT segment should not be used</assert>
    <assert test="$EDIFACT-SR-034" flag="warning" id="EDIFACT-SR-034">[EDIFACT-SR-034] - The SG55 segment group should not be used</assert>
</rule>
<rule context="$FTX">
    <assert test="$EDIFACT-SR-035" flag="warning" id="EDIFACT-SR-035">[EDIFACT-SR-035] - Only values GEN, AHR, AFP, ADE, AGM or AAB should be used</assert>
    <assert test="$EDIFACT-SR-036" flag="warning" id="EDIFACT-SR-036">[EDIFACT-SR-036] - Code list identification code should not be used</assert>
    <assert test="$EDIFACT-SR-037" flag="warning" id="EDIFACT-SR-037">[EDIFACT-SR-037] - Code list responsible agency code should not be used</assert>
    <assert test="$EDIFACT-SR-038" flag="warning" id="EDIFACT-SR-038">[EDIFACT-SR-038] - Additional free texts should not be used</assert>
    <assert test="$EDIFACT-SR-039" flag="warning" id="EDIFACT-SR-039">[EDIFACT-SR-039] - Language name code should not be used</assert>
    <assert test="$EDIFACT-SR-040" flag="warning" id="EDIFACT-SR-040">[EDIFACT-SR-040] - Free text format code should not be used</assert>
    </rule>

    <rule context="$SG1">
    <assert test="$EDIFACT-SR-041" flag="warning" id="EDIFACT-SR-041">[EDIFACT-SR-041] - Only values AAK, AEF, AEG, ALO, AOU, ATS, CR, CT, IV, ON, PQ or VN should be used</assert>
    <assert test="$EDIFACT-SR-042" flag="warning" id="EDIFACT-SR-042">[EDIFACT-SR-042] - Document line identifier should not be used</assert>
    <assert test="$EDIFACT-SR-043" flag="warning" id="EDIFACT-SR-043">[EDIFACT-SR-043] - Version identifier should not be used</assert>
    <assert test="$EDIFACT-SR-044" flag="warning" id="EDIFACT-SR-044">[EDIFACT-SR-044] - Revision identifier should not be used</assert>
    <assert test="$EDIFACT-SR-045" flag="warning" id="EDIFACT-SR-045">[EDIFACT-SR-045] - There should be maximal one buyer reference</assert>
    <assert test="$EDIFACT-SR-046" flag="warning" id="EDIFACT-SR-046">[EDIFACT-SR-046] - There should be maximal one business process reference</assert>
    <assert test="$EDIFACT-SR-047" flag="fatal" id="EDIFACT-SR-047">[EDIFACT-SR-047] - There must be exaclty one specification identification</assert>
    <assert test="$EDIFACT-SR-048" flag="warning" id="EDIFACT-SR-048">[EDIFACT-SR-048] - There should be maximal one contract reference</assert>
    <assert test="$EDIFACT-SR-049" flag="warning" id="EDIFACT-SR-049">[EDIFACT-SR-049] - There should be maximal one purchase order reference</assert>
    <assert test="$EDIFACT-SR-050" flag="warning" id="EDIFACT-SR-050">[EDIFACT-SR-050] - There should be maximal one sales order reference</assert>
    <assert test="$EDIFACT-SR-051" flag="warning" id="EDIFACT-SR-051">[EDIFACT-SR-051] - There should be maximal one receiving advice reference</assert>
    <assert test="$EDIFACT-SR-052" flag="warning" id="EDIFACT-SR-052">[EDIFACT-SR-052] - There should be maximal one despatch advice reference</assert>
    <assert test="$EDIFACT-SR-053" flag="warning" id="EDIFACT-SR-053">[EDIFACT-SR-053] - There should be maximal one invoiced object reference</assert>
    <assert test="$EDIFACT-SR-054" flag="warning" id="EDIFACT-SR-054">[EDIFACT-SR-054] - There should be maximal one buyer accounting reference</assert>
    <assert test="$EDIFACT-SR-055" flag="warning" id="EDIFACT-SR-055">[EDIFACT-SR-055] - A reference date should only be stated for a preceding invoice</assert>
    <assert test="$EDIFACT-SR-056" flag="warning" id="EDIFACT-SR-056">[EDIFACT-SR-056] - Date or time or period format code should not be used</assert>
    <assert test="$EDIFACT-SR-057" flag="warning" id="EDIFACT-SR-057">[EDIFACT-SR-057] - The segment GIR should not be used</assert>
    <assert test="$EDIFACT-SR-058" flag="warning" id="EDIFACT-SR-058">[EDIFACT-SR-058] - The segment LOC should not be used</assert>
    <assert test="$EDIFACT-SR-059" flag="warning" id="EDIFACT-SR-059">[EDIFACT-SR-059] - The segment MEA should not be used</assert>
    <assert test="$EDIFACT-SR-060" flag="warning" id="EDIFACT-SR-060">[EDIFACT-SR-060] - The segment QTY should not be used</assert>
    <assert test="$EDIFACT-SR-061" flag="warning" id="EDIFACT-SR-061">[EDIFACT-SR-061] - The segment FTX should not be used</assert>
    <assert test="$EDIFACT-SR-062" flag="warning" id="EDIFACT-SR-062">[EDIFACT-SR-062] - The segment MOA should not be used</assert>
    <assert test="$EDIFACT-SR-063" flag="warning" id="EDIFACT-SR-063">[EDIFACT-SR-063] - The segment RTE should not be used</assert>
	</rule>
    <rule context="$SG2">
		<assert test="$EDIFACT-SR-064" flag="warning" id="EDIFACT-SR-064">[EDIFACT-SR-064] - Only values SE, BY, PE, AE or DP should be used</assert>
		<assert test="$EDIFACT-SR-065" flag="fatal" id="EDIFACT-SR-065">[EDIFACT-SR-065] - If a party identifier is present, the code list responsible agency code must be stated</assert>
		<assert test="$EDIFACT-SR-066" flag="warning" id="EDIFACT-SR-066">[EDIFACT-SR-066] - Code list identification code should not be used</assert>
		<assert test="$EDIFACT-SR-067" flag="warning" id="EDIFACT-SR-067">[EDIFACT-SR-067] - Name and address composit should not be used</assert>
		<assert test="$EDIFACT-SR-068" flag="warning" id="EDIFACT-SR-068">[EDIFACT-SR-068] - Party identification should not be used for a seller's tax representative</assert>
		<assert test="$EDIFACT-SR-069" flag="warning" id="EDIFACT-SR-069">[EDIFACT-SR-069] - The second party name should be used for a seller</assert>
		<assert test="$EDIFACT-SR-070" flag="warning" id="EDIFACT-SR-070">[EDIFACT-SR-070] - Additional party name should not be used</assert>
		<assert test="$EDIFACT-SR-071" flag="warning" id="EDIFACT-SR-071">[EDIFACT-SR-071] - Party name format code should not be used</assert>
		<assert test="$EDIFACT-SR-072" flag="warning" id="EDIFACT-SR-072">[EDIFACT-SR-072] - Street should not be used in payee</assert>
		<assert test="$EDIFACT-SR-073" flag="warning" id="EDIFACT-SR-073">[EDIFACT-SR-073] - Street line 3 should not be used</assert>
		<assert test="$EDIFACT-SR-074" flag="warning" id="EDIFACT-SR-074">[EDIFACT-SR-074] - Street line 4 should not be used</assert>
		<assert test="$EDIFACT-SR-075" flag="warning" id="EDIFACT-SR-075">[EDIFACT-SR-075] - City name should not be used</assert>
		<assert test="$EDIFACT-SR-076" flag="warning" id="EDIFACT-SR-076">[EDIFACT-SR-076] - Country subdivision identifier should not be used</assert>
		<assert test="$EDIFACT-SR-077" flag="warning" id="EDIFACT-SR-077">[EDIFACT-SR-077] - Code list identification code should not be used</assert>
		<assert test="$EDIFACT-SR-078" flag="warning" id="EDIFACT-SR-078">[EDIFACT-SR-078] - Code list responsible agency code should not be used</assert>
		<assert test="$EDIFACT-SR-079" flag="warning" id="EDIFACT-SR-079">[EDIFACT-SR-079] - Country subdivision name should not be used</assert>
	</rule>
</pattern>
