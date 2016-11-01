@ECHO OFF

echo Usage validate_transaction example_number

rem example number 1, 2, 3...
set EXAMPLE_NUMBER=%1

set XSD_PATH=uncefact\data\standard\CrossIndustryInvoice_100pD16B.xsd
set SCHEMATRON_PATH="..\schematron\EN16931-CII-validation.sch"
set XML_PATH="..\instance\CII_example%EXAMPLE_NUMBER%.xml"

echo Validating XSD %XSD_PATH% %XML_PATH%
call validate_xsd.bat %XSD_PATH% %XML_PATH%
echo Done!

echo Validating Schematron %SCHEMATRON_PATH% %XML_PATH%
call validate_schematron.bat %SCHEMATRON_PATH% %XML_PATH%
echo Done!
