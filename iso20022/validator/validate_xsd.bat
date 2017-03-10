set XSD_PATH=%1
set XML_PATH=%2

java -jar en16931-xml-validator-0.1.0-jar-with-dependencies.jar -xml %XML_PATH% -xsd %XSD_PATH%
