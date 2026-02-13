import 'package:sugarlife/features/game_module/domain/entities/game_module_list_entity.dart';

abstract interface class GameModuleListRepository {
  Future<List<GameModuleListEntity>> getLevelsForSnake();
  Future<GameModuleListEntity> getLevelById({required int levelId});
}
