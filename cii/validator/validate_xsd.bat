set XSD_PATH=%1
set XML_PATH=%2

java -jar xmlvalidator-0.1.jar -xml %XML_PATH% -xsd %XSD_PATH%
