import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_module_level_entity.freezed.dart';

@freezed
sealed class GameModuleLevelEntity with _$GameModuleLevelEntity {
  const factory GameModuleLevelEntity({
    required int id,
    required String title,
    required int orderIndex,
    required int theoryModuleId,
    required int totalQuestions,
  }) = _GameModuleLevelEntity;
}