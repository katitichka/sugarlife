import 'package:sugarlife/features/game_module/data/dtos/game_module_list_dto.dart';
import 'package:sugarlife/features/game_module/domain/entities/game_module_list_entity.dart';

abstract class GameModuleListDtoMapper {
  static GameModuleListEntity toEntity({required GameModuleListDto dto}) {
    return GameModuleListEntity(
      id: dto.id,
      title: dto.title,
      orderIndex: dto.orderIndex,
    );
  }
}
