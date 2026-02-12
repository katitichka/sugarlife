import 'package:freezed_annotation/freezed_annotation.dart';

part 'theory_module_dto.freezed.dart';
part 'theory_module_dto.g.dart';

@freezed
sealed class TheoryModuleDto with _$TheoryModuleDto {
  const factory TheoryModuleDto({
    required int id,
    required String title,
    required String subtitle,
    @JsonKey(name:'character_id') required int characterId,
    @JsonKey(name:'color_hex') required String colorHex,
    @JsonKey(name:'order_index') required int orderIndex,
    @JsonKey(name: 'character_image_url') required String characterImageUrl,
    required Map<String, dynamic> content,
  }) = _TheoryModuleDto;

  factory TheoryModuleDto.fromJson(Map<String, Object?> json) =>
      _$TheoryModuleDtoFromJson(json);
}