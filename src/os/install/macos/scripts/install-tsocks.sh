#!/usr/bin/env bash

# https://github.com/openroc/tsocks-macosx
cd ~/.external/tools
cd tsocks-macosx

autoconf

./configure --libdir=/usr/lib

make

sudo cp tsocks /usr/local/bin

sudo cp libtsocks.dylib.1.8 /usr/lib
sudo ln -sf /usr/lib/libtsocks.dylib.1.8 /usr/lib/libtsocks.dylib

sudo cp ~/.tsocks.conf /etc/tsocks.conf
