import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_progress_dto.freezed.dart';
part 'level_progress_dto.g.dart';

@freezed
sealed class LevelProgressDto with _$LevelProgressDto {
  const factory LevelProgressDto({
    @JsonKey(name: 'level_id') required int levelId,
    int? stars,
    @JsonKey(name: 'correct_answers') int? correctAnswers,
    @JsonKey(name: 'completed_at') String? completedAt,
  }) = _LevelProgressDto;

  factory LevelProgressDto.fromJson(Map<String, Object?> json) =>
      _$LevelProgressDtoFromJson(json);
}
