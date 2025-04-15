#!/bin/sh
echo running UBL tests
docker run --rm --pull always -it -v $PWD:/src phelger/vefa-validator build -x -t -p ubl /src
