import 'package:sugarlife/features/characters/data/dtos/character_dto.dart';
import 'package:sugarlife/features/characters/domain/entitites/character_entity.dart';

abstract class CharacterDtoMapper {
  static CharacterEntity toEntity({required CharacterDto dto}) {
    return CharacterEntity(
      id: dto.id, 
      imageUrl: dto.imageUrl, 
      name: dto.name
      );
  }
}
