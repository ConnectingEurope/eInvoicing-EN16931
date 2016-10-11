#!/bin/bash -x

SCHEMATRON_PATH=../schematron/EN16931-ISO20022-validation.sch
XML_PATH=../instance/example_01_tsin.004.001.01.xml
java -jar xmlvalidator-1.0-SNAPSHOT-jar-with-dependencies.jar -xml $XML_PATH -sch $SCHEMATRON_PATH
