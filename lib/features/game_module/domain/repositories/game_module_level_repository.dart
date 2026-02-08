import 'package:sugarlife/features/game_module/domain/entities/game_module_level_entity.dart';

abstract interface class GameModuleLevelRepository {
  Future<List<GameModuleLevelEntity>> getLevelsForSnake();
  Future<GameModuleLevelEntity> getLevelById({required int levelId});
}
