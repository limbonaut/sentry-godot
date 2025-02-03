#!/bin/sh

# while [ "$#" -gt 0 ]; do
#     case "$1" in
#         -mmacosx-version-min=*)
#             DEPLOYMENT_TARGET="${1#-mmacosx-version-min=}"
#             ;;
#         -mmacosx-version-min)
#             DEPLOYMENT_TARGET="$2"
#             shift
#             ;;
#     esac
#     shift
# done

# if [ -z "$DEPLOYMENT_TARGET" ] || [ "$DEPLOYMENT_TARGET" = "default" ]; then
#     DEPLOYMENT_TARGET=14.0
# fi

echo "CCFLAGS: $CCFLAGS"
echo "LINKFLAGS: $LINKFLAGS"
echo CC="$CC"
echo CXX="$CXX"

export CC="$CC"
export CXX="$CXX"

cd modules/sentry-native
# cmake -B build -DSENTRY_BUILD_SHARED_LIBS=OFF -DSENTRY_BACKEND=crashpad -DSENTRY_SDK_NAME="sentry.native.godot" -DCMAKE_OSX_ARCHITECTURES="arm64;x86_64" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_OSX_DEPLOYMENT_TARGET="$DEPLOYMENT_TARGET"
# cmake --build build --target sentry --parallel --config RelWithDebInfo
# cmake --build build --target crashpad_handler --parallel --config RelWithDebInfo
# cmake --install build --prefix install --config RelWithDebInfo
cmake -B build -DSENTRY_BUILD_SHARED_LIBS=OFF -DSENTRY_BACKEND=crashpad -DSENTRY_SDK_NAME="sentry.native.godot" -DCMAKE_C_FLAGS="$CCFLAGS" -DCMAKE_CXX_FLAGS="$CCFLAGS" #-DCMAKE_STATIC_LINKER_FLAGS="$LINKFLAGS"
cmake --build build --target sentry --parallel
cmake --build build --target crashpad_handler --parallel
cmake --install build --prefix install
cd ../..
