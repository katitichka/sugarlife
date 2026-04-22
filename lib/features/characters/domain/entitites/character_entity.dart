import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_entity.freezed.dart';

@freezed
sealed class CharacterEntity with _$CharacterEntity {
  const factory CharacterEntity({
    required int id,
    required String imageUrl,
    required String name,
  }) = _CharacterEntity;
}
