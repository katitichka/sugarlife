import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_progress_entity.freezed.dart';

@freezed 
sealed class LevelProgressEntity with _$LevelProgressEntity{
  const factory LevelProgressEntity({
    required int levelId,
    required bool isCompleted,
    required int? stars,
    required DateTime? lastPlayedAt,
  }) =_LevelProgressEntity;
}