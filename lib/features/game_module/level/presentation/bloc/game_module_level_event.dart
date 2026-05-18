part of 'game_module_level_bloc.dart';

@freezed 
sealed class GameModuleLevelEvent with _$GameModuleLevelEvent {
  const factory GameModuleLevelEvent.receive({required int levelId,}) = _Receive;
  const factory GameModuleLevelEvent.answerMultipleChoice({required String answer}) = _AnswerMultipleChoice;
  const factory GameModuleLevelEvent.answerTrueFalse({required bool answer}) = _AnswerTrueFalse;
  const factory GameModuleLevelEvent.answerFillBlank({required String answer}) = _AnswerFillBlank;
  const factory GameModuleLevelEvent.answerMultipleSelect({
  required List<int> selectedIndices,
}) = _AnswerMultipleSelect;
  const factory GameModuleLevelEvent.nextQuestion() = _NextQuestion;
  const factory GameModuleLevelEvent.retryCompleteLevel() = _RetryCompleteLevel;
  const factory GameModuleLevelEvent.retryLevel() = _RetryLevel;
  const factory GameModuleLevelEvent.startLevel() = _StartLevel;
}