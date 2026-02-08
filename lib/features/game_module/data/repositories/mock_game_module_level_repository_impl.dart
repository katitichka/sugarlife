// Это тестовая имплементация репозитория уровней
import 'package:sugarlife/features/game_module/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/domain/repositories/game_module_level_repository.dart';

class MockGameModuleLevelRepositoryImpl implements GameModuleLevelRepository {
  @override
  Future<List<GameModuleLevelEntity>> getLevelsForSnake() async {
    await Future.delayed(Duration(milliseconds: 300));
    return List.generate(28, (index) {
      return GameModuleLevelEntity(
          id: index + 1, title: 'Уровень ${index + 1}', orderIndex: index + 1);
    });
  }

  @override
  Future<GameModuleLevelEntity> getLevelById({required int levelId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    return GameModuleLevelEntity(
        id: levelId, title: 'Уровень ${levelId}', orderIndex: levelId);
  }
}
