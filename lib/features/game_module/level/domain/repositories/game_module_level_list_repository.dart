import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';

abstract interface class GameModuleLevelListRepository {
  Future<List<GameModuleLevelEntity>> getAllLevels();
  Future<GameModuleLevelEntity> getLevelById({required int levelId});
}