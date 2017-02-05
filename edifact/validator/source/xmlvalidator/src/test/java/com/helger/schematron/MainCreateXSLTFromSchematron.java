package com.helger.schematron;

import java.io.File;
import java.io.OutputStream;

import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.SimpleLayout;

import com.helger.commons.io.file.FileHelper;
import com.helger.schematron.svrl.CSVRL;
import com.helger.schematron.xslt.ISchematronXSLTBasedProvider;
import com.helger.schematron.xslt.SchematronResourceSCH;
import com.helger.xml.CXML;
import com.helger.xml.XMLHelper;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.write.XMLWriter;
import com.helger.xml.serialize.write.XMLWriterSettings;

public class MainCreateXSLTFromSchematron
{
  private static final Logger logger = Logger.getRootLogger ();

  public static void main (final String [] args)
  {
    logger.addAppender (new ConsoleAppender (new SimpleLayout ()));
    logger.setLevel (Level.INFO);

    final File aSchFile = new File ("../../../schematron/EN16931-EDIFACT-validation.sch");
    final File aXsltFile = new File ("../../../stylesheet/EN16931-EDIFACT-validation-compiled.xsl");

    logger.info ("Reading Schematron");
    final SchematronResourceSCH aSch = SchematronResourceSCH.fromFile (aSchFile);
    final ISchematronXSLTBasedProvider aXsltProvider = aSch.getXSLTProvider ();

    // Write the resulting XSLT file to disk
    final MapBasedNamespaceContext aNSContext = new MapBasedNamespaceContext ().addMapping ("svrl",
                                                                                            CSVRL.SVRL_NAMESPACE_URI);
    // Add all namespaces from XSLT document root
    final String sNSPrefix = CXML.XML_ATTR_XMLNS + ":";
    XMLHelper.getAllAttributesAsMap (aXsltProvider.getXSLTDocument ().getDocumentElement ())
             .forEach ( (sAttrName, sAttrValue) -> {
               if (sAttrName.startsWith (sNSPrefix))
                 aNSContext.addMapping (sAttrName.substring (sNSPrefix.length ()), sAttrValue);
             });

    final XMLWriterSettings aXWS = new XMLWriterSettings ();
    aXWS.setNamespaceContext (aNSContext).setPutNamespaceContextPrefixesInRoot (true);

    logger.info ("Writing XSLT");
    final OutputStream aOS = FileHelper.getOutputStream (aXsltFile);
    XMLWriter.writeToStream (aXsltProvider.getXSLTDocument (), aOS, aXWS);

    logger.info ("Done");
  }
}
