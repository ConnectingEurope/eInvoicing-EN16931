# CEN/TC 434 - EN-16931 - Validation artefacts

Official Schematron eInvoicing-EN16931 artefacts for CEN/TC 434.
This repository does not contain eInvoicing-EN16931 rules for any CIUS.

**This was the repository originally created at ConnectingEurope/eInvoicing-EN16931 - it is now maintained here**

Latest release
  * UBL & CII: **v1.3.1** (2020-02-28) - https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.1
  * EDIFACT:   **v1.0.0** (2018-02-08) - https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/eInvoicing-EN16931-1.0.0

For each syntax a separate folder exists where all related artefacts are to be published.

* `ubl` - UBL 2.1 (ISO/IEC 19845:2015) - EN mandatory syntax
  * UBL Website: https://www.oasis-open.org/committees/ubl/
  * Used XML Schemas: http://docs.oasis-open.org/ubl/os-UBL-2.1/UBL-2.1.zip
* `cii` - Cross Industry Invoice (D16B) - EN mandatory syntax
  * XML Schemas overview: http://www.unece.org/cefact/xml_schemas/index.html
  * Used XML Schemas: http://www.unece.org/fileadmin/DAM/cefact/xml_schemas/D16B_SCRDM__Subset__CII.zip
* `edifact` - UN/EDIFACT (and ISO 26025 based XML version) - EN optional syntax

CEF supported code lists are available here:
 
* https://ec.europa.eu/cefdigital/wiki/display/CEFDIGITAL/Registry+of+supporting+artefacts+to+implement+EN16931

    
# License

Licensed under European Union Public Licence (EUPL) version 1.2.

Derivative work created from https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/eInvoicing-EN16931-1.2.3 

That was Licensed under the Apache License, Version 2.0

# News and noteworthy

* v1.3.1 - 2020-02-28 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.1
    * Some codelist values have been added
* v1.3.0 - 2019-10-05 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.0
    * Some codelist values have been added

* v1.2.3 - 2019-07-05 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.2.3
    * Some codelist values were missing

* v1.2.2 - 2019-07-05 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.2.2

* v1.2.1 - 2019-05-14 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.2.1

* v1.2.0 - 2019-04-26 (UBL and CII only)
    * Note: this release does NOT contain the EDIFACT eInvoicing-EN16931 rules - its development is currently paused/stalled
    * Note: this release is not backwards compatible, and the examples files were changed as well.
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.2
    * The UBL ODS files were removed, because they were out of sync with the used rules
    * The folder names for examples files were unified across the syntaxes
    * The name of the UBL Schematron/XSLT files was changed from `EN16931-UBL-model.*` to `EN16931-UBL-eInvoicing-EN16931.*`
    
* v1.1.0 - 2018-06-26 (UBL and CII only)
    * Note: this release does NOT contain the EDIFACT eInvoicing-EN16931 rules - its development is currently paused/stalled
    * New participant identifier schemes are supported
        * `0184` in [issue #64](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/64)
        * `0190` in [issue #70](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/70)
        * `0191` in [issue #58](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/58)
        * `0192` in [issue #62](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/62)
        * `0193` in [issue #71](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/71)
    * Rules targeting attributes were altered ([issue #50](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/50))
    * Fixed typo in `BR-CL-24` UBL ([issue #52](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/52))
    * Some code list assertions had no `id` attributes ([issue #53](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/53))
    * Rule `CII-SR-029` was removed and the context of `CII-SR-030` was adopted ([issue #54](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/54))
    * Using `xs:decimal` instead of `xs:double` ([issue #55](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/55))
    * The value of the VAT `@schemeID` attribute is `VAT` (instead of `VA`) ([issue #57](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/57))
    * Error in rule `BR-Z-10` UBL was fixed ([issue #59](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/59))
    * Fixed error message of `BR-AF-05` CII ([issue #60](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/60))
    * The value `532` was not supported in `BR-CL-01` ([issue #63](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues/63))
    
* v1.0.0 - 2018-02-08 (UBL, CII and EDIFACT)
    * Initial release

