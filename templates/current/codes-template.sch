<?xml version="1.0" encoding="ISO-8859-1"?>
<!--

    Licensed under European Union Public Licence (EUPL) version 1.2.

-->
<!-- 
        Codes template 
    
        The code template file contains the rules specific to assess values for coded elements.
        
        A timestamp is required in every file, created when generated. E.g.: 2016-05-23 10:47:49 +0200
        
        This file should contain only a pattern with an identifier.
                
        Every rule refers to a context where the actual XPATH where the rule applies is defined.
        
        The rules contain asserts, where there is :
            A test, containing the XPATH expression to test for the allowed values in the code list. 
            A flag: describing whether it is an error ("fatal") or a notice ("warning"). Fatal errors should stop the process of the invoice while warnings should not.
            An identifier: to allow for automatic processing. 
            A message: with the proper explanation of the error.
            
    -->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CodesTC434">
 
<rule context="cbc:InvoiceTypeCode">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' 380 393 384 381 ',concat(' ',normalize-space(.),' ') ) ) )" 
    flag="fatal" id="BR-CL-01">[BR-CL-01]-An Invoice MUST be coded with the InvoiceTypeCode code list UNCL D1001 TC434 subset</assert>
</rule>

<rule context="cac:AccountingSupplierParty/cac:Party//cac:Language//cbc:ID">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' ab aa af ak sq am ar an hy as av ae ay az bm ba eu be bn bh bi bs br bg my ca ch ce ny zh cv kw co cr hr cs da dv nl dz en eo et ee fo fj fi fr ff gl ka de el gn gu ht ha he hz hi ho hu ia id ie ga ig ik io is it iu ja jv kl kn kr ks kk km ki rw ky kv kg ko ku kj la lb lg li ln lo lt lu lv gv mk mg ms ml mt mi mr mh mn na nv nb nd ne ng nn no ii nr oc oj cu om or os pa pi fa pl ps pt qu rm rn ro ru sa sc sd se sm sg sr gd sn si sk sl so st az es su sw ss sv ta te tg th ti bo tk tl tn to tr ts tt tw ty ug uk ur uz ve vi vo wa cy wo fy xh yi yo za zu ',concat(' ',normalize-space(.),' ') ) ) )" 
    flag="warning" id="BR-CL-02">[BR-CL-02]-The lists of valid languages are registered with the ISO 639 Maintenance Agency Codes for the Representation of Names of Languages. It is recommended to use the ISO 639-1 alpha-2 representation</assert>
</rule>

<rule context="@currencyID">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GWP GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SKK SLL SOS SRD STD SVC SYP SZL THB TJS TMM TND TOP TRY TTD TWD TZS UAH UGX USD USN USS UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XFU XOF XPD XPF XTS XXX YER ZAR ZMK ZWR ZWD ',concat(' ',normalize-space(.),' ') ) ) )" 
    flag="fatal" id="BR-CL-03">[BR-CL-03]-currencyID MUST be coded using ISO code list 4217 alpha-3</assert>
</rule>

<rule context="cbc:DocumentCurrencyCode">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GWP GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SKK SLL SOS SRD STD SVC SYP SZL THB TJS TMM TND TOP TRY TTD TWD TZS UAH UGX USD USN USS UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XFU XOF XPD XPF XTS XXX YER ZAR ZMK ZWR ZWD ',concat(' ',normalize-space(.),' ') ) ) )" 
    flag="fatal" id="BR-CL-04">[BR-CL-04]-Invoice currency code MUST be coded using ISO code list 4217 alpha-3</assert>
</rule>
  
<!--
    ...
-->
</pattern>