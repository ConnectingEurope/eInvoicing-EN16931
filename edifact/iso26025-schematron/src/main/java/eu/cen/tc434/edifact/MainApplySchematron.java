package eu.cen.tc434.edifact;

import org.unece.cefact.invoic.d14b.MINVOIC;

import com.helger.commons.io.resource.FileSystemResource;
import com.helger.commons.system.SystemProperties;

public final class MainApplySchematron
{
  public static void main (final String [] args)
  {
    SystemProperties.setPropertyValue ("jdk.xml.maxOccurLimit", Integer.toString (9_999_999));
    final FileSystemResource aXML = new FileSystemResource ("src/main/resources/xml/invoic5.xml");

    final InvoicReader aReader = new InvoicReader ();
    final MINVOIC aInvoic = aReader.read (aXML);
    if (aInvoic == null)
    {
      System.err.println ("Failed to validate XML against XSD");
    }
    else
    {
      System.out.println ("XML is valid according to XSD!");
      // SchematronHelper.applySchematron (aSchematron, aXML);
    }
  }
}
