# CEN/TC 434 - EN-16931 - Validation artefacts
Official Schematron validation artefacts for CEN/TC 434.
This repository does not contain validation rules for any CIUS.

Latest release **v1.0.0** (2018-02-08) - https://github.com/CenPC434/validation/releases/tag/validation-1.0.0

For each syntax a separate folder exists where all related artefacts are to be published.

* `ubl` - UBL 2.1 (ISO/IEC 19845:2015) - EN mandatory syntax
  * UBL Website: https://www.oasis-open.org/committees/ubl/
  * Used XML Schemas: http://docs.oasis-open.org/ubl/os-UBL-2.1/UBL-2.1.zip
  * Contact points
    * Oriol Bausà (Rules)
    * Siw Midtgard Meckelborg (Testing and QA)
* `cii` - Cross Industry Invoice (D16B) - EN mandatory syntax
  * XML Schemas overview: http://www.unece.org/cefact/xml_schemas/index.html
  * Used XML Schemas: http://www.unece.org/fileadmin/DAM/cefact/xml_schemas/D16B_SCRDM__Subset__CII.zip
  * Contact points
    * Andreas Pelekies
    * Tayfun Mermer (Testing and QA)
* `edifact` - UN/EDIFACT (and ISO 26025 based XML version) - EN optional syntax
  * Contact points
    * Andreas Pelekies
    * Jörg Walther (XML Schema)
    * Martin Krusch (Testing and QA)
    * Philip Helger (Java applications)

# News and noteworthy

* v1.1.0 - work in progress (UBL and CII only)
    * Note: this release does NOT contain the EDIFACT validation rules - its development is currently paused/stalled
    * New participant identifier schemes are supported
        * `0184` in [issue #64](https://github.com/CenPC434/validation/issues/64)
        * `0190` in [issue #70](https://github.com/CenPC434/validation/issues/70)
        * `0191` in [issue #58](https://github.com/CenPC434/validation/issues/58)
        * `0192` in [issue #62](https://github.com/CenPC434/validation/issues/62)
        * `0193` in [issue #71](https://github.com/CenPC434/validation/issues/71)
    * Rules targeting attributes were altered ([issue #50](https://github.com/CenPC434/validation/issues/50))
    * Fixed typo in `BR-CL-24` UBL ([issue #52](https://github.com/CenPC434/validation/issues/52))
    * Some code list assertions had no `id` attributes ([issue #53](https://github.com/CenPC434/validation/issues/53))
    * Rule `CII-SR-029` was removed and the context of `CII-SR-030` was adopted ([issue #54](https://github.com/CenPC434/validation/issues/54))
    * Using `xs:decimal` instead of `xs:double` ([issue #55](https://github.com/CenPC434/validation/issues/55))
    * The value of the VAT `@schemeID` attribute is `VAT` (instead of `VA`) ([issue #57](https://github.com/CenPC434/validation/issues/57))
    * Error in rule `BR-Z-10` UBL was fixed ([issue #59](https://github.com/CenPC434/validation/issues/59))
    * Fixed error message of `BR-AF-05` CII ([issue #60](https://github.com/CenPC434/validation/issues/60))
    * The value `532` was not supported in `BR-CL-01` ([issue #63](https://github.com/CenPC434/validation/issues/63))
    
* v1.0.0 - 2018-02-08 (UBL, CII and EDIFACT)
  * Initial release


# Development

For the Java projects contained in this repository, please consider the following prerequisites
  * Java JDK 1.8.x latest (was tested only with a JDK and not with a JRE)
  * Eclipse 4.6.x latest (m2e - Maven for Eclipse - must be contained)
  * For building on the commandline use Apache Maven 3.x (latest) 
 
## Create XSLTs from Schematrons
  
Invoke `mvn process-resources` after changes - it will regenerate the XSLTs from the source SCHs.
Don't forget to update the license headers afterwards (see below).
 
## Update the license headers

The template for the license header resides in the file `templates/license-template.txt`.
To add the license header to all relevant files invoke the following command:

```
mvn license:format
```
