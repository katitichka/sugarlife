import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/features/game_module_list/domain/entities/game_module_list_entity.dart';
import 'package:sugarlife/features/game_module_list/domain/repositories/game_module_list_repository.dart';

part 'game_module_list_event.dart';
part 'game_module_list_state.dart';
part 'game_module_list_bloc.freezed.dart';

class GameModuleListBloc
    extends Bloc<GameModuleListEvent, GameModuleListState> {
  final GameModuleListRepository _gameModuleListRepository;
  GameModuleListBloc({
    required GameModuleListRepository gameModuleListRepository,
  }) : _gameModuleListRepository = gameModuleListRepository,
       super(const _Initial()) {
    on<_Receive>((event, emit) => _onReceiveGameModuleList(emit));
  }

  Future<void> _onReceiveGameModuleList(
    Emitter<GameModuleListState> emit,
  ) async {
    emit(
      const GameModuleListState.receiveInProgress(
        message: 'Загрузка игрового модуля',
      ),
    );
    try {
      final levels = await _gameModuleListRepository.getAllLevels();
      emit(GameModuleListState.receiveSuccess(levels: levels));
    } catch (e) {
      emit(GameModuleListState.receiveFailed(message: 'Ошибка: $e'));
    }
  }
}
