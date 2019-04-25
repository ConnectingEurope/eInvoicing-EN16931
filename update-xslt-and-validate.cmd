@echo off

rem preprocess first - catches errors quickers
call mvn -f pom-preprocess.xml generate-resources

rem convert to XSLT - takes forever
call mvn -f pom-xslt.xml process-resources

rem Add license headers to all relevant files
call mvn -f pom-license.xml license:format

rem validate afterwards
call mvn -f pom-validate.xml validate

echo Sucessfully done
