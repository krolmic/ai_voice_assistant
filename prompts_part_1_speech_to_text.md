# 1

Before starting to work on the project, please read and memorise information important for the code additions you're going to make:
https://codewithandrea.com/articles/flutter-firebase-multiple-flavors-flutterfire-cli/ (consider how we structure entry points for app flavors)
https://bloclibrary.dev/flutter-bloc-concepts/
https://bloclibrary.dev/architecture/
https://bloclibrary.dev/modeling-state/
https://www.kodeco.com/19539821-slivers-in-flutter-getting-started (flutter slivers)
https://github.com/krolmic/tracking_app/blob/main/tracking_flutter/lib/home/view/home_screen.dart (flutter slivers example)
https://bloclibrary.dev/tutorials/flutter-todos/
https://cli.vgv.dev/docs/overview 
https://bloclibrary.dev/testing/
https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html (official go_router configuration docs)
https://pub.dev/documentation/go_router/latest/topics/Navigation-topic.html (official go_router navigation docs)
https://github.com/krolmic/happy_day/tree/main/lib/shared/router (this structure should be used to add go_router configuration for routing implementation - it's slightly different than the official documentation)
https://github.com/krolmic/tracking_app/blob/main/tracking_flutter/lib/shared/navigation.dart
https://github.com/krolmic/happy_day/blob/main/lib/theme/theme.dart (theme example including colors)
https://github.com/krolmic/happy_day/blob/main/lib/shared/toastification.dart (example of generic methods for showing toast messages)

https://pub.dev/packages/audioplayers
https://pub.dev/packages/path_provider
https://pub.dev/packages/flutter_animate
https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md
https://pub.dev/packages/speech_to_text
https://firebase.google.com/docs/ai-logic/get-started
https://elevenlabs.io/docs/quickstart
https://github.com/krolmic/happy_day/blob/main/packages/steps_generation_repository/lib/src/steps_generation_client.dart
https://github.com/krolmic/happy_day/blob/main/packages/steps_generation_repository/lib/src/steps_generation_repository.dart

# 2

Add the platform configuration necessary for usage of speech_to_text described here
https://pub.dev/packages/speech_to_text#permissions
for iOS and Android

# 3

Add in lib/repositories a repository SpeechToTextRepository.
Using speech_to_text and providing methods init, startListening - with callback as in docs example, and stopListening

Wrap the MaterialApp in lib/app/view/app.dart with MultiRepositoryProvider providing only SpeechToTextRepository for now.

# 4 


Add a feature dir voice_assistant including:

## Cubit & State
- it should await the created repository in constructor
- it's state should include:
  - ListeningToSpeechStatus (idle, listening)
  - lastRequestText : String (last text saved by the repository)
- the cubit should provide methods:
  - startListening (using the repository to start recording user's speech - sets listeningToSpeechStatus to ListeningToSpeechStatus.listening)
  - stopListening (using the repository to stop listening, save the speech in lastRequestText, and set ListeningToSpeechStatus to idle)

## Page
About this we're going to take care about in the next stop. Add just the cubit with state for now.

# 5 

## Page

- follow the design I attached
- the page should include a floating action button using Icons.mic_off as listeningToSpeechStatus is listening, otherwise Icons.mic
- the button should call startListening if listeningToSpeechStatus is idle, otherwise stopListening
- the page should build as well lastRequestText (faded in by using flutter_animate)