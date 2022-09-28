#!/bin/sh
set -e
BLIS="$1"
test -z "$BLIS" && exit 1   # e.g. blis-openmp
mkdir -p ./lib
mkdir -p ./include/blis
mkdir -p ./share/blis
cp -rv /usr/lib/$(dpkg-architecture -qDEB_HOST_MULTIARCH)/$BLIS/*     ./lib/
cp -rv /usr/include/$(dpkg-architecture -qDEB_HOST_MULTIARCH)/$BLIS/* ./include/blis/
cp -rv /usr/share/$BLIS-$(dpkg-architecture -qDEB_HOST_MULTIARCH)/*   ./share/blis/
if test -r ./lib/libblis64.a; then
	cp -v ./lib/libblis64.a ./lib/libblis.a
	cp -v ./include/blis/blis64.h ./include/blis/blis.h
fi
make BLIS_INSTALL_PATH=.
./test_libblis.x -g input.general.fast -o input.operations.fast
