part of 'achievement_bloc.dart';

@freezed
sealed class AchievementState with _$AchievementState {
  const factory AchievementState({
    @Default([]) List<AchievementEntity> achievements,
    AchievementEntity? pendingAchievement,
    @Default(0) int pendingSyncToken,
  }) = _AchievementState;
}
