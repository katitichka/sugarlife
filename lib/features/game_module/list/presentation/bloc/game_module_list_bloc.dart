import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/utils/retry.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

part 'game_module_list_event.dart';
part 'game_module_list_state.dart';
part 'game_module_list_bloc.freezed.dart';

class GameModuleListBloc
    extends Bloc<GameModuleListEvent, GameModuleListState> {
  final GameModuleLevelListRepository _gameModuleLevelListRepository;
  final LevelProgressRepository _gameProgressRepository;

  GameModuleListBloc({
    required GameModuleLevelListRepository gameModuleLevelListRepository,
    required LevelProgressRepository gameProgressRepository,
  }) : _gameModuleLevelListRepository = gameModuleLevelListRepository,
       _gameProgressRepository = gameProgressRepository,
       super(const _Initial()) {
    on<GameModuleListEvent>((event, emit) async {
      switch (event) {
        case _Receive():
          await _onReceive(emit: emit);
        case _LevelCompleted(
          :final levelId,
          :final stars,
          :final correctAnswers,
        ):
          _applyOptimisticProgress(
            emit: emit,
            levelId: levelId,
            stars: stars,
            correctAnswers: correctAnswers,
          );
          await _onSilentRefresh(emit: emit);
      }
    });
  }

  Future<void> _onReceive({
    required Emitter<GameModuleListState> emit,
  }) async {
    emit(
      const GameModuleListState.receiveInProgress(
        message: 'Загрузка игрового модуля...',
      ),
    );

    try {
      final result = await withRetry(() async {
        final levels = await _gameModuleLevelListRepository
            .getAllLevels()
            .timeout(const Duration(seconds: 10));
        final allLevelsProgress = await _gameProgressRepository
            .getAllLevelsProgress()
            .timeout(const Duration(seconds: 10));
        return (levels: levels, progressMap: allLevelsProgress);
      });

      emit(
        GameModuleListState.receiveSuccess(
          levels: result.levels,
          progressMap: result.progressMap,
        ),
      );
    } catch (e) {
      emit(
        const GameModuleListState.receiveFailed(
          message: 'Не удалось загрузить уровни. Проверьте соединение.',
        ),
      );
    }
  }

  void _applyOptimisticProgress({
    required Emitter<GameModuleListState> emit,
    required int levelId,
    required int stars,
    required int correctAnswers,
  }) {
    final current = state;
    if (current is! ReceiveSuccess) return;
    final updatedMap = Map<int, LevelProgressEntity>.from(current.progressMap);
    updatedMap[levelId] = LevelProgressEntity(
      levelId: levelId,
      isCompleted: stars > 0,
      stars: stars,
      lastPlayedAt: DateTime.now(),
      correctAnswers: correctAnswers,
    );
    emit(ReceiveSuccess(levels: current.levels, progressMap: updatedMap));
  }

  Future<void> _onSilentRefresh({
    required Emitter<GameModuleListState> emit,
  }) async {
    try {
      final levels = await _gameModuleLevelListRepository.getAllLevels();
      final allLevelsProgress = await _gameProgressRepository
          .getAllLevelsProgress()
          .timeout(const Duration(seconds: 15));
      emit(
        GameModuleListState.receiveSuccess(
          levels: levels,
          progressMap: allLevelsProgress,
        ),
      );
    } catch (_) {
    }
  }
}