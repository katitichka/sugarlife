import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_entity.freezed.dart';

@freezed
sealed class AchievementEntity with _$AchievementEntity {
  const factory AchievementEntity({
    required int id,
    required int moduleId,
    required String name,
    required String description,
    required String iconUrl,
  }) = _AchievementEntity;
}
