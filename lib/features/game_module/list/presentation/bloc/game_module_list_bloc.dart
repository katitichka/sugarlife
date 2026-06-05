import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

    const maxRetries = 3;
    const retryDelay = Duration(seconds: 3);

    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        print('=== ПОПЫТКА ЗАГРУЗКИ УРОВНЕЙ $attempt/$maxRetries ===');
        
        final levels = await _gameModuleLevelListRepository
            .getAllLevels()
            .timeout(const Duration(seconds: 10));
            
        final allLevelsProgress = await _gameProgressRepository
            .getAllLevelsProgress()
            .timeout(const Duration(seconds: 10));
            
        emit(
          GameModuleListState.receiveSuccess(
            levels: levels,
            progressMap: allLevelsProgress,
          ),
        );
        return; // Успех — выходим
        
      } catch (e) {
        print('=== ОШИБКА ЗАГРУЗКИ (попытка $attempt): $e ===');
        
        if (attempt == maxRetries) {
          // Последняя попытка — показываем ошибку
          emit(
            const GameModuleListState.receiveFailed(
              message: 'Не удалось загрузить уровни. Проверьте соединение.',
            ),
          );
        } else {
          // Ждём 3 секунды перед следующей попыткой
          await Future.delayed(retryDelay);
        }
      }
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
      // Фоновое обновление не должно показывать ошибку пользователю
      print('Фоновое обновление не удалось, оставляем текущее состояние');
    }
  }
}