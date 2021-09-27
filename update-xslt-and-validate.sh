#!/bin/sh
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-13.jdk/Contents/Home
export PATH=/opt/apache-maven-3.6.2/bin:$PATH

# preprocess first - catches errors quicker
mvn -f pom-preprocess.xml generate-resources || exit 1

# convert to XSLT - takes forever
mvn -f pom-xslt.xml process-resources || exit 1

# Add license headers to all relevant files
mvn -f pom-license.xml license:format || exit 1

# validate afterwards
mvn -f pom-validate.xml validate || exit 1

echo "Successfully done"
