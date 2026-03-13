import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
sealed class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String id,
    required String username,
    required List<DateTime> correctDates, // даты павильных ответов для миф правда
    required int currentAvatarId,
  }) = _ProfileEntity;
}
