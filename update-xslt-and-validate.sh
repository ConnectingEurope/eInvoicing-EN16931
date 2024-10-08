#!/bin/sh
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-13.jdk/Contents/Home
export PATH=/opt/apache-maven-3.6.2/bin:$PATH

# preprocess first - catches errors quicker
mvn -f pom-preprocess.xml generate-resources || exit 1

# convert to XSLT
mvn -f pom-xslt-preprocessed.xml process-resources || exit 1

# adopt filenames
rm cii/xslt/EN16931-CII-validation.xslt
mv cii/xslt/EN16931-CII-validation-preprocessed.xslt cii/xslt/EN16931-CII-validation.xslt 
rm ubl/xslt/EN16931-UBL-validation.xslt
mv ubl/xslt/EN16931-UBL-validation-preprocessed.xslt ubl/xslt/EN16931-UBL-validation.xslt 

# Add license headers to all relevant files
mvn -f pom-license.xml license:format || exit 1

# validate afterwards
mvn -f pom-validate.xml validate || exit 1

echo "Successfully done"
