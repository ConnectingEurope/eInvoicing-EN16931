package eu.cen.tc434.edifact;

import java.util.List;

import org.oclc.purl.dsdl.svrl.SchematronOutputType;
import org.unece.cefact.invoic.d14b.MINVOIC;

import com.helger.commons.io.resource.FileSystemResource;
import com.helger.commons.system.SystemProperties;
import com.helger.schematron.ISchematronResource;
import com.helger.schematron.SchematronHelper;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLWriter;

public final class MainApplySchematron
{
  public static void main (final String [] args)
  {
    SystemProperties.setPropertyValue ("jdk.xml.maxOccurLimit", Integer.toString (9_999_999));
    final FileSystemResource aXML = new FileSystemResource ("src/main/resources/xml/invoic5.xml");
    final FileSystemResource aSCH = new FileSystemResource ("src/main/resources/sch/example.sch");

    final InvoicReader aReader = new InvoicReader ();
    final MINVOIC aInvoic = aReader.read (aXML);
    if (aInvoic == null)
    {
      System.err.println ("Failed to validate XML against XSD");
    }
    else
    {
      System.out.println ("XML is valid according to XSD!");

      final ISchematronResource aSchematron = new SchematronResourcePure (aSCH);
      final SchematronOutputType aSOT = SchematronHelper.applySchematron (aSchematron, aXML);
      if (aSOT == null)
        System.out.println ("Seems like the Schematron has error - check the console log!");
      else
      {
        final String sSVRL = SVRLWriter.createXMLString (aSOT);
        final List <SVRLFailedAssert> aFailedAsserts = SVRLHelper.getAllFailedAssertions (aSOT);
        if (aFailedAsserts.isEmpty ())
        {
          System.out.println ("XML complies to Schematron! SVRL:\n" + sSVRL);
        }
        else
        {
          System.err.println ("XML does not comply to Schematron! SVRL:\n" + sSVRL);
        }
      }
    }
  }
}
