// XLSXFileWriter.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.xml;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.ListIterator;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class XLSXFileWriter 
{
	private Document document = null;
	private Document resultRelsBase = null;
	private Document resultContentTypes = null;
	private Document resultWorkbookDefinition = null;
	private Document resultWorkbookRels = null;
	private Document styles = null;
	
	private OutputStream targetStream = null;	
	private ZipOutputStream zipStream;
	
	private GoodDateTimeFormat[] goodDateTimeFormats = 
	{ 
		new GoodDateTimeFormat("", "0"), 
		new GoodDateTimeFormat("dt", "22"),
		new GoodDateTimeFormat("d", "14"),
		new GoodDateTimeFormat("t", "18")
	};
		
	public XLSXFileWriter(com.altova.io.Output xlsxOutput, Document doc) throws Exception
	{
		if (xlsxOutput.getType() != com.altova.io.Output.IO_STREAM)
			throw new Exception("XLSX can be written only into stream");
		
		targetStream = xlsxOutput.getStream();
		document = doc;
	}
	
	public XLSXFileWriter(OutputStream xlsxStream, Document doc)
	{
		targetStream = xlsxStream;
		document = doc;
	}
	
	public void run() throws Exception
	{
		zipStream = new ZipOutputStream(targetStream);
		
		ArrayList<ResultWorksheet> resultWorksheets = new ArrayList<ResultWorksheet>();
		makeWorksheets(resultWorksheets);
		
		if (resultWorksheets.size() == 0)
			throw new Exception("Cannot create workbook without worksheets"); 
		
		createResultSheetContentsAndClearMatrices(resultWorksheets);
		
		ListIterator<ResultWorksheet> it = resultWorksheets.listIterator();
		while (it.hasNext())
		{
			ResultWorksheet resultWorksheet = it.next();
			save(resultWorksheet.document, "xl/" + resultWorksheet.filename);
		}
		
		makeWorkbookRels(resultWorksheets);
		save(resultWorkbookRels, "xl/_rels/workbook.xml.rels");
		
		makeWorkbookDefinition(resultWorksheets);
		save(resultWorkbookDefinition, "xl/workbook.xml");
		
		makeRelsContentTypes(resultWorksheets);
		save(resultContentTypes, "[Content_Types].xml");
		
		makeRelsBase();
		save(resultRelsBase, "_rels/.rels");
		
		makeStyles();
		save(styles, "xl/styles.xml");
		
		zipStream.close();
	}
	
	private void makeWorksheets(java.util.List<ResultWorksheet> resultWorksheets) throws Exception
	{
		
		Element workbook = XmlTreeOperations.findChildNode(document, "Workbook");
		if (workbook == null)
			throw new Exception("Workbook not found.");
		
		for (Element worksheet=XmlTreeOperations.getFirstElementChild(workbook); worksheet != null; worksheet = XmlTreeOperations.getNextElementSibling(worksheet))
		{
			if (worksheet.getLocalName().equals("Worksheet"))
			{
				// doSomething
				String sheetName = worksheet.getAttribute("Name");
				if (sheetName.length() == 0)
					throw new Exception("Cannot create a worksheet without a name");
				
				int lastRowSeen = 0;

				ResultWorksheet resultWorksheet = null;
				ListIterator<ResultWorksheet> itResultWorksheet = resultWorksheets.listIterator();
				while (itResultWorksheet.hasNext())
				{
					ResultWorksheet resultWorksheet2 = itResultWorksheet.next();
					if (resultWorksheet2.sheetName.equals(sheetName))
					{
						resultWorksheet = resultWorksheet2;
						break;
					}
				}
				
				if (resultWorksheet == null)
				{
					resultWorksheet = new ResultWorksheet(sheetName, new ArrayList<java.util.List<Element>>());
					resultWorksheets.add(resultWorksheet);
				}

				int rangeStart = 0;
				int rangeEnd = 0;

				for (Element row=XmlTreeOperations.getFirstElementChild(worksheet); row != null; row = XmlTreeOperations.getNextElementSibling(row))
				{
					if (row.getLocalName().equals("RowMarker"))
					{
						String attr = row.getAttribute("s");
						if (attr.length() > 0)
							rangeStart = Integer.parseInt(attr);
						else
							rangeStart = 0;

						int rangeCount = 0;
						attr = row.getAttribute("cnt");
						if (attr.length() > 0)
							rangeCount = Integer.parseInt(attr);

						if (rangeStart > 0)
						{
							lastRowSeen = rangeStart - 1;
							if (rangeCount > 0)
								rangeEnd = rangeStart + rangeCount - 1;
							else
								rangeEnd = 0;
						}
						else
						{
							int rangeOffset = 0;
							attr = row.getAttribute("o");
							if (attr.length() > 0)
								rangeOffset = Integer.parseInt(attr) - 1;

							if (rangeEnd == 0)
								lastRowSeen += rangeOffset;
							else
								lastRowSeen = rangeEnd + rangeOffset;

							if (rangeCount > 0)
								rangeEnd = lastRowSeen + rangeCount;
							else
								rangeEnd = 0;
						}
					}
					else
					if (row.getLocalName().equals("Row"))
					{
						String rowIndex = row.getAttribute("r");
						int n = 0;
						if (rowIndex.length() > 0 && ((n = Integer.parseInt(rowIndex)) > 0))
							lastRowSeen = n;
						else
							rowIndex = String.valueOf(++lastRowSeen);
						
						while (resultWorksheet.matrix.size() <= lastRowSeen)
							resultWorksheet.matrix.add(null);

                        if (rangeStart > 0 && lastRowSeen < rangeStart)
                            continue;

                        if (rangeEnd > 0 && lastRowSeen > rangeEnd)
                            continue;

						java.util.List<Element> lastRow = resultWorksheet.matrix.get(lastRowSeen);
						if (lastRow == null)
							lastRow = new ArrayList<Element>();
						
						makeCells(row, lastRow, rowIndex);
						resultWorksheet.matrix.set(lastRowSeen, lastRow);
					}
				}
			}
		}
	}
	
	private void makeCells(Element row, java.util.List<Element> resultRow, String rowIndex) throws Exception
	{
		int lastColSeen = 0;
		
		for (Element cell = XmlTreeOperations.getFirstElementChild(row); cell != null; cell = XmlTreeOperations.getNextElementSibling(cell))
		{
			if (cell.getLocalName().equals("Cell"))
			{
				String colIndex = cell.getAttribute("n");
				int n = 0;
				if (colIndex.length() > 0 && ((n = Integer.parseInt(colIndex)) > 0))
					lastColSeen = n;
				else
					lastColSeen++;
				
				 if (lastColSeen > 16384)
                    throw new Exception("Cannot make more than 16384 columns; This is an Excel limitation");
				
				while (resultRow.size() <= lastColSeen)
					resultRow.add(null);
				
				if (resultRow.get(lastColSeen) == null)
					resultRow.set(lastColSeen, cell);
			}
		}
	}
	
	private void createResultSheetContentsAndClearMatrices(java.util.List<ResultWorksheet> resultWorksheets) throws Exception
	{
		int workSheet = 0;
		
		ListIterator<ResultWorksheet> itResultWorksheet = resultWorksheets.listIterator();
		ResultWorksheet resultWorksheet = null;
		while(itResultWorksheet.hasNext())
		{
			resultWorksheet = itResultWorksheet.next();
			resultWorksheet.filename = ("worksheets/Sheet" + String.valueOf(workSheet++) + ".xml");
			Document resultSheetDocument = XmlTreeOperations.createDocument();
			String ns = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
			
			Element worksheet = XmlTreeOperations.appendElement(resultSheetDocument, ns, "worksheet");
			Element sheetData = XmlTreeOperations.appendElement(worksheet, ns, "sheetData");

			for (int i = 0; i < resultWorksheet.matrix.size(); i++)
			{
				java.util.List<Element> cells = resultWorksheet.matrix.get(i);
				if (cells == null || cells.size() == 0)
					continue;
				
				Element row = XmlTreeOperations.appendElement(sheetData, ns, "row");
				row.setAttribute("r", String.valueOf(i));
				
				for(int j = 0; j < cells.size(); j++)
				{
					Element cell = cells.get(j);
					if (cell == null)
						continue;
					
					String value = XmlTreeOperations.getTextValue(cell);
					Element c = XmlTreeOperations.appendElement(row, ns, "c");
					String colName = XLSXFileReader.index2ColumnName(j);
					c.setAttribute("r", colName + String.valueOf(i));
					String t = cell.getAttribute("t");
					if (t.equals("s"))
					{
						if (value.indexOf('\r') != -1 || value.indexOf('\n') != -1)
							c.setAttribute("s", "4");
						c.setAttribute("t", "inlineStr");
						Element is = XmlTreeOperations.appendElement(c, ns, "is");
						Element also_t = XmlTreeOperations.appendElement(is, ns, "t");
						also_t.appendChild(also_t.getOwnerDocument().createTextNode(value));
					}
					else
					{
						String attrName = "n";
						boolean checkForDateTimeStyle = false;
						if (t.equals("b"))
							attrName = "b";
						else if (t.equals("e"))
							attrName = "e";
						else
							checkForDateTimeStyle = true;
						
						c.setAttribute("t", attrName);
						if (checkForDateTimeStyle)
						{
							String formatHint = cell.getAttribute("f");
							if (formatHint.length() > 0)
								for (int k = 0; k < goodDateTimeFormats.length; k++)
									if (formatHint.equals(goodDateTimeFormats[k].name))
										c.setAttribute("s", String.valueOf(k));
						}
						Element v = XmlTreeOperations.appendElement(c, ns, "v");
						v.appendChild(v.getOwnerDocument().createTextNode(value));
					}
				}
			}
			resultWorksheet.matrix.clear();
			resultWorksheet.document = resultSheetDocument;
		}
	}
	
	private void makeWorkbookRels(java.util.List<ResultWorksheet> resultWorksheets) throws Exception
	{
		resultWorkbookRels = XmlTreeOperations.createDocument();
		String ns = "http://schemas.openxmlformats.org/package/2006/relationships";
		Element relationships = XmlTreeOperations.appendElement(resultWorkbookRels, ns, "Relationships");
		
		Element stylesRel = XmlTreeOperations.appendElement(relationships, ns, "Relationship");
		stylesRel.setAttribute("Id", "rId");
		stylesRel.setAttribute("Type", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles");
		stylesRel.setAttribute("Target", "styles.xml");
		
		int n = 1;
		ListIterator<ResultWorksheet> itR = resultWorksheets.listIterator();
		while (itR.hasNext())
		{
			Element relationship = XmlTreeOperations.appendElement(relationships, ns, "Relationship");
			relationship.setAttribute("Id", "r" + String.valueOf(n));
			relationship.setAttribute("Target", itR.next().filename);
			relationship.setAttribute("Type", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet");
			n++;
		}
	}
	
	private void makeWorkbookDefinition(java.util.List<ResultWorksheet> resultWorksheets) throws Exception
	{
		resultWorkbookDefinition = XmlTreeOperations.createDocument();
		String ns = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
		Element workbook = XmlTreeOperations.appendElement(resultWorkbookDefinition, ns, "workbook");
		
		workbook.setAttribute("xmlns:r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
		Element fileVersion = XmlTreeOperations.appendElement(workbook, ns, "fileVersion");
		fileVersion.setAttribute("appName", "xl");
		fileVersion.setAttribute("lastEdited", "4");
		fileVersion.setAttribute("lowestEdited", "4");
		Element sheets = XmlTreeOperations.appendElement(workbook, ns, "sheets");
		ListIterator<ResultWorksheet> it = resultWorksheets.listIterator();
		int iSheet = 1;
		while (it.hasNext())
		{
			Element sheet = XmlTreeOperations.appendElement(sheets, ns, "sheet");
			sheet.setAttribute("name", it.next().sheetName);
			sheet.setAttribute("sheetId", String.valueOf(iSheet));
			sheet.setAttribute("r:id", "r" + String.valueOf(iSheet));
			iSheet++;
		}
	}

	private void makeRelsContentTypes(java.util.List<ResultWorksheet> resultWorksheets) throws Exception
	{
		resultContentTypes = XmlTreeOperations.createDocument();
		String ns = "http://schemas.openxmlformats.org/package/2006/content-types"; 
		Element types = XmlTreeOperations.appendElement(resultContentTypes, ns, "Types");
				
		Element defaault = XmlTreeOperations.appendElement(types, ns, "Default");
		defaault.setAttribute("Extension", "rels");	
		defaault.setAttribute("ContentType", "application/vnd.openxmlformats-package.relationships+xml");	
		defaault = XmlTreeOperations.appendElement(types, ns, "Default");
		defaault.setAttribute("Extension", "xml");	
		defaault.setAttribute("ContentType", "application/xml");	
		
		Element override = XmlTreeOperations.appendElement(types, ns, "Override");
		override.setAttribute("PartName", "/xl/workbook.xml");
		override.setAttribute("ContentType", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml");
		
		override = XmlTreeOperations.appendElement(types, ns, "Override");
		override.setAttribute("PartName", "/xl/styles.xml");
		override.setAttribute("ContentType", "application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml");
		
		ListIterator<ResultWorksheet> it = resultWorksheets.listIterator();
		while (it.hasNext())
		{
			override = XmlTreeOperations.appendElement(types, ns, "Override");
			override.setAttribute("PartName", "/xl/" + it.next().filename);
			override.setAttribute("ContentType", "application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml");
		}
	}
	
	private void makeRelsBase() throws Exception
	{
		resultRelsBase = XmlTreeOperations.createDocument();
		String ns = "http://schemas.openxmlformats.org/package/2006/relationships";
		Element relationships = XmlTreeOperations.appendElement(resultRelsBase, ns, "Relationships");
		relationships.setAttribute("xmlns", "http://schemas.openxmlformats.org/package/2006/relationships");
		Element relationship = XmlTreeOperations.appendElement(relationships, ns, "Relationship");
		relationship.setAttribute("Id", "rId");
		relationship.setAttribute("Type", "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument");
		relationship.setAttribute("Target", "xl/workbook.xml");
	}
	
	private void makeStyles() throws Exception
	{
		styles = XmlTreeOperations.createDocument();
		String ns = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
		Element stylesheet = XmlTreeOperations.appendElement(styles, ns, "styleSheet");
		stylesheet.setAttribute("xmlns", "http://schemas.openxmlformats.org/spreadsheetml/2006/main");
		
		addEverythingToStylesWhichExcelWantsToHaveToOpenTheCreatedFile(stylesheet);
		
		Element cellXfs = XmlTreeOperations.appendElement(stylesheet, ns, "cellXfs");
		cellXfs.setAttribute("count", "5");
		for (int i=0; i<goodDateTimeFormats.length; i++)
		{
			Element xf = XmlTreeOperations.appendElement(cellXfs, ns, "xf");
			xf.setAttribute("numFmtId", goodDateTimeFormats[i].id);
			xf.setAttribute("fontId", "0");
			if (i>0)
				xf.setAttribute("applyNumberFormat", "1");
		}
		Element xf = XmlTreeOperations.appendElement(cellXfs, ns, "xf");
		xf.setAttribute("numFmtId", "0");
		xf.setAttribute("fontId", "0");
		xf.setAttribute("applyAlignment", "1");
		Element alignment = XmlTreeOperations.appendElement(xf, ns, "alignment");
		alignment.setAttribute("wrapText", "1");
	}
	
	private void addEverythingToStylesWhichExcelWantsToHaveToOpenTheCreatedFile(Element stylesheet)
	{
		String ns = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
		Element fonts = XmlTreeOperations.appendElement(stylesheet, ns, "fonts");
		fonts.setAttribute("count", "1");
		Element font = XmlTreeOperations.appendElement(fonts, ns, "font");
		XmlTreeOperations.appendElement(font, ns, "sz").setAttribute("val", "10");
		XmlTreeOperations.appendElement(font, ns, "name").setAttribute("val", "Arial");
		
		Element fills = XmlTreeOperations.appendElement(stylesheet, ns, "fills");
		fills.setAttribute("count", "1");
		Element fill = XmlTreeOperations.appendElement(fills, ns, "fill");
		XmlTreeOperations.appendElement(fill, ns, "patternFill").setAttribute("patternType", "none");
		
		Element borders = XmlTreeOperations.appendElement(stylesheet, ns, "borders");
		borders.setAttribute("count", "1");
		Element border = XmlTreeOperations.appendElement(borders, ns, "border");
		XmlTreeOperations.appendElement(border, ns, "left");
		XmlTreeOperations.appendElement(border, ns, "right");
		XmlTreeOperations.appendElement(border, ns, "top");
		XmlTreeOperations.appendElement(border, ns, "bottom");
		XmlTreeOperations.appendElement(border, ns, "diagonal");
		
		Element cellStyleXfs = XmlTreeOperations.appendElement(stylesheet, ns, "cellStyleXfs");
		cellStyleXfs.setAttribute("count", "1");
		Element xf = XmlTreeOperations.appendElement(cellStyleXfs, ns, "xf");
		xf.setAttribute("numFmtId", "0");
		xf.setAttribute("fontId", "0");
		xf.setAttribute("fillId", "0");
		xf.setAttribute("borderId", "0");
	}
	
	private void save(Object p, String path) throws Exception
	{
		zipStream.putNextEntry(new ZipEntry(path));

		XmlTreeOperations.saveDocument((Document) p, zipStream, "UTF-8", false, false, false, false);

		zipStream.closeEntry();
	}
			
	private class ResultWorksheet
	{
		public ResultWorksheet(String sheetName, ArrayList<java.util.List<Element>> matrix) {this.sheetName=sheetName; this.filename=null; this.matrix = matrix; document = null;}
		public String sheetName = null;
		public String filename = null;
		public ArrayList<java.util.List<Element>> matrix = null;
		public Document document = null;
	}
	
	private class GoodDateTimeFormat
	{
		public GoodDateTimeFormat(String n, String i) {name = n; id = i;}
		public String name;
		public String id;
	}
}
