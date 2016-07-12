<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                version="2.0"
                xml:base="file:/H:/validool.org/Kunden/NEN/WP5/EDIFACT/schematron/EN16931-EDIFACT-validation.sch_xslt_cascade"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. The name or details of 
    this mode may change during 1Q 2007.-->


<!--PHASES-->


<!--PROLOG-->
   <xsl:output xmlns:iso="http://purl.oclc.org/dsdl/schematron"
               xmlns:osf="http://www.oxygenxml.com/sch/functions"
               method="xml"/>

   <!--KEYS-->


   <!--DEFAULT RULES-->


   <!--MODE: SCHEMATRON-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-get-full-path">
      <xsl:variable name="sameUri">
         <xsl:value-of select="saxon:system-id() = parent::node()/saxon:system-id()"
                       use-when="function-available('saxon:system-id')"/>
         <xsl:value-of select="true()" use-when="not(function-available('saxon:system-id'))"/>
      </xsl:variable>
      <xsl:if test="$sameUri = 'true'">
         <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      </xsl:if>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*:</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>[namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="$sameUri = 'true'">
         <xsl:variable name="preceding"
                       select="count(preceding-sibling::*[local-name()=local-name(current())                                    and namespace-uri() = namespace-uri(current())])"/>
         <xsl:text>[</xsl:text>
         <xsl:value-of select="1+ $preceding"/>
         <xsl:text>]</xsl:text>
      </xsl:if>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="text()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>text()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::text())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="comment()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>comment()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::comment())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>processing-instruction()</xsl:text>
      <xsl:variable name="preceding"
                    select="count(preceding-sibling::processing-instruction())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-2-->
   <!--This mode can be used to generate prefixed XPath for humans-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>

   <!--MODE: GENERATE-ID-FROM-PATH -->
   <xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:choose>
         <xsl:when test="count(. | ../namespace::*) = count(../namespace::*)">
            <xsl:value-of select="concat('.namespace::-',1+count(namespace::*),'-')"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--MODE: GENERATE-ID-2 -->
   <xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters-->
   <xsl:template match="text()" priority="-1"/>

   <!--SCHEMA METADATA-->
   <xsl:template match="/">
      <xsl:apply-templates select="/" mode="M4"/>
      <xsl:apply-templates select="/" mode="M5"/>
      <xsl:apply-templates select="/" mode="M6"/>
   </xsl:template>

   <!--SCHEMATRON PATTERNS-->


   <!--PATTERN EN16931-EDIFACT-Model-->


	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG2[S_NAD/C_C082/D_3039='PE' or S_NAD/C_C082/D_3039='SE']/S_FII[D_3035='RB']"
                 priority="144"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C078/D_3194"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-53]-A Financial account identifier shall be present if Account identification information is provided in the Invoice. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG26/S_EFI" priority="143" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C077/D_1508"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-55]-Each additional supporting document shall contain a Supporting document identifier. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C077/D_7008"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-56]-Each additional supporting document shall contain a Supporting document description. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG2[S_NAD/C_C082/D_3039='BY']/S_FII[D_3035='BI']"
                 priority="142"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="string-length(C_C078/D_3194)&lt;=6 and string-length(C_C078/D_3194)&gt;=4"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-54]-The last 4 to 6 digit of the Payment card primary account number shall be present if card information is provided in the Invoice. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='A']" priority="141" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG20/S_MOA/C_C516[D_5025='25']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-32]-Each document level allowance shall have a Document level allowance amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG22/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/D_5305"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-33]-Each document level allowance shall have a Document level allowance VAT category code. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_ALC/C_C552/D_1230"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-35]-Each document level allowance shall have a Document level allowance reason. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG20/S_MOA/C_C516[D_5025='25']/D_5004 &gt;=0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-36]-Document level allowance amounts shall not be negative. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="true()"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-05]-Document level allowance reason code and Document level allowance reason shall indicate the same type of allowance. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='C']" priority="140" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG20/S_MOA/C_C516[D_5025='389']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-37]-Each document level charge shall have a Document level charge amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG22/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/D_5305"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-38]-Each document level charge shall have a Document level charge VAT category code. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_ALC/C_C552/D_1230"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-40]-Each document level charge shall have a Document level charge reason. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG20/S_MOA/C_C516[D_5025='389']/D_5004 &gt;=0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-41]-Document level charge amounts shall not be negative. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="true()"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-06]-Document level charge reason code and Document level charge reason shall indicate the same type of charge. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG52" priority="139" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG28/S_MOA/C_C516[D_5025='79']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-10]-An Invoice shall have the Sum of Invoice line net amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG28/S_MOA/C_C516[D_5025='499']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-11]-An Invoice shall have the Invoice total amount without VAT. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG28/S_MOA/C_C516[D_5025='388']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-12]-An Invoice shall have the Invoice total amount with VAT. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG28/S_MOA/C_C516[D_5025='9']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-13]-An Invoice shall have the Amount due for payment. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_MOA/C_C516[D_5025='388']/D_5004) &gt;=0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-57]-Invoice total amount with VAT shall not be negative. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_MOA/C_C516[D_5025='79']/D_5004 = (round(sum(/M_INVOIC/G_SG27/G_SG28/S_MOA/C_C516[D_5025='79']/D_5004) * 10 * 10)div 100)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-10]-Sum of Invoice line net amount = Σ Invoice line net amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_MOA/C_C516[D_5025='260']/D_5004 =      (     round(     sum(     /M_INVOIC/G_SG16[S_ALC/D_5463='A']/G_SG20/S_MOA/C_C516[D_5025='389']/D_5004     )* 10 * 10      ) div 100     ) or      not(S_MOA/C_C516[D_5025='260']/D_5004)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-11]-Sum of allowances on document level = Σ Document level allowance amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_MOA/C_C516[D_5025='259']/D_5004 =      (     round(     sum(     /M_INVOIC/G_SG16[S_ALC/D_5463='C']/G_SG20/S_MOA/C_C516[D_5025='389']/D_5004     )* 10 * 10      ) div 100     ) or      not(S_MOA/C_C516[D_5025='259']/D_5004)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-12]-Sum of charges on document level = Σ Document level charge amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_MOA/C_C516[D_5025='499']/D_5004 = S_MOA/C_C516[D_5025='79']/D_5004 - S_MOA/C_C516[D_5025='260']/D_5004 + S_MOA/C_C516[D_5025='259']/D_5004) or      ((S_MOA/C_C516[D_5025='499']/D_5004 = S_MOA/C_C516[D_5025='79']/D_5004 - S_MOA/C_C516[D_5025='260']/D_5004) and not (S_MOA/C_C516[D_5025='259']/D_5004)) or      ((S_MOA/C_C516[D_5025='499']/D_5004 = S_MOA/C_C516[D_5025='79']/D_5004 + S_MOA/C_C516[D_5025='259']/D_5004) and not (S_MOA/C_C516[D_5025='260']/D_5004)) or      ((S_MOA/C_C516[D_5025='499']/D_5004 = S_MOA/C_C516[D_5025='79']/D_5004) and not (S_MOA/C_C516[D_5025='259']/D_5004) and not (S_MOA/C_C516[D_5025='260']/D_5004))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-13]-Invoice total amount without VAT = Σ Invoice line net amount - Sum of allowances on document level + Sum of charges on document level. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_MOA/C_C516[D_5025='388']/D_5004 = S_MOA/C_C516[D_5025='499']/D_5004 + S_MOA/C_C516[D_5025='176']/D_5004)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-15]-Invoice total amount with VAT = Invoice total amount without VAT + Invoice total VAT amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_MOA/C_C516[D_5025='9']/D_5004 = S_MOA/C_C516[D_5025='388']/D_5004 - S_MOA/C_C516[D_5025='113']/D_5004) or      ((S_MOA/C_C516[D_5025='9']/D_5004 = S_MOA/C_C516[D_5025='388']/D_5004) and not (S_MOA/C_C516[D_5025='113']/D_5004))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-16]-Amount due for payment = Invoice total VAT amount-Paid amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC" priority="138" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG1/S_RFF/C_C506[D_1153='AEG']/D_1154"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-01]-An Invoice shall have a Specification identification. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG27/S_LIN"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-14]-An Invoice shall have at least one Invoice line. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_BGM/C_C106/D_1004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-02]-An Invoice shall have an Invoice number. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_DTM/C_C507[D_2005='137' and D_2379='102']/D_2380"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-03]-An Invoice shall have an Invoice issue date. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_BGM/C_C002/D_1001"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-04]-An Invoice shall have an Invoice type code. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG7/S_CUX/C_C504[D_6347='3' and D_6343='18']/D_6345"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-05]-An Invoice shall have an Invoice currency code. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((G_SG8[S_PYT/D_4279='1']/S_PAI/C_C534/D_4461 = '49') and ((G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='AII']/D_1154)or(G_SG2[S_NAD/D_3035='PE']/G_SG3/S_RFF/C_C506[D_1153='AII']/D_1154))) or not(G_SG8[S_PYT/D_4279='1']/S_PAI/C_C534/D_4461 =  '49')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-52]-The Bank creditor identifier shall be given in an Invoice in case the payment means is a SEPA direct debit. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG2/S_NAD[D_3035='SE']/C_C080/D_3036"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-06]-An Invoice shall contain Seller name. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG2/S_NAD[D_3035='BY']/C_C080/D_3036"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-07]-An Invoice shall contain Buyer name. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG2/S_NAD[D_3035='SE']/C_C059"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-08]-An Invoice shall contain the Seller postal address. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG2/S_NAD[D_3035='BY']/C_C059"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-09]-An Invoice shall contain the Buyer postal address. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="true()"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-01]-Only one language shall be used in an Invoice. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG54/S_MOA/C_C516[D_5025='176']/D_5004) or (G_SG54/S_MOA/C_C516[D_5025='176']/D_5004 and ((G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VAT']/D_1154 and not (G_SG2[S_NAD/D_3035='AE']/G_SG3/S_RFF/C_C506[D_1153='VAT']/D_1154)) or ((not(G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VAT']/D_1154) and (G_SG2[S_NAD/D_3035='AE']/G_SG3/S_RFF/C_C506[D_1153='VAT']/D_1154)))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-03]-One and only one of either the Seller VAT identifier or the Seller tax representative VAT identifier shall exist in an Invoice if the Invoice has an Invoice total VAT amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27" priority="137" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_LIN/D_1082"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-18]-Each Invoice line shall have an Invoice line identifier. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_QTY/C_C186[D_6063='47']/D_6060"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-19]-Each Invoice line shall have an Invoiced quantity. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_QTY/C_C186[D_6063='47']/D_6411"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-20]-An invoiced quantity shall have an Invoice quantity unit of measure. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG28/S_MOA/C_C516[D_5025='203']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-21]-Each Invoice line shall have an Invoice line net amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_IMD[D_7077='F' and C_C272/D_7081='57']/C_C273/D_7008"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-22]-Each Invoice line shall contain the Item name. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG30/S_PRI/C_C509[D_5125='AAA']/D_5118"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-23]-Each Invoice line shall contain the Item net price. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(G_SG30/S_PRI/C_C509[D_5125='AAA']/D_5118) &gt;= 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-24]-Invoice line item net price shall NOT be negative. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(G_SG30/S_PRI/C_C509[D_5125='AAB']/D_5118 &gt;= 0) or not(G_SG30/S_PRI/C_C509[D_5125='AAB']/D_5118)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-25]-Invoice line item gross price shall NOT be negative. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/D_5305"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-04]-Each Invoice line shall be categorized with an Invoiced item VAT category code. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_LIN/D_1082=preceding-sibling::G_SG27/S_LIN/D_1082)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-MD-118]-Each Invoice line shall have a unique identifier within the whole Invoice. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27/G_SG40[S_ALC/D_5463='A' and S_ALC/D_4471='2']"
                 priority="136"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG43/S_MOA/C_C516[D_5025='204']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-42]-Each Invoice line allowance shall have an Invoice line allowance amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_ALC/C_C552/D_1230"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-43]-Each Invoice line allowance shall have an Invoice line allowance reason. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="true()"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-07]-Invoice line allowance reason code and Invoice line allowance reason shall indicate the same type of allowance reason. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27/G_SG40[S_ALC/D_5463='C' and S_ALC/D_4471='2']"
                 priority="135"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG43/S_MOA/C_C516[D_5025='23']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-44]-Each Invoice line charge shall have an Invoice line charge amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_ALC/C_C552/D_1230"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-45]-Each Invoice line charge shall have an Invoice line charge reason. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="true()"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-08]-Invoice line charge reason code and Invoice line charge reason shall indicate the same type of charge reason. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27/S_DTM" priority="134" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C507[D_2005='194' and D_2379='102']/D_2380"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-29]-An Invoice line period shall have an Invoice line period start date. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C507[D_2005='206' and D_2379='102']/D_2380"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-30]-An Invoice line period shall have an Invoice line period end date. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(C_C507[D_2005='206' and D_2379='102']/D_2380) &gt;= (C_C507[D_2005='194' and D_2379='102']/D_2380)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-31]-An Invoice line period end date shall be later or equal to an Invoice line period start date. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/S_DTM" priority="133" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C507[D_2005='194' and D_2379='102']/D_2380"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-26]-An Invoice period shall have an Invoice period start date. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C507[D_2005='206' and D_2379='102']/D_2380"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-27]-An Invoice period shall have an Invoice period end date. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(C_C507[D_2005='206' and D_2379='102']/D_2380) &gt;= (C_C507[D_2005='194' and D_2379='102']/D_2380)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-28]-An Invoice period end date shall be later or equal to an Invoice period start date. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27/S_FTX[D_4451='ACF' and D_4453='1']/C_C108"
                 priority="132"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(D_4440) and (D_4440_2)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-60]-Each Item attribute shall contain an Item attribute name and an Item attribute value. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG2/S_NAD[D_3035='PE']" priority="131" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(C_C080/D_3036) and (not(C_C080/D_3036 = ../../G_SG2/S_NAD[D_3035='SE']/C_C080/D_3036) or not(C_C082/D_3039 = ../../G_SG2/S_NAD[D_3035='SE']/C_C082/D_3039) or not(../G_SG3/S_RFF/C_C506[D_1153='APA']/D_1154 = ../../G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='APA']/D_1154))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-16]-The Payee name shall be provided in the Invoice, if the Payee is different from the Seller. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC" priority="130" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG8[S_PYT/D_4279='1']/S_PAI/C_C534/D_4461"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-50]-A payment instruction shall specify the Payment means type code. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((G_SG8[S_PYT/D_4279='1']/S_PAI/C_C534/D_4461 = '49') and ((G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='AVS']/D_1154) or (G_SG2[S_NAD/D_3035='PE']/G_SG3/S_RFF/C_C506[D_1153='AVS']/D_1154))) or not(G_SG8[S_PYT/D_4279='1']/S_PAI/C_C534/D_4461 =  '49')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-51]-The Mandate reference identifier shall be given in an Invoice in case the payment means is a SEPA direct debit. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((G_SG8[S_PYT/D_4279='1']/S_PAI/C_C534/D_4461 = '30') and (G_SG2[S_NAD/C_C082/D_3039='PE' or S_NAD/C_C082/D_3039='SE']/S_FII[D_3035='RB']/C_C088/D_3434)) or not(G_SG8[S_PYT/D_4279='1']/S_PAI/C_C534/D_4461 =  '30')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-02]-Account identification shall be present if payment means is credit transfer. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG2/S_NAD[D_3035='AE']" priority="129" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C059"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-15]-The Seller tax representative postal address shall be provided in the Invoice, if the Seller has a tax representative party. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C080/D_3036"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-17]-The Seller tax representative name shall be provided in the Invoice, if the Seller has a tax representative party. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54[S_TAX[C_C241/D_5153='VAT']/D_5283='7']/S_MOA"
                 priority="128"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(C_C516[D_5025='2']/D_5004) and not(/M_INVOIC/G_SG7/S_CUX/C_C504[D_6347='2' and D_6343='4']/D_6345 = /M_INVOIC/G_SG7/S_CUX/C_C504[D_6347='3' and D_6343='18']/D_6345)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-59]-If the VAT accounting currency code is different than the Invoice currency code, then the Invoice total VAT amount in accounting currency shall be provided. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_MOA/C_C516[D_5025='176']/D_5004"
                 priority="127"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test=". =      (     round(     sum(     /M_INVOIC/G_SG54[S_TAX/D_5283='7' and S_TAX/C_C241/D_5153='VAT']/S_MOA/C_C516[D_5025='124']/D_5004     )*10*10     )div 100     ) "/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-14]-Invoice total VAT amount = Σ VAT category tax amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54[S_TAX/D_5283='7' and S_TAX/C_C241/D_5153='VAT']"
                 priority="126"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_MOA/C_C516[D_5025='125']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-46]-Each VAT breakdown shall have a VAT category taxable amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_MOA/C_C516[D_5025='124']/D_5004"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-47]-Each VAT breakdown shall have a VAT category tax amount. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_TAX/D_5305"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-48]-Each VAT breakdown shall be defined through a VAT category code. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_TAX/C_C243/D_5278) or (S_TAX/D_5305 = 'O')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-49]-Each VAT breakdown shall have a VAT category rate, except if the Invoice is outside the scope of VAT. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_MOA/C_C516[D_5025='124']/D_5004 = round(S_MOA/C_C516[D_5025='125']/D_5004 * (S_TAX[D_5283='VAT']/C_C243/D_5278 div 100) * 10 * 10) div 100 "/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-17]-VAT category tax amount = VAT category taxable amount x (VAT category rate / 100), rounded "half up" to two decimals. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC" priority="125" mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="true()"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-CO-09]-The Seller VAT identifier, Seller tax representative VAT identifier, Buyer VAT identifier shall have a prefix in accordance with ISO code ISO 3166-1 alpha-2 by which the Member State of issue may be identified. Nevertheless, Greece may use the prefix ‘EL’. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 = 'AE']"
                 priority="124"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG27/G_SG35/S_TAX/D_5305 = 'AE'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-01]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “AE” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "AE". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-10]-An Invoice with a VAT category code "AE" shall have the VAT category rate (BT-112) 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154) and (/M_INVOIC/G_SG2[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-02]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “AE” shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="../S_MOA/C_C516[D_5025='124']/D_5004 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-05]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where the VAT category code (BT-111) is “AE” shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="current()[D_5283='7' and C_C241/D_5153='VAT']/S_MOA/C_C516[D_5025='1']/D_5004 =      (     round(     sum(/M_INVOIC/G_SG27[                           G_SG35/S_TAX[                                         D_5283='7' and                                          C_C241/D_5153='VAT'                                                            ]                                       /D_5305='AE' and                            G_SG35/S_TAX[                                        D_5283='7' and                                         C_C241/D_5153='VAT']                                       /C_C243/D_5278 = current()/C_C243/D_5278                         ]                         /G_SG28/S_MOA/C_C516[D_5025='203']/D_5004      )     *10*10)     div 100     ) + (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='C' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'AE' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)      -      (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='A' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'AE' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-07]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "AE" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amounts (BT-122) where the VAT category code (BT-142) is "AE" and VAT exemption reason text (BT-144) matches the exemption reason text (BT-113), minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category code (BT-142, BT-89, BT-96) is “AE". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/S_FTX[D_4451='AGM']/C_C108/D_D4440"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-09]-The VAT exemption reason text (BT-113) shall be "Reverse charge" (or the equivalent standard text in other languages) in the VAT breakdown (BG-21) if the VAT category code is "AE". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='A']/G_SG22/S_TAX"
                 priority="123"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='AE') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154) and (/M_INVOIC/G_SG2[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-03]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "AE" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='C']/G_SG22/S_TAX"
                 priority="122"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='AE') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154) and (/M_INVOIC/G_SG2[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-04]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "AE" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27/G_SG35/S_TAX[D_5305 = 'AE']"
                 priority="121"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-06]-In an Invoice line where the Invoice item VAT category code (BT-142) is "AE" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_FTX[D_4451='AGM' and D_4453='1']/C_C108/D_D4440"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-AE-08]-In an Invoice line where the Invoice item VAT category code (BT-142) is "AE" the invoiced item VAT exemption reasons text (BT-144) shall be "Reverse charge" (or the equivalent standard text in other languages). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 = 'E']"
                 priority="120"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG27/G_SG35/S_TAX/D_5305 = 'E'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-01]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “E” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "E". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-10]-An Invoice with a VAT category code "E" shall have the VAT category rate (BT-112) 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “E” shall contain the Seller's VAT identifier (BT-30). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="current()[D_5283='7' and C_C241/D_5153='VAT']/S_MOA/C_C516[D_5025='1']/D_5004 =      (     round(     sum(/M_INVOIC/G_SG27[     G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305='E' and      G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG28/S_MOA/C_C516[D_5025='203']/D_5004      )     *10*10)     div 100     ) + (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='C' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'E' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)      -      (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='A' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'E' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-07]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "E" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amount (BT-122) where the VAT category codes (BT-142) is "E" and VAT exemption reason text (BT-144) matches the exemption reason text (BT-113), minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category code (BT-142, BT-89, BT-96) is “E". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="../S_MOA/C_C516[D_5025='124']/D_5004 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-08]-The VAT category tax amount (BT-110) In a VAT breakdown (BG-21) where the VAT category code (BT-111) equals "E", shall equal 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(/M_INVOIC/S_FTX[D_4451='AGM']/C_C108/D_D4440)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-09]-A VAT exemption reason text (BT-113) shall be provided in the VAT breakdown (BG-21) if the VAT category code is "E". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='A']/G_SG22/S_TAX"
                 priority="119"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='E') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-03]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "E" shall contain the Seller's VAT identifier (BT-30). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='C']/G_SG22/S_TAX"
                 priority="118"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='E') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-04]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "E" shall contain the Seller's VAT identifier (BT-30). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27[G_SG35/S_TAX/D_5305 = 'E']"
                 priority="117"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-05]-In an Invoice line where the Invoice item VAT category code (BT-142) is "E", the Invoiced item VAT rate (BT-143) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_FTX[D_4451='AGM' and D_4453='1']/C_C108/D_D4440"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-E-06]-In an Invoice line where the Invoice item VAT category code (BT-142) is "E" the Invoiced item VAT exemption reason text (BT-144) shall not be blank. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 = 'G']"
                 priority="116"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG27/G_SG35/S_TAX/D_5305 = 'G'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-01]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “G” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "G". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-10]-An Invoice with a VAT category code "G" shall have the VAT category rate (BT-112) 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="../S_MOA/C_C516[D_5025='124']/D_5004 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-06]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where the VAT category code (BT-111) is “G” shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-08]-In an Invoice line where the Invoice item VAT category code (BT-142) is "G" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/S_FTX[D_4451='AGM']/C_C108/D_D4440"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-09]-The VAT exemption reason text (BT-113) shall be "Export outside the EU" (or the equivalent standard text in other languages) in the VAT breakdown (BG-21) if the VAT category code is "G". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='A']/G_SG22/S_TAX"
                 priority="115"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='G') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-03]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "G" shall contain the Seller's VAT identifier (BT-30). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='C']/G_SG22/S_TAX"
                 priority="114"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='G') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-04]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "G" shall contain the Seller's VAT identifier. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27[G_SG35/S_TAX/D_5305 = 'G']"
                 priority="113"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “G” shall contain the Seller's VAT identifier (BT-30). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-05]-In an Invoice line where the Invoice item VAT category code (BT-142) is "G" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_FTX[D_4451='AGM' and D_4453='1']/C_C108/D_D4440"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-G-07]-In an Invoice line where the Invoice item VAT category code (BT-142) is "G" the invoiced item VAT exemption reasons text (BT-144) shall be "Export outside the EU" (or the equivalent standard text in other languages). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 = 'IC']"
                 priority="112"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG27/G_SG35/S_TAX/D_5305 = 'IC'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-01]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “IC” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "IC". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/S_FTX[D_4451='AGM']/C_C108/D_D4440"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-10]-The VAT exemption reason text (BT-113) shall be "Intra community supply" (or the equivalent standard text in other languages) in the VAT breakdown (BG-21) if the VAT category code is "IC". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-11]-An Invoice with a VAT category code "IC" shall have the VAT category rate (BT-112) 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="current()[D_5283='7' and C_C241/D_5153='VAT']/S_MOA/C_C516[D_5025='1']/D_5004 =      (     round(     sum(/M_INVOIC/G_SG27[     G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305='IC' and      G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG28/S_MOA/C_C516[D_5025='203']/D_5004      )     *10*10)     div 100     ) + (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='C' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'IC' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)      -      (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='A' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'IC' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-12]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "IC" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amounts (BT-122) where the VAT category code (BT-142) is "IC" and VAT exemption reason text (BT-144) matches the exemption reason text (BT-113), minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category code (BT-142, BT-89, BT-96) is “IC". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="../S_MOA/C_C516[D_5025='124']/D_5004 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-02]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where the VAT category code (BT-111) is “IC” shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(/M_INVOIC/S_DTM/C_C507[D_2005='35' and D_2379='102']/D_2380)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-08]-In an Invoice with a VAT breakdown (BG-21) where the VAT category code (BT-111) is "IC" the actual delivery date (BT-69) shall not be blank. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(/M_INVOIC/G_SG2/S_NAD[D_3035='DP']/D_3207)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-09]-In an Invoice with a VAT breakdown (BG-21) where the VAT category code (BT-111) is "IC" the deliver to country code (BT-75) shall not be blank. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='A']/G_SG22/S_TAX"
                 priority="111"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='IC') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154) and (/M_INVOIC/G_SG2[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-04]-An Invoice that contains a document level allowance (BG-18) with a document level allowance VAT category code (BT-89) that is "IC" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='C']/G_SG22/S_TAX"
                 priority="110"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(current()[D_5283='7' and C_C241/D_5153='VAT']/D_5305='IC') and (/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154) and (/M_INVOIC/G_SG2[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-05]-An Invoice that contains a document level charge (BG-19) with a document level charge VAT category code (BT-89) that is "IC" shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27[G_SG35/S_TAX/D_5305 = 'IC']"
                 priority="109"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154) and (/M_INVOIC/G_SG2[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-03]-An Invoice that contains a line where the invoiced item VAT category code (BT-142) is “IC” shall contain both the Seller's VAT identifier (BT-30) and Buyer's VAT identifier (BT-46). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-06]-In an Invoice line where the Invoice item VAT category code (BT-142) is "IC" the invoiced item VAT rate (BT-143) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_FTX[D_4451='AGM' and D_4453='1']/C_C108/D_D4440"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-IC-07]-In an Invoice line where the Invoice item VAT category code (BT-142) is "IC" the invoiced item VAT exemption reasons text (BT-144) shall be "Intra community supply" (or the equivalent standard text in other languages). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 = 'O']"
                 priority="108"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154) and not(/M_INVOIC/G_SG2[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-01]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as “O” shall not contain Seller's VAT identifier (BT-30) or Buyer's VAT identifier (BT-46). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 != 'O'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-02]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as "O" shall not contain other VAT category codes (BT-111) that are not "O". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/G_SG16[S_ALC/D_5463='A']/G_SG22/S_TAX/D_5305 !='O')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-04]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as "O" shall not contain a Document level allowances group (BG-18) where Document level allowance VAT category code (BT-89) is not "O". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/G_SG16[S_ALC/D_5463='C']/G_SG22/S_TAX/D_5305 !='O')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-05]-An Invoice that contains a VAT breakdown group (BG-21) with a VAT category code (BT-111) as "O" shall not contain a document Level charge group (BG-18) where Document level charge VAT category code (BT-96) is not "O". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/S_FTX[D_4451='AGM']/C_C108/D_D4440) and not (/M_INVOIC/G_SG54/S_TAX[D_5305 != 'S' and D_5305 != 'Z' and D_5305 != 'O'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-07]-An Invoice where VAT category code (BT-111) is "O" shall not contain the VAT exemption reason text (BT-113). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27/G_SG35/S_TAX[D_5305 = 'O']"
                 priority="107"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/G_SG27/G_SG35/S_TAX[D_5305 != 'O'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-03]-An Invoice that contains a line where VAT category code (BT-142) is "O" shall not contain other lines where the Invoiced item VAT category code (BT-142) is not "O". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/C_C243/D_5278)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-06]-An Invoice line where VAT category code (BT-142) is "O" shall not contain an invoiced item VAT rate (BT-143). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FTX[D_4451='AGM' and D_4453='1']/C_C108/D_D4440)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-O-08]-An Invoice line where Invoiced item VAT category code (BT-142) is "O" shall not contain the Invoiced item VAT exemption reason text (BT-144). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 = 'S']"
                 priority="106"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG27/G_SG35/S_TAX/D_5305 = 'S'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-S-01]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “S” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "S". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-S-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “S” shall contain the Seller's VAT identifier (BT-30). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="current()[D_5283='7' and C_C241/D_5153='VAT']/S_MOA/C_C516[D_5025='1']/D_5004 =      (     round(     sum(/M_INVOIC/G_SG27[     G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305='S' and      G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG28/S_MOA/C_C516[D_5025='203']/D_5004      )     *10*10)     div 100     ) + (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='C' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'S' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)      -      (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='A' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'S' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-S-03]-For each different value of VAT category rate (BT-112) where the VAT category code (BT-111) is "S", the VAT category taxable amount (BT-109) in a VAT breakdown (BG-21) shall equal the sum of Invoice line net amounts (BT-122) plus the sum of document level charge amount (BT-93) minus the sum of document level allowance amount (BT-86); where the VAT category code (BT-142, BT-96, BT-89) is “S” and the VAT rate (BT-143, BT-90, BT-97) equals the VAT category rate (BT-112). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="true()"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-S-04]-The VAT category tax amount (BT-110) in VAT breakdown (BG-21) shall equal the VAT category taxable amount (BT-109) multiplied by the VAT category rate (BT-112). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C243/D_5278 &gt; 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-S-05]-An Invoice with a VAT category code "S" shall have the VAT category rate (BT-112) greater (&gt;) than 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/S_FTX[D_4451='AGM']/C_C108/D_D4440) and not (/M_INVOIC/G_SG54/S_TAX[D_5305 != 'S' and D_5305 != 'Z' and D_5305 != 'O'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-S-07]-An Invoice where VAT category code (BT-111) is "S" shall not contain the VAT exemption reason text (BT-113) for that VAT category </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27[G_SG35/S_TAX/D_5305 = 'S']"
                 priority="105"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FTX[D_4451='AGM' and D_4453='1']/C_C108/D_D4440)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-S-06]-An Invoice line where Invoiced item VAT category code (BT-142) is "S" shall not contain the Invoiced item VAT exemption reason text (BT-144) for that line. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG54/S_TAX[D_5283='7' and C_C241/D_5153='VAT' and D_5305 = 'Z']"
                 priority="104"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG27/G_SG35/S_TAX/D_5305 = 'Z'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-01]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “Z” shall contain in the VAT breakdown (BG-21) one VAT category code (BT-111) equal with "Z". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(/M_INVOIC/S_FTX[D_4451='AGM']/C_C108/D_D4440) and not (/M_INVOIC/G_SG54/S_TAX[D_5305 != 'S' and D_5305 != 'Z' and D_5305 != 'O'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-10]-An Invoice where VAT category code (BT-111) is “Z” shall not contain the VAT exemption reason text (BT-113) for that VAT Category. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/M_INVOIC/G_SG2[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153='VA']/D_1154"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-02]-An Invoice that contains a line where the Invoiced item VAT category code (BT-142) is “Z” shall contain the Seller's VAT identifier (BT-30). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="current()[D_5283='7' and C_C241/D_5153='VAT']/S_MOA/C_C516[D_5025='1']/D_5004 =      (     round(     sum(/M_INVOIC/G_SG27[     G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305='Z' and      G_SG35/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG28/S_MOA/C_C516[D_5025='203']/D_5004      )     *10*10)     div 100     ) + (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='C' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'Z' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)      -      (     round(     sum(     /M_INVOIC/G_SG16[     S_ALC/D_5463='A' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/D_5305 = 'Z' and     G_SG22/S_TAX[     D_5283='7' and      C_C241/D_5153='VAT'     ]/C_C243/D_5278 =      current()/C_C243/D_5278     ]/G_SG20/S_MOA/C_C516[     D_5025='389'     ]/D_5004     )     *10*10)     div 100)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-06]-In a VAT breakdown (BG-21) where VAT category code (BT-111) is "Z" the VAT category taxable amount (BT-109) shall equal the sum of: Invoice line net amounts where the VAT category codes (BT-142) is "Z" (BT-122) minus document level allowance amount (BT-86) plus document level charge amount (BT-93) where the VAT category codes (BT-142, BT-89, BT-96) are “Z". </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="../S_MOA/C_C516[D_5025='124']/D_5004 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-07]-The VAT category tax amount (BT-110) in a VAT breakdown (BG-21) where VAT category code (BT-111) is "Z" shall equal 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-08]-An Invoice with a VAT category code "Z" shall have the VAT category rate (BT-112) 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='A']/G_SG22/S_TAX[D_5283='7' and C_C241/D5153='VAT']"
                 priority="103"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(D_5305 = 'Z') and (C_C243/D_5278 = 0)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-04]-For a document level allowance (BG-18) where the Document level allowance VAT category code (BT-89) is "Z" the Document level allowance rate (BT-90) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG16[S_ALC/D_5463='C']/G_SG22/S_TAX[D_5283='7' and C_C241/D5153='VAT']"
                 priority="102"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(D_5305 = 'Z') and (C_C243/D_5278 = 0)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-05]-For a document level charge (BG-19) where the document level charge VAT category code (BT-96) is "Z" the Document level allowance rate (BT-97) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG27[G_SG35/S_TAX/D_5305 = 'Z']"
                 priority="101"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="G_SG35/S_TAX[D_5283='7' and C_C241/D_5153='VAT']/C_C243/D_5278 = 0"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-03]-In an Invoice line where the Invoice item VAT category code (BT-142) is "Z" the Invoiced item VAT rate (BT-143) shall be 0 (zero). </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FTX[D_4451='AGM' and D_4453='1']/C_C108/D_D4440)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[BR-Z-09]-An Invoice line where Invoiced item VAT category code (BT-142) is "Z" shall not contain the Invoiced item VAT exemption reason text (BT-144) for that line. </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M4"/>
   <xsl:template match="@*|node()" priority="-2" mode="M4">
      <xsl:choose><!--Housekeeping: SAXON warns if attempting to find the attribute
                           of an attribute-->
         <xsl:when test="not(@*)">
            <xsl:apply-templates select="node()" mode="M4"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="@*|node()" mode="M4"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--PATTERN EN16931-EDIFACT-Syntax-->


	  <!--RULE -->
   <xsl:template match="/M_INVOIC/S_UNH" priority="107" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(D_0068)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-001] - Common access reference should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_S010)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-002] - Status of the transfer should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/S_BGM" priority="106" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C002/D_1131)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-003] - Code list identification code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C002/D_3055)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-004] - Code list responsible agency code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C002/D_1000)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-005] - Document name should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C106/D_1056)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-006] - Version identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C106/D_1060)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-007] - Revision identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="D_1225='9'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-008] - Message function code should be 9 (Original)</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(D_4343)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-009] - Response type code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(D_1373)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-010] - Document status code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(D_3453)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-011] - Language name code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/S_DTM" priority="105" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="C_C507[D_2005='35' or D_2005='131' or D_2005='137' or D_2005='167' or D_2005='168']"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-012] - Only values 35, 131, 137, 167 or 168 should be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(C_C507[D_2005='35']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-013] - The actual delivery date may only be stated once</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(C_C507[D_2005='131']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-014] - The value added tax point date may only be stated once</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(C_C507[D_2005='137']) =1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-015] - The invoice issue date must be stated once</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(C_C507[D_2005='167']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-016] - The invoice period start date may only be stated once</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(C_C507[D_2005='168']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-017] - The invoice period end date may only be stated once</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC" priority="104" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_PAI)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-018] - The PAI segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_ALI)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-019] - The ALI segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_IMD)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-020] - The IMD segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_LOC)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-021] - The LOC segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_GEI)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-022] - The GEI segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_DGS)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-023] - The DGS segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_GIR)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-024] - The GIR segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG6)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-025] - The SG6 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG9)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-026] - The SG9 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG12)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-027] - The SG12 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG13)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-028] - The SG13 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG14)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-029] - The SG14 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG23)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-030] - The SG23 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG24)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-031] - The SG24 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG25)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-032] - The SG25 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_CNT)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-033] - The CNT segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG55)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-034] - The SG55 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/S_FTX" priority="103" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="current()[D_4451='GEN' or D_4451='AHR' or D_4451='AFP' or D_4451='ADE' or D_4451='AGM' or D_4451='AAB']"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-035] - Only values GEN, AHR, AFP, ADE, AGM or AAB should be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C107/D_1131)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-036] - Code list identification code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C107/D_3055)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-037] - Code list responsible agency code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(C_C108/D_4440_2 or C_C108/D_4440_3 or C_C108/D_4440_4 or C_C108/D_4440_5)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-038] - Additional free texts should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(D_3453)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-039] - Language name code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(D_4447)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-040] - Free text format code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG1" priority="102" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_RFF/C_C506[D_1153='PQ' or D_1153='IV' or D_1153='AOU' or D_1153='ATS' or D_1153='AAK' or D_1153='ALO' or D_1153='VN' or D_1153='ON' or D_1153='CT' or D_1153='AEG' or D_1153='AEF' or D_1153='CR'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-041] - Only values AAK, AEF, AEG, ALO, AOU, ATS, CR, CT, IV, ON, PQ or VN should be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_RFF/C_C506/D_1156)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-042] - Document line identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_RFF/C_C506/D_1056)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-043] - Version identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_RFF/C_C506/D_1060)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-044] - Revision identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='CR']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-045] - There should be maximal one buyer reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='AEF']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-046] - There should be maximal one business process reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='AEG']) =1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-047] - There must be exaclty one specification identification</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='CT']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-048] - There should be maximal one contract reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='ON']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-049] - There should be maximal one purchase order reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='VN']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-050] - There should be maximal one sales order reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='ALO']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-051] - There should be maximal one receiving advice reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='AAK']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-052] - There should be maximal one despatch advice reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='ATS']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-053] - There should be maximal one invoiced object reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(S_RFF/C_C506[D_1153='AOU']) &lt;=1"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-054] - There should be maximal one buyer accounting reference</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_DTM/C_C507[D_2005='3']) or not (S_DTM)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-055] - A reference date should only be stated for a preceding invoice</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_DTM/C_C507/D_2379)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-056] - Date or time or period format code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_GIR)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-057] - The segment GIR should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_LOC)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-058] - The segment LOC should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_MEA)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-059] - The segment MEA should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_QTY)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-060] - The segment QTY should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FTX)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-061] - The segment FTX should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_MOA)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-062] - The segment MOA should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_RTE)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-063] - The segment RTE should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="/M_INVOIC/G_SG2" priority="101" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_NAD[D_3035='SE' or D_3035='BY' or D_3035='PE' or D_3035='AE' or D_3035='DP']"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-064] - Only values SE, BY, PE, AE or DP should be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(S_NAD/C_C082/D_3039 and S_NAD/C_C082/D_3055) or not (S_NAD/C_C082)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-065] - If a party identifier is present, the code list responsible agency code must be stated</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C082/D_1131)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-066] - Code list identification code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C058)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-067] - Name and address composit should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD[D_3035='AE']/C_C082)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-068] - Party identification should not be used for a seller's tax representative</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD[D_3035!='SE']/C_C080/D_3036_2)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-069] - The second party name should be used for a seller</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C080/D_3036_3 or S_NAD/C_C080/D_3036_4 or S_NAD/C_C080/D_3036_5)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-070] - Additional party name should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C080/D_3045)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-071] - Party name format code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD[D_3035='PE']/C_C059)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-072] - Street should not be used in payee</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C059/D_3042_3)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-073] - Street line 3 should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C059/D_3042_4)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-074] - Street line 4 should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD[D_3035='PE']/D_3164)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-075] - City name should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C819/D_3229)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-076] - Country subdivision identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C819/D_1131)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-077] - Code list identification code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD/C_C819/D_3055)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-078] - Code list responsible agency code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD[D_3035='PE']/C_C819/D_3228)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-079] - Country subdivision name should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD[D_3035='PE']/D_3251)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-080] - Postal identification code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_NAD[D_3035='PE']/D_3207)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-081] - Country identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_LOC)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-082] - The LOC should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(not(current()[S_NAD/D_3035=('SE', 'PE')]/S_FII[D_3035='RB']))    or (current()[S_NAD/D_3035='BY']/S_FII[D_3035='BI'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-083] - The FII segment should only be used for seller, buyer and payee</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FII/C_C088/D_1131)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-084] - The code list identification code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FII/C_C088/D_1131_2)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-085] - The code list identification code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FII/C_C088/D_3055_2)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-086] - The code list responsible agency code should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FII/C_C088/D_3432)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-087] - The institution name should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FII/C_C088/D_3436)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-088] - The institution branch location name should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_FII/D_3207)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-089] - The country identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="S_FII[D_3035='BI']/C_C078/D_3192 or not (S_FII/C_C078/D_3192)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-090] - The account holder name should only be used with the buyer</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(S_MOA)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-091] - The MOA segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG3/S_DTM)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-092] - The DTM segment should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG3/S_RFF/C_C506/D_1156)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-093] - The document line identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG3/S_RFF/C_C506/D_1056)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-093] - The version identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG3/S_RFF/C_C506/D_1060)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-093] - The revision identifier should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG3/S_RFF) or        (current()[S_NAD/D_3035='SE']/G_SG3/S_RFF/C_C506[D_1153=('APA', 'VA', 'AHP', 'AII', 'AVS')]) or       (current()[S_NAD/D_3035='BY']/G_SG3/S_RFF/C_C506[D_1153=('GN', 'VA')]) or       (current()[S_NAD/D_3035='PE']/G_SG3/S_RFF/C_C506[D_1153=('GN', 'AAA', 'AVS')]) or       (current()[S_NAD/D_3035='AE']/G_SG3/S_RFF/C_C506[D_1153='VA'])"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-096] - The used reference code qualified should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG4)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-097] - The SG5 segment group should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG5) or G_SG5[S_CTA/D_3139='SU']/S_COM/C_C076[D_3155='EM']/D_3148    "/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-098] - The seller electronic address has to be given in a defined structure</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(G_SG5/S_CTA/C_C056/D_3413)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[EDIFACT-SR-099] - The contact identifer should not be used</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M5"/>
   <xsl:template match="@*|node()" priority="-2" mode="M5">
      <xsl:choose><!--Housekeeping: SAXON warns if attempting to find the attribute
                           of an attribute-->
         <xsl:when test="not(@*)">
            <xsl:apply-templates select="node()" mode="M5"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="@*|node()" mode="M5"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--PATTERN EN16931-Codes-->


	  <!--RULE -->
   <xsl:template match="//D_1001" priority="109" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' 380 381 ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-01]-An Invoice MUST be coded with the InvoiceTypeCode code list UNCL D1001 TC434 subset</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_3453" priority="108" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' ab aa af ak sq am ar an hy as av ae ay az bm ba eu be bn bh bi bs br bg my ca ch ce ny zh cv kw co cr hr cs da dv nl dz en eo et ee fo fj fi fr ff gl ka de el gn gu ht ha he hz hi ho hu ia id ie ga ig ik io is it iu ja jv kl kn kr ks kk km ki rw ky kv kg ko ku kj la lb lg li ln lo lt lu lv gv mk mg ms ml mt mi mr mh mn na nv nb nd ne ng nn no ii nr oc oj cu om or os pa pi fa pl ps pt qu rm rn ro ru sa sc sd se sm sg sr gd sn si sk sl so st az es su sw ss sv ta te tg th ti bo tk tl tn to tr ts tt tw ty ug uk ur uz ve vi vo wa cy wo fy xh yi yo za zu ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-02]-The lists of valid languages are registered with the ISO 639 Maintenance Agency Codes for the Representation of Names of Languages. It is recommended to use the ISO 639-1 alpha-2 representation</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_6345" priority="107" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GWP GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SKK SLL SOS SRD STD SVC SYP SZL THB TJS TMM TND TOP TRY TTD TWD TZS UAH UGX USD USN USS UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XFU XOF XPD XPF XTS XXX YER ZAR ZMK ZWR ZWD ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-03]-currencyID MUST be coded using ISO code list 4217 alpha-3</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_3207" priority="106" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' AD AE AF AG AI AL AM AN AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BL BJ BM BN BO BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR ST SV SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-06]-Country codes in an invoice MUST be coded using ISO code list 3166-1</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_4461" priority="105" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 60 61 62 63 64 65 66 67 70 74 75 76 77 78 91 92 93 94 95 96 97 ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-08]-Payment means in an invoice MUST be coded using UNCL 4461 code list</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_5305" priority="104" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' AE E S Z G O IC ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-10]-Invoice tax categories MUST be coded using UNCL 5305 code list</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_6411" priority="103" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' 5 6 8 10 11 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 40 41 43 44 45 46 47 48 53 54 56 57 58 59 60 61 62 63 64 66 69 71 72 73 74 76 77 78 80 81 84 85 87 89 90 91 92 93 94 95 96 97 98 1A 1B 1C 1D 1E 1F 1G 1H 1I 1J 1K 1L 1M 1X 2A 2B 2C 2G 2H 2I 2J 2K 2L 2M 2N 2P 2Q 2R 2U 2V 2W 2X 2Y 2Z 3B 3C 3E 3G 3H 3I 4A 4B 4C 4E 4G 4H 4K 4L 4M 4N 4O 4P 4Q 4R 4T 4U 4W 4X 5A 5B 5C 5E 5F 5G 5H 5I 5J 5K 5P 5Q A1 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A2 A20 A21 A22 A23 A24 A25 A26 A27 A28 A29 A3 A30 A31 A32 A33 A34 A35 A36 A37 A38 A39 A4 A40 A41 A42 A43 A44 A45 A47 A48 A49 A5 A50 A51 A52 A53 A54 A55 A56 A57 A58 A59 A6 A60 A61 A62 A63 A64 A65 A66 A67 A68 A69 A7 A70 A71 A73 A74 A75 A76 A77 A78 A79 A8 A80 A81 A82 A83 A84 A85 A86 A87 A88 A89 A9 A90 A91 A93 A94 A95 A96 A97 A98 A99 AA AB ACR ACT AD AE AH AI AJ AK AL AM AMH AMP ANN AP APZ AQ AR ARE AS ASM ASU ATM ATT AV AW AY AZ B0 B1 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B2 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B3 B30 B31 B32 B33 B34 B35 B36 B37 B38 B39 B4 B40 B41 B42 B43 B44 B45 B46 B47 B48 B49 B5 B50 B51 B52 B53 B54 B55 B56 B57 B58 B59 B6 B60 B61 B62 B63 B64 B65 B66 B67 B68 B69 B7 B70 B71 B72 B73 B74 B75 B76 B77 B78 B79 B8 B80 B81 B82 B83 B84 B85 B86 B87 B88 B89 B9 B90 B91 B92 B93 B94 B95 B96 B97 B98 B99 BAR BB BD BE BFT BG BH BHP BIL BJ BK BL BLD BLL BO BP BQL BR BT BTU BUA BUI BW BX BZ C0 C1 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C2 C20 C21 C22 C23 C24 C25 C26 C27 C28 C29 C3 C30 C31 C32 C33 C34 C35 C36 C37 C38 C39 C4 C40 C41 C42 C43 C44 C45 C46 C47 C48 C49 C5 C50 C51 C52 C53 C54 C55 C56 C57 C58 C59 C6 C60 C61 C62 C63 C64 C65 C66 C67 C68 C69 C7 C70 C71 C72 C73 C74 C75 C76 C77 C78 C79 C8 C80 C81 C82 C83 C84 C85 C86 C87 C88 C89 C9 C90 C91 C92 C93 C94 C95 C96 C97 C98 C99 CA CCT CDL CEL CEN CG CGM CH CJ CK CKG CL CLF CLT CMK CMQ CMT CNP CNT CO COU CQ CR CS CT CTG CTM CTN CU CUR CV CWA CWI CY CZ D03 D04 D1 D10 D11 D12 D13 D14 D15 D16 D17 D18 D19 D2 D20 D21 D22 D23 D24 D25 D26 D27 D28 D29 D30 D31 D32 D33 D34 D35 D36 D37 D38 D39 D40 D41 D42 D43 D44 D45 D46 D47 D48 D49 D5 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D6 D60 D61 D62 D63 D64 D65 D66 D67 D68 D69 D7 D70 D71 D72 D73 D74 D75 D76 D77 D78 D79 D8 D80 D81 D82 D83 D85 D86 D87 D88 D89 D9 D90 D91 D92 D93 D94 D95 D96 D97 D98 D99 DAA DAD DAY DB DC DD DE DEC DG DI DJ DLT DMA DMK DMO DMQ DMT DN DPC DPR DPT DQ DR DRA DRI DRL DRM DS DT DTN DU DWT DX DY DZN DZP E01 E07 E08 E09 E10 E11 E12 E14 E15 E16 E17 E18 E19 E2 E20 E21 E22 E23 E25 E27 E28 E3 E30 E31 E32 E33 E34 E35 E36 E37 E38 E39 E4 E40 E41 E42 E43 E44 E45 E46 E47 E48 E49 E5 E50 E51 E52 E53 E54 E55 E56 E57 E58 E59 E60 E61 E62 E63 E64 E65 E66 E67 E68 E69 E70 E71 E72 E73 E74 E75 E76 E77 E78 E79 E80 E81 E82 E83 E84 E85 E86 E87 E88 E89 E90 E91 E92 E93 E94 E95 E96 E97 E98 E99 EA EB EC EP EQ EV F01 F02 F03 F04 F05 F06 F07 F08 F1 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F20 F21 F22 F23 F24 F25 F26 F27 F28 F29 F30 F31 F32 F33 F34 F35 F36 F37 F38 F39 F40 F41 F42 F43 F44 F45 F46 F47 F48 F49 F50 F51 F52 F53 F54 F55 F56 F57 F58 F59 F60 F61 F62 F63 F64 F65 F66 F67 F68 F69 F70 F71 F72 F73 F74 F75 F76 F77 F78 F79 F80 F81 F82 F83 F84 F85 F86 F87 F88 F89 F9 F90 F91 F92 F93 F94 F95 F96 F97 F98 F99 FAH FAR FB FBM FC FD FE FF FG FH FIT FL FM FOT FP FR FS FTK FTQ G01 G04 G05 G06 G08 G09 G10 G11 G12 G13 G14 G15 G16 G17 G18 G19 G2 G20 G21 G23 G24 G25 G26 G27 G28 G29 G3 G30 G31 G32 G33 G34 G35 G36 G37 G38 G39 G40 G41 G42 G43 G44 G45 G46 G47 G48 G49 G50 G51 G52 G53 G54 G55 G56 G57 G58 G59 G60 G61 G62 G63 G64 G65 G66 G67 G68 G69 G7 G70 G71 G72 G73 G74 G75 G76 G77 G78 G79 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G93 G94 G95 G96 G97 G98 G99 GB GBQ GC GD GDW GE GF GFI GGR GH GIA GIC GII GIP GJ GK GL GLD GLI GLL GM GN GO GP GQ GRM GRN GRO GRT GT GV GW GWH GY GZ H03 H04 H05 H06 H07 H08 H09 H1 H10 H11 H12 H13 H14 H15 H16 H18 H19 H2 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31 H32 H33 H34 H35 H36 H37 H38 H39 H40 H41 H42 H43 H44 H45 H46 H47 H48 H49 H50 H51 H52 H53 H54 H55 H56 H57 H58 H59 H60 H61 H62 H63 H64 H65 H66 H67 H68 H69 H70 H71 H72 H73 H74 H75 H76 H77 H78 H79 H80 H81 H82 H83 H84 H85 H87 H88 H89 H90 H91 H92 H93 H94 H95 H96 H98 H99 HA HAR HBA HBX HC HD HDW HE HF HGM HH HI HIU HJ HK HKM HL HLT HM HMQ HMT HN HO HP HPA HS HT HTZ HUR HY IA IC IE IF II IL IM INH INK INQ IP ISD IT IU IV J10 J12 J13 J14 J15 J16 J17 J18 J19 J2 J20 J21 J22 J23 J24 J25 J26 J27 J28 J29 J30 J31 J32 J33 J34 J35 J36 J38 J39 J40 J41 J42 J43 J44 J45 J46 J47 J48 J49 J50 J51 J52 J53 J54 J55 J56 J57 J58 J59 J60 J61 J62 J63 J64 J65 J66 J67 J68 J69 J70 J71 J72 J73 J74 J75 J76 J78 J79 J81 J82 J83 J84 J85 J87 J89 J90 J91 J92 J93 J94 J95 J96 J97 J98 J99 JB JE JG JK JM JNT JO JOU JPS JR JWL K1 K10 K11 K12 K13 K14 K15 K16 K17 K18 K19 K2 K20 K21 K22 K23 K24 K25 K26 K27 K28 K3 K30 K31 K32 K33 K34 K35 K36 K37 K38 K39 K40 K41 K42 K43 K45 K46 K47 K48 K49 K5 K50 K51 K52 K53 K54 K55 K58 K59 K6 K60 K61 K62 K63 K64 K65 K66 K67 K68 K69 K70 K71 K73 K74 K75 K76 K77 K78 K79 K80 K81 K82 K83 K84 K85 K86 K87 K88 K89 K90 K91 K92 K93 K94 K95 K96 K97 K98 K99 KA KAT KB KBA KCC KD KDW KEL KF KG KGM KGS KHY KHZ KI KIC KIP KJ KJO KL KLK KMA KMH KMK KMQ KMT KNI KNS KNT KO KPA KPH KPO KPP KR KS KSD KSH KT KTM KTN KUR KVA KVR KVT KW KWH KWO KWT KX L10 L11 L12 L13 L14 L15 L16 L17 L18 L19 L2 L20 L21 L23 L24 L25 L26 L27 L28 L29 L30 L31 L32 L33 L34 L35 L36 L37 L38 L39 L40 L41 L42 L43 L44 L45 L46 L47 L48 L49 L50 L51 L52 L53 L54 L55 L56 L57 L58 L59 L60 L61 L62 L63 L64 L65 L66 L67 L68 L69 L70 L71 L72 L73 L74 L75 L76 L77 L78 L79 L80 L81 L82 L83 L84 L85 L86 L87 L88 L89 L90 L91 L92 L93 L94 L95 L96 L98 L99 LA LAC LBR LBT LC LD LE LEF LF LH LI LJ LK LM LN LO LP LPA LR LS LTN LTR LUB LUM LUX LX LY M0 M1 M10 M11 M12 M13 M14 M15 M16 M17 M18 M19 M20 M21 M22 M23 M24 M25 M26 M27 M29 M30 M31 M32 M33 M34 M35 M36 M37 M4 M5 M7 M9 MA MAH MAL MAM MAR MAW MBE MBF MBR MC MCU MD MF MGM MHZ MIK MIL MIN MIO MIU MK MLD MLT MMK MMQ MMT MND MON MPA MQ MQH MQS MSK MT MTK MTQ MTR MTS MV MVA MWH N1 N2 N3 NA NAR NB NBB NC NCL ND NE NEW NF NG NH NI NIL NIU NJ NL NMI NMP NN NPL NPR NPT NQ NR NRL NT NTT NU NV NX NY OA ODE OHM ON ONZ OP OT OZ OZA OZI P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 PA PAL PB PD PE PF PFL PG PGL PI PK PL PLA PM PN PO PQ PR PS PT PTD PTI PTL PU PV PW PY PZ Q3 QA QAN QB QD QH QK QR QT QTD QTI QTL QTR R1 R4 R9 RA RD RG RH RK RL RM RN RO RP RPM RPS RS RT RU S3 S4 S5 S6 S7 S8 SA SAN SCO SCR SD SE SEC SET SG SHT SIE SK SL SMI SN SO SP SQ SQR SR SS SST ST STI STK STL STN SV SW SX T0 T1 T3 T4 T5 T6 T7 T8 TA TAH TC TD TE TF TI TIC TIP TJ TK TL TMS TN TNE TP TPR TQ TQD TR TRL TS TSD TSH TT TU TV TW TY U1 U2 UA UB UC UD UE UF UH UM VA VI VLT VP VQ VS W2 W4 WA WB WCD WE WEB WEE WG WH WHR WI WM WR WSD WTT WW X1 YDK YDQ YL YRD YT Z1 Z2 Z3 Z4 Z5 Z6 Z8 ZP ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-11]-Unit code MUST be coded according to the UN/ECE Recommendation 20</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_0809" priority="102" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((. = 'application/pdf' or . = 'image/png' or . = 'image/jpeg' or . = 'text/comma-separated-values' or . = 'application/vnd.openxmlformats-officedocument. spreadsheetml.sheet' or . = 'application/vnd.oasis.opendocument.spreadsheet'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-12]-For Mime code in attribute use MIMEMediaType.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>

	  <!--RULE -->
   <xsl:template match="//D_5189" priority="101" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((not(contains(normalize-space(.), ' ')) and contains(' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 ', concat(' ', normalize-space(.), ' '))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                         xmlns:osf="http://www.oxygenxml.com/sch/functions">
               <xsl:text>[CL-13]-Coded allowance and charge reasons SHOULD belong to the UNCL 4465 code list</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M6"/>
   <xsl:template match="@*|node()" priority="-2" mode="M6">
      <xsl:choose><!--Housekeeping: SAXON warns if attempting to find the attribute
                           of an attribute-->
         <xsl:when test="not(@*)">
            <xsl:apply-templates select="node()" mode="M6"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="@*|node()" mode="M6"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
