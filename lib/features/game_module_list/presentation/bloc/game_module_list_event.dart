part of 'game_module_list_bloc.dart';

@freezed
sealed class GameModuleListEvent with _$GameModuleListEvent {
  const factory GameModuleListEvent.receive() = _Receive;
}
