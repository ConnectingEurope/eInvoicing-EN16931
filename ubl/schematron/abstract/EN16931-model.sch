<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for model -->
<!-- Timestamp: 2016-07-06 13:42:48 +0200 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="model">
  <rule context="$Account_information ">
    <assert test="$BR-53" flag="fatal" id="BR-53">[BR-53]-A Financial account identifier shall be present if Account identification information is provided in the Invoice. </assert>
  </rule>
  <rule context="$Additional_supporting_documents ">
    <assert test="$BR-55" flag="fatal" id="BR-55">[BR-55]-Each additional supporting document shall contain a Supporting document identifier. </assert>
    <assert test="$BR-56" flag="fatal" id="BR-56">[BR-56]-Each additional supporting document shall contain a Supporting document description. </assert>
  </rule>
  <rule context="$Card_information ">
    <assert test="$BR-54" flag="fatal" id="BR-54">[BR-54]-The last 4 to 6 digit of the Payment card primary account number shall be present if card information is provided in the Invoice. </assert>
  </rule>
  <rule context="$Document_level_allowances ">
    <assert test="$BR-32" flag="fatal" id="BR-32">[BR-32]-Each document level allowance shall have a Document level allowance amount. </assert>
    <assert test="$BR-33" flag="fatal" id="BR-33">[BR-33]-Each document level allowance shall have a Document level allowance VAT category code. </assert>
    <assert test="$BR-35" flag="fatal" id="BR-35">[BR-35]-Each document level allowance shall have a Document level allowance reason. </assert>
    <assert test="$BR-36" flag="fatal" id="BR-36">[BR-36]-Document level allowance amounts shall not be negative. </assert>
    <assert test="$BR-CO-05" flag="fatal" id="BR-CO-05">[BR-CO-05]-Document level allowance reason code and Document level allowance reason shall indicate the same type of allowance. </assert>
  </rule>
  <rule context="$Document_level_charges ">
    <assert test="$BR-37" flag="fatal" id="BR-37">[BR-37]-Each document level charge shall have a Document level charge amount. </assert>
    <assert test="$BR-38" flag="fatal" id="BR-38">[BR-38]-Each document level charge shall have a Document level charge VAT category code. </assert>
    <assert test="$BR-40" flag="fatal" id="BR-40">[BR-40]-Each document level charge shall have a Document level charge reason. </assert>
    <assert test="$BR-41" flag="fatal" id="BR-41">[BR-41]-Document level charge amounts shall not be negative. </assert>
    <assert test="$BR-CO-06" flag="fatal" id="BR-CO-06">[BR-CO-06]-Document level charge reason code and Document level charge reason shall indicate the same type of charge. </assert>
  </rule>
  <rule context="$Document_totals ">
    <assert test="$BR-10" flag="fatal" id="BR-10">[BR-10]-An Invoice shall have the Sum of Invoice line net amount. </assert>
    <assert test="$BR-11" flag="fatal" id="BR-11">[BR-11]-An Invoice shall have the Invoice total amount without VAT. </assert>
    <assert test="$BR-12" flag="fatal" id="BR-12">[BR-12]-An Invoice shall have the Invoice total amount with VAT. </assert>
    <assert test="$BR-13" flag="fatal" id="BR-13">[BR-13]-An Invoice shall have the Amount due for payment. </assert>
    <assert test="$BR-57" flag="fatal" id="BR-57">[BR-57]-Invoice total amount with VAT shall not be negative. </assert>
    <assert test="$BR-CO-10" flag="fatal" id="BR-CO-10">[BR-CO-10]-Sum of Invoice line net amount = Σ Invoice line net amount. </assert>
    <assert test="$BR-CO-11" flag="fatal" id="BR-CO-11">[BR-CO-11]-Sum of allowances on document level = Σ Document level allowance amount. </assert>
    <assert test="$BR-CO-12" flag="fatal" id="BR-CO-12">[BR-CO-12]-Sum of charges on document level = Σ Document level charge amount. </assert>
    <assert test="$BR-CO-13" flag="fatal" id="BR-CO-13">[BR-CO-13]-Invoice total amount without VAT = Σ Invoice line net amount - Sum of allowances on document level + Sum of charges on document level. </assert>
    <assert test="$BR-CO-15" flag="fatal" id="BR-CO-15">[BR-CO-15]-Invoice total amount with VAT = Invoice total amount without VAT + Invoice total VAT amount. </assert>
    <assert test="$BR-CO-16" flag="fatal" id="BR-CO-16">[BR-CO-16]-Amount due for payment = Invoice total VAT amount-Paid amount. </assert>
  </rule>
  <rule context="$Invoice ">
    <assert test="$BR-01" flag="fatal" id="BR-01">[BR-01]-An Invoice shall have a Specification identification. </assert>
    <assert test="$BR-02" flag="fatal" id="BR-02">[BR-02]-An Invoice shall have an Invoice number. </assert>
    <assert test="$BR-03" flag="fatal" id="BR-03">[BR-03]-An Invoice shall have an Invoice issue date. </assert>
    <assert test="$BR-04" flag="fatal" id="BR-04">[BR-04]-An Invoice shall have an Invoice type code. </assert>
    <assert test="$BR-05" flag="fatal" id="BR-05">[BR-05]-An Invoice shall have an Invoice currency code. </assert>
    <assert test="$BR-06" flag="fatal" id="BR-06">[BR-06]-An Invoice shall contain Seller name. </assert>
    <assert test="$BR-07" flag="fatal" id="BR-07">[BR-07]-An Invoice shall contain Buyer name. </assert>
    <assert test="$BR-08" flag="fatal" id="BR-08">[BR-08]-An Invoice shall contain the Seller postal address. </assert>
    <assert test="$BR-09" flag="fatal" id="BR-09">[BR-09]-An Invoice shall contain the Buyer postal address. </assert>
    <assert test="$BR-14" flag="fatal" id="BR-14">[BR-14]-An Invoice shall have at least one Invoice line. </assert>
    <assert test="$BR-52" flag="fatal" id="BR-52">[BR-52]-The Bank creditor identifier shall be given in an Invoice in case the payment means is a SEPA direct debit. </assert>
    <assert test="$BR-CO-01" flag="fatal" id="BR-CO-01">[BR-CO-01]-Only one language shall be used in an Invoice. </assert>
    <assert test="$BR-CO-03" flag="fatal" id="BR-CO-03">[BR-CO-03]-One and only one of either the Seller VAT identifier or the Seller tax representative VAT identifier shall exist in an Invoice if the Invoice has an Invoice total VAT amount. </assert>
  </rule>
  <rule context="$Invoice_Line ">
    <assert test="$BR-18" flag="fatal" id="BR-18">[BR-18]-Each Invoice line shall have an Invoice line identifier. </assert>
    <assert test="$BR-19" flag="fatal" id="BR-19">[BR-19]-Each Invoice line shall have an Invoiced quantity. </assert>
    <assert test="$BR-20" flag="fatal" id="BR-20">[BR-20]-An invoiced quantity shall have an Invoice quantity unit of measure. </assert>
    <assert test="$BR-21" flag="fatal" id="BR-21">[BR-21]-Each Invoice line shall have an Invoice line net amount. </assert>
    <assert test="$BR-22" flag="fatal" id="BR-22">[BR-22]-Each Invoice line shall contain the Item name. </assert>
    <assert test="$BR-23" flag="fatal" id="BR-23">[BR-23]-Each Invoice line shall contain the Item net price. </assert>
    <assert test="$BR-24" flag="fatal" id="BR-24">[BR-24]-Invoice line item net price shall NOT be negative. </assert>
    <assert test="$BR-25" flag="fatal" id="BR-25">[BR-25]-Invoice line item gross price shall NOT be negative. </assert>
    <assert test="$BR-61" flag="fatal" id="BR-61">[BR-61]-Each Invoice line shall have a unique identifier within the whole Invoice.</assert>
    <assert test="$BR-CO-04" flag="fatal" id="BR-CO-04">[BR-CO-04]-Each Invoice line shall be categorized with an Invoiced item VAT category code. </assert>
  </rule>
  <rule context="$Invoice_line_allowances ">
    <assert test="$BR-42" flag="fatal" id="BR-42">[BR-42]-Each Invoice line allowance shall have an Invoice line allowance amount. </assert>
    <assert test="$BR-43" flag="fatal" id="BR-43">[BR-43]-Each Invoice line allowance shall have an Invoice line allowance reason. </assert>
    <assert test="$BR-CO-07" flag="fatal" id="BR-CO-07">[BR-CO-07]-Invoice line allowance reason code and Invoice line allowance reason shall indicate the same type of allowance reason. </assert>
  </rule>
  <rule context="$Invoice_line_charges ">
    <assert test="$BR-44" flag="fatal" id="BR-44">[BR-44]-Each Invoice line charge shall have an Invoice line charge amount. </assert>
    <assert test="$BR-45" flag="fatal" id="BR-45">[BR-45]-Each Invoice line charge shall have an Invoice line charge reason. </assert>
    <assert test="$BR-CO-08" flag="fatal" id="BR-CO-08">[BR-CO-08]-Invoice line charge reason code and Invoice line charge reason shall indicate the same type of charge reason. </assert>
  </rule>
  <rule context="$Invoice_Line_Period ">
    <assert test="$BR-29" flag="fatal" id="BR-29">[BR-29]-An Invoice line period shall have an Invoice line period start date. </assert>
    <assert test="$BR-30" flag="fatal" id="BR-30">[BR-30]-An Invoice line period shall have an Invoice line period end date. </assert>
    <assert test="$BR-31" flag="fatal" id="BR-31">[BR-31]-An Invoice line period end date shall be later or equal to an Invoice line period start date. </assert>
  </rule>
  <rule context="$Invoice_Period ">
    <assert test="$BR-26" flag="fatal" id="BR-26">[BR-26]-An Invoice period shall have an Invoice period start date. </assert>
    <assert test="$BR-27" flag="fatal" id="BR-27">[BR-27]-An Invoice period shall have an Invoice period end date. </assert>
    <assert test="$BR-28" flag="fatal" id="BR-28">[BR-28]-An Invoice period end date shall be later or equal to an Invoice period start date. </assert>
  </rule>
  <rule context="$Item_attributes ">
    <assert test="$BR-60" flag="fatal" id="BR-60">[BR-60]-Each Item attribute shall contain an Item attribute name and an Item attribute value. </assert>
  </rule>
  <rule context="$Payee">
    <assert test="$BR-16" flag="fatal" id="BR-16">[BR-16]-The Payee name shall be provided in the Invoice, if the Payee is different from the Seller. </assert>
  </rule>
  <rule context="$Payment_instructions ">
    <assert test="$BR-50" flag="fatal" id="BR-50">[BR-50]-A payment instruction shall specify the Payment means type code. </assert>
    <assert test="$BR-51" flag="fatal" id="BR-51">[BR-51]-The Mandate reference identifier shall be given in an Invoice in case the payment means is a SEPA direct debit. </assert>
    <assert test="$BR-CO-02" flag="fatal" id="BR-CO-02">[BR-CO-02]-Account identification shall be present if payment means is credit transfer. </assert>
  </rule>
  <rule context="$Tax_Representative">
    <assert test="$BR-15" flag="fatal" id="BR-15">[BR-15]-The Seller tax representative postal address shall be provided in the Invoice, if the Seller has a tax representative party. </assert>
    <assert test="$BR-17" flag="fatal" id="BR-17">[BR-17]-The Seller tax representative name shall be provided in the Invoice, if the Seller has a tax representative party. </assert>
  </rule>
  <rule context="$Tax_Total">
    <assert test="$BR-CO-14" flag="fatal" id="BR-CO-14">[BR-CO-14]-Invoice total VAT amount = Σ VAT category tax amount. </assert>
  </rule>
  <rule context="$VAT_breakdown ">
    <assert test="$BR-46" flag="fatal" id="BR-46">[BR-46]-Each VAT breakdown shall have a VAT category taxable amount. </assert>
    <assert test="$BR-47" flag="fatal" id="BR-47">[BR-47]-Each VAT breakdown shall have a VAT category tax amount. </assert>
    <assert test="$BR-48" flag="fatal" id="BR-48">[BR-48]-Each VAT breakdown shall be defined through a VAT category code. </assert>
    <assert test="$BR-49" flag="fatal" id="BR-49">[BR-49]-Each VAT breakdown shall have a VAT category rate, except if the Invoice is outside the scope of VAT. </assert>
    <assert test="$BR-59" flag="fatal" id="BR-59">[BR-59]-If the VAT accounting currency code is different than the Invoice currency code, then the Invoice total VAT amount in accounting currency shall be provided. </assert>
    <assert test="$BR-CO-17" flag="fatal" id="BR-CO-17">[BR-CO-17]-VAT category tax amount = VAT category taxable amount x (VAT category rate / 100), rounded "half up" to two decimals. </assert>
  </rule>
  <rule context="$VAT_identifiers ">
    <assert test="$BR-CO-09" flag="fatal" id="BR-CO-09">[BR-CO-09]-The Seller VAT identifier, Seller tax representative VAT identifier, Buyer VAT identifier shall have a prefix in accordance with ISO code ISO 3166-1 alpha-2 by which the Member State of issue may be identified. Nevertheless, Greece may use the prefix ‘EL’. </assert>
  </rule>
  <rule context="$VATAE">
    <assert test="$BR-AE-05" flag="fatal" id="BR-AE-05">[BR-AE-05]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where the VAT category code (BT-111) is “AE” shall be 0 (zero). </assert>
    <assert test="$BR-AE-07" flag="fatal" id="BR-AE-07">[BR-AE-07]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "AE" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amounts (BT-122) where the VAT category code (BT-142) is "AE" and VAT exemption reason text (BT-144) matches the exemption reason text (BT-113), minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category code (BT-142, BT-89, BT-96) is “AE". </assert>
    <assert test="$BR-AE-09" flag="fatal" id="BR-AE-09">[BR-AE-09]-The VAT exemption reason text (BT-113) shall be "Reverse charge" (or the equivalent standard text in other languages) in the VAT breakdown (BG-21) if the VAT category code is "AE". </assert>
    <assert test="$BR-AE-10" flag="fatal" id="BR-AE-10">[BR-AE-10]-An Invoice with a VAT category code "AE" shall have the VAT category rate (BT-112) 0 (zero). </assert>
  </rule>
  <rule context="$VATAE_Allowance">
    <assert test="$BR-AE-03" flag="fatal" id="BR-AE-03">[BR-AE-03]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "AE" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </assert>
  </rule>
  <rule context="$VATAE_Charge">
    <assert test="$BR-AE-04" flag="fatal" id="BR-AE-04">[BR-AE-04]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "AE" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </assert>
  </rule>
  <rule context="$VATAE_Line">
    <assert test="$BR-AE-01" flag="fatal" id="BR-AE-01">[BR-AE-01]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “AE” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "AE". </assert>
    <assert test="$BR-AE-02" flag="fatal" id="BR-AE-02">[BR-AE-02]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “AE” shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </assert>
    <assert test="$BR-AE-06" flag="fatal" id="BR-AE-06">[BR-AE-06]-In an Invoice line where the Invoice item VAT category code (BT-142) is "AE" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </assert>
    <assert test="$BR-AE-08" flag="fatal" id="BR-AE-08">[BR-AE-08]-In an Invoice line where the Invoice item VAT category code (BT-142) is "AE" the invoiced item VAT exemption reasons text (BT-144) shall be "Reverse charge" (or the equivalent standard text in other languages). </assert>
  </rule>
  <rule context="$VATE">
    <assert test="$BR-E-07" flag="fatal" id="BR-E-07">[BR-E-07]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "E" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amount (BT-122) where the VAT category codes (BT-142) is "E" and VAT exemption reason text (BT-144) matches the exemption reason text (BT-113), minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category code (BT-142, BT-89, BT-96) is “E". </assert>
    <assert test="$BR-E-08" flag="fatal" id="BR-E-08">[BR-E-08]-The VAT category tax amount (BT-110) In a VAT breakdown (BG-21) where the VAT category code (BT-111) equals "E", shall equal 0 (zero). </assert>
    <assert test="$BR-E-09" flag="fatal" id="BR-E-09">[BR-E-09]-A VAT exemption reason text (BT-113) shall be provided in the VAT breakdown (BG-21) if the VAT category code is "E". </assert>
    <assert test="$BR-E-10" flag="fatal" id="BR-E-10">[BR-E-10]-An Invoice with a VAT category code "E" shall have the VAT category rate (BT-112) 0 (zero). </assert>
  </rule>
  <rule context="$VATE_Allowance">
    <assert test="$BR-E-03" flag="fatal" id="BR-E-03">[BR-E-03]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "E" shall contain the Seller's VAT identifier (BT-30). </assert>
  </rule>
  <rule context="$VATE_Charge">
    <assert test="$BR-E-04" flag="fatal" id="BR-E-04">[BR-E-04]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "E" shall contain the Seller's VAT identifier (BT-30). </assert>
  </rule>
  <rule context="$VATE_Line">
    <assert test="$BR-E-01" flag="fatal" id="BR-E-01">[BR-E-01]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “E” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "E". </assert>
    <assert test="$BR-E-02" flag="fatal" id="BR-E-02">[BR-E-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “E” shall contain the Seller's VAT identifier (BT-30). </assert>
    <assert test="$BR-E-05" flag="fatal" id="BR-E-05">[BR-E-05]-In an Invoice line where the Invoice item VAT category code (BT-142) is "E", the Invoiced item VAT rate (BT-143) shall be 0 (zero). </assert>
    <assert test="$BR-E-06" flag="fatal" id="BR-E-06">[BR-E-06]-In an Invoice line where the Invoice item VAT category code (BT-142) is "E" the Invoiced item VAT exemption reason text (BT-144) shall not be blank. </assert>
  </rule>
  <rule context="$VATG">
    <assert test="$BR-G-06" flag="fatal" id="BR-G-06">[BR-G-06]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where the VAT category code (BT-111) is “G” shall be 0 (zero). </assert>
    <assert test="$BR-G-08" flag="fatal" id="BR-G-08">[BR-G-08]-In an Invoice line where the Invoice item VAT category code (BT-142) is "G" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </assert>
    <assert test="$BR-G-09" flag="fatal" id="BR-G-09">[BR-G-09]-The VAT exemption reason text (BT-113) shall be "Export outside the EU" (or the equivalent standard text in other languages) in the VAT breakdown (BG-21) if the VAT category code is "G". </assert>
    <assert test="$BR-G-10" flag="fatal" id="BR-G-10">[BR-G-10]-An Invoice with a VAT category code "G" shall have the VAT category rate (BT-112) 0 (zero). </assert>
  </rule>
  <rule context="$VATG_Allowance">
    <assert test="$BR-G-03" flag="fatal" id="BR-G-03">[BR-G-03]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "G" shall contain the Seller's VAT identifier (BT-30). </assert>
  </rule>
  <rule context="$VATG_Charge">
    <assert test="$BR-G-04" flag="fatal" id="BR-G-04">[BR-G-04]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "G" shall contain the Seller's VAT identifier. </assert>
  </rule>
  <rule context="$VATG_Line">
    <assert test="$BR-G-01" flag="fatal" id="BR-G-01">[BR-G-01]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “G” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "G". </assert>
    <assert test="$BR-G-02" flag="fatal" id="BR-G-02">[BR-G-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “G” shall contain the Seller's VAT identifier (BT-30). </assert>
    <assert test="$BR-G-05" flag="fatal" id="BR-G-05">[BR-G-05]-In an Invoice line where the Invoice item VAT category code (BT-142) is "G" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </assert>
    <assert test="$BR-G-07" flag="fatal" id="BR-G-07">[BR-G-07]-In an Invoice line where the Invoice item VAT category code (BT-142) is "G" the invoiced item VAT exemption reasons text (BT-144) shall be "Export outside the EU" (or the equivalent standard text in other languages). </assert>
  </rule>
  <rule context="$VATIC">
    <assert test="$BR-IC-02" flag="fatal" id="BR-IC-02">[BR-IC-02]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where the VAT category code (BT-111) is “IC” shall be 0 (zero). </assert>
    <assert test="$BR-IC-08" flag="fatal" id="BR-IC-08">[BR-IC-08]-In an Invoice with a VAT breakdown (BG-21) where the VAT category code (BT-111) is "IC" the actual delivery date (BT-69) shall not be blank. </assert>
    <assert test="$BR-IC-09" flag="fatal" id="BR-IC-09">[BR-IC-09]-In an Invoice with a VAT breakdown (BG-21) where the VAT category code (BT-111) is "IC" the deliver to country code (BT-75) shall not be blank. </assert>
    <assert test="$BR-IC-10" flag="fatal" id="BR-IC-10">[BR-IC-10]-The VAT exemption reason text (BT-113) shall be "Intra community supply" (or the equivalent standard text in other languages) in the VAT breakdown (BG-21) if the VAT category code is "IC". </assert>
    <assert test="$BR-IC-11" flag="fatal" id="BR-IC-11">[BR-IC-11]-An Invoice with a VAT category code "IC" shall have the VAT category rate (BT-112) 0 (zero). </assert>
    <assert test="$BR-IC-12" flag="fatal" id="BR-IC-12">[BR-IC-12]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "IC" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amounts (BT-122) where the VAT category code (BT-142) is "IC" and VAT exemption reason text (BT-144) matches the exemption reason text (BT-113), minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category code (BT-142, BT-89, BT-96) is “IC". </assert>
  </rule>
  <rule context="$VATIC_Allowance">
    <assert test="$BR-IC-04" flag="fatal" id="BR-IC-04">[BR-IC-04]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "IC" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </assert>
  </rule>
  <rule context="$VATIC_Charge">
    <assert test="$BR-IC-05" flag="fatal" id="BR-IC-05">[BR-IC-05]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "IC" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </assert>
  </rule>
  <rule context="$VATIC_Line">
    <assert test="$BR-IC-01" flag="fatal" id="BR-IC-01">[BR-IC-01]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “IC” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "IC". </assert>
    <assert test="$BR-IC-03" flag="fatal" id="BR-IC-03">[BR-IC-03]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “IC” shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </assert>
    <assert test="$BR-IC-06" flag="fatal" id="BR-IC-06">[BR-IC-06]-In an Invoice line where the Invoice item VAT category code (BT-142) is "IC" the invoiced item VAT rate (BT-143) shall be 0 (zero). </assert>
    <assert test="$BR-IC-07" flag="fatal" id="BR-IC-07">[BR-IC-07]-In an Invoice line where the Invoice item VAT category code (BT-142) is "IC" the invoiced item VAT exemption reasons text (BT-144) shall be "Intra community supply" (or the equivalent standard text in other languages). </assert>
  </rule>
  <rule context="$VATO">
    <assert test="$BR-O-01" flag="fatal" id="BR-O-01">[BR-O-01]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as “O” shall not contain Seller's VAT identifier (BT-30) or Buyer's VAT identifier (BT-46). </assert>
    <assert test="$BR-O-02" flag="fatal" id="BR-O-02">[BR-O-02]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as "O" shall not contain other VAT category codes (BT-111) that are not "O". </assert>
    <assert test="$BR-O-04" flag="fatal" id="BR-O-04">[BR-O-04]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as "O" shall not contain a Document level allowances group (BG-18) where Document level allowance VAT category code (BT-89) is not "O". </assert>
    <assert test="$BR-O-05" flag="fatal" id="BR-O-05">[BR-O-05]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as "O" shall not contain a document Level charge group (BG-18) where Document level charge VAT category code (BT-96) is not "O". </assert>
    <assert test="$BR-O-07" flag="fatal" id="BR-O-07">[BR-O-07]-An Invoice where VAT category code (BT-111) is "O" shall not contain the VAT exemption reason text (BT-113). </assert>
  </rule>
  <rule context="$VATO_Line">
    <assert test="$BR-O-03" flag="fatal" id="BR-O-03">[BR-O-03]-An Invoice that contains a line where VAT category code (BT-142) is "O" shall not contain other lines where the Invoiced item VAT category code (BT-142) is not "O". </assert>
    <assert test="$BR-O-06" flag="fatal" id="BR-O-06">[BR-O-06]-An Invoice line where VAT category code (BT-142) is "O" shall not contain an invoiced item VAT rate (BT-143). </assert>
    <assert test="$BR-O-08" flag="fatal" id="BR-O-08">[BR-O-08]-An Invoice line where Invoiced item VAT category code (BT-142) is "O" shall not contain the Invoiced item VAT exemption reason text (BT-144). </assert>
  </rule>
  <rule context="$VATS">
    <assert test="$BR-S-03" flag="fatal" id="BR-S-03">[BR-S-03]-For each different value of VAT category rate (BT-112) where the VAT category code (BT-111) is "S", the VAT category taxable amount (BT-109) in a VAT breakdown (BG-21) shall equal the sum of Invoice line net amounts (BT-122) plus the sum of document level charge amount (BT-93) minus the sum of document level allowance amount (BT-86); where the VAT category code (BT-142, BT-96, BT-89) is “S” and the VAT rate (BT-143, BT-90, BT-97) equals the VAT category rate (BT-112). </assert>
    <assert test="$BR-S-04" flag="fatal" id="BR-S-04">[BR-S-04]-The VAT category tax amount (BT-110) in VAT breakdown (BG-21) shall equal the VAT category taxable amount (BT-109) multiplied by the VAT category rate (BT-112). </assert>
    <assert test="$BR-S-05" flag="fatal" id="BR-S-05">[BR-S-05]-An Invoice with a VAT category code "S" shall have the VAT category rate (BT-112) greater (&gt;) than 0 (zero). </assert>
    <assert test="$BR-S-07" flag="fatal" id="BR-S-07">[BR-S-07]-An Invoice where VAT category code (BT-111) is "S" shall not contain the VAT exemption reason text (BT-113) for that VAT category </assert>
  </rule>
  <rule context="$VATS_Line">
    <assert test="$BR-S-01" flag="fatal" id="BR-S-01">[BR-S-01]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “S” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "S". </assert>
    <assert test="$BR-S-02" flag="fatal" id="BR-S-02">[BR-S-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “S” shall contain the Seller's VAT identifier (BT-30). </assert>
    <assert test="$BR-S-06" flag="fatal" id="BR-S-06">[BR-S-06]-An Invoice line where Invoiced item VAT category code (BT-142) is "S" shall not contain the Invoiced item VAT exemption reason text (BT-144) for that line. </assert>
  </rule>
  <rule context="$VATZ">
    <assert test="$BR-Z-06" flag="fatal" id="BR-Z-06">[BR-Z-06]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "Z" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amounts where the VAT category codes (BT-142) is "Z" (BT-122) minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category codes (BT-142, BT-89, BT-96) are “Z". </assert>
    <assert test="$BR-Z-07" flag="fatal" id="BR-Z-07">[BR-Z-07]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where VAT category code (BT-111) is "Z" shall equal 0 (zero). </assert>
    <assert test="$BR-Z-08" flag="fatal" id="BR-Z-08">[BR-Z-08]-An Invoice with a VAT category code "Z" shall have the VAT category rate (BT-112) 0 (zero). </assert>
    <assert test="$BR-Z-10" flag="fatal" id="BR-Z-10">[BR-Z-10]-An Invoice where VAT category code (BT-111) is “Z” shall not contain the VAT exemption reason text (BT-113) for that VAT Category. </assert>
  </rule>
  <rule context="$VATZ_Allowance">
    <assert test="$BR-Z-04" flag="fatal" id="BR-Z-04">[BR-Z-04]-For a document level allowance (BG-18) where the Document level allowance VAT category code (BT-89) is "Z" the Document level allowance rate (BT-90) shall be 0 (zero). </assert>
  </rule>
  <rule context="$VATZ_Charge">
    <assert test="$BR-Z-05" flag="fatal" id="BR-Z-05">[BR-Z-05]-For a document level charge (BG-19) where the document level charge VAT category code (BT-96) is "Z" the Document level allowance rate (BT-97) shall be 0 (zero). </assert>
  </rule>
  <rule context="$VATZ_Line">
    <assert test="$BR-Z-01" flag="fatal" id="BR-Z-01">[BR-Z-01]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “Z” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "Z". </assert>
    <assert test="$BR-Z-02" flag="fatal" id="BR-Z-02">[BR-Z-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “Z” shall contain the Seller's VAT identifier (BT-30). </assert>
    <assert test="$BR-Z-03" flag="fatal" id="BR-Z-03">[BR-Z-03]-In an Invoice line where the Invoice item VAT category code (BT-142) is "Z" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </assert>
    <assert test="$BR-Z-09" flag="fatal" id="BR-Z-09">[BR-Z-09]-An Invoice line where Invoiced item VAT category code (BT-142) is "Z" shall not contain the Invoiced item VAT exemption reason text (BT-144) for that line. </assert>
  </rule>
</pattern>
