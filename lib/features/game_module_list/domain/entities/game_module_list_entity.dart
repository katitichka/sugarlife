import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_module_list_entity.freezed.dart';

@freezed
sealed class GameModuleListEntity with _$GameModuleListEntity {
  const factory GameModuleListEntity({
    required int id,
    required String title,
    required int orderIndex,
  }) = _GameModuleListEntity;
}
