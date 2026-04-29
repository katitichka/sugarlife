import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_module_level_dto.freezed.dart';
part 'game_module_level_dto.g.dart';

@freezed
sealed class GameModuleLevelDto with _$GameModuleLevelDto {
  const factory GameModuleLevelDto({
    required int id,
    required String title,
    @JsonKey(name: 'order_index') required int orderIndex,
    @JsonKey(name: 'theory_module_id') required int theoryModuleId,
    required int totalQuestions,
  }) = _GameModuleLevelDto;

  factory GameModuleLevelDto.fromJson(Map<String, Object?> json) =>
      _$GameModuleLevelDtoFromJson(json);
}