@echo off

echo running CII tests
docker run --rm --pull always -it -v %CD%:/src phelger/vefa-validator build -x -t -p cii /src
if errorlevel 1 goto error

goto end

:error
echo An error occurred in validation
pause

:end
