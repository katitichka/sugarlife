import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_dto.freezed.dart';
part 'avatar_dto.g.dart';

@freezed
sealed class AvatarDto with _$AvatarDto {
  const factory AvatarDto({
    required int id,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _AvatarDto;
  factory AvatarDto.fromJson(Map<String, Object?> json) =>
      _$AvatarDtoFromJson(json);
}
