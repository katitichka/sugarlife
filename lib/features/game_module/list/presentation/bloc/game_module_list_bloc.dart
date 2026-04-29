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
        case _LevelCompleted():
          // Обновляем прогресс на карте; экран результата показывается внутри уровня.
          add(const GameModuleListEvent.receive());
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
      final levels = await _gameModuleLevelListRepository.getAllLevels();
      final allLevelsProgress = await _gameProgressRepository.getAllLevelsProgress();
      emit(
        GameModuleListState.receiveSuccess(
          levels: levels,
          progressMap: allLevelsProgress,
        ),
      );
    } catch (e) {
      emit(GameModuleListState.receiveFailed(message: 'Ошибка: $e'));
    }
  }
}