part of 'theory_module_bloc.dart';

@freezed
sealed class TheoryModuleState with _$TheoryModuleState {
  const factory TheoryModuleState.initial() = _Initial;
  const factory TheoryModuleState.receiveInProgress({required String message}) = ReceiveInProgress;
  const factory TheoryModuleState.receiveSuccess({required List<TheoryModuleEntity> theoryModules}) = ReceiveSuccess;
  const factory TheoryModuleState.receiveFailed({required String message}) = ReceiveFailed;
}
