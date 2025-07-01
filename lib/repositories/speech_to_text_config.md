# Speech to Text Platform Configuration

This document outlines the platform-specific configurations required for the `speech_to_text` package.

## iOS Configuration

Added to `ios/Runner/Info.plist`:

```xml
<key>NSSpeechRecognitionUsageDescription</key>
<string>This app needs access to speech recognition to convert your voice to text</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to the microphone to listen to your voice</string>
```

These keys are required for:
- **NSSpeechRecognitionUsageDescription**: Explains why the app needs access to speech recognition
- **NSMicrophoneUsageDescription**: Explains why the app needs access to the microphone

## Android Configuration

### 1. Permissions
Added to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>
```

These permissions are required for:
- **RECORD_AUDIO**: Core permission for recording audio
- **INTERNET**: Required for some speech recognition services
- **BLUETOOTH**: Required for Bluetooth audio devices
- **BLUETOOTH_ADMIN**: Required for managing Bluetooth connections
- **BLUETOOTH_CONNECT**: Required for Android 12+ Bluetooth connections

### 2. Minimum SDK Version
Updated in `android/app/build.gradle`:

```gradle
minSdkVersion 21
```

The speech_to_text package requires a minimum SDK version of 21 (Android 5.0 Lollipop).

## Usage Notes

After adding these configurations:
1. For iOS: Clean and rebuild the iOS project
2. For Android: Clean and rebuild the Android project
3. Users will be prompted for permissions when the speech recognition feature is first used

## References
- [speech_to_text package documentation](https://pub.dev/packages/speech_to_text)
- [Flutter platform-specific setup](https://docs.flutter.dev/development/platform-integration/platform-channels)
