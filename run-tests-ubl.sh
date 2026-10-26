#!/bin/sh
echo running UBL tests
#docker run --rm --pull always -it -v $PWD:/src phelger/vefa-validator build -x -t -p ubl /src
docker run --rm -it -v $PWD:/src phelger/vefa-validator build -x -t -p ubl /src
#docker run --rm -it -v $PWD:/src -e JAVA_TOOL_OPTIONS="-Dvefa.validator.debug.saveSvrl=/src/svrl/" phelger/vefa-validator build -x -t -p ubl /src
