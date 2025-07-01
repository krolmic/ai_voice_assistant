import 'package:ai_assistant_1/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

part 'voice_assistant_state.dart';

class VoiceAssistantCubit extends Cubit<VoiceAssistantState> {
  VoiceAssistantCubit({
    required SpeechToTextRepository speechToTextRepository,
  })  : _speechToTextRepository = speechToTextRepository,
        super(const VoiceAssistantState()) {
    _initializeSpeechToText();
  }

  final SpeechToTextRepository _speechToTextRepository;
  String _currentSpeechText = '';

  Future<void> _initializeSpeechToText() async {
    final initialized = await _speechToTextRepository.init();
    if (!initialized) {
      print('Failed to initialize speech to text');
    }
  }

  Future<void> startListening() async {
    if (state.listeningToSpeechStatus == ListeningToSpeechStatus.listening) {
      return;
    }

    _currentSpeechText = '';
    
    emit(state.copyWith(
      listeningToSpeechStatus: ListeningToSpeechStatus.listening,
    ),);

    await _speechToTextRepository.startListening(
      onResult: _onSpeechResult,
    );
  }

  Future<void> stopListening() async {
    if (state.listeningToSpeechStatus == ListeningToSpeechStatus.idle) {
      return;
    }

    await _speechToTextRepository.stopListening();

    emit(state.copyWith(
      listeningToSpeechStatus: ListeningToSpeechStatus.idle,
      lastRequestText: _currentSpeechText,
    ),);
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _currentSpeechText = result.recognizedWords;
    
    // If the result is final, stop listening automatically
    if (result.finalResult) {
      stopListening();
    }
  }

  @override
  Future<void> close() {
    _speechToTextRepository.dispose();
    return super.close();
  }
}
