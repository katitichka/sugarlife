import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/game_module_list/domain/entities/game_module_list_entity.dart';
import 'package:sugarlife/features/game_module_list/domain/repositories/game_module_list_repository.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

part 'game_module_list_event.dart';
part 'game_module_list_state.dart';
part 'game_module_list_bloc.freezed.dart';

class GameModuleListBloc
    extends Bloc<GameModuleListEvent, GameModuleListState> {
  final GameModuleListRepository _gameModuleListRepository;
  final LevelProgressRepository _gameProgressRepository;
  GameModuleListBloc({
    required GameModuleListRepository gameModuleListRepository,
    required LevelProgressRepository gameProgressRepository,
  }) : _gameModuleListRepository = gameModuleListRepository,
       _gameProgressRepository = gameProgressRepository,
       super(const _Initial()) {
    on<GameModuleListEvent>(
      (event, emit) => switch (event) {
        _Receive() => _onReceive(emit: emit),
        _LevelCompleted(
          :final levelId,
          :final stars,
          :final correctAnswers,
          :final totalQuestions,
        ) =>
          _onLevelCompleted(
            emit: emit,
            levelId: levelId,
            stars: stars,
            correctAnswers: correctAnswers,
            totalQuestions: totalQuestions,
          ),
      },
    );
       }
    void _onLevelCompleted({
      required Emitter<GameModuleListState> emit,
      required int levelId,
      required int stars,
      required int correctAnswers,
      required int totalQuestions,
    }) {
      emit(
        GameModuleListState.levelJustCompleted(
          levelId: levelId,
          stars: stars,
          correctAnswers: correctAnswers,
          totalQuestions: totalQuestions,
        ),
      );
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
          final levels = await _gameModuleListRepository.getAllLevels();
          final allLevelsProgress = await _gameProgressRepository
              .getAllLevelsProgress();
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

