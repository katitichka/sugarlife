import 'package:sugarlife/features/game_module/level/data/dtos/game_module_level_dto.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';

abstract class GameModuleLevelMapper {
  static GameModuleLevelEntity toEntity(GameModuleLevelDto dto) {
    return GameModuleLevelEntity(
      id: dto.id,
      title: dto.title,
      orderIndex: dto.orderIndex,
      theoryModuleId: dto.theoryModuleId,
      totalQuestions: dto.totalQuestions,
    );
  }

  static List<GameModuleLevelEntity> toEntityList(List<GameModuleLevelDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}