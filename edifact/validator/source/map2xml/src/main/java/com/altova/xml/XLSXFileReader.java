// XLSXFileReader.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.xml;

import org.w3c.dom.Node;
import org.w3c.dom.Element;
import org.w3c.dom.Document;
import java.util.ArrayList;
import java.io.InputStream;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipEntry;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class XLSXFileReader
{
	private static String[] sheetTypeURIs = {
		"http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet",
		"http://purl.oclc.org/ooxml/officeDocument/relationships/worksheet" };

	private static String[] officeDocumentTypeURIs = {
		"http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument",
		"http://purl.oclc.org/ooxml/officeDocument/relationships/officeDocument" };

	private static String[] sharedStringsTypeURIs = {
		"http://schemas.openxmlformats.org/officeDocument/2006/relationships/sharedStrings", 
		"http://purl.oclc.org/ooxml/officeDocument/relationships/sharedStrings" };

	private static String[] namespaces = {
		"http://schemas.openxmlformats.org/officeDocument/2006/relationships",
		"http://purl.oclc.org/ooxml/officeDocument/relationships" };

	private Document relsBaseDoc = null;
	private Document workBookDoc = null;
	private String workBookFileName = null;
	private Document workBookRels = null;
	
	private java.util.List<String> sharedStrings = null;
	
	private Document resultDoc = null;
	private Element resultWorkBook = null;
	
	private java.util.List<String> workSheetNames = null;
	
	private InputStream inStream = null;
	private ZipInputStream xlsxZip = null;
	private java.util.HashMap<String,Document> entries = null;
			
	private int minColumn = 0;
	private int maxColumn = 0;
	
	private final static int InternalFormatNumber_String = 0;
	private final static int InternalFormatNumber_Number = 1;

	private final static int XLSXVersion_Xlsx2007 = 0;
	private final static int XLSXVersion_StrictOpenXML = 1;
	private int xlsxVersion = XLSXVersion_Xlsx2007;

	private int GetArraysIndex()
	{
		return xlsxVersion;
	}
	
	public XLSXFileReader(com.altova.io.Input xlsxInput) throws Exception
	{
		if (xlsxInput.getType() != com.altova.io.Output.IO_STREAM)
			throw new Exception("XLSX can be read from the stream");
		
		inStream = new java.io.BufferedInputStream(xlsxInput.getStream());
		xlsxZip = new ZipInputStream(inStream);
		entries = new java.util.HashMap<String,Document>();
	}
	
	public XLSXFileReader(InputStream in) throws Exception
	{
		inStream = new java.io.BufferedInputStream(in);
		xlsxZip = new ZipInputStream(inStream);
		entries = new java.util.HashMap<String,Document>();
	}
	
	public Document run() throws Exception
	{
		relsBaseDoc = openRelsBase();
		workBookDoc = openWorkBook();
		workBookRels = openWorkBookRels();
		sharedStrings = makeSharedStrings();
		
		resultDoc = XmlTreeOperations.createDocument();
		resultWorkBook = resultDoc.createElementNS(null, "Workbook");
		resultDoc.appendChild(resultWorkBook);
		resultWorkBook.setAttribute("uri", workBookFileName);
		
		makeWorkBook();
		
		return resultDoc;
	}
	
	private Document openRelsBase() throws Exception
	{
		return loadDocumentFromZip(xlsxZip, "_rels/.rels");
	}
	
	private Document openWorkBook() throws Exception
	{
		workBookFileName = findRelationTargetForKey(relsBaseDoc, "Type", officeDocumentTypeURIs[0]);
		if (workBookFileName == null)
		{
			workBookFileName = findRelationTargetForKey(relsBaseDoc, "Type", officeDocumentTypeURIs[1]);
			xlsxVersion = XLSXVersion_StrictOpenXML;
		}
		else
			xlsxVersion = XLSXVersion_Xlsx2007;
		
		return loadDocumentFromZip(xlsxZip, workBookFileName);
	}
	
	
	private Document openWorkBookRels() throws Exception
	{
		String workBookRelsName = getRelationsFileNameForFileName(workBookFileName);
		return loadDocumentFromZip(xlsxZip, workBookRelsName);
	}
	
	private java.util.List<String> makeSharedStrings() throws Exception
	{
		String stringTableFileName = findRelationTargetForKey(workBookRels, "Type", sharedStringsTypeURIs[GetArraysIndex()]);
		if (stringTableFileName == null)
			return null;
		
		stringTableFileName = replaceFilename(workBookFileName, stringTableFileName);
		
		Document sharedStringsDoc = loadDocumentFromZip(xlsxZip, stringTableFileName);
		
		Element sst = sharedStringsDoc.getDocumentElement();
		if (!sst.getLocalName().equals("sst"))
			throw new Exception ("makeSharedStrings: document element is not sst!");
		
		int count = Integer.parseInt(sst.getAttribute("count"));
		
		sharedStrings = new ArrayList<String>(count);
		
		for (Node si = XmlTreeOperations.getFirstElementChild(sst); si != null; si = XmlTreeOperations.getNextElementSibling(si))
			sharedStrings.add(XmlTreeOperations.getTextValue(si));
		
		return sharedStrings;
	}
	
	private void makeWorkBook() throws Exception
	{
		Element workBookNode = getChildNode(workBookDoc, "workbook");
		Element sheets = getChildNode(workBookNode, "sheets");
		
		workSheetNames = new ArrayList<String>();
		
		for (Element sheet = XmlTreeOperations.getFirstElementChild(sheets); sheet != null; sheet = XmlTreeOperations.getNextElementSibling(sheet))
		{
			String sheetRelId = sheet.getAttributeNS(namespaces[GetArraysIndex()], "id");
			String sheetName = sheet.getAttribute("name");
			
			workSheetNames.add(sheetName);
			
			String typeURI = findRelationInfoForKey(workBookRels, "Id", sheetRelId, "Type");
			if (typeURI == null || !typeURI.equals(sheetTypeURIs[GetArraysIndex()]))
				continue;
			
			String sheetFileName = findRelationTargetForKey(workBookRels, "Id", sheetRelId);
			if (sheetFileName == null)
				continue;
			
			sheetFileName = replaceFilename(workBookFileName, sheetFileName);
			
			Element resultWorkSheet = (Element) resultWorkBook.appendChild(resultDoc.createElementNS(null, "Worksheet"));
			resultWorkSheet.setAttribute("Name", sheetName);
			
			makeWorkSheet(loadDocumentFromZip(xlsxZip, sheetFileName), resultWorkSheet);
		}
	}
	
	private void makeWorkSheet(Document sheetDoc, Element resultWorkSheet) throws Exception
	{
		if (sheetDoc == null)
			throw new Exception ("makeWorkSheet: can't live without sheetDoc");
		
		int lastRowSeen = 0;

		Element workSheetElement = getChildNode(sheetDoc, "worksheet");
		
		Element dimension = null;
		boolean mustCreateDimension = false;
		
		dimension = (Element) resultWorkSheet.appendChild(resultDoc.createElementNS(null, "Dimension"));
		Element dimensionElement = XmlTreeOperations.findChildNode(workSheetElement, "dimension");
		if (dimensionElement == null)
			mustCreateDimension = true;
		else
		{
			String firstCell = dimensionElement.getAttribute("ref");
			if (firstCell.length() > 0)
			{
				Pattern pattern = Pattern.compile("([A-Z]+)(\\d+)(:([A-Z]+)(\\d+))?");
				Matcher matcher = pattern.matcher(firstCell);
				if (!matcher.matches())
					throw new Exception("makeWorkSheet: dimension " + firstCell + " doesn't match");
				int firstColumnIndex = matcher.group(1) != null ? columnName2Index(matcher.group(1)) : 1;
				int firstRowIndex = matcher.group(2) != null ? Integer.parseInt(matcher.group(2)) : 1; 
				int secondColumnIndex = matcher.group(4) != null ? columnName2Index(matcher.group(4)) : firstColumnIndex;
				int secondRowIndex = matcher.group(5) != null ? Integer.parseInt(matcher.group(5)) : firstRowIndex; 
			
				writeDimension(dimension, firstRowIndex, secondRowIndex, firstColumnIndex, secondColumnIndex);
			}
			else
				mustCreateDimension = true;
		}
		
		Element sheetDataElement = getChildNode(workSheetElement, "sheetData");
		
		minColumn = ~0;
		maxColumn = 0;
		
		for (Element rowElement = XmlTreeOperations.getFirstElementChild(sheetDataElement); rowElement != null; rowElement = XmlTreeOperations.getNextElementSibling(rowElement))
		{
			if (!rowElement.getLocalName().equals("row"))
				continue;
			
			Element resultRow = (Element) resultWorkSheet.appendChild(resultDoc.createElementNS(null, "Row"));
			String rowNumber = rowElement.getAttribute("r");
			if (rowNumber.length() > 0)
				lastRowSeen = Integer.parseInt(rowNumber);
			else
			{
				++lastRowSeen;
				rowNumber = String.valueOf(lastRowSeen);
			}
			resultRow.setAttribute("r", rowNumber);
			makeRow(rowElement, resultRow);
		}
		
		if (mustCreateDimension)
		{
			int firstRowIndex = 1;
			
			Element firstRow = XmlTreeOperations.findChildNode(resultWorkSheet, "Row");
			if (firstRow != null)
				firstRowIndex = Integer.parseInt(firstRow.getAttribute("r"));
			writeDimension(dimension, firstRowIndex, lastRowSeen, minColumn, maxColumn);
		}
	}
	
	private void makeRow(Element xlsxRow, Element resultRow)
	{
		int lastColSeen = 0;
		
		for (Element c = XmlTreeOperations.getFirstElementChild(xlsxRow); c != null; c =  XmlTreeOperations.getNextElementSibling(c))
		{
			if (!c.getLocalName().equals("c"))
				continue;
			
			Element v = XmlTreeOperations.findChildNode(c, "v");
			Element is = XmlTreeOperations.findChildNode(c, "is");
			if (v == null && is == null)
				continue;

			Element resultCol = (Element) resultRow.appendChild(resultDoc.createElementNS(null, "Cell"));
			String columnIdentifier = c.getAttribute("r");
			
			if (columnIdentifier.length() > 0)
			{
				int i = 0;
				while (Character.isLetter(columnIdentifier.charAt(i))) ++i;
				String colId = columnIdentifier.substring(0, i);
				lastColSeen = columnName2Index(colId);
				resultCol.setAttribute("c", colId);
			}
			else
			{
				lastColSeen++;
				resultCol.setAttribute("c", index2ColumnName(lastColSeen));
			}
			
			resultCol.setAttribute("n", String.valueOf(lastColSeen));
			
			minColumn = (lastColSeen < minColumn) ? lastColSeen : minColumn;
			maxColumn = (lastColSeen > maxColumn) ? lastColSeen : maxColumn;
			
			String cf1 = c.getAttribute("t");
			if (cf1.equals("")) cf1 = "n";
			int cf2 = InternalFormatNumber_Number;
			
			if (cf1.equals("inlineStr"))
			{
				cf2 = InternalFormatNumber_String;
				resultCol .setAttribute("t", "s");
				if (is != null)
					resultCol.appendChild(resultDoc.createTextNode(XmlTreeOperations.getTextValue(is)));
			}
			else
			{
				if (v != null)
				{
					String textValue = XmlTreeOperations.getTextValue(v);
					if (cf1.equals("s"))
					{
						cf2 = InternalFormatNumber_String;
						resultCol.setAttribute("t", "s");
						int stringIndex = Integer.parseInt(textValue);
						if (stringIndex < sharedStrings.size())
							resultCol.appendChild(resultDoc.createTextNode(sharedStrings.get(stringIndex)));
					}
					else
					{
						if (cf1.equals("str") || cf1.equals("e"))
							resultCol.setAttribute("t", "s");
						else
							resultCol.setAttribute("t", cf1);
						resultCol.appendChild(resultDoc.createTextNode(textValue));
					}
				}
			}
		}
	}

	private void writeDimension(Element dimension, int firstRowIndex, int secondRowIndex, int firstColumnIndex, int secondColumnIndex)
	{
		dimension.setAttribute("FirstRow", String.valueOf(firstRowIndex));
		dimension.setAttribute("FirstColumn", String.valueOf(firstColumnIndex));
		dimension.setAttribute("LastRow", String.valueOf(secondRowIndex));
		dimension.setAttribute("LastColumn", String.valueOf(secondColumnIndex));
	}
	
	private Element getChildNode(Node node, String localName) throws Exception
	{
		Element e = XmlTreeOperations.findChildNode(node, localName);
		if (e == null) 
			throw new Exception("Child " + localName + " not found in node " + node.getLocalName());
		return e;
	}
	
	
	public static int columnName2Index(String colName)
	{
		int index = 0;
		
		for (int i=0; i < colName.length(); i++)
		{
			int col = (int) colName.charAt(i);
			if ( col < (int)'A' || col > (int)'Z')
				return 0;

			index = (index * 26) + col - ((int) 'A' - 1);
		}
		
		return index;
	}
	
	public static String index2ColumnName(int index)
	{
		//char p;
		StringBuffer str = new StringBuffer();

		if (index == 0)
			return str.toString();
		
		do
		{
			str = str.insert(0, (char) ('A' + (char) --index % 26));
			index /= 26;
		}
		while (index > 0);
		return str.toString();
	}
	
	private String findRelationTargetForKey(Node node, String keyName, String key)
	{
		return findRelationInfoForKey(node, keyName, key, "Target");
	}
	
	private String findRelationInfoForKey(Node node, String keyName, String key, String type)
	{
		for (Element n = XmlTreeOperations.getFirstElementChild(node); n != null; n = XmlTreeOperations.getNextElementSibling(n))
			if (n.getLocalName().equals("Relationships"))
				for (Element m = XmlTreeOperations.getFirstElementChild(n); m != null; m = XmlTreeOperations.getNextElementSibling(m))
					if (m.getLocalName().equals("Relationship"))
						if (m.getAttribute(keyName).equals(key))
							return m.getAttribute(type);
						
		return null;
	}
	
	private Document loadDocumentFromZip(ZipInputStream zip, String entryName) throws Exception
	{
		Document doc = entries.remove(entryName);
		if (doc != null)
			return doc;
		
		ZipEntry entry = null;
		while((entry = zip.getNextEntry()) != null)
		{
			if (entry.isDirectory())
				continue;
			
			if (entry.getName().endsWith(".xml") || entry.getName().endsWith(".rels"))
			{
				doc = XmlTreeOperations.loadDocument(new NoCloseInputStream(zip));
				if (entryName.equals(entry.getName()))
					return doc;
				
				entries.put(entry.getName(), doc);
			}
		}
		return null;
	}
	
	private String getRelationsFileNameForFileName(String filename)
	{
		int i = filename.lastIndexOf('/');
		String path = filename.substring(0, i+1);
		String file = filename.substring(i+1);
		return path + "_rels/" + file + ".rels";
	}

	private String replaceFilename(String o, String n)
	{
		int i = o.lastIndexOf('/');
		if (n.startsWith(o.substring(0, i+1)))
			return n;
		return o.substring(0, i+1) + n;
	}
	
	class NoCloseInputStream extends java.io.FilterInputStream 
	{
		public NoCloseInputStream(InputStream i) {super(i);}
		public void close() {}
	}
}
