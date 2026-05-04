part of 'achievement_bloc.dart';

@freezed
sealed class AchievementState with _$AchievementState {
  const factory AchievementState({
    @Default([]) List<AchievementEntity> achievements,
    AchievementEntity? pendingAchievement,
  }) = _AchievementState;
}
