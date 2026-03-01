part of 'game_module_list_bloc.dart';

@freezed
sealed class GameModuleListState with _$GameModuleListState {
  const factory GameModuleListState.initial() = _Initial;
  const factory GameModuleListState.receiveInProgress({
    required String message,
  }) = ReceiveInProgress;
  const factory GameModuleListState.receiveSuccess({
    required List<GameModuleListEntity> levels,
    required Map<int, LevelProgressEntity> progressMap,
  }) = ReceiveSuccess;
  const factory GameModuleListState.receiveFailed({required String message}) =
      ReceiveFailed;
const factory GameModuleListState.levelJustCompleted({
    required int levelId,
    required int stars,
    required int correctAnswers,
    required int totalQuestions,
  }) = LevelJustCompleted;
}
