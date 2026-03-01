part of 'game_module_list_bloc.dart';

@freezed
sealed class GameModuleListEvent with _$GameModuleListEvent {
  const factory GameModuleListEvent.receive() = _Receive;
  const factory GameModuleListEvent.levelCompleted({
    required int levelId,
    required int stars,
    required int correctAnswers,
    required int totalQuestions,
  }) = _LevelCompleted;
}
