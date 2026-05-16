import 'package:sugarlife/features/game_module/level/data/dtos/game_module_level_dto.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';

abstract class GameModuleLevelMapper {
  static GameModuleLevelEntity toEntity(
    GameModuleLevelDto dto, {
    required int totalQuestions,
  }) {
    return GameModuleLevelEntity(
      id: dto.id,
      orderIndex: dto.orderIndex,
      theoryModuleId: dto.theoryModuleId ?? 1,
      totalQuestions: totalQuestions,
    );
  }

  static List<GameModuleLevelEntity> toEntityList(
    List<GameModuleLevelDto> dtos,
    Map<int, int> questionCountByLevel,
  ) {
    return dtos
        .map(
          (dto) => toEntity(
            dto,
            totalQuestions: questionCountByLevel[dto.id] ?? 0,
          ),
        )
        .toList();
  }
}
