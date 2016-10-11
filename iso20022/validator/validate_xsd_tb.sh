#!/bin/sh

XSD_PATH=../schema/official_tsin.004.001.01.xsd
XML_PATH=../instance/example_01_tsin.004.001.01.xml

java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml $XML_PATH -xsd $XSD_PATH
