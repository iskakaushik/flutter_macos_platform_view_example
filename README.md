# flutter_macos_platform_view_example

Example for a simple macOS platform view.

1. Build Flutter engine with PR: https://github.com/flutter/engine/pull/30853

2. You need to comment the check here: https://github.com/flutter/engine/pull/30853/files#diff-a8d2afa913a2b6ed6a1b0bd09db3ab8dd7811ba2430bb8d1f8308f23a68cb68cR108 to account for issue https://github.com/flutter/flutter/issues/96668.

3. Build the engine and copy it to framework cache:

```
autoninja -C out/host_debug_unopt
cp -r $ENGINE_SRC/out/host_debug_unopt/FlutterMacOS.framework/*  $FRAMEWORK/bin/cache/artifacts/engine/darwin-x64/FlutterMacOS.framework/
```

4. Run the example app and you should see something like this:

```
flutter run --local-engine host_debug_unopt -d macos
```

PHOTO LINK: https://photos.app.goo.gl/Fpfs4Y1KVzvU7bhy5

<img src="https://lh3.googleusercontent.com/fmef6U3lepnTAClWJ0750NJHiqdKKuwZapYeOQXvR0CwxTbIP8bEBuXl2PMfOj9kYPTYK0GiwD-IsUzC_NiipjrFcI__y84ufgujUvMB1kBfKJXpyOyqrNwL5qPXMVRzKkREf-7X3gqEJnVuplbssHwGGEYHOyo8TKchhTMipO_nfOJ1fvZeKjpiNakzEIQvJMDvUUY6CQiajY2gHL6yfoHbgsg7Ja2QbsCoDi-JNV7VtJ2mGIbQ39C5kPPZDtwqNkthxNy8_6tdN346hZ5HlW9FRX33uJsrnclvlfRAB61K5QCgBHOzMG5JxYAALGnZnkc7ZBC4SFFDFeXO_UjPSsRp1ftK0wZEcic10SqX7cbecX3lVjQN5sVaNJhBW7SnaLoQlc9MELlkDtHZItuTTO0N1wbdYvnPbWcbn0mAdKZ7Tz6Y7yFrM9x8AAZJgXogy0h850Eir2WXMXbtzV4_cd4lyONEmbjASxNuWL6xulUMTiR4ZbEOdCduYOedHujSmZFXOoPTWbtu2SgEqEFOf1m3Ac-ZR0S2xWQU91Bdehh2K7YXpBfLC1UeE1Bb0Gq2-My8VwhUZV3JPJ-bLId3Qz3uJEIO4-O8KEvRPgMbkBOBadcwKb9gaydX9BZZw3qVik7zdfXVX8fWunC8VDQLFAYShWG9fFdLKKGHix22IqZwbryvgIP7c75acIozmDIXKHetthbgWQkPFXeBRPhVE6DO=w1672-h1304-no?authuser=0" width=600px/>
