import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
sealed class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    required String id,
    required String username,
    @JsonKey(name: 'current_avatar_id') required int currentAvatarId,
    int? level,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}
