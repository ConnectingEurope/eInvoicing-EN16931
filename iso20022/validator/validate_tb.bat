@ECHO OFF

echo Usage validate_transaction example_number

set EXAMPLE_NUMBER=1

set XSD_PATH="..\schema\official_tsin.004.001.01.xsd"
set SCHEMATRON_PATH="..\schematron\EN16931-ISO20022-validation.sch"
set XML_PATH="..\instance\example_01_tsin.004.001.01.xml"

echo Validating XSD %XSD_PATH% %XML_PATH%
call validate_xsd.bat %XSD_PATH% %XML_PATH%
echo XSD validation done!

echo Validating Schematron %SCHEMATRON_PATH% %XML_PATH%
call validate_schematron.bat %SCHEMATRON_PATH% %XML_PATH%
echo Schematron validation done!
