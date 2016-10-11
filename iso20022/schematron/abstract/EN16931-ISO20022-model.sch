<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="EN16931">  
<rule context="$Additional_supporting_documents ">
			<assert test="$BR-52" flag="fatal" id="BR-52">[BR-52]-Each additional supporting document shall contain a Supporting document identifier. </assert>
</rule>
<rule context="$Card_information ">
			<assert test="$BR-51" flag="fatal" id="BR-51">[BR-51]-The last 4 to 6 digits of the Payment card primary account number shall be present if Payment card information is provided in the Invoice. </assert>
</rule>
<rule context="$CreditTransfer_information ">
			<assert test="$BR-50" flag="fatal" id="BR-50">[BR-50]-A Payment account identifier shall be present if Credit transfer information is provided in the Invoice. </assert>
</rule>
<rule context="$Document_level_allowances ">
			<assert test="$BR-31" flag="fatal" id="BR-31">[BR-31]-Each document level allowance shall have a Document level allowance amount. </assert>
			<assert test="$BR-32" flag="fatal" id="BR-32">[BR-32]-Each document level allowance shall have a Document level allowance VAT category code. </assert>
			<assert test="$BR-33" flag="fatal" id="BR-33">[BR-33]-Each document level allowance shall have a Document level allowance reason or a Document level allowance reason code. </assert>
			<assert test="$BR-34" flag="fatal" id="BR-34">[BR-34]-Document level allowance amounts shall not be negative. </assert>
			<assert test="$BR-35" flag="fatal" id="BR-35">[BR-35]-Document level allowance base amount shall not be negative. </assert>
			<assert test="$BR-CO-05" flag="fatal" id="BR-CO-05">[BR-CO-05]-Document level allowance reason code and Document level allowance reason shall indicate the same type of allowance. </assert>
			<assert test="$BR-CO-21" flag="fatal" id="BR-CO-21">[BR-CO-21]-Each Document level allowance (BG-20) must contain a Document level allowance reason or a Document level allowance reason code, or both.</assert>
			<assert test="$BR-DEC-01" flag="fatal" id="BR-DEC-01">[BR-DEC-01]-The allowed maximum number of decimals for the Document level allowance amount (BT-92) is 2.</assert>
			<assert test="$BR-DEC-02" flag="fatal" id="BR-DEC-02">[BR-DEC-02]-The allowed maximum number of decimals for the Document level allowance base amount (BT-93) is 2.</assert>
			<assert test="$BR-DEC-03" flag="fatal" id="BR-DEC-03">[BR-DEC-03]-The allowed maximum number of decimals for the Document level allowance percentage (BT-94) is 4.</assert>
			<assert test="$BR-DEC-04" flag="fatal" id="BR-DEC-04">[BR-DEC-04]-The allowed maximum number of decimals for the Document level allowance VAT rate (BT-96) is 4.</assert>
</rule>
<rule context="$Document_level_charges ">
			<assert test="$BR-36" flag="fatal" id="BR-36">[BR-36]-Each document level charge shall have a Document level charge amount. </assert>
			<assert test="$BR-37" flag="fatal" id="BR-37">[BR-37]-Each document level charge shall have a Document level charge VAT category code. </assert>
			<assert test="$BR-38" flag="fatal" id="BR-38">[BR-38]-Each document level charge shall have a Document level charge reason or a Document level charge reason code. </assert>
			<assert test="$BR-39" flag="fatal" id="BR-39">[BR-39]-Document level charge amount shall not be negative. </assert>
			<assert test="$BR-40" flag="fatal" id="BR-40">[BR-40]-Document level charge base amount shall not be negative. </assert>
			<assert test="$BR-CO-06" flag="fatal" id="BR-CO-06">[BR-CO-06]-Document level charge reason code and Document level charge reason shall indicate the same type of charge. </assert>
			<assert test="$BR-CO-22" flag="fatal" id="BR-CO-22">[BR-CO-22]-Each Document level charge (BG-21) must contain a Document level charge reason or a Document level charge reason code, or both.</assert>
			<assert test="$BR-DEC-05" flag="fatal" id="BR-DEC-05">[BR-DEC-05]-The allowed maximum number of decimals for the Document level charge amount (BT-92) is 2.</assert>
			<assert test="$BR-DEC-06" flag="fatal" id="BR-DEC-06">[BR-DEC-06]-The allowed maximum number of decimals for the Document level charge base amount (BT-93) is 2.</assert>
			<assert test="$BR-DEC-07" flag="fatal" id="BR-DEC-07">[BR-DEC-07]-The allowed maximum number of decimals for the Document level charge percentage (BT-94) is 4.</assert>
			<assert test="$BR-DEC-08" flag="fatal" id="BR-DEC-08">[BR-DEC-08]-The allowed maximum number of decimals for the Document level charge VAT rate (BT-96) is 4.</assert>
</rule>
<rule context="$Document_totals ">
			<assert test="$BR-12" flag="fatal" id="BR-12">[BR-12]-An Invoice shall have the Sum of Invoice line net amount. </assert>
			<assert test="$BR-13" flag="fatal" id="BR-13">[BR-13]-An Invoice shall have the Invoice total amount without VAT. </assert>
			<assert test="$BR-14" flag="fatal" id="BR-14">[BR-14]-An Invoice shall have the Invoice total amount with VAT. </assert>
			<assert test="$BR-15" flag="fatal" id="BR-15">[BR-15]-An Invoice shall have the Amount due for payment. </assert>
			<assert test="$BR-CO-10" flag="fatal" id="BR-CO-10">[BR-CO-10]-Sum of Invoice line net amount = Σ Invoice line net amount. </assert>
			<assert test="$BR-CO-11" flag="fatal" id="BR-CO-11">[BR-CO-11]-Sum of allowances on document level = Σ Document level allowance amount. </assert>
			<assert test="$BR-CO-12" flag="fatal" id="BR-CO-12">[BR-CO-12]-Sum of charges on document level = Σ Document level charge amount. </assert>
			<assert test="$BR-CO-13" flag="fatal" id="BR-CO-13">[BR-CO-13]-Invoice total amount without VAT = Σ Invoice line net amount - Sum of allowances on document level + Sum of charges on document level. </assert>
			<assert test="$BR-CO-15" flag="fatal" id="BR-CO-15">[BR-CO-15]-Invoice total amount with VAT = Invoice total amount without VAT + Invoice total VAT amount. </assert>
			<assert test="$BR-CO-16" flag="fatal" id="BR-CO-16">[BR-CO-16]-Amount due for payment = Invoice total amount with VAT-Paid amount + Rounding amount (BT-114). </assert>
			<assert test="$BR-DEC-09" flag="fatal" id="BR-DEC-09">[BR-DEC-09]-The allowed maximum number of decimals for the Sum of Invoice line net amount (BT-106) is 2.</assert>
			<assert test="$BR-DEC-10" flag="fatal" id="BR-DEC-10">[BR-DEC-10]-The allowed maximum number of decimals for the Sum of allowanced on document level (BT-107) is 2.</assert>
			<assert test="$BR-DEC-11" flag="fatal" id="BR-DEC-11">[BR-DEC-11]-The allowed maximum number of decimals for the Sum of charges on document level (BT-108) is 2.</assert>
			<assert test="$BR-DEC-12" flag="fatal" id="BR-DEC-12">[BR-DEC-12]-The allowed maximum number of decimals for the Invoice total amount without VAT (BT-109) is 2.</assert>
			<assert test="$BR-DEC-14" flag="fatal" id="BR-DEC-14">[BR-DEC-14]-The allowed maximum number of decimals for the Invoice total amount with VAT (BT-112) is 2.</assert>
			<assert test="$BR-DEC-13" flag="fatal" id="BR-DEC-13">[BR-DEC-13]-The allowed maximum number of decimals for the Invoice total VAT amount (BT-110) is 2.</assert>
			<assert test="$BR-DEC-15" flag="fatal" id="BR-DEC-15">[BR-DEC-15]-The allowed maximum number of decimals for the Invoice total VAT amount in accounting currency (BT-111) is 2.</assert>
			<assert test="$BR-DEC-16" flag="fatal" id="BR-DEC-16">[BR-DEC-16]-The allowed maximum number of decimals for the Paid amount (BT-113) is 2.</assert>
			<assert test="$BR-DEC-17" flag="fatal" id="BR-DEC-17">[BR-DEC-17]-The allowed maximum number of decimals for the Rounding amount (BT-114) is 2.</assert>
			<assert test="$BR-DEC-18" flag="fatal" id="BR-DEC-18">[BR-DEC-18]-The allowed maximum number of decimals for the Amount due for payment (BT-115) is 2.</assert>
</rule>
</pattern>