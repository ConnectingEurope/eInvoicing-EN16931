@echo off

echo running CII tests
docker run --rm --pull -it -v %CD%:/src difi/vefa-validator build -x -t -p cii /src
if errorlevel 1 goto error

goto end

:error
echo An error occurred in validation
pause

:end
