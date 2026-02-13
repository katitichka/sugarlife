import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_module_list_dto.freezed.dart';
part 'game_module_list_dto.g.dart';

@freezed
sealed class GameModuleListDto with _$GameModuleListDto {
  const factory GameModuleListDto({
    required int id,
    required String title,
    @JsonKey(name: 'order_index') required int orderIndex,
  }) = _GameModuleListDto;
  factory GameModuleListDto.fromJson(Map<String, Object?> json) =>
      _$GameModuleListDtoFromJson(json);
}
