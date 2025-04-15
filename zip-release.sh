#!/bin/sh
ver=1.3.14

#
# CII
#
rm en16931-cii-$ver.zip
cd cii
zip -9 -r ../en16931-cii-$ver.zip schematron/* xslt/* examples/*
cd ..

#
# UBL
#
rm en16931-ubl-$ver.zip
cd ubl
zip -9 -r ../en16931-ubl-$ver.zip schematron/* xslt/* examples/*
cd ..

echo "Successfully done"
