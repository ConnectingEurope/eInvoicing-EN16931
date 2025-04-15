#!/bin/sh
echo running CII tests
docker run --rm --pull always -it -v $PWD:/src phelger/vefa-validator build -x -t -p cii /src
