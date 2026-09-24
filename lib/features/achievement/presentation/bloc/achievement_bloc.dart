import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/services/app_logger.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';

part 'achievement_bloc.freezed.dart';
part 'achievement_event.dart';
part 'achievement_state.dart';

class AchievementBloc extends Bloc<AchievementEvent, AchievementState> {
  static const _tag = 'AchievementBloc';

  AchievementBloc({required AchievementRepository achievementRepository})
    : _achievementRepository = achievementRepository,
      super(const AchievementState()) {
    on<AchievementEvent>(
      (event, emit) => switch (event) {
        _LoadAchievements() => _loadAchievements(emit),
        _CheckPendingAchievement() => _checkPendingAchievement(emit),
        _MarkPendingAchievementShown(:final achievementId) =>
          _markPendingAchievementShown(emit, achievementId),
      },
    );
  }

  final AchievementRepository _achievementRepository;

  Future<void> _loadAchievements(Emitter<AchievementState> emit) async {
    try {
      final results = await Future.wait([
        _achievementRepository.getAllAchievements(),
        _achievementRepository.getUserAchievements(),
      ]).timeout(const Duration(seconds: 10));
      final allAchievements = results[0];
      final unlockedById = {
        for (final achievement in results[1]) achievement.id: achievement,
      };
      final achievements = allAchievements
          .map((achievement) => unlockedById[achievement.id] ?? achievement)
          .toList();
      emit(state.copyWith(achievements: achievements));
    } catch (error, stackTrace) {
      AppLogger.error('Ошибка загрузки достижений', error, stackTrace, _tag);
      emit(state.copyWith(achievements: const []));
    }
  }

  Future<void> _checkPendingAchievement(Emitter<AchievementState> emit) async {
    try {
      final achievement = await _achievementRepository.getPendingAchievement();
      emit(
        state.copyWith(
          pendingAchievement: achievement,
          pendingSyncToken: state.pendingSyncToken + 1,
        ),
      );
    } catch (error, stackTrace) {
      AppLogger.error('Ошибка получения достижения', error, stackTrace, _tag);
      emit(
        state.copyWith(
          pendingAchievement: null,
          pendingSyncToken: state.pendingSyncToken + 1,
        ),
      );
    }
  }

  Future<void> _markPendingAchievementShown(
    Emitter<AchievementState> emit,
    int achievementId,
  ) async {
    try {
      await _achievementRepository.markAchievementCardShown(
        achievementId: achievementId,
      );
    } catch (error, stackTrace) {
      AppLogger.error(
        'Ошибка сохранения статуса достижения',
        error,
        stackTrace,
        _tag,
      );
    }

    emit(
      state.copyWith(
        pendingAchievement: null,
        pendingSyncToken: state.pendingSyncToken + 1,
      ),
    );
  }
}
