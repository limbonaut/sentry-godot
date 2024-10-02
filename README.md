# Sentry for Godot Engine

An eventual Godot SDK for Sentry

## Build steps (work-in-progress)

1. Clone repository and its submodules.
2. Build sentry-native (libsentry and crashpad):
    ```bash
    cd sentry-native
    # configure CMake build as a static library in the `build-static` directory
    cmake -B build-static -DSENTRY_BUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo
    # build libsentry and crashpad
    cmake --build build-static --parallel
    ```
3. Copy crashpad_handler executable into `project/addons/sentrysdk/bin/`
4. Build the Godot GDExtension libraries:
    ```bash
    # build *editor* library for the current platform
    # run from the repository root dir
    scons target=editor
    ```
    The build process should produce a GDExtension library file for the ***editor target*** at `project/addons/sentrysdk/bin/libsentrysdk.*.editor.*`.

    To export a project in Godot that uses this extension, you'll also need libraries for the export templates:
    ```bash
    # build *export* library for the current platform
    scons target=template_release
    ```
