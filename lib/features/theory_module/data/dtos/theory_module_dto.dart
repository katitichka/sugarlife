import 'package:freezed_annotation/freezed_annotation.dart';

part 'theory_module_dto.freezed.dart';
part 'theory_module_dto.g.dart';

@freezed
sealed class TheoryModuleDto with _$TheoryModuleDto {
  const factory TheoryModuleDto({
    required int id,
    required String title,
    required String subtitle,
    @JsonKey(name:'color_hex') required String colorHex,
    @JsonKey(name:'order_index') required int orderIndex,
  }) = _TheoryModuleDto;
  
  factory TheoryModuleDto.fromJson(Map<String, Object?> json) =>
      _$TheoryModuleDtoFromJson(json);
}