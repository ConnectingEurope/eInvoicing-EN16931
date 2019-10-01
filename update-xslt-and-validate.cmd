@echo off

rem preprocess first - catches errors quickers
call mvn -f pom-preprocess.xml generate-resources
if errorlevel 1 goto error

rem convert to XSLT - takes forever
call mvn -f pom-xslt.xml process-resources
if errorlevel 1 goto error

rem Add license headers to all relevant files
call mvn -f pom-license.xml license:format
if errorlevel 1 goto error

rem validate afterwards
call mvn -f pom-validate.xml validate
if errorlevel 1 goto error

echo Sucessfully done
goto end

:error
pause

:end
