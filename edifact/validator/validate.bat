@ECHO OFF

echo Usage validate_transaction example_number

rem example number 1, 2, 3...
set EXAMPLE_NUMBER=%1

set CONVERT_PATH="1INVOIC2ISOXML\1INVOIC2ISOXML.exe"
set XSD_PATH="..\schema\INVOIC_D14B_ISO20625.xsd"
set SCHEMATRON_PATH="..\schematron\EN16931-EDIFACT-validation.sch"
set SCHEMATRON_PATH="..\stylesheet\EN16931-EDIFACT-validation-compiled.xsl"
set TXT_PATH="..\instance\EDIFACT_EXAMPLE%EXAMPLE_NUMBER%.txt"
set XML_PATH="..\instance\EDIFACT_EXAMPLE%EXAMPLE_NUMBER%.xml"

echo Conversion to XSD %CONVERT_PATH% %TXT_PATH%
call convert_2_xsd.bat %CONVERT_PATH% %TXT_PATH%
echo Conversion done!

echo Validating XSD %XSD_PATH% %XML_PATH%
call validate_xsd.bat %XSD_PATH% %XML_PATH%
echo XSD validation done!

echo Validating Schematron %SCHEMATRON_PATH% %XML_PATH%
call validate_schematron.bat %SCHEMATRON_PATH% %XML_PATH%
echo Schematron validation done!
