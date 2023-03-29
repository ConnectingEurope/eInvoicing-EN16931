# CEN/TC 434 - EN-16931 - Validation artefacts

Official Schematron eInvoicing-EN16931 artefacts for CEN/TC 434.
This repository does not contain eInvoicing-EN16931 rules for any CIUS.

Latest release
  * UBL & CII: **v1.3.9** (2022-10-10) - [https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.9](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.9)
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

Derivative work created from https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.2.3 

That was Licensed under the Apache License, Version 2.0

# News and noteworthy

* v1.3.9 - 2022-10-10 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3A1.3.9
    * Updated code lists and minor fixes
* v1.3.8 - 2022-04-08 (UBL and CII only)
    * See all fixed issues: [https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.8](https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3A1.3.8)
    * Update code lists, improves CII validations and minor fixes
* v1.3.7 - 2021-10-04 (UBL and CII only)
    * Merged requirements from XRechnung
    * Fix syntax issues
* v1.3.6a - 2021-08-03 (UBL and CII only - KoSIT specific fix)
    * This contains a fix for BR-CO-15 as required by XRechnung 2.1.1 - when https://github.com/ConnectingEurope/eInvoicing-EN16931/pull/292 is merged, the next XRechnung release can be again based on the official rule release. No further hot fixes are assumed.
* v1.3.6 - 2021-05-31 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.6
    * Hot fix to support country codes 1A - Kosovo and XI - United Kingdom (Northern Ireland) in rule BR-CO-09
* v1.3.5 - 2021-03-29 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.5
    * Changes in the code lists and fixing CII errors.
* v1.3.4 - 2021-01-27 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.4
    * Hot fix of error introduced in 1.3.3
* v1.3.3 - 2020-10-02 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.3
* v1.3.2 - 2020-05-25 (UBL and CII only)
    * See all fixed issues: https://github.com/ConnectingEurope/eInvoicing-EN16931/issues?q=is%3Aissue+is%3Aclosed+milestone%3Av1.3.2
    * Added code 0208 in EAS and 0205 to 0208 in ICD code lists
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

