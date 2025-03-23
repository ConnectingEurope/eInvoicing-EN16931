<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->
<!-- Abstract rules for model -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="model">
  <rule context="$Additional_supporting_documents ">
    <assert test="$BR-52" flag="fatal" id="BR-52">[BR-52]-Each Additional supporting document (BG-24) shall contain a Supporting document reference (BT-122).</assert>
  </rule>
  <rule context="$Amount_due">
    <assert test="$BR-CO-25" flag="fatal" id="BR-CO-25">[BR-CO-25]-In case the Amount due for payment (BT-115) is positive, either the Payment due date (BT-9) or the Payment terms (BT-20) shall be present.</assert>
  </rule>
  <rule context="$Buyer_electronic_address">
    <assert test="$BR-63" flag="fatal" id="BR-63">[BR-63]-The Buyer electronic address (BT-49) shall have a Scheme identifier.</assert>
  </rule>
  <rule context="$Buyer_postal_address">
    <assert test="$BR-11" flag="fatal" id="BR-11">[BR-11]-The Buyer postal address shall contain a Buyer country code (BT-55).</assert>
  </rule>
  <rule context="$Card_information ">
    <assert test="$BR-51" flag="warning" id="BR-51">[BR-51]-In accordance with card payments security standards an invoice should never include a full card primary account number (BT-87). At the moment PCI Security Standards Council has defined that the first 6 digits and last 4 digits are the maximum number of digits to be shown.</assert>
  </rule>
  <rule context="$Deliver_to_address">
    <assert test="$BR-57" flag="fatal" id="BR-57">[BR-57]-Each Deliver to address (BG-15) shall contain a Deliver to country code (BT-80).</assert>
  </rule>
  <rule context="$Document_level_allowances ">
    <assert test="$BR-31" flag="fatal" id="BR-31">[BR-31]-Each Document level allowance (BG-20) shall have a Document level allowance amount (BT-92).</assert>
    <assert test="$BR-32" flag="fatal" id="BR-32">[BR-32]-Each Document level allowance (BG-20) shall have a Document level allowance VAT category code (BT-95).</assert>
    <assert test="$BR-33" flag="fatal" id="BR-33">[BR-33]-Each Document level allowance (BG-20) shall have a Document level allowance reason (BT-97) or a Document level allowance reason code (BT-98).</assert>
    <assert test="$BR-CO-05" flag="fatal" id="BR-CO-05">[BR-CO-05]-Document level allowance reason code (BT-98) and Document level allowance reason (BT-97) shall indicate the same type of allowance.</assert>
    <assert test="$BR-CO-21" flag="fatal" id="BR-CO-21">[BR-CO-21]-Each Document level allowance (BG-20) shall contain a Document level allowance reason (BT-97) or a Document level allowance reason code (BT-98), or both.</assert>
    <assert test="$BR-DEC-01" flag="fatal" id="BR-DEC-01">[BR-DEC-01]-The allowed maximum number of decimals for the Document level allowance amount (BT-92) is 2.</assert>
    <assert test="$BR-DEC-02" flag="fatal" id="BR-DEC-02">[BR-DEC-02]-The allowed maximum number of decimals for the Document level allowance base amount (BT-93) is 2.</assert>
  </rule>
  <rule context="$Document_level_charges ">
    <assert test="$BR-36" flag="fatal" id="BR-36">[BR-36]-Each Document level charge (BG-21) shall have a Document level charge amount (BT-99).</assert>
    <assert test="$BR-37" flag="fatal" id="BR-37">[BR-37]-Each Document level charge (BG-21) shall have a Document level charge VAT category code (BT-102).</assert>
    <assert test="$BR-38" flag="fatal" id="BR-38">[BR-38]-Each Document level charge (BG-21) shall have a Document level charge reason (BT-104) or a Document level charge reason code (BT-105).</assert>
    <assert test="$BR-CO-06" flag="fatal" id="BR-CO-06">[BR-CO-06]-Document level charge reason code (BT-105) and Document level charge reason (BT-104) shall indicate the same type of charge.</assert>
    <assert test="$BR-CO-22" flag="fatal" id="BR-CO-22">[BR-CO-22]-Each Document level charge (BG-21) shall contain a Document level charge reason (BT-104) or a Document level charge reason code (BT-105), or both.</assert>
    <assert test="$BR-DEC-05" flag="fatal" id="BR-DEC-05">[BR-DEC-05]-The allowed maximum number of decimals for the Document level charge amount (BT-99) is 2.</assert>
    <assert test="$BR-DEC-06" flag="fatal" id="BR-DEC-06">[BR-DEC-06]-The allowed maximum number of decimals for the Document level charge base amount (BT-100) is 2.</assert>
  </rule>
  <rule context="$Document_totals ">
    <assert test="$BR-12" flag="fatal" id="BR-12">[BR-12]-An Invoice shall have the Sum of Invoice line net amount (BT-106).</assert>
    <assert test="$BR-13" flag="fatal" id="BR-13">[BR-13]-An Invoice shall have the Invoice total amount without VAT (BT-109).</assert>
    <assert test="$BR-14" flag="fatal" id="BR-14">[BR-14]-An Invoice shall have the Invoice total amount with VAT (BT-112).</assert>
    <assert test="$BR-15" flag="fatal" id="BR-15">[BR-15]-An Invoice shall have the Amount due for payment (BT-115).</assert>
    <assert test="$BR-CO-10" flag="fatal" id="BR-CO-10">[BR-CO-10]-Sum of Invoice line net amount (BT-106) = Σ Invoice line net amount (BT-131).</assert>
    <assert test="$BR-CO-11" flag="fatal" id="BR-CO-11">[BR-CO-11]-Sum of allowances on document level (BT-107) = Σ Document level allowance amount (BT-92).</assert>
    <assert test="$BR-CO-12" flag="fatal" id="BR-CO-12">[BR-CO-12]-Sum of charges on document level (BT-108) = Σ Document level charge amount (BT-99).</assert>
    <assert test="$BR-CO-13" flag="fatal" id="BR-CO-13">[BR-CO-13]-Invoice total amount without VAT (BT-109) = Σ Invoice line net amount (BT-131) - Sum of allowances on document level (BT-107) + Sum of charges on document level (BT-108).</assert>
    <assert test="$BR-CO-16" flag="fatal" id="BR-CO-16">[BR-CO-16]-Amount due for payment (BT-115) = Invoice total amount with VAT (BT-112) -Paid amount (BT-113) +Rounding amount (BT-114).</assert>
    <assert test="$BR-DEC-09" flag="fatal" id="BR-DEC-09">[BR-DEC-09]-The allowed maximum number of decimals for the Sum of Invoice line net amount (BT-106) is 2.</assert>
    <assert test="$BR-DEC-10" flag="fatal" id="BR-DEC-10">[BR-DEC-10]-The allowed maximum number of decimals for the Sum of allowanced on document level (BT-107) is 2.</assert>
    <assert test="$BR-DEC-11" flag="fatal" id="BR-DEC-11">[BR-DEC-11]-The allowed maximum number of decimals for the Sum of charges on document level (BT-108) is 2.</assert>
    <assert test="$BR-DEC-12" flag="fatal" id="BR-DEC-12">[BR-DEC-12]-The allowed maximum number of decimals for the Invoice total amount without VAT (BT-109) is 2.</assert>
    <assert test="$BR-DEC-14" flag="fatal" id="BR-DEC-14">[BR-DEC-14]-The allowed maximum number of decimals for the Invoice total amount with VAT (BT-112) is 2.</assert>
    <assert test="$BR-DEC-16" flag="fatal" id="BR-DEC-16">[BR-DEC-16]-The allowed maximum number of decimals for the Paid amount (BT-113) is 2.</assert>
    <assert test="$BR-DEC-17" flag="fatal" id="BR-DEC-17">[BR-DEC-17]-The allowed maximum number of decimals for the Rounding amount (BT-114) is 2.</assert>
    <assert test="$BR-DEC-18" flag="fatal" id="BR-DEC-18">[BR-DEC-18]-The allowed maximum number of decimals for the Amount due for payment (BT-115) is 2.  </assert>
  </rule>
  <rule context="$Invoice ">
    <assert test="$BR-01" flag="fatal" id="BR-01">[BR-01]-An Invoice shall have a Specification identifier (BT-24).   </assert>
    <assert test="$BR-02" flag="fatal" id="BR-02">[BR-02]-An Invoice shall have an Invoice number (BT-1).</assert>
    <assert test="$BR-03" flag="fatal" id="BR-03">[BR-03]-An Invoice shall have an Invoice issue date (BT-2).</assert>
    <assert test="$BR-04" flag="fatal" id="BR-04">[BR-04]-An Invoice shall have an Invoice type code (BT-3).</assert>
    <assert test="$BR-05" flag="fatal" id="BR-05">[BR-05]-An Invoice shall have an Invoice currency code (BT-5).</assert>
    <assert test="$BR-06" flag="fatal" id="BR-06">[BR-06]-An Invoice shall contain the Seller name (BT-27).</assert>
    <assert test="$BR-07" flag="fatal" id="BR-07">[BR-07]-An Invoice shall contain the Buyer name (BT-44).</assert>
    <assert test="$BR-08" flag="fatal" id="BR-08">[BR-08]-An Invoice shall contain the Seller postal address. </assert>
    <assert test="$BR-10" flag="fatal" id="BR-10">[BR-10]-An Invoice shall contain the Buyer postal address (BG-8).</assert>
    <assert test="$BR-16" flag="fatal" id="BR-16">[BR-16]-An Invoice shall have at least one Invoice line (BG-25)</assert>
    <assert test="$BR-53" flag="fatal" id="BR-53">[BR-53]-If the VAT accounting currency code (BT-6) is present, then the Invoice total VAT amount in accounting currency (BT-111) shall be provided.</assert>
    <assert test="$BR-66" flag="fatal" id="BR-66">[BR-66]-An Invoice shall contain maximum one Payment Card account (BG-18).</assert>
    <assert test="$BR-67" flag="fatal" id="BR-67">[BR-67]-An Invoice shall contain maximum one Payment Mandate (BG-19).</assert>
    <assert test="$BR-AE-01" flag="fatal" id="BR-AE-01">[BR-AE-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Reverse charge" shall contain in the VAT Breakdown (BG-23) exactly one VAT category code (BT-118) equal with "VAT reverse charge".</assert>
    <assert test="$BR-AE-02" flag="fatal" id="BR-AE-02">[BR-AE-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Reverse charge" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) and/or the Buyer legal registration identifier (BT-47).</assert>
    <assert test="$BR-AE-03" flag="fatal" id="BR-AE-03">[BR-AE-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Reverse charge" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) and/or the Buyer legal registration identifier (BT-47).</assert>
    <assert test="$BR-AE-04" flag="fatal" id="BR-AE-04">[BR-AE-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Reverse charge" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) and/or the Buyer legal registration identifier (BT-47).</assert>
    <assert test="$BR-CO-03" flag="fatal" id="BR-CO-03">[BR-CO-03]-Value added tax point date (BT-7) and Value added tax point date code (BT-8) are mutually exclusive.</assert>
    <assert test="$BR-CO-15" flag="fatal" id="BR-CO-15">[BR-CO-15]-Invoice total amount with VAT (BT-112) = Invoice total amount without VAT (BT-109) + Invoice total VAT amount (BT-110).</assert>
    <assert test="$BR-CO-18" flag="fatal" id="BR-CO-18">[BR-CO-18]-An Invoice shall at least have one VAT breakdown group (BG-23).</assert>
    <assert test="$BR-DEC-13" flag="fatal" id="BR-DEC-13">[BR-DEC-13]-The allowed maximum number of decimals for the Invoice total VAT amount (BT-110) is 2.</assert>
    <assert test="$BR-DEC-15" flag="fatal" id="BR-DEC-15">[BR-DEC-15]-The allowed maximum number of decimals for the Invoice total VAT amount in accounting currency (BT-111) is 2.</assert>
    <assert test="$BR-E-01" flag="fatal" id="BR-E-01">[BR-E-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Exempt from VAT" shall contain exactly one VAT breakdown (BG-23) with the VAT category code (BT-118) equal to "Exempt from VAT".</assert>
    <assert test="$BR-E-02" flag="fatal" id="BR-E-02">[BR-E-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Exempt from VAT" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-E-03" flag="fatal" id="BR-E-03">[BR-E-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Exempt from VAT" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-E-04" flag="fatal" id="BR-E-04">[BR-E-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Exempt from VAT" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-G-01" flag="fatal" id="BR-G-01">[BR-G-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Export outside the EU" shall contain in the VAT breakdown (BG-23) exactly one VAT category code (BT-118) equal with "Export outside the EU".</assert>
    <assert test="$BR-G-02" flag="fatal" id="BR-G-02">[BR-G-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Export outside the EU" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-G-03" flag="fatal" id="BR-G-03">[BR-G-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Export outside the EU" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-G-04" flag="fatal" id="BR-G-04">[BR-G-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Export outside the EU" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-IC-01" flag="fatal" id="BR-IC-01">[BR-IC-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Intra-community supply" shall contain in the VAT breakdown (BG-23) exactly one VAT category code (BT-118) equal with "Intra-community supply".</assert>
    <assert test="$BR-IC-02" flag="fatal" id="BR-IC-02">[BR-IC-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Intra-community supply" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48).</assert>
    <assert test="$BR-IC-03" flag="fatal" id="BR-IC-03">[BR-IC-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Intra-community supply" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48).</assert>
    <assert test="$BR-IC-04" flag="fatal" id="BR-IC-04">[BR-IC-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Intra-community supply" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48).</assert>
    <assert test="$BR-IC-11" flag="fatal" id="BR-IC-11">[BR-IC-11]-In an Invoice with a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" the Actual delivery date (BT-72) or the Invoicing period (BG-14) shall not be blank.</assert>
    <assert test="$BR-IC-12" flag="fatal" id="BR-IC-12">[BR-IC-12]-In an Invoice with a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" the Deliver to country code (BT-80) shall not be blank.</assert>
    <assert test="$BR-AF-01" flag="fatal" id="BR-AF-01">[BR-AF-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "IGIC" shall contain in the VAT breakdown (BG-23) at least one VAT category code (BT-118) equal with "IGIC".</assert>
    <assert test="$BR-AF-02" flag="fatal" id="BR-AF-02">[BR-AF-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IGIC" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-AF-03" flag="fatal" id="BR-AF-03">[BR-AF-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IGIC" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-AF-04" flag="fatal" id="BR-AF-04">[BR-AF-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IGIC" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-AG-01" flag="fatal" id="BR-AG-01">[BR-AG-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "IPSI" shall contain in the VAT breakdown (BG-23) at least one VAT category code (BT-118) equal with "IPSI".</assert>
    <assert test="$BR-AG-02" flag="fatal" id="BR-AG-02">[BR-AG-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IPSI" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-AG-03" flag="fatal" id="BR-AG-03">[BR-AG-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IPSI" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-AG-04" flag="fatal" id="BR-AG-04">[BR-AG-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IPSI" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-O-01" flag="fatal" id="BR-O-01">[BR-O-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Not subject to VAT" shall contain exactly one VAT breakdown group (BG-23) with the VAT category code (BT-118) equal to "Not subject to VAT".</assert>
    <assert test="$BR-O-02" flag="fatal" id="BR-O-02">[BR-O-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Not subject to VAT" shall not contain the Seller VAT identifier (BT-31), the Seller tax representative VAT identifier (BT-63) or the Buyer VAT identifier (BT-48).</assert>
    <assert test="$BR-O-03" flag="fatal" id="BR-O-03">[BR-O-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Not subject to VAT" shall not contain the Seller VAT identifier (BT-31), the Seller tax representative VAT identifier (BT-63) or the Buyer VAT identifier (BT-48).</assert>
    <assert test="$BR-O-04" flag="fatal" id="BR-O-04">[BR-O-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Not subject to VAT" shall not contain the Seller VAT identifier (BT-31), the Seller tax representative VAT identifier (BT-63) or the Buyer VAT identifier (BT-48).</assert>
    <assert test="$BR-O-11" flag="fatal" id="BR-O-11">[BR-O-11]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain other VAT breakdown groups (BG-23).</assert>
    <assert test="$BR-O-12" flag="fatal" id="BR-O-12">[BR-O-12]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is not "Not subject to VAT".</assert>
    <assert test="$BR-O-13" flag="fatal" id="BR-O-13">[BR-O-13]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain Document level allowances (BG-20) where Document level allowance VAT category code (BT-95) is not "Not subject to VAT".</assert>
    <assert test="$BR-O-14" flag="fatal" id="BR-O-14">[BR-O-14]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain Document level charges (BG-21) where Document level charge VAT category code (BT-102) is not "Not subject to VAT".</assert>
    <assert test="$BR-S-01" flag="fatal" id="BR-S-01">[BR-S-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Standard rated" shall contain in the VAT breakdown (BG-23) at least one VAT category code (BT-118) equal with "Standard rated".</assert>
    <assert test="$BR-S-02" flag="fatal" id="BR-S-02">[BR-S-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Standard rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-S-03" flag="fatal" id="BR-S-03">[BR-S-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Standard rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-S-04" flag="fatal" id="BR-S-04">[BR-S-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Standard rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-Z-01" flag="fatal" id="BR-Z-01">[BR-Z-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Zero rated" shall contain in the VAT breakdown (BG-23) exactly one VAT category code (BT-118) equal with "Zero rated".</assert>
    <assert test="$BR-Z-02" flag="fatal" id="BR-Z-02">[BR-Z-02]-An Invoice that contains an Invoice line where the Invoiced item VAT category code (BT-151) is "Zero rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-Z-03" flag="fatal" id="BR-Z-03">[BR-Z-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Zero rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-Z-04" flag="fatal" id="BR-Z-04">[BR-Z-04]-An Invoice that contains a Document level charge where the Document level charge VAT category code (BT-102) is "Zero rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    <assert test="$BR-B-01" flag="fatal" id="BR-B-01">[BR-B-01]-An Invoice where the VAT category code (BT-151, BT-95 or BT-102) is “Split payment” shall be a domestic Italian invoice.</assert>
    <assert test="$BR-B-02" flag="fatal" id="BR-B-02">[BR-B-02]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is “Split payment" shall not contain an invoice line (BG-25), a Document level allowance (BG-20) or  a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is “Standard rated”.</assert>
  </rule>
  <rule context="$Invoice_Line ">
    <assert test="$BR-21" flag="fatal" id="BR-21">[BR-21]-Each Invoice line (BG-25) shall have an Invoice line identifier (BT-126).</assert>
    <assert test="$BR-22" flag="fatal" id="BR-22">[BR-22]-Each Invoice line (BG-25) shall have an Invoiced quantity (BT-129).</assert>
    <assert test="$BR-23" flag="fatal" id="BR-23">[BR-23]-An Invoice line (BG-25) shall have an Invoiced quantity unit of measure code (BT-130).</assert>
    <assert test="$BR-24" flag="fatal" id="BR-24">[BR-24]-Each Invoice line (BG-25) shall have an Invoice line net amount (BT-131).</assert>
    <assert test="$BR-25" flag="fatal" id="BR-25">[BR-25]-Each Invoice line (BG-25) shall contain the Item name (BT-153).</assert>
    <assert test="$BR-26" flag="fatal" id="BR-26">[BR-26]-Each Invoice line (BG-25) shall contain the Item net price (BT-146).</assert>
    <assert test="$BR-27" flag="fatal" id="BR-27">[BR-27]-The Item net price (BT-146) shall NOT be negative.</assert>
    <assert test="$BR-28" flag="fatal" id="BR-28">[BR-28]-The Item gross price (BT-148) shall NOT be negative.</assert>
    <assert test="$BR-CO-04" flag="fatal" id="BR-CO-04">[BR-CO-04]-Each Invoice line (BG-25) shall be categorized with an Invoiced item VAT category code (BT-151).</assert>
    <assert test="$BR-DEC-23" flag="fatal" id="BR-DEC-23">[BR-DEC-23]-The allowed maximum number of decimals for the Invoice line net amount (BT-131) is 2.</assert>
  </rule>
  <rule context="$Invoice_line_allowances ">
    <assert test="$BR-41" flag="fatal" id="BR-41">[BR-41]-Each Invoice line allowance (BG-27) shall have an Invoice line allowance amount (BT-136).</assert>
    <assert test="$BR-42" flag="fatal" id="BR-42">[BR-42]-Each Invoice line allowance (BG-27) shall have an Invoice line allowance reason (BT-139) or an Invoice line allowance reason code (BT-140).</assert>
    <assert test="$BR-CO-07" flag="fatal" id="BR-CO-07">[BR-CO-07]-Invoice line allowance reason code (BT-140) and Invoice line allowance reason (BT-139) shall indicate the same type of allowance reason.</assert>
    <assert test="$BR-CO-23" flag="fatal" id="BR-CO-23">[BR-CO-23]-Each Invoice line allowance (BG-27) shall contain an Invoice line allowance reason (BT-139) or an Invoice line allowance reason code (BT-140), or both.</assert>
    <assert test="$BR-DEC-24" flag="fatal" id="BR-DEC-24">[BR-DEC-24]-The allowed maximum number of decimals for the Invoice line allowance amount (BT-136) is 2.</assert>
    <assert test="$BR-DEC-25" flag="fatal" id="BR-DEC-25">[BR-DEC-25]-The allowed maximum number of decimals for the Invoice line allowance base amount (BT-137) is 2.</assert>
  </rule>
  <rule context="$Invoice_line_charges ">
    <assert test="$BR-43" flag="fatal" id="BR-43">[BR-43]-Each Invoice line charge (BG-28) shall have an Invoice line charge amount (BT-141).</assert>
    <assert test="$BR-44" flag="fatal" id="BR-44">[BR-44]-Each Invoice line charge shall have an Invoice line charge reason or an invoice line allowance reason code. </assert>
    <assert test="$BR-CO-08" flag="fatal" id="BR-CO-08">[BR-CO-08]-Invoice line charge reason code (BT-145) and Invoice line charge reason (BT-144) shall indicate the same type of charge reason.</assert>
    <assert test="$BR-CO-24" flag="fatal" id="BR-CO-24">[BR-CO-24]-Each Invoice line charge (BG-28) shall contain an Invoice line charge reason (BT-144) or an Invoice line charge reason code (BT-145), or both.</assert>
    <assert test="$BR-DEC-27" flag="fatal" id="BR-DEC-27">[BR-DEC-27]-The allowed maximum number of decimals for the Invoice line charge amount (BT-141) is 2.</assert>
    <assert test="$BR-DEC-28" flag="fatal" id="BR-DEC-28">[BR-DEC-28]-The allowed maximum number of decimals for the Invoice line charge base amount (BT-142) is 2.</assert>
  </rule>
  <rule context="$Invoice_Line_Period ">
    <assert test="$BR-30" flag="fatal" id="BR-30">[BR-30]-If both Invoice line period start date (BT-134) and Invoice line period end date (BT-135) are given then the Invoice line period end date (BT-135) shall be later or equal to the Invoice line period start date (BT-134).</assert>
    <assert test="$BR-CO-20" flag="fatal" id="BR-CO-20">[BR-CO-20]-If Invoice line period (BG-26) is used, the Invoice line period start date (BT-134) or the Invoice line period end date (BT-135) shall be filled, or both.</assert>
  </rule>
  <rule context="$Invoice_Period ">
    <assert test="$BR-29" flag="fatal" id="BR-29">[BR-29]-If both Invoicing period start date (BT-73) and Invoicing period end date (BT-74) are given then the Invoicing period end date (BT-74) shall be later or equal to the Invoicing period start date (BT-73).</assert>
    <assert test="$BR-CO-19" flag="fatal" id="BR-CO-19">[BR-CO-19]-If Invoicing period (BG-14) is used, the Invoicing period start date (BT-73) or the Invoicing period end date (BT-74) shall be filled, or both.</assert>
  </rule>
  <rule context="$Item_attributes ">
    <assert test="$BR-54" flag="fatal" id="BR-54">[BR-54]-Each Item attribute (BG-32) shall contain an Item attribute name (BT-160) and an Item attribute value (BT-161).</assert>
  </rule>
  <rule context="$Item_classification_identifier">
    <assert test="$BR-65" flag="fatal" id="BR-65">[BR-65]-The Item classification identifier (BT-158) shall have a Scheme identifier.</assert>
  </rule>
  <rule context="$Item_standard_identifier">
    <assert test="$BR-64" flag="fatal" id="BR-64">[BR-64]-The Item standard identifier (BT-157) shall have a Scheme identifier.</assert>
  </rule>
  <rule context="$Note">
    <assert test="$BR-CL-08" flag="fatal" id="BR-CL-08">[BR-CL-08]-Invoiced note subject code shall be coded using UNCL4451</assert>
  </rule>
  <rule context="$Payee">
    <assert test="$BR-17" flag="fatal" id="BR-17">[BR-17]-The Payee name (BT-59) shall be provided in the Invoice, if the Payee (BG-10) is different from the Seller (BG-4)</assert>
  </rule>
  <rule context="$Payee_Financial_Account">
    <assert test="$BR-50" flag="fatal" id="BR-50">[BR-50]-A Payment account identifier (BT-84) shall be present if Credit transfer (BG-17) information is provided in the Invoice.</assert>
  </rule>
  <rule context="$Payment_instructions ">
    <assert test="$BR-49" flag="fatal" id="BR-49">[BR-49]-A Payment instruction (BG-16) shall specify the Payment means type code (BT-81).</assert>
    <assert test="$BR-61" flag="fatal" id="BR-61">[BR-61]-If the Payment means type code (BT-81) means SEPA credit transfer, Local credit transfer or Non-SEPA international credit transfer, the Payment account identifier (BT-84) shall be present.</assert>
  </rule>
  <rule context="$Preceding_Invoice">
    <assert test="$BR-55" flag="fatal" id="BR-55">[BR-55]-Each Preceding Invoice reference (BG-3) shall contain a Preceding Invoice reference (BT-25).</assert>
  </rule>
  <rule context="$Seller">
    <assert test="$BR-CO-26" flag="fatal" id="BR-CO-26">[BR-CO-26]-In order for the buyer to automatically identify a supplier, the Seller identifier (BT-29), the Seller legal registration identifier (BT-30) and/or the Seller VAT identifier (BT-31) shall be present.  </assert>
  </rule>
  <rule context="$Seller_electronic_address">
    <assert test="$BR-62" flag="fatal" id="BR-62">[BR-62]-The Seller electronic address (BT-34) shall have a Scheme identifier.</assert>
  </rule>
  <rule context="$Seller_postal_address">
    <assert test="$BR-09" flag="fatal" id="BR-09">[BR-09]-The Seller postal address (BG-5) shall contain a Seller country code (BT-40).</assert>
  </rule>
  <rule context="$Tax_Representative">
    <assert test="$BR-18" flag="fatal" id="BR-18">[BR-18]-The Seller tax representative name (BT-62) shall be provided in the Invoice, if the Seller (BG-4) has a Seller tax representative party (BG-11)</assert>
    <assert test="$BR-19" flag="fatal" id="BR-19">[BR-19]-The Seller tax representative postal address (BG-12) shall be provided in the Invoice, if the Seller (BG-4) has a Seller tax representative party (BG-11).</assert>
    <assert test="$BR-56" flag="fatal" id="BR-56">[BR-56]-Each Seller tax representative party (BG-11) shall have a Seller tax representative VAT identifier (BT-63).</assert>
  </rule>
  <rule context="$Tax_Representative_postal_address">
    <assert test="$BR-20" flag="fatal" id="BR-20">[BR-20]-The Seller tax representative postal address (BG-12) shall contain a Tax representative country code (BT-69), if the Seller (BG-4) has a Seller tax representative party (BG-11).</assert>
  </rule>
  <rule context="$Tax_Total">
    <assert test="$BR-CO-14" flag="fatal" id="BR-CO-14">[BR-CO-14]-Invoice total VAT amount (BT-110) = Σ VAT category tax amount (BT-117).</assert>
  </rule>
  <rule context="$VAT_breakdown ">
    <assert test="$BR-45" flag="fatal" id="BR-45">[BR-45]-Each VAT breakdown (BG-23) shall have a VAT category taxable amount (BT-116).</assert>
    <assert test="$BR-46" flag="fatal" id="BR-46">[BR-46]-Each VAT breakdown (BG-23) shall have a VAT category tax amount (BT-117).</assert>
    <assert test="$BR-47" flag="fatal" id="BR-47">[BR-47]-Each VAT breakdown (BG-23) shall be defined through a VAT category code (BT-118).</assert>
    <assert test="$BR-48" flag="fatal" id="BR-48">[BR-48]-Each VAT breakdown (BG-23) shall have a VAT category rate (BT-119), except if the Invoice is not subject to VAT.</assert>
    <assert test="$BR-CO-17" flag="fatal" id="BR-CO-17">[BR-CO-17]-VAT category tax amount (BT-117) = VAT category taxable amount (BT-116) x (VAT category rate (BT-119) / 100), rounded to two decimals.</assert>
    <assert test="$BR-DEC-19" flag="fatal" id="BR-DEC-19">[BR-DEC-19]-The allowed maximum number of decimals for the VAT category taxable amount (BT-116) is 2.</assert>
    <assert test="$BR-DEC-20" flag="fatal" id="BR-DEC-20">[BR-DEC-20]-The allowed maximum number of decimals for the VAT category tax amount (BT-117) is 2.    </assert>
  </rule>
  <rule context="$VAT_identifiers ">
    <assert test="$BR-CO-09" flag="fatal" id="BR-CO-09">[BR-CO-09]-The Seller VAT identifier (BT-31), the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) shall have a prefix in accordance with ISO code ISO 3166-1 alpha-2 by which the country of issue may be identified. Nevertheless, Greece may use the prefix ‘EL’.</assert>
  </rule>
  <rule context="$VATAE">
    <assert test="$BR-AE-08" flag="fatal" id="BR-AE-08">[BR-AE-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Reverse charge" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Reverse charge".</assert>
    <assert test="$BR-AE-09" flag="fatal" id="BR-AE-09">[BR-AE-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Reverse charge" shall be 0 (zero).</assert>
    <assert test="$BR-AE-10" flag="fatal" id="BR-AE-10">[BR-AE-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Reverse charge" shall have a VAT exemption reason code (BT-121), meaning "Reverse charge" or the VAT exemption reason text (BT-120) "Reverse charge" (or the equivalent standard text in another language).</assert>
  </rule>
  <rule context="$VATAE_Allowance">
    <assert test="$BR-AE-06" flag="fatal" id="BR-AE-06">[BR-AE-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Reverse charge" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATAE_Charge">
    <assert test="$BR-AE-07" flag="fatal" id="BR-AE-07">[BR-AE-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Reverse charge" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATAE_Line">
    <assert test="$BR-AE-05" flag="fatal" id="BR-AE-05">[BR-AE-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Reverse charge" the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATE">
    <assert test="$BR-E-08" flag="fatal" id="BR-E-08">[BR-E-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Exempt from VAT" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Exempt from VAT".</assert>
    <assert test="$BR-E-09" flag="fatal" id="BR-E-09">[BR-E-09]-The VAT category tax amount (BT-117) In a VAT breakdown (BG-23) where the VAT category code (BT-118) equals "Exempt from VAT" shall equal 0 (zero).</assert>
    <assert test="$BR-E-10" flag="fatal" id="BR-E-10">[BR-E-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Exempt from VAT" shall have a VAT exemption reason code (BT-121) or a VAT exemption reason text (BT-120).</assert>
  </rule>
  <rule context="$VATE_Allowance">
    <assert test="$BR-E-06" flag="fatal" id="BR-E-06">[BR-E-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Exempt from VAT", the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATE_Charge">
    <assert test="$BR-E-07" flag="fatal" id="BR-E-07">[BR-E-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Exempt from VAT", the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATE_Line">
    <assert test="$BR-E-05" flag="fatal" id="BR-E-05">[BR-E-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Exempt from VAT", the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATG">
    <assert test="$BR-G-08" flag="fatal" id="BR-G-08">[BR-G-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Export outside the EU" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Export outside the EU".</assert>
    <assert test="$BR-G-09" flag="fatal" id="BR-G-09">[BR-G-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Export outside the EU" shall be 0 (zero).</assert>
    <assert test="$BR-G-10" flag="fatal" id="BR-G-10">[BR-G-10]-A VAT breakdown (BG-23) with the VAT Category code (BT-118) "Export outside the EU" shall have a VAT exemption reason code (BT-121), meaning "Export outside the EU" or the VAT exemption reason text (BT-120) "Export outside the EU" (or the equivalent standard text in another language).</assert>
  </rule>
  <rule context="$VATG_Allowance">
    <assert test="$BR-G-06" flag="fatal" id="BR-G-06">[BR-G-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Export outside the EU" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATG_Charge">
    <assert test="$BR-G-07" flag="fatal" id="BR-G-07">[BR-G-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Export outside the EU" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATG_Line">
    <assert test="$BR-G-05" flag="fatal" id="BR-G-05">[BR-G-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Export outside the EU" the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATIC">
    <assert test="$BR-IC-08" flag="fatal" id="BR-IC-08">[BR-IC-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Intra-community supply".</assert>
    <assert test="$BR-IC-09" flag="fatal" id="BR-IC-09">[BR-IC-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" shall be 0 (zero).</assert>
    <assert test="$BR-IC-10" flag="fatal" id="BR-IC-10">[BR-IC-10]-A VAT breakdown (BG-23) with the VAT Category code (BT-118) "Intra-community supply" shall have a VAT exemption reason code (BT-121), meaning "Intra-community supply" or the VAT exemption reason text (BT-120) "Intra-community supply" (or the equivalent standard text in another language).</assert>
  </rule>
  <rule context="$VATIC_Allowance">
    <assert test="$BR-IC-06" flag="fatal" id="BR-IC-06">[BR-IC-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Intra-community supply" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATIC_Charge">
    <assert test="$BR-IC-07" flag="fatal" id="BR-IC-07">[BR-IC-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Intra-community supply" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATIC_Line">
    <assert test="$BR-IC-05" flag="fatal" id="BR-IC-05">[BR-IC-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Intracommunity supply" the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATIG">
    <assert test="$BR-AF-08" flag="fatal" id="BR-AF-08">[BR-AF-08]-For each different value of VAT category rate (BT-119) where the VAT category code (BT-118) is "IGIC", the VAT category taxable amount (BT-116) in a VAT breakdown (BG-23) shall equal the sum of Invoice line net amounts (BT-131) plus the sum of document level charge amounts (BT-99) minus the sum of document level allowance amounts (BT-92) where the VAT category code (BT-151, BT-102, BT-95) is "IGIC" and the VAT rate (BT-152, BT-103, BT-96) equals the VAT category rate (BT-119).</assert>
    <assert test="$BR-AF-09" flag="fatal" id="BR-AF-09">[BR-AF-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where VAT category code (BT-118) is "IGIC" shall equal the VAT category taxable amount (BT-116) multiplied by the VAT category rate (BT-119).</assert>
    <assert test="$BR-AF-10" flag="fatal" id="BR-AF-10">[BR-AF-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "IGIC" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).</assert>
  </rule>
  <rule context="$VATIG_Allowance">
    <assert test="$BR-AF-06" flag="fatal" id="BR-AF-06">[BR-AF-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IGIC" the Document level allowance VAT rate (BT-96) shall be 0 (zero) or greater than zero.</assert>
  </rule>
  <rule context="$VATIG_Charge">
    <assert test="$BR-AF-07" flag="fatal" id="BR-AF-07">[BR-AF-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IGIC" the Document level charge VAT rate (BT-103) shall be 0 (zero) or greater than zero.</assert>
  </rule>
  <rule context="$VATIG_Line">
    <assert test="$BR-AF-05" flag="fatal" id="BR-AF-05">[BR-AF-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IGIC" the invoiced item VAT rate (BT-152) shall be 0 (zero) or greater than zero.</assert>
  </rule>
  <rule context="$VATIP">
    <assert test="$BR-AG-08" flag="fatal" id="BR-AG-08">[BR-AG-08]-For each different value of VAT category rate (BT-119) where the VAT category code (BT-118) is "IPSI", the VAT category taxable amount (BT-116) in a VAT breakdown (BG-23) shall equal the sum of Invoice line net amounts (BT-131) plus the sum of document level charge amounts (BT-99) minus the sum of document level allowance amounts (BT-92) where the VAT category code (BT-151, BT-102, BT-95) is "IPSI" and the VAT rate (BT-152, BT-103, BT-96) equals the VAT category rate (BT-119).</assert>
    <assert test="$BR-AG-09" flag="fatal" id="BR-AG-09">[BR-AG-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where VAT category code (BT-118) is "IPSI" shall equal the VAT category taxable amount (BT-116) multiplied by the VAT category rate (BT-119).</assert>
    <assert test="$BR-AG-10" flag="fatal" id="BR-AG-10">[BR-AG-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "IPSI" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).</assert>
  </rule>
  <rule context="$VATIP_Allowance">
    <assert test="$BR-AG-06" flag="fatal" id="BR-AG-06">[BR-AG-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IPSI" the Document level allowance VAT rate (BT-96) shall be 0 (zero) or greater than zero.</assert>
  </rule>
  <rule context="$VATIP_Charge">
    <assert test="$BR-AG-07" flag="fatal" id="BR-AG-07">[BR-AG-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IPSI" the Document level charge VAT rate (BT-103) shall be 0 (zero) or greater than zero.</assert>
  </rule>
  <rule context="$VATIP_Line">
    <assert test="$BR-AG-05" flag="fatal" id="BR-AG-05">[BR-AG-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IPSI" the Invoiced item VAT rate (BT-152) shall be 0 (zero) or greater than zero.</assert>
  </rule>
  <rule context="$VATO">
    <assert test="$BR-O-08" flag="fatal" id="BR-O-08">[BR-O-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is " Not subject to VAT" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Not subject to VAT".</assert>
    <assert test="$BR-O-09" flag="fatal" id="BR-O-09">[BR-O-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Not subject to VAT" shall be 0 (zero).</assert>
    <assert test="$BR-O-10" flag="fatal" id="BR-O-10">[BR-O-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) " Not subject to VAT" shall have a VAT exemption reason code (BT-121), meaning " Not subject to VAT" or a VAT exemption reason text (BT-120) " Not subject to VAT" (or the equivalent standard text in another language).</assert>
  </rule>
  <rule context="$VATO_Allowance">
    <assert test="$BR-O-06" flag="fatal" id="BR-O-06">[BR-O-06]-A Document level allowance (BG-20) where VAT category code (BT-95) is "Not subject to VAT" shall not contain a Document level allowance VAT rate (BT-96).</assert>
  </rule>
  <rule context="$VATO_Charge">
    <assert test="$BR-O-07" flag="fatal" id="BR-O-07">[BR-O-07]-A Document level charge (BG-21) where the VAT category code (BT-102) is "Not subject to VAT" shall not contain a Document level charge VAT rate (BT-103).</assert>
  </rule>
  <rule context="$VATO_Line">
    <assert test="$BR-O-05" flag="fatal" id="BR-O-05">[BR-O-05]-An Invoice line (BG-25) where the VAT category code (BT-151) is "Not subject to VAT" shall not contain an Invoiced item VAT rate (BT-152).</assert>
  </rule>
  <rule context="$VATS">
    <assert test="$BR-S-08" flag="fatal" id="BR-S-08">[BR-S-08]-For each different value of VAT category rate (BT-119) where the VAT category code (BT-118) is "Standard rated", the VAT category taxable amount (BT-116) in a VAT breakdown (BG-23) shall equal the sum of Invoice line net amounts (BT-131) plus the sum of document level charge amounts (BT-99) minus the sum of document level allowance amounts (BT-92) where the VAT category code (BT-151, BT-102, BT-95) is "Standard rated" and the VAT rate (BT-152, BT-103, BT-96) equals the VAT category rate (BT-119).</assert>
    <assert test="$BR-S-09" flag="fatal" id="BR-S-09">[BR-S-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where VAT category code (BT-118) is "Standard rated" shall equal the VAT category taxable amount (BT-116) multiplied by the VAT category rate (BT-119).</assert>
    <assert test="$BR-S-10" flag="fatal" id="BR-S-10">[BR-S-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Standard rate" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).</assert>
  </rule>
  <rule context="$VATS_Allowance">
    <assert test="$BR-S-06" flag="fatal" id="BR-S-06">[BR-S-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Standard rated" the Document level allowance VAT rate (BT-96) shall be greater than zero.</assert>
  </rule>
  <rule context="$VATS_Charge">
    <assert test="$BR-S-07" flag="fatal" id="BR-S-07">[BR-S-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Standard rated" the Document level charge VAT rate (BT-103) shall be greater than zero.  </assert>
  </rule>
  <rule context="$VATS_Line">
    <assert test="$BR-S-05" flag="fatal" id="BR-S-05">[BR-S-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Standard rated" the Invoiced item VAT rate (BT-152) shall be greater than zero.</assert>
  </rule>
  <rule context="$VATZ">
    <assert test="$BR-Z-08" flag="fatal" id="BR-Z-08">[BR-Z-08]-In a VAT breakdown (BG-23) where VAT category code (BT-118) is "Zero rated" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amount (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Zero rated".</assert>
    <assert test="$BR-Z-09" flag="fatal" id="BR-Z-09">[BR-Z-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where VAT category code (BT-118) is "Zero rated" shall equal 0 (zero).</assert>
    <assert test="$BR-Z-10" flag="fatal" id="BR-Z-10">[BR-Z-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Zero rated" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).</assert>
  </rule>
  <rule context="$VATZ_Allowance">
    <assert test="$BR-Z-06" flag="fatal" id="BR-Z-06">[BR-Z-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Zero rated" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATZ_Charge">
    <assert test="$BR-Z-07" flag="fatal" id="BR-Z-07">[BR-Z-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Zero rated" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
  </rule>
  <rule context="$VATZ_Line">
    <assert test="$BR-Z-05" flag="fatal" id="BR-Z-05">[BR-Z-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Zero rated" the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
  </rule>
</pattern>
