import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_entity.freezed.dart';

@freezed
sealed class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String id,
    required String email,
    required bool isAuthenticated,
  }) = _AuthEntity;
}
