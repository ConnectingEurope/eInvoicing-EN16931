set XSD_PATH=%1
set XML_PATH=%2

java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml %XML_PATH% -xsd %XSD_PATH%
