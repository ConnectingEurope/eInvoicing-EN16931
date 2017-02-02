/*
 * Apache 2.0 license is applied. Using Philip Helgers template for validating.
 */
package org.validool.xmlvalidator;

import java.io.File;
import java.io.IOException;

import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Validator;

import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.FileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.SimpleLayout;
import org.oclc.purl.dsdl.svrl.SchematronOutputType;
import org.xml.sax.SAXException;

import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.io.resource.FileSystemResource;
import com.helger.schematron.ISchematronResource;
import com.helger.schematron.SchematronHelper;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLMarshaller;
import com.helger.schematron.xslt.SchematronResourceSCH;
import com.helger.schematron.xslt.SchematronResourceXSLT;
import com.helger.xml.schema.XMLSchemaCache;

/**
 * @author Andreas Pelekies (andreas.pelekies(at)validool.org)
 */
public final class XMLValidator
{
  private static final Logger logger = Logger.getRootLogger ();
  private static final boolean pureMode = false;

  public static void main (final String [] args)
  {
    try
    {
      final SimpleLayout layout = new SimpleLayout ();
      final ConsoleAppender consoleAppender = new ConsoleAppender (layout);
      logger.addAppender (consoleAppender);
      final FileAppender fileAppender = new FileAppender (layout, "log.txt", false);
      logger.addAppender (fileAppender);
      // ALL | DEBUG | INFO | WARN | ERROR | FATAL | OFF:
      logger.setLevel (Level.WARN);
    }
    catch (final Exception ex)
    {
      logger.info (ex);
    }

    boolean argsValid = true;
    boolean xsdMode = false;
    boolean schMode = false;
    boolean schXsltMode = false;
    String xmlFile = null;
    String xsdFile = null;
    String schFile = null;
    String svrlFile = "result.svrl";

    if (argsValid && args.length < 4)
    {
      argsValid = false;
    }
    if (argsValid && args[0].equals ("-xml"))
    {
      final File f = new File (args[1]);
      if (!f.exists () || f.isDirectory ())
      {
        logger.info ("The xml instance file does not exist.");
        argsValid = false;
      }
      else
      {
        xmlFile = args[1];
      }
    }
    else
    {
      argsValid = false;
    }
    if (argsValid && args[2].equals ("-xsd"))
    {
      final File f = new File (args[3]);
      xsdMode = true;
      if (!f.exists () || f.isDirectory ())
      {
        logger.info ("The schema file does not exist.");
        argsValid = false;
      }
      else
      {
        xsdFile = args[3];
      }
    }
    if (argsValid && (args[2].equals ("-sch") || args[2].equals ("-xslt")))
    {
      final File f = new File (args[3]);
      schMode = true;
      schXsltMode = args[2].equals ("-xslt");
      if (!f.exists () || f.isDirectory ())
      {
        logger.info ("The schematron file does not exist.");
        argsValid = false;
      }
      else
      {
        schFile = args[3];
        if (args.length >= 5)
        {
          // Optional SVRL filename - defaults to "result.svrl"
          svrlFile = args[4];
        }
      }
    }
    if (!schMode && !xsdMode)
    {
      argsValid = false;
    }

    if (!argsValid)
    {
      logger.info ("Usage XSD mode:  java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml instance.xml -xsd schema.xsd");
      logger.info ("Schematron mode: java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml instance.xml -sch schematron.sch [result.svrl]");
      if (!pureMode)
        logger.info ("Schematron mode: java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml instance.xml -xslt schematron.xslt [result.svrl]");
      return;
    }

    logger.info ("=========================================");
    System.out.print ("Starting validation against ");
    if (xsdMode)
    {
      logger.info ("schema");
      logger.info ("Result: " + validateXMLSchema (xsdFile, xmlFile));
    }
    else
    {
      logger.info ("schematron");
      logger.info ("Result: " + validateXMLSchematron (schFile, schXsltMode, xmlFile, svrlFile));
    }
    logger.info ("Finished.");
    logger.info ("=========================================");

  }

  public static boolean validateXMLSchema (final String xsdPath, final String xmlPath)
  {

    try
    {
      System.setProperty ("jdk.xml.maxOccurLimit", "9999999");
      final Validator validator = XMLSchemaCache.getInstance ().getValidator (new FileSystemResource (xsdPath));
      validator.validate (new StreamSource (new File (xmlPath)));
    }
    catch (IOException | SAXException e)
    {
      logger.info ("Exception: " + e.getMessage ());
      return false;
    }
    return true;
  }

  public static boolean validateXMLSchematron (final String schPath,
                                               final boolean schXsltMode,
                                               final String xmlPath,
                                               final String svrlPath)
  {
    final FileSystemResource aXML = new FileSystemResource (xmlPath);
    final FileSystemResource aSCH = new FileSystemResource (schPath);

    // Use pure implementation or XSLT to do the conversion?
    final ISchematronResource aSchematron = pureMode ? new SchematronResourcePure (aSCH)
                                                     : schXsltMode ? new SchematronResourceXSLT (aSCH)
                                                                   : new SchematronResourceSCH (aSCH);
    final SchematronOutputType aSOT = SchematronHelper.applySchematron (aSchematron, aXML);
    if (aSOT == null)
    {
      logger.info ("Schematron file is malformed!");
      return false;
    }

    // Write SVRL
    new SVRLMarshaller (false).write (aSOT, new FileSystemResource (svrlPath));

    final ICommonsList <SVRLFailedAssert> aFailedAsserts = SVRLHelper.getAllFailedAssertions (aSOT);
    if (aFailedAsserts.isNotEmpty ())
    {
      logger.info ("XML does not comply to Schematron! See SVRL for details: " + svrlPath);
      return false;
    }

    logger.info ("XML complies to Schematron!");
    return true;
  }

}
