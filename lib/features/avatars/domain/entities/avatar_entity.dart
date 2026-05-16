import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_entity.freezed.dart';

@freezed
sealed class AvatarEntity with _$AvatarEntity {
  const factory AvatarEntity({
    required int id,
    required String imageUrl,
  }) = _AvatarEntity;
}
