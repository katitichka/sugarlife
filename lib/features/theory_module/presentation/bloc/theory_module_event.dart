part of 'theory_module_bloc.dart';

@freezed
sealed class TheoryModuleEvent with _$TheoryModuleEvent {
  const factory TheoryModuleEvent.receive() = _Receive;
}
