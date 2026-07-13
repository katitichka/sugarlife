import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';

part 'achievement_entity.freezed.dart';

@freezed
sealed class AchievementEntity with _$AchievementEntity {
  const factory AchievementEntity({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
    required AchievementType type,
  }) = _AchievementEntity;
}
