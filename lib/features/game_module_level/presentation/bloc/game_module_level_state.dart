part of 'game_module_level_bloc.dart';

@freezed
sealed class GameModuleLevelState with _$GameModuleLevelState {
  const factory GameModuleLevelState.initial() = _Initial;
  const factory GameModuleLevelState.receiveInProgress({
    required String message,
  }) = ReceiveInProgress;
  const factory GameModuleLevelState.receiveSuccess({
    required List<GameModuleQuestionEntity> questions,
    required int currentIndex,
    required LevelProgressEntity? progress,
    required bool isAnswered,
  }) = ReceiveSuccess;
  const factory GameModuleLevelState.receiveFailed({required String message}) =
      ReceiveFailed;
  const factory GameModuleLevelState.answerInProgress({
    required bool isCorrect,
    required String explanation,
    required String selectedAnswer,
    required String correctAnswer,
    required GameModuleQuestionEntity question,
    required int currentIndex,
    required List<GameModuleQuestionEntity> questions,
    required LevelProgressEntity? progress,
  }) = AnswerInProgress;
  const factory GameModuleLevelState.levelCompleted() = LevelCompleted;
}
