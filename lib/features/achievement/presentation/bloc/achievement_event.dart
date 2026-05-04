part of 'achievement_bloc.dart';

@freezed
sealed class AchievementEvent with _$AchievementEvent {
  const factory AchievementEvent.loadAchievements() = _LoadAchievements;
  const factory AchievementEvent.checkPendingAchievement() =
      _CheckPendingAchievement;
  const factory AchievementEvent.markPendingAchievementShown({
    required int achievementId,
  }) = _MarkPendingAchievementShown;
}
