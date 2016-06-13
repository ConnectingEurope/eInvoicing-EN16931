<!-- Abstract rules for EN16931 -->
<!-- Timestamp: 2016-06-10 08:16:02 +0200 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="EN16931-SYNTAX">
    <rule context="$Tax_subtotal">
        <assert test="$EDIFACT-SR-01" flag="warning" id="EDIFACT-SR-01">[EDIFACT-SR-01]-VAT exemption reason text shall occur maximum once</assert>
    </rule>
    <rule context="$Tax_Representative">
    </rule>
    <rule context="$Quantity_data_type">
    </rule>
    <rule context="$Price_data_type">
    </rule>
    <rule context="$Preceding_Invoice">
    </rule>
    <rule context="$Percent_data_type">
    </rule>
    <rule context="$Payment_instructions">
    </rule>
    <rule context="$Payee">
    </rule>
    <rule context="$Invoice_total_VAT">
    </rule>
    <rule context="$Invoice_line">
    </rule>
    <rule context="$Invoice">
        <assert test="$EDIFACT-DT-01" flag="warning" id="EDIFACT-DT-01">[EDIFACT-DT-01]-Scheme name attribute should not be present</assert>
    </rule>
    <rule context="$Document_level_charges">
    </rule>
    <rule context="$Document_level_allowances">
    </rule>
    <rule context="$Deliver_to">
    </rule>
    <rule context="$Code_data_type">
    </rule>
    <rule context="$Binary_object_data_type">
    </rule>
    <rule context="$Amount_data_type">
    </rule>
    <rule context="$Additional_supporting_documents">
    </rule>
</pattern>
