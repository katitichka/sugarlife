part of 'theory_module_list_bloc.dart';

@freezed
sealed class TheoryModuleListEvent with _$TheoryModuleListEvent {
  const factory TheoryModuleListEvent.receive() = _Receive;
  const factory TheoryModuleListEvent.select({required int id}) = _Select;
}
