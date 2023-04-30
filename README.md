# OurSpaceApp

Author: Adeel Sadiq
Student Number: D18125723
For final submission DT249 Bsc in Information systems and information technology.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

Commands:

flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs

get SHA-1 Key:
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore

send adb command to test returning URL
adb shell am start -a android.intent.action.VIEW -d "ourspaceapp://ourspaceapp.com/return?accountId="

Look at this
test case

Build apk: flutter build apk --release

Debug filters:
!D/EGL_emulation, !I/Count, !E/SurfaceSyncerters, !E/FrameEvents, !E/BufferQueueProducer, !E/SurfaceSyncer
