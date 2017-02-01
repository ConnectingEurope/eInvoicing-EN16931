# EDIFACT validator
This folder contains the the following tools:
  * A mapper from EDIFACT D14B to ISO 20625 XML files (`map2xml`)
    * This is only required for EDIFACT files
    * **This is currently not 100% correct - should be resolved until 2017-01-27**
    * Note: The `map2xml` project is the extracted content of the file `1INVOIC2ISOXML(JAVA).zip`
  * A commandline tool to validate an XML instance against XML schema and Schematron (`xmlvalidator`)
    * This can be used for UBL, CII and the ISO 20625 files (EDIFACT XML)
  * `validate.bat` and `validate-java.bat` are Windows batch files to perform the following steps on the example EDIFACT files to be found in https://github.com/CenPC434/validation/tree/master/edifact/instance
    1. Convert to ISO 20625 XML
    2. Perform XML Schema check (XSDs are in https://github.com/CenPC434/validation/tree/master/edifact/schema)
    3. Perform Schematron validation (rule files are in https://github.com/CenPC434/validation/tree/master/edifact/schematron)

Note: `validate.bat` is a Windows only batch file because it uses `1INVOIC2ISOXML\1INVOIC2ISOXML.exe` to perform the mapping. `validate-java` is a platform independent batch file that only uses Java applications (`map2xml-1.0-SNAPSHOT.jar` and `xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar`) to perform the validation.

##Prerequisites
To run the validations, please ensure that Java 1.8 JRE or JDK is installed on the machine where you run the validation
