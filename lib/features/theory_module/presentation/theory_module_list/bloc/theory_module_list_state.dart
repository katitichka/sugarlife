part of 'theory_module_list_bloc.dart';

@freezed
sealed class TheoryModuleListState with _$TheoryModuleListState {
  const factory TheoryModuleListState.initial() = _Initial;
  const factory TheoryModuleListState.receiveInProgress({required String message}) = ReceiveInProgress;
  const factory TheoryModuleListState.receiveSuccess({required List<TheoryModuleListEntity> theoryModules}) = ReceiveSuccess;
  const factory TheoryModuleListState.receiveFailed({required String message}) = ReceiveFailed;
  const factory TheoryModuleListState.selected({required int theoryModuleId}) = Selected;
}
