#!/bin/sh

XSD_PATH=../schema/official_tsin.004.001.01.xsd
XML_PATH=../instance/example_01_tsin.004.001.01.xml

java -jar en16931-xml-validator-0.1.0-jar-with-dependencies.jar -xml $XML_PATH -xsd $XSD_PATH
