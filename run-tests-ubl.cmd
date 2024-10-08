@echo off

echo running UBL tests
docker run --rm --pull -it -v %CD%:/src phelger/vefa-validator build -x -t -p ubl /src
if errorlevel 1 goto error

goto end

:error
echo An error occurred in validation
pause

:end
