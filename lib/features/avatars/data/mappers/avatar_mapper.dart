import 'package:sugarlife/features/avatars/data/dtos/avatar_dto.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';

abstract class AvatarDtoMapper {
  static AvatarEntity toEntity({required AvatarDto dto}) {
    return AvatarEntity(
      id: dto.id,
      imageUrl: dto.imageUrl,
    );
  }

  static AvatarDto toDto({required AvatarEntity entity}) {
    return AvatarDto(
      id: entity.id,
      imageUrl: entity.imageUrl,
    );
  }
}