import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
sealed class CharacterDto with _$CharacterDto {
  const factory CharacterDto({
    required int id,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, Object?> json) =>
      _$CharacterDtoFromJson(json);
}
