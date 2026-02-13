// Это тестовая имплементация репозитория уровней
import 'package:sugarlife/features/game_module/domain/entities/game_module_list_entity.dart';
import 'package:sugarlife/features/game_module/domain/repositories/game_module_list_repository.dart';

class MockGameModuleListRepositoryImpl implements GameModuleListRepository {
  @override
  Future<List<GameModuleListEntity>> getLevelsForSnake() async {
    await Future.delayed(Duration(milliseconds: 300));
    return List.generate(28, (index) {
      return GameModuleListEntity(
          id: index + 1, title: 'Уровень ${index + 1}', orderIndex: index + 1);
    });
  }

  @override
  Future<GameModuleListEntity> getLevelById({required int levelId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    return GameModuleListEntity(
        id: levelId, title: 'Уровень ${levelId}', orderIndex: levelId);
  }
}
