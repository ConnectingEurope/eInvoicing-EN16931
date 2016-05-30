<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>TC434 bound to ISO 20625</title>
  <pattern id="TC434">
    <rule context="/M_INVOIC/S_UNH/D_0062">
      <assert test="string-length(text()) &lt; 5" flag="fatal" id="dummy">Something must be present</assert>
    </rule>
  </pattern>  
</schema>
