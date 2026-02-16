import 'package:sugarlife/features/game_module_list/domain/entities/game_module_list_entity.dart';

abstract interface class GameModuleListRepository {
  Future<List<GameModuleListEntity>> getAllLevels();
  Future<GameModuleListEntity> getLevelById({required int levelId});
}
