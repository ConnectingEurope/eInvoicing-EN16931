@echo off

echo running UBL tests
docker run --rm -it -v %CD%:/src difi/vefa-validator build -x -t -p ubl /src
if errorlevel 1 goto error

goto end

:error
echo An error occurred in validation
pause

:end
