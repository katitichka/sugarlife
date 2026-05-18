import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/errors/error_mapper.dart';
import 'package:sugarlife/core/errors/error_messages.dart';
import 'package:sugarlife/core/errors/load_with_retry.dart';
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
          // 1. Оптимистичное обновление — сразу отражаем результат в UI,
          //    не дожидаясь ответа от Supabase.
          _applyOptimisticProgress(
            emit: emit,
            levelId: levelId,
            stars: stars,
            correctAnswers: correctAnswers,
          );
          // Синхронизация в фоне — не блокируем завершение уровня.
          unawaited(_onSilentRefresh(emit: emit));
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
      final levels = await loadWithRetry(
        _gameModuleLevelListRepository.getAllLevels,
      );
      final allLevelsProgress = await loadWithRetry(
        () => _gameProgressRepository
            .getAllLevelsProgress()
            .timeout(const Duration(seconds: 15)),
      );
      emit(
        GameModuleListState.receiveSuccess(
          levels: levels,
          progressMap: allLevelsProgress,
        ),
      );
    } catch (e) {
      emit(
        GameModuleListState.receiveFailed(
          message: ErrorMapper.toUserMessage(
            e,
            loadContext: ErrorMessages.loadFailed,
          ),
        ),
      );
    }
  }

  /// Немедленно обновляет progressMap в текущем состоянии локальными данными,
  /// не делая запроса к сети. Состояние обновляется синхронно — пользователь
  /// видит пройденный уровень сразу при возврате на GamePage.
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

  /// Обновляет данные без перехода в receiveInProgress.
  /// Используется после завершения уровня — GamePage остаётся
  /// в текущем состоянии (не показывает спиннер) и обновляется,
  /// когда данные придут.
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
      // Молча игнорируем — текущее состояние экрана не трогаем.
    }
  }
}