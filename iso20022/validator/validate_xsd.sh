#!/bin/sh

XSD_PATH=$1
XML_PATH=$2

java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml "$XML_PATH" -xsd "$XSD_PATH"
