package eu.cen.tc434.edifact;

import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;

import org.unece.cefact.invoic.d14b.MINVOIC;

import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.jaxb.AbstractJAXBMarshaller;

/**
 * A wrapper around JAXB generated classes to read respective XML documents
 *
 * @author Philip Helger
 */
public class InvoicReader extends AbstractJAXBMarshaller <MINVOIC>
{
  private static final IReadableResource XSD = new ClassPathResource ("xsd/INVOIC_D14B_ISO20625.xsd");

  protected InvoicReader ()
  {
    super (MINVOIC.class,
           new CommonsArrayList<> (XSD),
           x -> new JAXBElement <MINVOIC> (new QName ("", "M_INVOICE"), MINVOIC.class, x));
  }
}
