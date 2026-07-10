import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_level_progress_dto.freezed.dart';
part 'save_level_progress_dto.g.dart';

@freezed
sealed class SaveLevelProgressDto with _$SaveLevelProgressDto {
  const factory SaveLevelProgressDto({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'level_id') required int levelId,
    required int stars,
    @JsonKey(name: 'correct_answers') required int correctAnswers,
    @JsonKey(name: 'completed_at') required String completedAt,
  }) = _SaveLevelProgressDto;

  factory SaveLevelProgressDto.fromJson(Map<String, Object?> json) =>
      _$SaveLevelProgressDtoFromJson(json);
}
