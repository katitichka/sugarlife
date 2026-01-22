@freezed
sealed class TheoryModuleDto with _$TheoryModuleDto {
  const factory TheoryModuleDto({
    required int id,
    required String title,
    required String subtitle,
    @JsonKey(name:'character_id') required int characterId,
    @JsonKey(name:'color_hex') required String colorHex,
    @JsonKey(name:'order_index') required int orderIndex,
    @JsonKey(name: 'character_image_url') String characterImageUrl,
    required Map<String, dynamic> content,
  }) = _TheoryModuleDto;

  factory TheoryModuleDto.fromJson(Map<String, Object?> ison) =>
      _$TheoryModuleDtoFromJson(json);
}
