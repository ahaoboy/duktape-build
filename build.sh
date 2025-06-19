#!/bin/bash

if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

if [[ "$TARGET" == *windows* ]]; then
  curl -L -o duktape.tar.xz https://github.com/svaarala/duktape/releases/download/v2.7.0/duktape-2.7.0.tar.xz
  tar xvfJ duktape.tar.xz
  cd duktape-2.7.0
  make -f Makefile.cmdline
else
  git clone https://github.com/svaarala/duktape duktape
  cd duktape
  make duk
fi

mkdir ../dist

cp ./duk ../dist

cd ..

ls -lh dist

tar -czf ./duktape-${TARGET}.tar.gz -C dist .
ls -l ./duktape-${TARGET}.tar.gz