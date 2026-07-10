import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_dto.freezed.dart';
part 'achievement_dto.g.dart';

@freezed
sealed class AchievementDto with _$AchievementDto {
  const factory AchievementDto({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _AchievementDto;

  factory AchievementDto.fromJson(Map<String, Object?> json) =>
      _$AchievementDtoFromJson(json);
}
