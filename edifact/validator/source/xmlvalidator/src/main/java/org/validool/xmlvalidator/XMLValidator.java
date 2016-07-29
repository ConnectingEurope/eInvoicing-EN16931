/*
 * Apache 2.0 license is applied. Using Philip Helgers template for validating.
 */
package org.validool.xmlvalidator;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.FileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.SimpleLayout;
import org.oclc.purl.dsdl.svrl.SchematronOutputType;
import org.xml.sax.SAXException;

import com.helger.commons.io.resource.FileSystemResource;
import com.helger.schematron.ISchematronResource;
import com.helger.schematron.SchematronHelper;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLMarshaller;

/**
 * @author Andreas Pelekies (andreas.pelekies(at)validool.org)
 */
public class XMLValidator
{
  private static Logger logger = Logger.getRootLogger ();

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
      System.out.println (ex);
    }

    boolean argsValid = true;
    boolean xsdMode = false;
    boolean schMode = false;
    String xmlFile = null;
    String xsdFile = null;
    String schFile = null;

    if (argsValid && args.length < 4)
    {
      argsValid = false;
    }
    if (argsValid && args[0].compareTo ("-xml") == 0)
    {
      final File f = new File (args[1]);
      if (!f.exists () || f.isDirectory ())
      {
        System.out.println ("The xml instance file does not exist.");
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
    if (argsValid && args[2].compareTo ("-xsd") == 0)
    {
      final File f = new File (args[3]);
      xsdMode = true;
      if (!f.exists () || f.isDirectory ())
      {
        System.out.println ("The schema file does not exist.");
        argsValid = false;
      }
      else
      {
        xsdFile = args[3];
      }
    }
    if (argsValid && args[2].compareTo ("-sch") == 0)
    {
      final File f = new File (args[3]);
      schMode = true;
      if (!f.exists () || f.isDirectory ())
      {
        System.out.println ("The schematron file does not exist.");
        argsValid = false;
      }
      else
      {
        schFile = args[3];
      }
    }
    if (!schMode && !xsdMode)
    {
      argsValid = false;
    }

    if (!argsValid)
    {
      System.out.println ("Usage: java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml instance.xml -xsd schema.xsd");
      System.out.println ("or   : java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml instance.xml -sch schematron.sch");
      return;
    }

    System.out.println ("=========================================");
    System.out.print ("Starting validation against ");
    if (xsdMode)
    {
      System.out.println ("schema");
      System.out.println ("Result: " + validateXMLSchema (xsdFile, xmlFile));
    }
    else
    {
      System.out.println ("schematron");
      System.out.println ("Result: " + validateXMLSchematron (schFile, xmlFile, "result.svrl"));
    }
    System.out.println ("Finished.");
    System.out.println ("=========================================");

  }

  public static boolean validateXMLSchema (final String xsdPath, final String xmlPath)
  {

    try
    {
      System.setProperty ("jdk.xml.maxOccurLimit", "9999999");
      final SchemaFactory factory = SchemaFactory.newInstance (XMLConstants.W3C_XML_SCHEMA_NS_URI);
      final Schema schema = factory.newSchema (new File (xsdPath));
      final Validator validator = schema.newValidator ();

      validator.validate (new StreamSource (new File (xmlPath)));
    }
    catch (IOException | SAXException e)
    {
      System.out.println ("Exception: " + e.getMessage ());
      return false;
    }
    return true;
  }

  public static boolean validateXMLSchematron (final String schPath, final String xmlPath, final String svrlPath)
  {
    final FileSystemResource aXML = new FileSystemResource (xmlPath);
    final FileSystemResource aSCH = new FileSystemResource (schPath);

    final ISchematronResource aSchematron = new SchematronResourcePure (aSCH);
    final SchematronOutputType aSOT = SchematronHelper.applySchematron (aSchematron, aXML);
    if (aSOT == null)
    {
      System.out.println ("Schematron file is malformed!");
      return false;
    }
    new SVRLMarshaller (false).write (aSOT, new FileSystemResource (svrlPath));

    final List <SVRLFailedAssert> aFailedAsserts = SVRLHelper.getAllFailedAssertions (aSOT);
    if (!aFailedAsserts.isEmpty ())
    {
      System.out.println ("XML does not comply to Schematron! SVRL:");
      return false;
    }

    System.out.println ("XML complies to Schematron!");
    return true;
  }

}
