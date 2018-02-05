# validation
Schematron validation artefacts for CEN/TC 434

For each syntax a separate folder exists where all related artefacts are to be published.

  * `cii` - Cross Industry Invoice
    * XML Schemas overview: http://www.unece.org/cefact/xml_schemas/index.html
    * Used XML Schemas: http://www.unece.org/fileadmin/DAM/cefact/xml_schemas/D16B_SCRDM__Subset__CII.zip
    * Contact points
      * Andreas Pelekies
      * Tayfun Mermer (Testing and QA)
  * `ubl` - UBL 2.1 (ISO/IEC 19845:2015)
    * UBL Website: https://www.oasis-open.org/committees/ubl/
    * Used XML Schemas: http://docs.oasis-open.org/ubl/os-UBL-2.1/UBL-2.1.zip
    * Contact points
      * Oriol Bausa (Rules)
      * Siw Midtgard Meckelborg (Testing and QA)
  * `edifact` - UN/EDIFACT (and ISO 26025 based XML version)
    * Contact points
      * Andreas Pelekies
      * Jörg Walther (XML Schema)
      * Martin Krusch (Testing and QA)
      * Philip Helger (Java applications)
  * `iso20022` - Invoice based on ISO 20022 (**discontinued**)
    * Contact points
      * Zsoltan Patkai

# Development

For the Java projects contained in this repository, please consider the following prerequisites
  * Java JDK 1.8.x latest (was tested only with a JDK and not with a JRE)
  * Eclipse 4.6.x latest (m2e - Maven for Eclipse - must be contained)
  * For building on the commandline use Apache Maven 3.x (latest) 
 
 ## Create XSLTs from Schematrons
 
Invoke `mvn process-resources` after changes - it will regenerate the XSLTs from the source SCHs.
 