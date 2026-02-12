part of 'game_module_bloc.freezed.dart'

import 'package:sugarlife/features/game_module/domain/entities/game_module_level_entity.dart';

@freezed 
sealed class GameModuleState  with _$GameModuleState{
  const factory GameModuleState.initial() = _Initial();
  const factory GameModuleState.receiveInProgress({required String message}) = ReceiveInProgress;
  const factory GameModuleState.receiveSuccess({required List<GameModuleLevelEntity> theoryModules}) = ReceiveSuccess;
  const factory GameModuleState.receiveFailed({required String message}) = ReceiveFailed;
  const factory GameModuleState.selected({required int theoryModuleId}) = Selected;
}