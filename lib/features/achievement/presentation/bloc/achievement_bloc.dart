import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';

part 'achievement_bloc.freezed.dart';
part 'achievement_event.dart';
part 'achievement_state.dart';

class AchievementBloc extends Bloc<AchievementEvent, AchievementState> {
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
      final achievements = await _achievementRepository.getUserAchievements();
      emit(state.copyWith(achievements: achievements));
    } catch (e) {
      print('Ошибка загрузки достижений: $e');
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
    } catch (e) {
      print('Ошибка получения pending-достижения: $e');
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
    } catch (e) {
      print('Ошибка сохранения показа достижения: $e');
    }

    emit(
      state.copyWith(
        pendingAchievement: null,
        pendingSyncToken: state.pendingSyncToken + 1,
      ),
    );
  }
}
