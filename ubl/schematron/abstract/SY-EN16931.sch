<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for EN16931 -->
<!-- Timestamp: 2016-06-09 08:16:02 +0200 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="EN16931">
  <rule context="$Tax_subtotal">
    <assert test="$UBL-SR-35" flag="warning" id="UBL-SR-35">[UBL-SR-35]-VAT exemption reason text shall occur maximum once</assert>
  </rule>
  <rule context="$Tax_Representative">
    <assert test="$UBL-SR-22" flag="warning" id="UBL-SR-22">[UBL-SR-22]-Seller tax representative name shall occur maximum once, if the Seller has a tax representative</assert>
    <assert test="$UBL-SR-23" flag="warning" id="UBL-SR-23">[UBL-SR-23]-Seller tax representative VAT identifier shall occur maximum once, if the Seller has a tax representative</assert>
  </rule>
  <rule context="$Quantity_data_type">
    <assert test="$UBL-DT-03" flag="fatal" id="UBL-DT-03">[UBL-DT-03]-Quantities shall be decimal up to four fraction digits</assert>
  </rule>
  <rule context="$Price_data_type">
    <assert test="$UBL-DT-02" flag="fatal" id="UBL-DT-02">[UBL-DT-02]-Unit price shall be decimal up to four fraction digits</assert>
  </rule>
  <rule context="$Preceding_Invoice">
    <assert test="$UBL-SR-07" flag="warning" id="UBL-SR-07">[UBL-SR-07]-If there is a preceding invoice reference, the preceding invoice number shall be present</assert>
  </rule>
  <rule context="$Percent_data_type">
    <assert test="$UBL-DT-04" flag="fatal" id="UBL-DT-04">[UBL-DT-04]-Percentages shall be decimal up to four fraction digits</assert>
  </rule>
  <rule context="$Payment_instructions">
    <assert test="$UBL-SR-26" flag="warning" id="UBL-SR-26">[UBL-SR-26]-Payment reference shall occur maximum once</assert>
    <assert test="$UBL-SR-27" flag="warning" id="UBL-SR-27">[UBL-SR-27]-Payment means text shall occur maximum once</assert>
    <assert test="$UBL-SR-28" flag="warning" id="UBL-SR-28">[UBL-SR-28]-Mandate reference identifier shall occur maximum once</assert>
  </rule>
  <rule context="$Payee">
    <assert test="$UBL-SR-19" flag="warning" id="UBL-SR-19">[UBL-SR-19]-Payee name shall occur maximum once, if the Payee is different from the Seller</assert>
    <assert test="$UBL-SR-20" flag="warning" id="UBL-SR-20">[UBL-SR-20]-Payee identifier shall occur maximum once, if the Payee is different from the Seller</assert>
    <assert test="$UBL-SR-21" flag="warning" id="UBL-SR-21">[UBL-SR-21]-Payee legal registration identifier shall occur maximum once, if the Payee is different from the Seller</assert>
  </rule>
  <rule context="$Invoice_total_VAT">
    <assert test="$UBL-SR-33" flag="warning" id="UBL-SR-33">[UBL-SR-33]-Invoice total VAT amount shall occur maximum once</assert>
    <assert test="$UBL-SR-34" flag="warning" id="UBL-SR-34">[UBL-SR-34]-Invoice total VAT amount in accounting currency shall occur maximum once if present</assert>
  </rule>
  <rule context="$Invoice_line">
    <assert test="$UBL-SR-38" flag="warning" id="UBL-SR-38">[UBL-SR-38]-Invoice line note shall occur maximum once</assert>
    <assert test="$UBL-SR-39" flag="warning" id="UBL-SR-39">[UBL-SR-39]-Referenced purchase order line identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-40" flag="warning" id="UBL-SR-40">[UBL-SR-40]-Invoice line period shall occur maximum once</assert>
    <assert test="$UBL-SR-41" flag="warning" id="UBL-SR-41">[UBL-SR-41]-Invoice line allowance reason shall occur maximum once</assert>
    <assert test="$UBL-SR-42" flag="warning" id="UBL-SR-42">[UBL-SR-42]-Invoice line charge reason shall occur maximum once</assert>
    <assert test="$UBL-SR-43" flag="warning" id="UBL-SR-43">[UBL-SR-43]-Item price discount shall occur maximum once</assert>
    <assert test="$UBL-SR-44" flag="warning" id="UBL-SR-44">[UBL-SR-44]-Invoiced item VAT exemption reason text shall occur maximum once</assert>
  </rule>
  <rule context="$Invoice">
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
    <assert test="$UBL-SR-01" flag="warning" id="UBL-SR-01">[UBL-SR-01]-Contract identifier shall occur maximum once.</assert>
    <assert test="$UBL-SR-02" flag="warning" id="UBL-SR-02">[UBL-SR-02]-Receive advice identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-03" flag="warning" id="UBL-SR-03">[UBL-SR-03]-Despatch advice identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-04" flag="warning" id="UBL-SR-04">[UBL-SR-04]-Invoice note shall occur maximum once</assert>
    <assert test="$UBL-SR-05" flag="warning" id="UBL-SR-05">[UBL-SR-05]-Payment terms shall occur maximum once</assert>
    <assert test="$UBL-SR-06" flag="warning" id="UBL-SR-06">[UBL-SR-06]-Preceding invoice reference shall occur maximum once</assert>
    <assert test="$UBL-SR-08" flag="warning" id="UBL-SR-08">[UBL-SR-08]-Invoice period shall occur maximum once</assert>
    <assert test="$UBL-SR-09" flag="warning" id="UBL-SR-09">[UBL-SR-09]-Seller name shall occur maximum once</assert>
    <assert test="$UBL-SR-10" flag="warning" id="UBL-SR-10">[UBL-SR-10]-Seller trader name shall occur maximum once</assert>
    <assert test="$UBL-SR-11" flag="warning" id="UBL-SR-11">[UBL-SR-11]-Seller legal registration identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-12" flag="warning" id="UBL-SR-12">[UBL-SR-12]-Seller VAT identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-13" flag="warning" id="UBL-SR-13">[UBL-SR-13]-Seller tax registration shall occur maximum once</assert>
    <assert test="$UBL-SR-14" flag="warning" id="UBL-SR-14">[UBL-SR-14]-Seller additional legal information shall occur maximum once</assert>
    <assert test="$UBL-SR-15" flag="warning" id="UBL-SR-15">[UBL-SR-15]-Buyer name shall occur maximum once</assert>
    <assert test="$UBL-SR-16" flag="warning" id="UBL-SR-16">[UBL-SR-16]-Buyer identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-17" flag="warning" id="UBL-SR-17">[UBL-SR-17]-Buyer legal registration identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-18" flag="warning" id="UBL-SR-18">[UBL-SR-18]-Buyer VAT identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-24" flag="warning" id="UBL-SR-24">[UBL-SR-24]-Deliver to information shall occur maximum once</assert>
    <assert test="$UBL-SR-29" flag="warning" id="UBL-SR-29">[UBL-SR-29]-Bank creditor reference shall occur maximum once</assert>
  </rule>
  <rule context="$Document_level_charges">
    <assert test="$UBL-SR-31" flag="warning" id="UBL-SR-31">[UBL-SR-31]-Document level charge reason shall occur maximum once</assert>
    <assert test="$UBL-SR-32" flag="warning" id="UBL-SR-32">[UBL-SR-32]-Document level charge reason code shall occur maximum once</assert>
  </rule>
  <rule context="$Document_level_allowances">
    <assert test="$UBL-SR-30" flag="warning" id="UBL-SR-30">[UBL-SR-30]-Document level allowance reason shall occur maximum once</assert>
  </rule>
  <rule context="$Deliver_to">
    <assert test="$UBL-SR-25" flag="warning" id="UBL-SR-25">[UBL-SR-25]-Deliver to party name shall occur maximum once</assert>
  </rule>
  <rule context="$Code_data_type">
    <assert test="$UBL-DT-05" flag="fatal" id="UBL-DT-05">[UBL-DT-05]-Coded data elements shall contain the list identifier attribute</assert>
  </rule>
  <rule context="$Binary_object_data_type">
    <assert test="$UBL-DT-06" flag="fatal" id="UBL-DT-06">[UBL-DT-06]-Binary object elements shall contain the mime code attribute</assert>
    <assert test="$UBL-DT-07" flag="fatal" id="UBL-DT-07">[UBL-DT-07]-Binary object elements shall contain the file name attribute</assert>
  </rule>
  <rule context="$Amount_data_type">
    <assert test="$UBL-DT-01" flag="fatal" id="UBL-DT-01">[UBL-DT-01]-Amounts shall be decimal up to two fraction digits</assert>
  </rule>
  <rule context="$Additional_supporting_documents">
    <assert test="$UBL-SR-36" flag="warning" id="UBL-SR-36">[UBL-SR-36]-Supporting document identifier shall occur maximum once</assert>
    <assert test="$UBL-SR-37" flag="warning" id="UBL-SR-37">[UBL-SR-37]-Supporting document description shall occur maximum once</assert>
  </rule>
</pattern>
