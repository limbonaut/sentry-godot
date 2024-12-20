Push-Location modules\sentry-native
cmake -B build -DSENTRY_BUILD_SHARED_LIBS=OFF -DSENTRY_BUILD_RUNTIMESTATIC=ON -DSENTRY_BACKEND=crashpad -DSENTRY_SDK_NAME="sentry.native.godot" -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build --target sentry --parallel --config RelWithDebInfo
cmake --build build --target crashpad_handler --parallel --config RelWithDebInfo
cmake --install build --prefix install --config RelWithDebInfo
Pop-Location
