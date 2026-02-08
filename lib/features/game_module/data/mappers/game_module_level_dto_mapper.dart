import 'package:sugarlife/features/game_module/data/dtos/game_module_level_dto.dart';
import 'package:sugarlife/features/game_module/domain/entities/game_module_level_entity.dart';

abstract class GameModuleLevelDtoMapper {
  static GameModuleLevelEntity toEntity({required GameModuleLevelDto dto}) {
    return GameModuleLevelEntity(
      id: dto.id,
      title: dto.title,
      orderIndex: dto.orderIndex,
    );
  }
}
