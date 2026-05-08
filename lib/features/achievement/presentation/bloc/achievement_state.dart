part of 'achievement_bloc.dart';

@freezed
sealed class AchievementState with _$AchievementState {
  const factory AchievementState({
    @Default([]) List<AchievementEntity> achievements,
    AchievementEntity? pendingAchievement,
    /// Увеличивается при каждой проверке pending из хранилища, чтобы слушатели
    /// срабатывали даже если [pendingAchievement] по значению не изменился
    /// (Bloc не шлёт уведомление при `state == previousState`).
    @Default(0) int pendingSyncToken,
  }) = _AchievementState;
}
