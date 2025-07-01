part of 'voice_assistant_cubit.dart';

enum ListeningToSpeechStatus { idle, listening }

class VoiceAssistantState extends Equatable {
  const VoiceAssistantState({
    this.listeningToSpeechStatus = ListeningToSpeechStatus.idle,
    this.lastRequestText = '',
  });

  final ListeningToSpeechStatus listeningToSpeechStatus;
  final String lastRequestText;

  VoiceAssistantState copyWith({
    ListeningToSpeechStatus? listeningToSpeechStatus,
    String? lastRequestText,
  }) {
    return VoiceAssistantState(
      listeningToSpeechStatus: listeningToSpeechStatus ?? this.listeningToSpeechStatus,
      lastRequestText: lastRequestText ?? this.lastRequestText,
    );
  }

  @override
  List<Object> get props => [listeningToSpeechStatus, lastRequestText];
}
